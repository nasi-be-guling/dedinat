@extends('layouts.app')
@section('title', 'Buat Asesmen Anak')
@section('content')
    <div id="asesmen1" class="card">
        <h5 class="card-header text-center">
            INSTRUMEN DETEKSI DINI KETUNAAN DAN KETERLAMBATAN INTELEKTUAL ELEKTRONIK
        </h5>
        <hr class="m-0">
        <div class="card-body">
            {{-- <div class="alert alert-primary alert-dismissible mb-3" role="alert">
                <h4 class="alert-heading d-flex align-items-center">
                    <i class="mdi mdi-chat-alert-outline mdi-24px me-2"></i>Petunjuk
                </h4>
                <hr>
                <ol class="mb-0">
                    <li>
                        Pilih data anak yang tersedia
                    </li>
                    <li>
                        Jika data anak tidak sesuai yang diinginkan, dapat ditambahkan pada menu profil
                    </li>
                    <li>
                        Berikan penilaian pada tiap item dengan memberikan skor 1 - 5
                    </li>
                    <li>
                        Perhitungan pemberian penilaian atas dasar kualitas masing-masing item
                    </li>
                    <li>
                        Penilaian didasarkan pada masing-masing anak dengan kategori:
                    </li>
                </ol>
                <ul style="margin-left: 20px">
                    <li>
                        V = Favourable (kondisi yang baik)
                    </li>
                    <li>
                        UV = Unfavourable (kondisi yang tidak baik)
                    </li>
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div> --}}
            <form action="{{ route('assessment.store') }}" method="post">
                @csrf
                @php
                    $az = range('A', 'Z');
                @endphp
                <div class="row mb-2">
                    <div class="form-floating">
                        <select id="selectChild" name="child_id" class="selectpicker form-control w-100"
                            data-style="btn-default" data-show-subtext="true">
                            @foreach ($childs as $child)
                                <option value="{{ $child->id }}" data-child-name="{{ $child->nama }}"
                                    data-subtext="Umur: {{ $child->umur }} tahun, Jenis Kebutuhan: {{ $child->jenis_kebutuhan }}">
                                    {{ $child->nama }}</option>
                            @endforeach
                        </select>
                        @error('child')
                            <div class=" invalid-feedback">{{ $message }}</div>
                        @enderror
                        <label for="selectChild"
                            style="font-size: 18px; font-weight: bolder; color: #37373b; line-height: 18px;">Data Anak
                            Berkebutuhan Khusus</label>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="form-floating">
                        <select id="selectCategory" name="category_id" class="selectpicker form-control w-100"
                            data-style="btn-default" data-show-subtext="true">
                            <option value="" selected disabled>Pilih Kategori</option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id }}" data-child-name="{{ $category->name }}">
                                    {{ $category->name }}</option>
                            @endforeach
                        </select>
                        @error('categories')
                            <div class=" invalid-feedback">{{ $message }}</div>
                        @enderror
                        <label for="selectCategory"
                            style="font-size: 18px; font-weight: bolder; color: #37373b; line-height: 18px;">Kategori</label>
                    </div>
                </div>
                <div class="row mb-3" id="form-item1">
                </div>
                <div class="text-center">
                    <button type="submit" data-swa-text="Anda tidak dapat mengubah jawaban setelah menyimpan asesmen ini"
                        class="btn btn-simpan btn-primary waves-effect waves-light btn-lg w-25">Simpan</button>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('styles')
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
            $("#selectCategory").on("change", function() {
                $("#form-item1").html("");
                blockUI("#asesmen1");
                const id = $(this).val();
                $.ajax({
                    url: "{{ url('assessment/generate-form') }}",
                    type: "POST",
                    data: {
                        id
                    },
                    success: function(res) {
                        $("#form-item1").html(res);
                        $("td.check").on("click", function() {
                            $(this).find(".form-check-input").prop("checked", true);
                            $(this).find(".form-check-input.error").removeClass(
                                "error");
                            $(this).siblings().find(".form-check-input.error")
                                .removeClass("error");
                        });
                    },
                    error: function(err) {
                        // console.log("error", err);
                    },
                    complete: function() {
                        $("#asesmen1").unblock();
                    }
                });
            });
        });
    </script>
@endpush
