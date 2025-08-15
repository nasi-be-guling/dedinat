<div class="d-flex justify-content-start gap-1">
    <a href="{{ $editUrl }}" class="btn btn-warning btn-sm" title="Edit">
        <i class="fa fa-edit"></i>
    </a>
    <form action="{{ $deleteUrl }}" method="POST" onsubmit="return confirm('Yakin ingin menghapus data ini?')">
        @csrf
        @method('DELETE')
        <button class="btn btn-danger btn-sm" title="Hapus">
            <i class="fa fa-trash"></i>
        </button>
    </form>
</div>
