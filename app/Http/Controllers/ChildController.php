<?php

namespace App\Http\Controllers;

use App\DataTables\ChildDataTable;
use App\Models\Child;
use Illuminate\Http\Request;
use DB;
use Illuminate\Database\Eloquent\SoftDeletes;

class ChildController extends AppController
{
    use SoftDeletes;
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
        DB::beginTransaction();
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
        return redirect()->route('assessment.create');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
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
