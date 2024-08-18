@extends('layouts.app')
@section('title', 'Asesmen')
@section('content')
    <div class="card">
        <h5 class="card-header text-center">
            INSTRUMEN ASESMEN RISIKO BENCANA PADA ANAK BERKEBUTUHAN KHUSUS
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
                            <th width="200">Skor V</th>
                            <td width="10">:</td>
                            <td>{{ $ases->skor_v }}</td>
                        </tr>
                        <tr>
                            <th width="200">Umur</th>
                            <td width="10">:</td>
                            <td>{{ $ases->r_child?->umur }} tahun</td>
                            <th width="200">Skor UV</th>
                            <td width="10">:</td>
                            <td>{{ $ases->skor_uv }}</td>
                        </tr>
                        <tr>
                            <th width="200">Jenis Kebutuhan</th>
                            <td width="10">:</td>
                            <td>{{ $ases->r_child?->jenis_kebutuhan }}</td>
                            <th width="200">Skor</th>
                            <td width="10">:</td>
                            <td>{{ $ases->skor }}</td>
                        </tr>
                        {{-- <tr>
                            <th width="200">Skor V</th>
                            <td width="10">:</td>
                            <td>{{ $ases->skor_v }}</td>
                        </tr>
                        <tr>
                            <th width="200">Skor UV</th>
                            <td width="10">:</td>
                            <td>{{ $ases->skor_uv }}</td>
                        </tr>
                        <tr>
                            <th width="200">Skor</th>
                            <td width="10">:</td>
                            <td>{{ $ases->skor }}</td>
                        </tr> --}}
                    </table>
                </div>
                <div class="row">
                    <div class="table-responsive text-nowrap">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th width="25" class="text-center" rowspan="2">No</th>
                                    <th colspan="2" rowspan="2">Variable dan Item Instrumen</th>
                                    <th width="50" class="text-center" rowspan="2">Kode</th>
                                    <th width="80" class="text-center" rowspan="2">Kategori</th>
                                    <th width="50" colspan="5" class="text-center">Skor</th>
                                </tr>
                                <tr>
                                    <th width="10" class="text-center">1</th>
                                    <th width="10" class="text-center">2</th>
                                    <th width="10" class="text-center">3</th>
                                    <th width="10" class="text-center">4</th>
                                    <th width="10" class="text-center">5</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($ases->r_items()->get() as $i => $item)
                                    @if ($item->item_nama == null)
                                        <tr>
                                            <td class="text-center"><b>{{ $item->item_kode }}</b></td>
                                            <td colspan="9" style="text-wrap: wrap;">
                                                <b>{{ $item->variable_nama }}</b>
                                            </td>
                                        </tr>
                                    @elseif ($item->item_nama != null && $item->item_item_id == null)
                                        <tr>
                                            <td></td>
                                            <td width="20" style="border-left: hidden">{{ $item->item_no_urut }}</td>
                                            <td @if ($item->skor == 0) colspan="8" @endif
                                                style="text-wrap: wrap;">
                                                {{ $item->item_nama }}
                                            </td>
                                            @if ($item->skor != 0)
                                                <td class="text-center">{{ $item->item_kode }}</td>
                                                <td class="text-center">{{ $item->item_kategori }}</td>
                                                <td class="text-center">
                                                    @if ($item->skor == 1)
                                                        <i class="fa-solid fa-check"></i>
                                                    @endif
                                                </td>
                                                <td class="text-center">
                                                    @if ($item->skor == 2)
                                                        <i class="fa-solid fa-check"></i>
                                                    @endif
                                                </td>
                                                <td class="text-center">
                                                    @if ($item->skor == 3)
                                                        <i class="fa-solid fa-check"></i>
                                                    @endif
                                                </td>
                                                <td class="text-center">
                                                    @if ($item->skor == 4)
                                                        <i class="fa-solid fa-check"></i>
                                                    @endif
                                                </td>
                                                <td class="text-center">
                                                    @if ($item->skor == 5)
                                                        <i class="fa-solid fa-check"></i>
                                                    @endif
                                                </td>
                                            @endif
                                        </tr>
                                    @elseif ($item->item_nama != null && $item->item_item_id != null && $item->skor != 0)
                                        <tr>
                                            <td colspan="2"></td>
                                            <td style="text-wrap: wrap;">
                                                {{ $item->item_nama }}
                                            </td>
                                            <td class="text-center">{{ $item->item_kode }}</td>
                                            <td class="text-center">{{ $item->item_kategori }}</td>
                                            <td class="text-center">
                                                @if ($item->skor == 1)
                                                    <i class="fa-solid fa-check"></i>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if ($item->skor == 2)
                                                    <i class="fa-solid fa-check"></i>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if ($item->skor == 3)
                                                    <i class="fa-solid fa-check"></i>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if ($item->skor == 4)
                                                    <i class="fa-solid fa-check"></i>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if ($item->skor == 5)
                                                    <i class="fa-solid fa-check"></i>
                                                @endif
                                            </td>
                                        </tr>
                                    @endif
                                @endforeach
                            </tbody>
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

        $(document).ready(function() {
            $(".selectpicker").selectpicker();
        });
    </script>
@endpush
