<form action="{{ route('user.change-password') }}" method="post">
    @csrf
    @include('user._change-password-form')
    <div class="row justify-content-end">
        <div class="col-sm-10">
            <button type="submit" class="btn btn-primary">Simpan</button>
        </div>
    </div>
</form>
