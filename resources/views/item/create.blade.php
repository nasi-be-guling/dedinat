@extends('layouts.app')
@section('title', 'Tambah Item')

@section('content')
    <div class="card mb-4">
        <h5 class="card-header">Tambah Item</h5>
        <div class="card-body">
            <form action="{{ route('item.store') }}" method="post">
                @csrf
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="variable_id">Variable</label>
                    <div class="col-sm-9">
                        <select class="selectpicker w-100" data-style="btn-default" name="variable_id">
                            @foreach ($variables as $variable)
                                <option value="{{ $variable->id }}">{{ ucfirst($variable->nama) }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="nama">Nama Item</label>
                    <div class="col-sm-9">
                        <input required id="nama" type="text"
                            class="form-control @error('nama') is-invalid @enderror" placeholder="Nama item" name="nama"
                            value="{{ old('nama') }}">
                        @error('nama')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="item_id">Parent Item</label>
                    <div class="col-sm-9">
                        <input required id="item_id" type="text"
                            class="form-control @error('item_id') is-invalid @enderror" placeholder="Parent item"
                            name="item_id" value="{{ old('item_id') }}">
                        @error('nama')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="item_id">Parent Item</label>
                    <div class="col-sm-9">
                        <input required id="item_id" type="text"
                            class="form-control @error('item_id') is-invalid @enderror" placeholder="Parent item"
                            name="item_id" value="{{ old('item_id') }}">
                        @error('nama')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="kategori">Kategori</label>
                    <div class="col-sm-3">
                        <select class="selectpicker w-100" data-style="btn-default" name="kategori">
                            <option value="V">Favourable</option>
                            <option value="UV">Unfavourable</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="alamat">No. Urut</label>
                    <div class="col-sm-3">
                        <input required id="no_urut" type="number" min="1" value="1" placeholder="Nomor Urut"
                            class="form-control @error('no_urut') is-invalid @enderror" name="no_urut"
                            value="{{ old('no_urut') }}">
                        @error('no_urut')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row justify-content-end">
                    <div class="col-sm-9">
                        <button type="submit"
                            class="btn btn-simpan btn-primary waves-effect waves-light btn-simpan">Simpan</button>
                        <a type="button" href="{{ route('item.index') }}"
                            class="btn btn-simpan btn-secondary waves-effect waves-light">Kembali</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
@endpush
