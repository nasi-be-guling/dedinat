<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="{{ assets('vendor/libs/jquery/jquery.js') }}"></script>
<script src="{{ assets('vendor/libs/popper/popper.js') }}"></script>
<script src="{{ assets('vendor/js/bootstrap.js') }}"></script>
<script src="{{ assets('vendor/libs/perfect-scrollbar/perfect-scrollbar.js') }}"></script>
<script src="{{ assets('vendor/libs/node-waves/node-waves.js') }}"></script>
<script src="{{ assets('vendor/libs/hammer/hammer.js') }}"></script>
<script src="{{ assets('vendor/libs/i18n/i18n.js') }}"></script>
<script src="{{ assets('vendor/libs/typeahead-js/typeahead.js') }}"></script>
<script src="{{ assets('vendor/js/menu.js') }}"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="{{ assets('vendor/libs/sweetalert2/sweetalert2.js') }}"></script>
<script src="{{ assets('vendor/libs/block-ui/block-ui.js') }}"></script>
<script src="{{ assets('vendor/libs/bootstrap-select/bootstrap-select.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.20.x/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
    $.extend($.validator.messages, {
        required: "Kolom ini harus diisi.",
        remote: "Harap benarkan kolom ini.",
        email: "Silakan masukkan format email yang benar.",
        url: "Silakan masukkan format URL yang benar.",
        date: "Silakan masukkan format tanggal yang benar.",
        dateISO: "Silakan masukkan format tanggal(ISO) yang benar.",
        number: "Silakan masukkan angka yang benar.",
        digits: "Harap masukan angka saja.",
        creditcard: "Harap masukkan format kartu kredit yang benar.",
        equalTo: "Harap masukkan nilai yg sama dengan sebelumnya.",
        maxlength: $.validator.format("Input dibatasi hanya {0} karakter."),
        minlength: $.validator.format("Input tidak kurang dari {0} karakter."),
        rangelength: $.validator.format("Panjang karakter yg diizinkan antara {0} dan {1} karakter."),
        range: $.validator.format("Harap masukkan nilai antara {0} dan {1}."),
        max: $.validator.format("Harap masukkan nilai lebih kecil atau sama dengan {0}."),
        min: $.validator.format("Harap masukkan nilai lebih besar atau sama dengan {0}.")
    });
    @if (session('notify'))
        const t = document.getElementById('app-bstoast');
        const toast = new bootstrap.Toast(t);
        toast.show();
    @endif
</script>

<!-- Main JS -->
<script src="{{ assets('js/main.js') }}"></script>
<script src="{{ assets('js/forms-selects.js') }}"></script>

<!-- Page JS -->
@stack('scripts')
<script src="{{ assets('js/extend.js') }}" defer></script>
