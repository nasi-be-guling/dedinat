@extends('layouts.app')
@section('title', isset($item) ? 'Edit Item' : 'Tambah Item')

@section('content')
    <div class="card mb-4">
        <h5 class="card-header">{{ isset($item) ? 'Edit Item' : 'Tambah Item' }}</h5>
        <div class="card-body">
            <form action="{{ isset($item) ? route('item.update', $item->id) : route('item.store') }}" method="POST">
                @csrf
                @if(isset($item))
                    @method('PUT')
                @endif

                @include('item.form', [
                    'item' => $item ?? null,
                    'variables' => $variables,
                    'categories' => $categories,
                    'items' => $items,
                    'buttonText' => isset($item) ? 'Update' : 'Simpan'
                ])
            </form>
        </div>
    </div>
@endsection