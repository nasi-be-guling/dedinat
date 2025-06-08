<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Models\Variable;
use App\Models\Category;
use Illuminate\Http\Request;
use App\DataTables\ItemDataTable;
use App\Http\Controllers\AppController;

class ItemController extends AppController
{
    public function index(ItemDataTable $dataTable)
    {
        return $dataTable->render('item.index');
    }

    public function create()
    {
        $variables = Variable::orderBy('order_num')->get();
        $categories = Category::orderBy('id')->get();
        $items = Item::whereNull('item_id')->get();

        return view('item.create', compact('variables', 'categories', 'items'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'variable_id' => 'required|exists:variables,id',
            'name' => 'required|string|max:2000',
            'category_id' => 'required|integer|exists:categories,id',
            'order_num' => 'required|integer|min:1',
            'item_id' => 'nullable|integer|exists:items,id',
        ], [], [
            'variable_id' => 'Nama Variabel',
            'name' => 'Nama Item',
            'category_id' => 'Kategori',
            'order_num' => 'No. Urut',
            'item_id' => 'Parent Item'
        ]);

        if ($request->filled('item_id')) {
            $parentItem = Item::findOrFail($request->item_id);
            if ($parentItem->item_id !== null) {
                notify(['status' => 'error', 'title' => 'Gagal', 'text' => 'Item Parent tidak dapat dipilih']);
                return redirect()->route('item.index');
            }
        }

        $data = [
            'variable_id' => $request->variable_id,
            'category_id' => $request->category_id,
            'item_id'     => $request->item_id ?: null,
            'name'        => $request->name,
            'order_num'   => $request->order_num,
        ];

        Item::create($data);

        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Item berhasil dibuat']);
        return redirect()->route('item.index');
    }

    public function edit(string $id)
    {
        $item = Item::with('children')->findOrFail($id);
        $variables = Variable::orderBy('order_num')->get();
        $categories = Category::orderBy('id')->get();

        $excludedIds = $item->getDescendantIds();
        $excludedIds[] = $item->id;

        $items = Item::whereNull('item_id')
            ->whereNotIn('id', $excludedIds)
            ->get();

        return view('item.edit', compact('item', 'variables', 'categories', 'items'));
    }

    public function update(Request $request, string $id)
    {
        $this->validate($request, [
            'variable_id' => 'required|exists:variables,id',
            'name' => 'required|string|max:2000',
            'category_id' => 'required|integer|exists:categories,id',
            'order_num' => 'required|integer|min:1',
            'item_id' => 'nullable|integer|exists:items,id',
        ], [], [
            'variable_id' => 'Nama Variabel',
            'name' => 'Nama Item',
            'category_id' => 'Kategori',
            'order_num' => 'No. Urut',
            'item_id' => 'Parent Item'
        ]);

        if ($request->filled('item_id')) {
            $parentItem = Item::findOrFail($request->item_id);
            if ($parentItem->item_id !== null) {
                notify(['status' => 'error', 'title' => 'Gagal', 'text' => 'Item Parent tidak dapat dipilih']);
                return redirect()->route('item.index');
            }
        }

        $item = Item::findOrFail($id);

        $data = [
            'variable_id' => $request->variable_id,
            'category_id' => $request->category_id,
            'item_id'     => $request->item_id ?: null,
            'name'        => $request->name,
            'order_num'   => $request->order_num,
        ];

        $item->update($data);

        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Item berhasil diupdate']);
        return redirect()->route('item.index');
    }

    public function destroy(string $id)
    {
        Item::destroy($id);
        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Item berhasil dihapus']);
        return redirect()->route('item.index');
    }
}
