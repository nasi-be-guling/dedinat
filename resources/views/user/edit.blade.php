@extends('layouts.app')
@section('title', 'User')
@section('content')
    <div class="card">
        <div class="card-header header-elements">
            <span class="me-2">Pengguna</span>
        </div>
        <div class="card-body">
            <form action="{{ route('user.update', $data->id) }}" method="post">
                @csrf @method('patch')
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="name">Nama Pengguna</label>
                    <div class="col-sm-10">
                        <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
                            placeholder="Nama Pengguna" name="name" value="{{ old('name') ?: $data->name }}">
                        @error('name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="username">Username</label>
                    <div class="col-sm-10">
                        <input id="username" type="text" class="form-control @error('username') is-invalid @enderror"
                            placeholder="Username" name="username" value="{{ old('username') ?: $data->username }}">
                        @error('username')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="email">Email</label>
                    <div class="col-sm-10">
                        <input id="email" type="text" class="form-control @error('email') is-invalid @enderror"
                            placeholder="Email" name="email" value="{{ old('email') ?: $data->email }}">
                        @error('email')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label" for="role_id">Role / Jabatan</label>
                    <div class="col-sm-10">
                        <select id="role_id" class="select2 form-select" data-allow-clear="true" name="role_id">
                            @foreach ($roles as $item)
                                <option value="{{ $item }}"
                                    @if ($data->getRoleNames()->get(0) == $item) selected="selected" @endif>{{ $item }}
                                </option>
                            @endforeach
                        </select>
                        @error('role_id')
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

@push('styles')
    <link rel="stylesheet" href="{{ assets('vendor/libs/select2/select2.css') }}" />
@endpush

@push('scripts')
    <script src="{{ assets('vendor/libs/select2/select2.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            let $select2 = $('.select2');
            $select2.select2({
                placeholder: 'Pilih nama perizinan',
                dropdownParent: $select2.parent()
            });
        });
    </script>
@endpush
