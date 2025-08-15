@csrf
<div class="row mb-3">
    <label for="variable_id" class="col-sm-2 col-form-label">Nama Variabel</label>
    <div class="col-sm-10">
        <select name="variable_id" id="variable_id" class="form-select" required>
            <option value="">-- Pilih Variabel --</option>
            @foreach ($variables as $variable)
                <option value="{{ $variable->id }}" {{ old('variable_id', $item->variable_id ?? '') == $variable->id ? 'selected' : '' }}>
                    {{ $variable->name }}
                </option>
            @endforeach
        </select>
    </div>
</div>

<div class="row mb-3">
    <label for="name" class="col-sm-2 col-form-label">Nama Item</label>
    <div class="col-sm-10">
        <input type="text" name="name" id="name" class="form-control" value="{{ old('name', $item->name ?? '') }}" required>
    </div>
</div>

<div class="row mb-3">
    <label for="category_id" class="col-sm-2 col-form-label">Kategori</label>
    <div class="col-sm-10">
        <select name="category_id" id="category_id" class="form-select" required>
            <option value="">-- Pilih Kategori --</option>
            @foreach ($categories as $category)
                <option value="{{ $category->id }}" {{ old('category_id', $item->category_id ?? '') == $category->id ? 'selected' : '' }}>
                    {{ $category->name }}
                </option>
            @endforeach
        </select>
    </div>
</div>

<div class="row mb-3">
    <label for="order_num" class="col-sm-2 col-form-label">No. Urut</label>
    <div class="col-sm-10">
        <input type="number" name="order_num" id="order_num" class="form-control" min="1" value="{{ old('order_num', $item->order_num ?? '') }}" required>
    </div>
</div>

<div class="row mb-3">
    <label for="item_id" class="col-sm-2 col-form-label">Parent Item</label>
    <div class="col-sm-10">
        <select name="item_id" id="item_id" class="form-select">
            <option value="">-- Tidak Ada --</option>
            @foreach ($parentItems as $parent)
                <option value="{{ $parent->id }}" {{ old('item_id', $item->item_id ?? '') == $parent->id ? 'selected' : '' }}>
                    {{ $parent->name }}
                </option>
            @endforeach
        </select>
    </div>
</div>

<div class="d-flex justify-content-end">
    <button type="submit" class="btn btn-primary">Simpan</button>
</div>
