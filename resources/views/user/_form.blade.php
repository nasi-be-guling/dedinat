@php
    $isEdit = isset($data);
@endphp

<div class="row mb-3">
    <label class="col-sm-2 col-form-label" for="name">Nama Pengguna</label>
    <div class="col-sm-10">
        <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
            name="name" placeholder="Nama Pengguna"
            value="{{ old('name', $isEdit ? $data->name : '') }}">
        @error('name')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

<div class="row mb-3">
    <label class="col-sm-2 col-form-label" for="username">Username</label>
    <div class="col-sm-10">
        <input id="username" type="text" class="form-control @error('username') is-invalid @enderror"
            name="username" placeholder="Username"
            value="{{ old('username', $isEdit ? $data->username : '') }}">
        @error('username')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

<div class="row mb-3">
    <label class="col-sm-2 col-form-label" for="email">Email</label>
    <div class="col-sm-10">
        <input id="email" type="text" class="form-control @error('email') is-invalid @enderror"
            name="email" placeholder="Email"
            value="{{ old('email', $isEdit ? $data->email : '') }}">
        @error('email')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

@if (!$isEdit)
    <div class="row mb-3">
        <label class="col-sm-2 col-form-label" for="password">Password</label>
        <div class="col-sm-10">
            <input id="password" type="password" class="form-control @error('password') is-invalid @enderror"
                name="password" placeholder="Password">
            @error('password')
                <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
    </div>

    <div class="row mb-3">
        <label class="col-sm-2 col-form-label" for="password_confirmation">Konfirmasi Password</label>
        <div class="col-sm-10">
            <input id="password_confirmation" type="password"
                class="form-control @error('password_confirmation') is-invalid @enderror"
                name="password_confirmation" placeholder="Konfirmasi Password">
            @error('password_confirmation')
                <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
    </div>
@endif

<div class="row mb-3">
    <label class="col-sm-2 col-form-label" for="role_id">Role / Jabatan</label>
    <div class="col-sm-10">
        <select id="role_id" class="select2 form-select" name="role_id" data-allow-clear="true">
            @foreach ($roles as $item)
                <option value="{{ $item }}"
                    @selected(old('role_id', $isEdit ? $data->getRoleNames()->first() : '') == $item)>
                    {{ $item }}
                </option>
            @endforeach
        </select>
        @error('role_id')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>
