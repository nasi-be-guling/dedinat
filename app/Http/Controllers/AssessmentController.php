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
        DB::beginTransaction();
        $ases = new Assessment();
        $ases->child_id = $request->child_id;
        $ases->user_id = auth()->user()->id;
        $ases->save();

        $skor = 0;
        $skorV = 0;
        $skorUV = 0;
        foreach ($request->item_id as $i => $itemId) {
            $variableId = $request->variable_id[$i];
            $variableNama = $request->variable_nama[$i];
            $itemItemId = $request->item_item_id[$i];
            $itemNama = $request->item_nama[$i];
            $itemKategori = $request->item_kategori[$i];
            $itemKode = $request->item_kode[$i];
            $itemNoUrut = $request->item_no_urut[$i];

            $asesItem = new AssessmentItem();
            $asesItem->assessment_id = $ases->id;
            $asesItem->variable_id = $variableId;
            $asesItem->variable_nama = $variableNama;
            $asesItem->item_id = $itemId;
            $asesItem->item_variable_id = $variableId;
            $asesItem->item_item_id = $itemItemId;
            $asesItem->item_kategori = $itemKategori;
            $asesItem->item_nama = $itemNama;
            $asesItem->item_kode = $itemKode;
            $asesItem->item_no_urut = $itemNoUrut;
            if ($request->has('skor-' . str_replace('.', '_', $itemKode))) {
                $asesItem->skor = (int) $request->{'skor-' . str_replace('.', '_', $itemKode)};
                if ($itemKategori == "V") {
                    $skorV += $asesItem->skor;
                    // $skor += $asesItem->skor;
                } elseif ($itemKategori == "UV") {
                    $skorUV += $asesItem->skor;
                    // $skor -= $asesItem->skor;
                }
            }
            $asesItem->save();
        }
        $ases->skor_v = $skorV;
        $ases->skor_uv = $skorUV;
        // $ases->skor = $skor;
        $ases->skor = $skorV - $skorUV;
        $ases->save();
        DB::commit();
        return redirect()->route('assessment.show', $ases->id);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // dd(ini_get_all(null, false));
        $authUser = auth()->user();
        $ases = Assessment::with(['r_items', 'r_child' => fn($q) => $q->withTrashed()])->where('id', $id);
        if ($authUser->hasRole('user')) {
            $ases->where('user_id', $authUser->id);
        }
        $ases = $ases->firstOrFail();
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
