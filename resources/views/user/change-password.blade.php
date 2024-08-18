@extends('layouts.app')
@section('title', 'User')
@section('content')
    <div class="card mb-4">
        <h5 class="card-header">Ganti Password</h5>
        <div class="card-body">
            <form action="{{ route('user.change-password') }}" method="post">
                @csrf
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="old_password">Password Lama</label>
                    <div class="col-sm-10">
                        <input id="old_password" type="password"
                            class="form-control @error('old_password') is-invalid @enderror" placeholder="Password Lama"
                            name="old_password" value="{{ old('old_password') }}">
                        @error('old_password')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="password">Password Baru</label>
                    <div class="col-sm-10">
                        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror"
                            placeholder="Password Baru" name="password">
                        @error('password')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="password_confirmation">Ulangi Password Baru</label>
                    <div class="col-sm-10">
                        <input id="password_confirmation" type="password"
                            class="form-control @error('password_confirmation') is-invalid @enderror"
                            placeholder="Ulangi Password Baru" name="password_confirmation">
                        @error('password_confirmation')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row justify-content-end">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary waves-effect waves-light btn-simpan">Simpan</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
@endpush
