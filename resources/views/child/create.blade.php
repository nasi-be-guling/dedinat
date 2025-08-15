@extends('layouts.app')
@section('title', 'Tambah Anak')
@section('content')
<div class="card">
    <div class="card-header"><h5>Tambah Data Anak</h5></div>
    <div class="card-body">
        <form action="{{ route('child.store') }}" method="POST">
            @include('child.form')
            <button type="submit" class="btn btn-primary">Simpan</button>
        </form>
    </div>
</div>
@endsection
