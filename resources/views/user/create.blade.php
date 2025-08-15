<form action="{{ route('user.store') }}" method="post">
    @csrf
    @include('user._form')
    <div class="row justify-content-end">
        <div class="col-sm-10">
            <button type="submit" class="btn btn-primary">Simpan</button>
        </div>
    </div>
</form>
