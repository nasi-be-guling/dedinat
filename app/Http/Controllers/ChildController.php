<?php

namespace App\Http\Controllers;

use App\DataTables\ChildDataTable;
use App\Models\Child;
use Illuminate\Http\Request;
use DB;

class ChildController extends AppController
{
    /**
     * Display a listing of the resource.
     */
    public function index(ChildDataTable $dataTable)
    {
        return $dataTable->render('child.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('child.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required|string|max:255',
            'alamat' => 'required|string',
            'umur' => 'required|integer|min:0',
            'jenis_kebutuhan' => 'required|string|max:255',
        ]);

        DB::beginTransaction();
        try {
            $child = new Child();
            $child->nama = $request->nama;
            $child->alamat = $request->alamat;
            $child->umur = $request->umur;
            $child->jenis_kebutuhan = $request->jenis_kebutuhan;
            $child->save();

            if (auth()->user()->hasRole('user')) {
                auth()->user()->r_childs()->save($child);
            }

            DB::commit();
            return redirect()->route('child.index')->with('success', 'Data anak berhasil disimpan.');
        } catch (\Throwable $e) {
            DB::rollBack();
            \Bugsnag::notifyException($e);
            return back()->withErrors('Gagal menyimpan data anak.');
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $child = Child::findOrFail($id);
        return view('child.edit', compact('child'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'nama' => 'required|string|max:255',
            'alamat' => 'required|string',
            'umur' => 'required|integer|min:0',
            'jenis_kebutuhan' => 'required|string|max:255',
        ]);

        DB::beginTransaction();
        try {
            $child = Child::findOrFail($id);
            $child->nama = $request->nama;
            $child->alamat = $request->alamat;
            $child->umur = $request->umur;
            $child->jenis_kebutuhan = $request->jenis_kebutuhan;
            $child->save();

            DB::commit();
            return redirect()->route('child.index')->with('success', 'Data anak berhasil diperbarui.');
        } catch (\Throwable $e) {
            DB::rollBack();
            \Bugsnag::notifyException($e);
            return back()->withErrors('Gagal memperbarui data anak.');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        if (!auth()->user()->can('child.delete')) return redirect('home');

        try {
            Child::destroy($id);
            notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil menghapus data anak']);
        } catch (\Throwable $th) {
            \Bugsnag::notifyException($th);
            notify(['status' => 'danger', 'title' => 'Gagal', 'text' => 'Gagal menghapus data anak']);
        }

        return redirect()->route('child.index');
    }
}
