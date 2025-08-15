@csrf

<div class="mb-3">
    <label for="variable_id" class="form-label">Nama Variabel</label>
    <select name="variable_id" id="variable_id" class="form-select" required>
        <option value="">-- Pilih Variabel --</option>
        @foreach ($variables as $variable)
            <option value="{{ $variable->id }}" {{ old('variable_id', $item->variable_id ?? '') == $variable->id ? 'selected' : '' }}>
                {{ $variable->name }}
            </option>
        @endforeach
    </select>
</div>

<div class="mb-3">
    <label for="name" class="form-label">Nama Item</label>
    <input type="text" name="name" id="name" class="form-control" value="{{ old('name', $item->name ?? '') }}" required>
</div>

<div class="mb-3">
    <label for="category_id" class="form-label">Kategori</label>
    <select name="category_id" id="category_id" class="form-select" required>
        <option value="">-- Pilih Kategori --</option>
        @foreach ($categories as $cat)
            <option value="{{ $cat->id }}" {{ old('category_id', $item->category_id ?? '') == $cat->id ? 'selected' : '' }}>
                {{ $cat->name }}
            </option>
        @endforeach
    </select>
</div>

<div class="mb-3">
    <label for="order_num" class="form-label">No. Urut</label>
    <input type="number" name="order_num" id="order_num" class="form-control" min="1" value="{{ old('order_num', $item->order_num ?? '') }}" required>
</div>

<div class="mb-3">
    <label for="item_id" class="form-label">Parent Item (Opsional)</label>
    <select name="item_id" id="item_id" class="form-select">
        <option value="">-- Tidak ada --</option>
        @foreach ($items as $parent)
            <option value="{{ $parent->id }}" {{ old('item_id', $item->item_id ?? '') == $parent->id ? 'selected' : '' }}>
                {{ $parent->name }}
            </option>
        @endforeach
    </select>
</div>

<div class="d-flex justify-content-end">
    <button type="submit" class="btn btn-primary">Simpan</button>
</div>
