@extends('layouts.app')
@section('title', 'Tambah Data Anak Berkebutuhan Khusus')

@section('content')
    <div class="card mb-4">
        <h5 class="card-header text-center">Tambah Data Anak Berkebutuhan Khusus</h5>
        <hr class="m-0">
        <div class="card-body">
            <form action="{{ route('child.store') }}" method="post">
                @csrf
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="nama">Nama Anak</label>
                    <div class="col-sm-9">
                        <input required id="nama" type="text"
                            class="form-control @error('nama') is-invalid @enderror"
                            placeholder="Nama anak berkebutuhan khusus" name="nama" value="{{ old('nama') }}">
                        @error('nama')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="umur">Umur</label>
                    <div class="col-sm-3">
                        <input required id="umur" type="number"
                            class="form-control @error('umur') is-invalid @enderror" placeholder="Umur anak (tahun)"
                            name="umur" value="{{ old('umur') }}">
                        @error('umur')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="alamat">Alamat / Tempat Tinggal</label>
                    <div class="col-sm-9">
                        <input required id="alamat" type="text"
                            class="form-control @error('alamat') is-invalid @enderror"
                            placeholder="Alamat atau tempat tinggal" name="alamat" value="{{ old('alamat') }}">
                        @error('alamat')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-3 col-form-label align-right" for="jenis">Jenis Kebutuhan Khusus</label>
                    <div class="col-sm-9">
                        <input required id="jenis_kebutuhan" type="text"
                            class="form-control @error('jenis_kebutuhan') is-invalid @enderror"
                            placeholder="Jenis kebutuhan khusus" name="jenis_kebutuhan"
                            value="{{ old('jenis_kebutuhan') }}">
                        @error('jenis_kebutuhan')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row justify-content-end">
                    <div class="col-sm-9">
                        <button type="submit"
                            class="btn btn-simpan btn-primary waves-effect waves-light btn-simpan">Simpan</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
@endpush
