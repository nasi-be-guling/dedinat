@extends('layouts.app')
@section('title', 'Home')
@section('content')
    <div class="row">
    </div>
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/css/pages/cards-advance.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/select2/select2.css') }}" />
@endpush

@push('scripts')
    <script src="{{ assets('vendor/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    <script src="{{ assets('vendor/libs/select2/select2.js') }}"></script>
    <script type="text/javascript">
        async function getPerizinanDasarSummary() {}

        async function getIzinProduksiSummary() {}

        async function getPerjanjianKerjasamaSummary() {}

        function blockUI(el) {
            $(el).block({
                message: '<div class="sk-wave mx-auto"><div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div></div>',
                css: {
                    backgroundColor: 'transparent',
                    color: '#fff',
                    border: '0'
                },
                overlayCSS: {
                    opacity: 0.5
                }
            });
        }

        $(document).ready(function() {});
    </script>
@endpush
