<div class="btn-group btn-group-sm" role="group">
    <a href="{{ $edit }}" class="btn btn-warning" title="Edit">
        <i class="ti ti-edit"></i>
    </a>
    <form action="{{ $delete }}" method="POST" onsubmit="return confirm('Yakin ingin menghapus data ini?');" style="display:inline;">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger" title="Hapus">
            <i class="ti ti-trash"></i>
        </button>
    </form>
</div>
