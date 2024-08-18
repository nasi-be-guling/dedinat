@extends('layouts.app')
@section('title', 'Variable')
@section('content')
    <div class="card">
        <div class="card-header header-elements">
            <h5>Data Variable</h5>
            <div class="card-header-elements ms-auto">
                <a type="button" class="btn btn-md btn-primary waves-effect waves-light" href="{{ route('variable.create') }}"
                    data-bs-toggle="tooltip" data-bs-placement="top" title="Tambah Data Variable">
                    <span class="tf-icon ti ti-plus"></span>Tambah
                </a>
            </div>
        </div>
        <div class="card-body card-datatable text-nowrap">
            {{ $dataTable->table() }}
        </div>
    </div>
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
@endpush

@push('scripts')
    <script src="{{ assets('vendor/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    {{ $dataTable->scripts(attributes: ['type' => 'module']) }}
@endpush
