<div class="card">
    <div class="card-body">
        <form action="{{ $action }}" method="POST">
            @csrf
            @if($method === 'PUT') @method('PUT') @endif

            <div class="mb-3">
                <label for="name">Nama Kategori</label>
                <input type="text" name="name" class="form-control" required
                       value="{{ old('name', $model->name ?? '') }}">
            </div>

            <div class="mb-3">
                <label for="rumus">Rumus</label>
                <input type="text" name="rumus" class="form-control"
                       value="{{ old('rumus', $model->rumus ?? '') }}">
            </div>

            <div class="mb-3">
                <label for="footer_diduga">Footer Diduga</label>
                <textarea name="footer_diduga" class="form-control" rows="3">{{ old('footer_diduga', $model->footer_diduga ?? '') }}</textarea>
            </div>

            <div class="mb-3">
                <label for="footer_normal">Footer Normal</label>
                <textarea name="footer_normal" class="form-control" rows="3">{{ old('footer_normal', $model->footer_normal ?? '') }}</textarea>
            </div>

            <button type="submit" class="btn btn-primary">Simpan</button>
            <a href="{{ route('category.index') }}" class="btn btn-secondary">Batal</a>
        </form>
    </div>
</div>
