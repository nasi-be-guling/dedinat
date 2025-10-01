@extends('layouts.app')
@section('title', 'Buat Asesmen Anak')

@section('content')
    <div id="asesmen1" class="card">
        <h5 class="card-header text-center">
            INSTRUMEN DETEKSI DINI KETUNAAN DAN KETERLAMBATAN INTELEKTUAL ELEKTRONIK
        </h5>
        <hr class="m-0">
        <div class="card-body">
            <form id="frmAssessment" action="{{ route('assessment.store') }}" method="post">
                @csrf

                <div class="row mb-2">
                    <div class="form-floating">
                        <select id="selectChild" name="child_id"
                                class="selectpicker form-control w-100"
                                data-style="btn-default" data-show-subtext="true" required>
                            <option value="" disabled selected>-- Pilih Anak --</option>
                            @foreach ($childs as $child)
                                <option value="{{ $child->id }}"
                                        data-child-name="{{ $child->nama }}"
                                        data-subtext="Umur: {{ $child->umur }} tahun, Jenis Kebutuhan: {{ $child->jenis_kebutuhan }}">
                                    {{ $child->nama }}
                                </option>
                            @endforeach
                        </select>
                        @error('child_id')
                            <div class="invalid-feedback d-block">{{ $message }}</div>
                        @enderror
                        <label for="selectChild"
                               style="font-size: 18px; font-weight: bolder; color: #37373b; line-height: 18px;">
                            Data Anak Berkebutuhan Khusus
                        </label>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="form-floating">
                        <select id="selectCategory" name="category_id"
                                class="selectpicker form-control w-100"
                                data-style="btn-default" data-show-subtext="true" required>
                            <option value="" disabled selected>-- Pilih Kategori --</option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id }}" data-child-name="{{ $category->name }}">
                                    {{ $category->name }}
                                </option>
                            @endforeach
                        </select>
                        @error('category_id')
                            <div class="invalid-feedback d-block">{{ $message }}</div>
                        @enderror
                        <label for="selectCategory"
                               style="font-size: 18px; font-weight: bolder; color: #37373b; line-height: 18px;">
                            Kategori
                        </label>
                    </div>
                </div>

                {{-- Partial instrumen akan dimuat di sini.
                     NOTE: Partial (assessment.form-item) SUDAH membaca $item->subs dari DB
                     sehingga judul sub-kategori akan tampil "A.1", "A.2", dst sesuai DB --}}
                <div class="row mb-3" id="form-item1">
                    <div class="text-muted">
                        Silakan pilih <b>Kategori</b> untuk memuat instrumen asesmen.
                    </div>
                </div>

                <div class="text-center">
                    <button id="btnSimpan" type="submit"
                            data-swa-text="Anda tidak dapat mengubah jawaban setelah menyimpan asesmen ini"
                            class="btn btn-simpan btn-primary waves-effect waves-light btn-lg w-25"
                            disabled>
                        Simpan
                    </button>
                    <a href="{{ route('assessment.index') }}" class="btn btn-secondary btn-lg w-25 ms-2">Batal</a>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ assets('vendor/css/pages/cards-advance.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/bootstrap-select/bootstrap-select.css') }}" />
    <style type="text/css">
        th, td { align-content: center; }
        label.error { display: none !important; }
    </style>
@endpush

@push('scripts')
    <script src="{{ assets('vendor/libs/bootstrap-select/bootstrap-select.js') }}"></script>
    <script type="text/javascript">
        function blockUI(el) {
            $(el).block({
                message: '<div class="sk-wave mx-auto"><div class="sk-rect sk-wave-rect"></div><div class="sk-rect sk-wave-rect"></div><div class="sk-rect sk-wave-rect"></div><div class="sk-rect sk-wave-rect"></div><div class="sk-rect sk-wave-rect"></div></div>',
                css: { backgroundColor: 'transparent', color: '#fff', border: '0' },
                overlayCSS: { opacity: 0.5 }
            });
        }

        $(document).ready(function () {
            // Init bootstrap-select
            $('.selectpicker').selectpicker();

            const $selectCategory = $('#selectCategory');
            const $formItem       = $('#form-item1');
            const $btnSimpan      = $('#btnSimpan');

            function setLoading(on) {
                $btnSimpan.prop('disabled', true);
                if (on) {
                    $formItem.html(
                        '<div class="d-flex align-items-center text-muted" style="gap:.5rem;">' +
                        '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>' +
                        '<span>Memuat instrumen…</span>' +
                        '</div>'
                    );
                }
            }

            $('#selectCategory').on('change', function () {
                $formItem.html('');
                blockUI('#asesmen1');

                const id = $(this).val();
                if (!id) {
                    $btnSimpan.prop('disabled', true);
                    $('#asesmen1').unblock();
                    return;
                }

                setLoading(true);

                $.ajax({
                    url: "{{ url('assessment/generate-form') }}",
                    type: "POST",
                    data: {
                        id: id,
                        _token: "{{ csrf_token() }}"
                    },
                    success: function (res) {
                        $formItem.html(res);

                        // Antisipasi: bila partial menyisipkan input name="category_id", ganti agar tidak override select utama
                        $formItem.find('input[name="category_id"]').attr('name', 'category_id_dup');

                        // UX: klik sel langsung pilih radio
                        $("td.check").off('click').on("click", function () {
                            $(this).find(".form-check-input").prop("checked", true);
                            $(this).find(".form-check-input.error").removeClass("error");
                            $(this).siblings().find(".form-check-input.error").removeClass("error");
                        });

                        $btnSimpan.prop('disabled', false);
                    },
                    error: function (err) {
                        console.error('Gagal memuat instrumen:', err);
                        $formItem.html('<div class="alert alert-warning">Gagal memuat instrumen. Silakan coba lagi.</div>');
                        $btnSimpan.prop('disabled', true);
                    },
                    complete: function () {
                        $('#asesmen1').unblock();
                    }
                });
            });

            // Jika balik dari validasi dan kategori sudah terpilih, muat ulang
            if ($selectCategory.val()) {
                $selectCategory.trigger('change');
            }
        });
    </script>
@endpush
