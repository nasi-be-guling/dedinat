<div class="row mb-3">
    <label class="col-sm-2 col-form-label" for="old_password">Password Lama</label>
    <div class="col-sm-10">
        <input id="old_password" type="password"
            class="form-control @error('old_password') is-invalid @enderror"
            name="old_password" placeholder="Password Lama" value="{{ old('old_password') }}">
        @error('old_password')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>
<div class="row mb-3">
    <label class="col-sm-2 col-form-label" for="password">Password Baru</label>
    <div class="col-sm-10">
        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror"
            name="password" placeholder="Password Baru">
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
            name="password_confirmation" placeholder="Ulangi Password Baru">
        @error('password_confirmation')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>
