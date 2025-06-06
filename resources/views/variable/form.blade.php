<div class="card">
    <div class="card-body">
        <form action="{{ $action }}" method="POST">
            @csrf
            @if(isset($method) && strtoupper($method) === 'PUT')
                @method('PUT')
            @elseif(isset($method) && strtoupper($method) === 'PATCH')
                @method('PATCH')
            @endif

            <div class="row mb-3">
                <label class="col-sm-3 col-form-label align-right" for="nama">Nama Variable</label>
                <div class="col-sm-9">
                    <input required id="nama" type="text"
                        class="form-control @error('nama') is-invalid @enderror"
                        placeholder="Nama variable" name="nama"
                        value="{{ old('nama', $variable->name ?? '') }}">
                    @error('nama')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label align-right" for="no_urut">No. Urut</label>
                <div class="col-sm-3">
                    <input required id="no_urut" type="number"
                        class="form-control @error('no_urut') is-invalid @enderror"
                        placeholder="Nomor Urut" name="no_urut"
                        value="{{ old('no_urut', $variable->order_num ?? '') }}">
                    @error('no_urut')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
            </div>
            <div class="row mb-3">
                <label class="col-sm-3 col-form-label align-right" for="subs">Subs</label>
                <div class="col-sm-3">
                    <input id="subs" type="text" maxlength="4"
                        class="form-control @error('subs') is-invalid @enderror"
                        placeholder="Subs" name="subs"
                        value="{{ old('subs', $variable->subs ?? '') }}">
                    @error('subs')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>
            </div>
            <div class="row justify-content-end">
                <div class="col-sm-9">
                    <button type="submit" class="btn btn-primary btn-simpan">Simpan</button>
                    <a href="{{ route('variable.index') }}" class="btn btn-secondary">Kembali</a>
                </div>
            </div>
        </form>
    </div>
</div>
