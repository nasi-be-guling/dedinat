<!DOCTYPE html>

<html lang="en" class="light-style customizer-hide" dir="ltr" data-theme="theme-default"
    data-assets-path="{{ assets('') . '/' }}" data-template="vertical-menu-template">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>{{ config('app.name') }} | Pilih Role</title>
    <meta name="description" content="{{ config('app.name_long') }}" />

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

    <!-- Core CSS -->
    <link rel="stylesheet" href="{{ assets('vendor/css/rtl/core.css') }}" class="template-customizer-core-css" />
    <link rel="stylesheet" href="{{ assets('vendor/css/rtl/theme-default.css') }}"
        class="template-customizer-theme-css" />
    <link rel="stylesheet" href="{{ assets('css/demo.css') }}" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="{{ assets('vendor/libs/formvalidation/dist/css/formValidation.min.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/bootstrap-select/bootstrap-select.css') }}" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="{{ assets('vendor/css/pages/page-auth.css') }}" />

    <!-- Helpers -->
    <script src="{{ assets('vendor/js/helpers.js') }}"></script>
    <script src="{{ assets('vendor/js/template-customizer.js') }}"></script>
    <script src="{{ assets('js/config.js') }}"></script>
</head>

<body>
    <!-- Content -->
    <div class="container-xxl">
        <div class="authentication-wrapper authentication-basic container-p-y">
            <div class="authentication-inner py-4">
                <!-- Login -->
                <div class="card">
                    <div class="card-body">
                        <h4 class="mb-2 text-center">Pilih Role</h4>
                        <form class="mb-3" action="{{ route('auth.set-role') }}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label for="role" class="form-label">Role</label>
                                <select class="selectpicker w-100" data-style="btn-default" name="role"
                                    id="role">
                                    @foreach (auth()->user()->roles()->get() as $role)
                                        <option value="{{ $role->id }}">{{ ucfirst($role->name) }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div>
                                <button class="btn btn-primary d-grid w-100" type="submit">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Login -->
            </div>
        </div>
    </div>
    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="{{ assets('vendor/libs/jquery/jquery.js') }}"></script>
    <script src="{{ assets('vendor/js/bootstrap.js') }}"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="{{ assets('vendor/libs/formvalidation/dist/js/FormValidation.min.js') }}"></script>
    <script src="{{ assets('vendor/libs/formvalidation/dist/js/plugins/Bootstrap5.min.js') }}"></script>
    <script src="{{ assets('vendor/libs/formvalidation/dist/js/plugins/AutoFocus.min.js') }}"></script>
    <script src="{{ assets('vendor/libs/bootstrap-select/bootstrap-select.js') }}"></script>

    <!-- Main JS -->
    <script src="{{ assets('js/main.js') }}"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".selectpicker").selectpicker();
        });
    </script>
</body>

</html>
