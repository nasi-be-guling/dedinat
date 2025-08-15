@csrf
<div class="mb-3">
    <label for="nama" class="form-label">Nama Anak</label>
    <input type="text" class="form-control" id="nama" name="nama" value="{{ old('nama', $child->nama ?? '') }}" required>
</div>
<div class="mb-3">
    <label for="alamat" class="form-label">Alamat</label>
    <textarea class="form-control" id="alamat" name="alamat" rows="3" required>{{ old('alamat', $child->alamat ?? '') }}</textarea>
</div>
<div class="mb-3">
    <label for="umur" class="form-label">Umur</label>
    <input type="number" class="form-control" id="umur" name="umur" value="{{ old('umur', $child->umur ?? '') }}" required>
</div>
<div class="mb-3">
    <label for="jenis_kebutuhan" class="form-label">Jenis Kebutuhan</label>
    <input type="text" class="form-control" id="jenis_kebutuhan" name="jenis_kebutuhan" value="{{ old('jenis_kebutuhan', $child->jenis_kebutuhan ?? '') }}" required>
</div>
