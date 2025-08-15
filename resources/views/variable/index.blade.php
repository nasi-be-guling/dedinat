@extends('layouts.app')
@section('title', 'Variable')

@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between">
        <h5>Daftar Variable</h5>
        <a href="{{ route('variable.create') }}" class="btn btn-primary btn-sm">Tambah Variable</a>
    </div>
    <div class="card-body">
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        <table class="table table-bordered table-hover dt-responsive" id="variable-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama Variable</th>
                    <th>No. Urut</th>
                    <th>Aksi</th>
                </tr>
            </thead>
        </table>
    </div>
</div>
@endsection
@push('scripts')
<script>
$(function () {
    if (!$.fn.DataTable.isDataTable('#variable-table')) {
    $('#variable-table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/master/variable',
        columns: [
            { data: 'id', name: 'id' },
            { data: 'name', name: 'name' },
            { data: 'subs', name: 'subs' },
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