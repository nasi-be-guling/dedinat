@extends('layouts.app')
@section('title', 'Tambah Kategori')
@section('content')
    @include('category.form', [
        'action' => route('category.store'),
        'method' => 'POST',
        'model' => null
    ])
@endsection
