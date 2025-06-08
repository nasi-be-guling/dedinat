@extends('layouts.app')
@section('title', isset($item) ? 'Edit Item' : 'Tambah Item')

@section('content')
    <div class="card mb-4">
        <h5 class="card-header">{{ isset($item) ? 'Edit' : 'Tambah' }} Item</h5>
        <div class="card-body">
            <form action="{{ isset($item) ? route('item.update', $item->id) : route('item.store') }}" method="post">
                @csrf
                @if(isset($item))
                    @method('PATCH')
                @endif

                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="variable_id">Variable</label>
                    <div class="col-sm-9">
                        <select class="selectpicker w-100" data-style="btn-default" name="variable_id" required>
                            @foreach ($variables as $var)
                                <option value="{{ $var->id }}" {{ old('variable_id', $item->variable_id ?? '') == $var->id ? 'selected' : '' }}>
                                    {{ ucfirst($var->name) }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="name">Nama Item</label>
                    <div class="col-sm-9">
                        <input id="name" type="text" name="name"
                            class="form-control @error('name') is-invalid @enderror"
                            value="{{ old('name', $item->name ?? '') }}" required>
                        @error('name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="item_id">Parent Item</label>
                    <div class="col-sm-9 col-md-5">
                        <select class="selectpicker w-100" data-style="btn-default" name="item_id">
                            <option value="">- Tidak Ada -</option>
                            @foreach ($items as $parent)
                                <option value="{{ $parent->id }}" {{ old('item_id', $item->item_id ?? '') == $parent->id ? 'selected' : '' }}>
                                    {{ $parent->name }}
                                </option>
                            @endforeach
                        </select>
                        @error('item_id')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="category_id">Kategori</label>
                    <div class="col-sm-3">
                        <select class="selectpicker w-100" data-style="btn-default" name="category_id" required>
                            @foreach ($categories as $cat)
                                <option value="{{ $cat->id }}" {{ old('category_id', $item->category_id ?? '') == $cat->id ? 'selected' : '' }}>
                                    {{ $cat->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="method_id">Metode</label>
                    <div class="col-sm-9">
                        <select class="selectpicker w-100" data-style="btn-default" name="method_id[]" multiple required>
                            @foreach ($methods as $method)
                                <option value="{{ $method->id }}"
                                    @if(isset($item)) {{ in_array($method->id, explode(';', old('method_id', $item->method_id))) ? 'selected' : '' }} @endif>
                                    {{ $method->name }}
                                </option>
                            @endforeach
                        </select>
                        @error('method_id')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="order_num">No. Urut</label>
                    <div class="col-sm-3">
                        <input id="order_num" type="number" name="order_num" min="1"
                            class="form-control @error('order_num') is-invalid @enderror"
                            value="{{ old('order_num', $item->order_num ?? 1) }}" required>
                        @error('order_num')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

                <div class="row justify-content-end">
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary waves-effect waves-light">
                            {{ $buttonText ?? 'Simpan' }}
                        </button>
                        <a href="{{ route('item.index') }}" class="btn btn-secondary waves-effect waves-light">Kembali</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
