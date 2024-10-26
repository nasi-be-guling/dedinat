@extends('layouts.app')
@section('title', 'Asesmen')
@section('content')
    <div class="card">
        <h5 class="card-header text-center">
            INSTRUMEN DETEKSI DINI KETUNAAN DAN KETERLAMBATAN INTELEKTUAL ELEKTRONIK
        </h5>
        <hr class="m-0">
        <div class="card-body">
            <form action="{{ route('assessment.store') }}" method="post">
                @csrf
                <div class="row mb-3">
                    <label for="selectChild" style="font-size: 16px; font-weight: bolder; padding-left: 1.25rem;">Data Anak
                        Berkebutuhan Khusus</label>
                    <table class="table table-borderless">
                        <tr>
                            <th width="200">Nama</th>
                            <td width="10">:</td>
                            <td>{{ $ases->r_child?->nama }}</td>
                            <th width="200">Skor Ya</th>
                            <td width="10">:</td>
                            <td>{{ $ases->score_yes }}</td>
                        </tr>
                        <tr>
                            <th width="200">Umur</th>
                            <td width="10">:</td>
                            <td>{{ $ases->r_child?->umur }} tahun</td>
                            <th width="200">Skor Tidak</th>
                            <td width="10">:</td>
                            <td>{{ $ases->score_no }}</td>
                        </tr>
                        <tr>
                            <th width="200">Jenis Kebutuhan</th>
                            <td width="10">:</td>
                            <td>{{ $ases->r_child?->jenis_kebutuhan }}</td>
                            <th width="200">Skor</th>
                            <td width="10">:</td>
                            <td>{{ $ases->score }}</td>
                        </tr>
                    </table>
                </div>
                <div class="row mb-3">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover table-sticky">
                            <thead>
                                <tr>
                                    <th width="25" class="text-center" rowspan="2">No</th>
                                    <th rowspan="2">Item Instrumen</th>
                                    <th width="200" class="text-center" rowspan="2">Metode</th>
                                    <th width="50" colspan="2" class="text-center">Respon Anak</th>
                                </tr>
                                <tr>
                                    <th width="10" class="text-center">Ya</th>
                                    <th width="10" class="text-center">Tidak</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $variableId = null;
                                    $indexAz = -1;
                                    $az = range('A', 'Z');
                                @endphp
                                @foreach ($ases->r_items()->get() as $i => $item)
                                    @if ($item->variable_id != $variableId)
                                        @php
                                            $variableId = $item->variable_id;
                                            $indexAz++;
                                        @endphp
                                        <tr>
                                            <td colspan="5" class="text-center">
                                                <b>{{ $az[$indexAz] . '. ' . $item->variable_name }}</b>
                                            </td>
                                        </tr>
                                    @endif
                                    <tr>
                                        <td class="text-center"><b>{{ $i + 1 }}</b></td>
                                        <td>
                                            {{ $item->item_name }}
                                        </td>
                                        <td class="text-center" style="white-space: pre;">{!! $item->r_item->method_id_html !!}</td>
                                        <td class="text-center">
                                            @if ($item->score == 1)
                                                <i class="fa-solid fa-check"></i>
                                            @endif
                                        </td>
                                        <td class="text-center">
                                            @if ($item->score == 0)
                                                <i class="fa-solid fa-check"></i>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr style="background-color: #fde68a">
                                    <td colspan="3" style="text-align: right">
                                        <b>{{ $ases->r_category?->footer_diduga }}</b>
                                    </td>
                                    <td colspan="2"><b>Diduga</b></td>
                                </tr>
                                <tr style="background-color: #d9f99d">
                                    <td colspan="3" style="text-align: right">
                                        <b>{{ $ases->r_category?->footer_normal }}</b>
                                    </td>
                                    <td colspan="2"><b>Normal</b></td>
                                </tr>
                                <tr style="background-color: #ddd6fe">
                                    <td colspan="3" style="text-align: right"><b>Hasil</b></td>
                                    <td id="tdHasil" colspan="2" style="font-weight: bolder"></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/css/pages/cards-advance.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/bootstrap-select/bootstrap-select.css') }}" />
    <style type="text/css">
        th,
        td {
            align-content: center;
        }

        label.error {
            display: none !important;
        }
    </style>
@endpush

@push('scripts')
    <script src="{{ assets('vendor/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    <script src="{{ assets('vendor/libs/bootstrap-select/bootstrap-select.js') }}"></script>
    <script type="text/javascript">
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
