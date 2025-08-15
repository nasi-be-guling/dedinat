@extends('layouts.app')

@section('title', 'Item')

@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Daftar Item</h5>
        <a href="{{ route('item.create') }}" class="btn btn-primary btn-sm">Tambah Item</a>
    </div>
    <div class="card-body">
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
        {{ $dataTable->table(['class' => 'table table-bordered table-striped', 'id' => 'item-table']) }}
    </div>
</div>
@endsection

@push('scripts')
    {{ $dataTable->scripts(attributes: ['type' => 'module']) }}
    <script type="module">
        document.addEventListener('DOMContentLoaded', function () {
            const table = document.getElementById('item-table');
            if (table) {
                table.addEventListener('click', function(e) {
                    const target = e.target.closest('.delete-item');
                    if (target) {
                        e.preventDefault();
                        const url = target.dataset.url;
                        Swal.fire({
                            title: 'Hapus Data',
                            text: 'Apakah Anda yakin ingin menghapus data ini?',
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: 'Ya, Hapus!',
                            cancelButtonText: 'Batal'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                fetch(url, {
                                    method: 'DELETE',
                                    headers: {
                                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                                        'Accept': 'application/json',
                                    }
                                })
                                .then(response => response.json())
                                .then(data => {
                                    Swal.fire('Berhasil!', data.message, 'success');
                                    $('#item-table').DataTable().ajax.reload();
                                })
                                .catch(err => {
                                    Swal.fire('Gagal!', 'Terjadi kesalahan.', 'error');
                                });
                            }
                        });
                    }
                });
            }
        });
    </script>
@endpush
