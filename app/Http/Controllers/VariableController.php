<?php

namespace App\Http\Controllers;

use App\Models\Variable;
use Illuminate\Http\Request;
use App\DataTables\VariableDataTable;
use App\Http\Controllers\AppController;

class VariableController extends AppController
{
    /**
     * Display a listing of the resource.
     */
    public function index(VariableDataTable $dataTable)
    {
        return $dataTable->render('variable.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('variable.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        Variable::create($request->all());
        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil membuat variabel']);
        return redirect()->route('variable.index');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $variable = Variable::findOrFail($id);
        return view('variable.edit', compact('variable'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $this->validate($request, [
            'nama' => 'required',
            'no_urut' => 'required',
        ], [], [
            'nama' => 'Nama Variable',
            'no_urut' => 'No. Urut'
        ]);

        $variable = Variable::findOrFail($id);
        $variable->update($request->all());
        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil mengubah variabel']);
        return redirect()->route('variable.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Variable::destroy($id);
        notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil menghapus variabel']);
        return redirect()->route('variable.index');
    }
}
