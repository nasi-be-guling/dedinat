@extends('layouts.app')
@section('title', 'Tambah Item')

@section('content')
<div class="card mb-4">
    <h5 class="card-header">Tambah Item</h5>
    <div class="card-body">
        <form action="{{ route('item.store') }}" method="post">
            @csrf

            {{-- Variable --}}
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label align-right" for="variable_id">Variable</label>
                <div class="col-sm-9">
                    <select class="selectpicker w-100 @error('variable_id') is-invalid @enderror"
                        data-style="btn-default" name="variable_id" required>
                        <option value="">-- Pilih Variable --</option>
                        @foreach ($variables as $variable)
                            <option value="{{ $variable->id }}" {{ old('variable_id') == $variable->id ? 'selected' : '' }}>
                                {{ $variable->name }}
                            </option>
                        @endforeach
                    </select>
                    @error('variable_id')
                        <div class="invalid-feedback d-block">{{ $message }}</div>
                    @enderror
                </div>
            </div>

            {{-- Nama Item --}}
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label align-right" for="nama">Nama Item</label>
                <div class="col-sm-9">
                    <input id="nama" type="text" name="nama"
                        class="form-control @error('nama') is-invalid @enderror"
                        placeholder="Nama item" required value="{{ old('nama') }}">
                    @error('nama')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
            </div>

            {{-- Parent Item --}}
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label align-right" for="item_id">Parent Item</label>
                <div class="col-sm-9">
                    <select name="item_id" id="item_id"
                        class="selectpicker w-100 @error('item_id') is-invalid @enderror"
                        data-style="btn-default">
                        <option value="">-- Tidak ada --</option>
                        @foreach($items as $item)
                            <option value="{{ $item->id }}" {{ old('item_id') == $item->id ? 'selected' : '' }}>
                                {{ $item->name }}
                            </option>
                        @endforeach
                    </select>
                    @error('item_id')
                        <div class="invalid-feedback d-block">{{ $message }}</div>
                    @enderror
                </div>
            </div>

            {{-- Kategori --}}
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label align-right" for="kategori">Kategori</label>
                <div class="col-sm-9">
                    <select name="kategori" id="kategori"
                        class="selectpicker w-100 @error('kategori') is-invalid @enderror"
                        data-style="btn-default" required>
                        <option value="">-- Pilih Kategori --</option>
                        @foreach($categories as $category)
                            <option value="{{ $category->id }}" {{ old('kategori') == $category->id ? 'selected' : '' }}>
                                {{ $category->name }}
                            </option>
                        @endforeach
                    </select>
                    @error('kategori')
                        <div class="invalid-feedback d-block">{{ $message }}</div>
                    @enderror
                </div>
            </div>

            {{-- No Urut --}}
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label align-right" for="order_num">No. Urut</label>
                <div class="col-sm-3">
                    <input id="order_num" type="number" min="1" name="no_urut"
                        class="form-control @error('no_urut') is-invalid @enderror"
                        placeholder="Nomor Urut" required value="{{ old('no_urut', 1) }}">
                    @error('no_urut')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
            </div>

            {{-- Tombol --}}
            <div class="row justify-content-end">
                <div class="col-sm-9">
                    <button type="submit" class="btn btn-primary">Simpan</button>
                    <a href="{{ route('item.index') }}" class="btn btn-secondary">Kembali</a>
                </div>
            </div>

        </form>
    </div>
</div>
@endsection

@push('scripts')
@endpush
