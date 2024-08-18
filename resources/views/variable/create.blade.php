@extends('layouts.app')
@section('title', 'Tambah Variable')

@section('content')
    <div class="card mb-4">
        <h5 class="card-header">Tambah Variable</h5>
        <div class="card-body">
            <form action="{{ route('variable.store') }}" method="post">
                @csrf
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="nama">Nama Variable</label>
                    <div class="col-sm-9">
                        <input required id="nama" type="text"
                            class="form-control @error('nama') is-invalid @enderror" placeholder="Nama variable"
                            name="nama" value="{{ old('nama') }}">
                        @error('nama')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="alamat">No. Urut</label>
                    <div class="col-sm-3">
                        <input required id="no_urut" type="number" value="1"
                            class="form-control @error('no_urut') is-invalid @enderror" placeholder="Nomor Urut"
                            name="no_urut" value="{{ old('no_urut') }}">
                        @error('no_urut')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row justify-content-end">
                    <div class="col-sm-9">
                        <button type="submit"
                            class="btn btn-simpan btn-primary waves-effect waves-light btn-simpan">Simpan</button>
                        <a type="button" href="{{ route('variable.index') }}"
                            class="btn btn-simpan btn-secondary waves-effect waves-light">Kembali</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
@endpush
