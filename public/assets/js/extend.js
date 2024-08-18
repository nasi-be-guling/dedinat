$(document).ready(function () {
    $("tbody").on("click", ".btn-actions .btn-delete", function (e) {
        e.preventDefault();
        let form = $(this).parents("form");
        Swal.fire({
            title: "Apakah Anda yakin?",
            text: "Menghapus data ini",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Ya",
            cancelButtonText: "Batal",
            customClass: {
                confirmButton: "btn btn-primary me-3",
                cancelButton: "btn btn-label-secondary",
            },
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                blockUI();
                form.submit();
            }
        });
    });

    $("tbody").on("click", ".btn-actions .btn-reset", function (e) {
        e.preventDefault();
        let form = $(this).parents("form");
        Swal.fire({
            title: "Apakah Anda yakin?",
            text: "Mereset password pengguna",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Ya",
            cancelButtonText: "Batal",
            customClass: {
                confirmButton: "btn btn-primary me-3",
                cancelButton: "btn btn-label-secondary",
            },
            buttonsStyling: false,
        }).then(function (result) {
            if (result.value) {
                blockUI();
                form.submit();
            }
        });
    });

    $(".btn-simpan").on("click", function (e) {
        // e.preventDefault();
        const form = $(this).parents("form");
        const swaText = $(this).data("swa-text");
        form.validate({
            submitHandler: function (f) {
                Swal.fire({
                    title: "Apakah Anda yakin?",
                    text: swaText ?? "Menyimpan data ini",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Ya",
                    cancelButtonText: "Batal",
                    customClass: {
                        confirmButton: "btn btn-primary me-3",
                        cancelButton: "btn btn-label-secondary",
                    },
                    buttonsStyling: false,
                }).then(function (result) {
                    if (result.value) {
                        blockUI();
                        f.submit();
                    }
                });
            },
        });
    });

    function blockUI() {
        $.blockUI({
            message:
                '<div class="sk-wave mx-auto"><div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div></div>',
            css: {
                backgroundColor: "transparent",
                border: "0",
            },
            overlayCSS: {
                opacity: 0.5,
            },
            zIndex: 1,
        });
    }
});
