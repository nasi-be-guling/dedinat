<div class="row mb-3">
    <label class="col-sm-3 col-form-label align-right" for="variable_id">Variable</label>
    <div class="col-sm-9">
        <select class="selectpicker w-100" data-style="btn-default" name="variable_id" required>
            @foreach ($variables as $var)
                <option value="{{ $var->id }}" {{ old('variable_id', $item->variable_id ?? '') == $var->id ? 'selected' : '' }}>
                    {{ ucfirst($var->name) }}
                </option>
            @endforeach
        </select>
    </div>
</div>

<div class="row mb-3">
    <label class="col-sm-3 col-form-label align-right" for="name">Nama Item</label>
    <div class="col-sm-9">
        <input id="name" type="text" name="name"
            class="form-control @error('name') is-invalid @enderror"
            value="{{ old('name', $item->name ?? '') }}" required>
        @error('name')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

<div class="row mb-3">
    <label class="col-sm-3 col-form-label align-right" for="item_id">Parent Item</label>
    <div class="col-sm-6">
        <select name="item_id"
                id="item_id"
                class="selectpicker form-control form-control-sm"
                data-style="btn-default"
                data-live-search="true"
                data-width="100%">
            <option value="">-- Tidak Ada --</option>
            @foreach ($items as $parent)
                @php
                    $isSelf = isset($item) && $item->id == $parent->id;
                    $isChild = isset($item) && in_array($parent->id, $item->getDescendantIds() ?? []);
                    $disabled = $isSelf || $isChild;
                @endphp
                <option value="{{ $parent->id }}"
                        {{ old('item_id', $item->item_id ?? '') == $parent->id ? 'selected' : '' }}
                        {{ $disabled ? 'disabled' : '' }}>
                    {{ $parent->name }} {{ $disabled ? '(tidak valid)' : '' }}
                </option>
            @endforeach
        </select>
        @error('item_id')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>


<div class="row mb-3">
    <label class="col-sm-3 col-form-label align-right" for="category_id">Kategori</label>
    <div class="col-sm-3">
        <select class="selectpicker w-100" data-style="btn-default" name="category_id" required>
            @foreach ($categories as $cat)
                <option value="{{ $cat->id }}" {{ old('category_id', $item->category_id ?? '') == $cat->id ? 'selected' : '' }}>
                    {{ $cat->name }}
                </option>
            @endforeach
        </select>
    </div>
</div>

<div class="row mb-3">
    <label class="col-sm-3 col-form-label align-right" for="order_num">No. Urut</label>
    <div class="col-sm-3">
        <input id="order_num" type="number" name="order_num" min="1"
            class="form-control @error('order_num') is-invalid @enderror"
            value="{{ old('order_num', $item->order_num ?? 1) }}" required>
        @error('order_num')
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror
    </div>
</div>

<div class="row justify-content-end">
    <div class="col-sm-9">
        <button type="submit"
            class="btn btn-primary waves-effect waves-light">{{ $buttonText ?? 'Simpan' }}</button>
        <a href="{{ route('item.index') }}" class="btn btn-secondary waves-effect waves-light">Kembali</a>
    </div>
</div>
