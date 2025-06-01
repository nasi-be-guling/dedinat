@extends('layouts.app')
@section('title', 'Edit Kategori')
@section('content')
    @include('category.form', [
        'action' => route('category.update', $category),
        'method' => 'PUT',
        'model' => $category
    ])
@endsection
