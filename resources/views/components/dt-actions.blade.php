@props(['editUrl', 'deleteUrl'])

<div class="d-flex gap-1">
    <a href="{{ $editUrl }}" class="btn btn-warning btn-sm">
        <i class="ti ti-edit"></i>
    </a>

    <form action="{{ $deleteUrl }}" method="POST" onsubmit="return confirm('Hapus data ini?')">
        @csrf
        @method('DELETE')
        <button class="btn btn-danger btn-sm">
            <i class="ti ti-trash"></i>
        </button>
    </form>
</div>
