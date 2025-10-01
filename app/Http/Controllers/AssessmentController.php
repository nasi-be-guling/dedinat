<?php

namespace App\Http\Controllers;

use App\DataTables\AssessmentDataTable;
use App\Models\Assessment;
use App\Models\AssessmentItem;
use App\Models\Category;
use App\Models\Variable;
use App\Models\Item;
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
        // Validasi dasar
        $request->validate([
            'child_id'      => ['required', 'integer'],
            'category_id'   => ['nullable', 'integer'],
            'item_id'       => ['required', 'array', 'min:1'],
            'item_id.*'     => ['integer'],
            'subs'          => ['required', 'array', 'min:1'],
        ]);

        DB::beginTransaction();
        try {
            // Derive category_id dari item yang dipilih (kebal salah input hidden)
            $cats = Item::query()->whereIn('id', $request->item_id)->distinct()->pluck('category_id');
            if ($cats->count() !== 1) {
                return back()->withErrors(['item_id' => 'Item yang dipilih harus berasal dari satu kategori yang sama.'])->withInput();
            }
            $derivedCategoryId = $cats->first();

            $ases = new Assessment();
            $ases->child_id    = $request->child_id;
            $ases->category_id = $derivedCategoryId ?? $request->category_id;
            $ases->user_id     = auth()->user()->id;
            $ases->save();

            $scoreYes = 0;
            $scoreNo  = 0;

            foreach ($request->item_id as $i => $itemId) {
                $subs         = $request->subs[$i] ?? null;
                $variableId   = $request->variable_id[$i] ?? null;
                $variableName = $request->variable_name[$i] ?? null;
                $itemNama     = $request->item_name[$i] ?? null;
                $itemCode     = $request->item_code[$i] ?? "{$i}_0";

                $asesItem = new AssessmentItem();
                $asesItem->assessment_id   = $ases->id;
                $asesItem->variable_id     = $variableId;
                $asesItem->variable_name   = $variableName;
                $asesItem->item_id         = $itemId;
                $asesItem->item_variable_id= $variableId;
                $asesItem->item_name       = $itemNama;
                $asesItem->item_code       = $itemCode;
                $asesItem->subs            = $subs;

                // Ambil jawaban radio: skor-{kode} (kode titik diganti underscore di form)
                $scoreKey = 'skor-' . str_replace('.', '_', $itemCode);
                if ($request->has($scoreKey)) {
                    $jawaban = (int) $request->{$scoreKey};
                    $asesItem->score = $jawaban;
                    if ($jawaban === 1) $scoreYes++;
                    else                $scoreNo++;
                } else {
                    $asesItem->score = null;
                }

                $asesItem->save();
            }

            $ases->score_yes = $scoreYes;
            $ases->score_no  = $scoreNo;
            $ases->score     = $scoreYes; // total YA
            $ases->save();

            DB::commit();
            return redirect()->route('assessment.show', $ases->id);

        } catch (\Throwable $th) {
            DB::rollBack();
            if (class_exists('\Bugsnag')) {
                \Bugsnag::notifyException($th);
            }
            return back()->withErrors(['general' => 'Gagal menyimpan asesmen: '.$th->getMessage()])->withInput();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $authUser = auth()->user();
        $asesQ = Assessment::with([
            'r_items',
            'r_category',
            'r_child' => fn($q) => $q->withTrashed()
        ])->where('id', $id);

        if ($authUser->hasRole('user')) {
            $asesQ->where('user_id', $authUser->id);
        }

        $ases = $asesQ->firstOrFail();

        // 🔢 Hitung skor berdasarkan subs (granular), normalisasi ke A1 (A.1 → A1)
        $subsSkor = [];
        foreach ($ases->r_items as $item) {
            if ((int)$item->score === 1 && $item->subs) {
                $raw  = strtoupper($item->subs);                    // contoh: A.1
                $norm = preg_replace('/[^A-Z0-9]/', '', $raw);      // -> A1
                $subsSkor[$norm] = ($subsSkor[$norm] ?? 0) + 1;
            }
        }

        // 🧠 Evaluasi rumus dari kategori (support {{A}}, {{A1}}, {{A.1}}, AND/OR, dll)
        $category = $ases->r_category;
        $ases->score_text = $category->evaluateScore($subsSkor);
        $ases->save();

        return view('assessment.show', compact('ases'));
    }

    public function edit(string $id)
    {
        abort(404);
    }

    public function update(Request $request, string $id)
    {
        abort(404);
    }

    public function destroy(string $id)
    {
        try {
            Assessment::destroy($id);
            notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil menghapus data asesmen']);
        } catch (\Throwable $th) {
            if (class_exists('\Bugsnag')) {
                \Bugsnag::notifyException($th);
            }
            notify(['status' => 'danger', 'title' => 'Gagal', 'text' => 'Gagal menghapus data asesmen']);
        }
        return redirect()->route('assessment.index');
    }

    public function generateForm(Request $request): View
    {
        $items    = Variable::getItems($request->id); // items per Variable (tiap Variable punya subs)
        $category = Category::find($request->id);
        $quote    = \App\Models\Quote::inRandomOrder()->first();
        $az       = range('A', 'Z'); // fallback saja (kalau subs kosong)
        return view('assessment.form-item', compact('items', 'category', 'quote', 'az'));
    }

    public function generateFormGet($id): View
    {
        $items = Variable::getItems($id);
        dd($items);
    }
}
