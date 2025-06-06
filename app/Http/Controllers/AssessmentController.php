<?php

namespace App\Http\Controllers;

use App\DataTables\AssessmentDataTable;
use App\Models\Assessment;
use App\Models\AssessmentItem;
use App\Models\Category;
use App\Models\Variable;
use Illuminate\Http\Request;
use Illuminate\Contracts\View\View;
use DB;

class AssessmentController extends AppController
{
    /**
     * Display a listing of the resource.
     */
    public function index(AssessmentDataTable $dataTable)
    {
        return $dataTable->render('assessment.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $childs = auth()->user()->r_childs()->get();
        if (count($childs) <= 0) return redirect()->route('child.create');
        $categories = Category::get();
        return view('assessment.create', compact('childs', 'categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        DB::beginTransaction();
        $ases = new Assessment();
        $ases->child_id = $request->child_id;
        $ases->category_id = $request->category_id;
        $ases->user_id = auth()->user()->id;
        $ases->save();

        $score = 0;
        $scoreYes = 0;
        $scoreNo = 0;
        foreach ($request->item_id as $i => $itemId) {
            $subs = $request->subs[$i];
            $variableId = $request->variable_id[$i];
            $variableName = $request->variable_name[$i];
            // $itemItemId = $request->item_item_id[$i];
            $itemNama = $request->item_name[$i];
            // $itemKategori = $request->item_kategori[$i];
            $itemCode = $request->item_code[$i];
            // $itemNoUrut = $request->item_no_urut[$i];

            $asesItem = new AssessmentItem();
            $asesItem->assessment_id = $ases->id;
            $asesItem->variable_id = $variableId;
            $asesItem->variable_name = $variableName;
            $asesItem->item_id = $itemId;
            $asesItem->item_variable_id = $variableId;
            // $asesItem->item_item_id = $itemItemId;
            // $asesItem->item_kategori = $itemKategori;
            $asesItem->item_name = $itemNama;
            $asesItem->item_code = $itemCode;
            $asesItem->subs = $subs;
            // $asesItem->item_no_urut = $itemNoUrut;
            if ($request->has('skor-' . str_replace('.', '_', $itemCode))) {
                $jawaban = (int) $request->{'skor-' . str_replace('.', '_', $itemCode)};
                $asesItem->score = $jawaban;
                if ($jawaban == 1) {
                    $scoreYes += 1;
                } else {
                    $scoreNo += 1;
                }
            }
            $asesItem->save();
        }
        $ases->score_yes = $scoreYes;
        $ases->score_no = $scoreNo;
        $ases->score = $scoreYes;
        $ases->save();
        DB::commit();
        return redirect()->route('assessment.show', $ases->id);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $authUser = auth()->user();
        $ases = Assessment::with([
            'r_items',
            'r_category',
            'r_child' => fn($q) => $q->withTrashed()
        ])->where('id', $id);

        if ($authUser->hasRole('user')) {
            $ases->where('user_id', $authUser->id);
        }

        $ases = $ases->firstOrFail();

        // 🔢 Hitung skor berdasarkan subs (contoh: A, B, C...)
        $subsSkor = [];
        foreach ($ases->r_items as $item) {
            if ($item->score == 1 && $item->subs) {
                $subs = strtoupper($item->subs);
                $subsSkor[$subs] = ($subsSkor[$subs] ?? 0) + 1;
            }
        }

        // 🧠 Evaluasi rumus dari kategori
        $category = $ases->r_category;
        $ases->score_text = $category->evaluateScore($subsSkor);
        $ases->save();

        return view('assessment.show', compact('ases'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        abort(404);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        abort(404);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // if (!auth()->user()->can('child.delete')) return redirect('home');
        try {
            Assessment::destroy($id);
            notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil menghapus data asesmen']);
        } catch (\Throwable $th) {
            \Bugsnag::notifyException($th);
            notify(['status' => 'danger', 'title' => 'Gagal', 'text' => 'Gagal menghapus data asesmen']);
        }
        return redirect()->route('assessment.index');
    }

    public function generateForm(Request $request): View
    {
        $items = Variable::getItems($request->id);
        $category = Category::find($request->id);
        $quote = \App\Models\Quote::inRandomOrder()->first();
        $az = range('A', 'Z');
        return view('assessment.form-item', compact('items', 'category', 'quote', 'az'));
    }

    public function generateFormGet($id): View
    {
        $items = Variable::getItems($id);
        dd($items);
    }
}
