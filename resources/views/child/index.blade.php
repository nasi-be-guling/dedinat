@extends('layouts.app')
@section('title', 'Data Anak')

@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between">
        <h5>Daftar Anak Berkebutuhan Khusus</h5>
        <a href="{{ route('child.create') }}" class="btn btn-primary btn-sm">Tambah Anak</a>
    </div>
    <div class="card-body">
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        <table class="table table-bordered table-hover dt-responsive w-100" id="child-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>Alamat</th>
                    <th>Umur</th>
                    <th>Jenis Kebutuhan</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
    </div>
</div>
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
@endpush

@push('scripts')
<script>
$(function () {
    if (!$.fn.DataTable.isDataTable('#child-table')) {
        $('#child-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ route("child.index") }}',
            columns: [
                { data: 'id', name: 'id' },
                { data: 'nama', name: 'nama' },
                { data: 'alamat', name: 'alamat' },
                { data: 'umur', name: 'umur' },
                { data: 'jenis_kebutuhan', name: 'jenis_kebutuhan' },
                { data: 'action', name: 'action', orderable: false, searchable: false },
            ],
            drawCallback: function() {
                $('[data-bs-toggle="tooltip"]').tooltip();
            }
        });
    }
});
</script>
@endpush
