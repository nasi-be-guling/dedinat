<!-- Favicon -->
{{--
<link rel="icon" type="image/x-icon" href="{{ assets('img/favicon/favicon.ico') }}" /> --}}

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
    href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
    rel="stylesheet" />

<!-- Icons -->
<link rel="stylesheet" href="{{ assets('vendor/fonts/fontawesome.css') }}" />
<link rel="stylesheet" href="{{ assets('vendor/fonts/tabler-icons.css') }}" />

<link rel="stylesheet" href="{{ assets('vendor/fonts/flag-icons.css') }}" />
<link rel="stylesheet" href="{{ assets('vendor/fonts/materialdesignicons.css') }}" />
<link rel="stylesheet" href="{{ assets('vendor/fonts/flag-icons.css') }}" />

<!-- Core CSS -->
<link rel="stylesheet" href="{{ assets('vendor/css/rtl/core.css') }}" class="template-customizer-core-css" />
<link rel="stylesheet" href="{{ assets('vendor/css/rtl/theme-default.css') }}" class="template-customizer-theme-css" />
<link rel="stylesheet" href="{{ assets('css/demo.css') }}" />
<link rel="stylesheet" href="{{ assets('css/extend.css') }}" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="{{ assets('vendor/libs/perfect-scrollbar/perfect-scrollbar.css') }}" />
<link rel="stylesheet" href="{{ assets('vendor/libs/node-waves/node-waves.css') }}" />
<link rel="stylesheet" href="{{ assets('vendor/libs/typeahead-js/typeahead.css') }}" />
<link rel="stylesheet" href="{{ assets('vendor/libs/sweetalert2/sweetalert2.css') }}" />
<link rel="stylesheet" href="{{ assets('vendor/libs/spinkit/spinkit.css') }}" />
<link rel="stylesheet" href="{{ assets('vendor/libs/bootstrap-select/bootstrap-select.css') }}" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="{{ assets('vendor/js/helpers.js') }}"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
<script src="{{ assets('vendor/js/template-customizer.js') }}"></script>
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="{{ assets('js/config.js') }}"></script>
{{-- <script src="https://cdn.tailwindcss.com"></script> --}}

<style>
    #template-customizer {
        visibility: hidden !important;
    }
</style>

@stack('styles')
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css">
<style>
/* Fix agar icon tabler muncul di sub-menu */
.menu-sub i[class^="ti"], .menu-sub i[class*=" ti"] {
    font-family: 'tabler-icons' !important;
    font-style: normal;
    font-weight: normal;
    speak: never;
    display: inline-block;
    text-decoration: inherit;
    text-align: center;
    font-size: 1rem;
    line-height: 1;
    margin-right: 0.5rem;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

/* Optional: Hilangkan bullet bawaan ul */
.menu-sub li {
    list-style: none;
}
</style>
