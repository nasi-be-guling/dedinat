<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Variable;
use Illuminate\Http\Request;
use App\DataTables\ItemDataTable;
use App\Http\Controllers\AppController;

class ItemController extends AppController
{
    /**
     * Display a listing of the resource.
     */
    public function index(ItemDataTable $dataTable)
    {
        return $dataTable->render('item.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $variables = Variable::all();
        return view('item.create', compact('variables'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'variable_id' => 'required',
            'nama' => 'required',
            'no_urut' => 'required',
        ], [], [
            'variable_id' => 'Nama Variabel',
            'nama' => 'Nama Item',
            'no_urut' => 'No. Urut'
        ]);

        if ($request->has('item_id')) {
            $parentItem = Item::findOrFail($request->item_id);
            if ($parentItem->item_id != null) {
                notify(['status' => 'error', 'title' => 'Gagal', 'text' => 'Item Parent tidak dapat dipilih']);
                return redirect()->route('item.index');
            }
        }

        Item::create($request->all());
        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Item berhasil dibaut']);
        return redirect()->route('item.index');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $item = Item::findOrFail($id);
        $variables = Variable::all();
        return view('item.edit', compact('item', 'variables'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $this->validate($request, [
            'variable_id' => 'required',
            'nama' => 'required',
            'no_urut' => 'required',
        ], [], [
            'variable_id' => 'Nama Variabel',
            'nama' => 'Nama Item',
            'no_urut' => 'No. Urut'
        ]);

        if ($request->has('item_id')) {
            $parentItem = Item::findOrFail($request->item_id);
            if ($parentItem->item_id != null) {
                notify(['status' => 'error', 'title' => 'Gagal', 'text' => 'Item Parent tidak dapat dipilih']);
                return redirect()->route('item.index');
            }
        }

        $item = Item::findOrFail($id);
        $item->update($request->all());
        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Item berhasil diupdate']);
        return redirect()->route('item.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Item::destroy($id);
        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Item berhasil dihapus']);
        return redirect()->route('item.index');
    }
}
