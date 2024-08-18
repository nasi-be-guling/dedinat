<!DOCTYPE html>

<html lang="en" class="light-style customizer-hide" dir="ltr" data-theme="theme-default"
    data-assets-path="{{ assets('') . '/' }}" data-template="vertical-menu-template">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <title>{{ config('app.name') }} | Login</title>
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
                        <h4 class="pt-2 text-center">{{ strtoupper(config('app.name')) }}</h4>
                        <h5 class="mb-5 text-center">{{ config('app.name_long') }}</h5>
                        <form id="formAuthentication" class="mb-3" action="/login" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" class="form-control" id="email" name="username"
                                    placeholder="Masukkan alamat email" autofocus />
                            </div>
                            <div class="mb-3 form-password-toggle">
                                <div class="d-flex justify-content-between">
                                    <label class="form-label" for="password">Password</label>
                                </div>
                                <div class="input-group input-group-merge">
                                    <input type="password" id="password" class="form-control" name="password"
                                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                        aria-describedby="password" />
                                    <span class="input-group-text cursor-pointer"><i class="ti ti-eye-off"></i></span>
                                </div>
                            </div>
                            <div>
                                <button class="btn btn-primary d-grid w-100" type="submit">Login</button>
                            </div>
                            <div class="divider my-3">
                                <div class="divider-text">atau</div>
                            </div>
                            <div class="d-flex flex-column gap-2">
                                {{-- <a id="login-google" type="button" href="#"
                                    class="btn btn-outline-google-plus waves-effect waves-light w-100">
                                    <i class="tf-icons ti ti-brand-google ti-xs me-1"></i> Login dengan Google
                                </a> --}}
                                <a href="{{ route('google.login') }}" type="button"
                                    class="btn btn-outline-google-plus waves-effect waves-light w-100">
                                    <i class="tf-icons ti ti-brand-google ti-xs me-1"></i> Login dengan Google
                                </a>
                                {{-- <a href="{{ route('facebook.login') }}" type="button"
                                    class="btn btn-outline-facebook waves-effect waves-light w-100">
                                    <i class="tf-icons ti ti-brand-facebook ti-xs me-1"></i> Login dengan Facebook
                                </a> --}}
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

    <!-- Main JS -->
    <script src="{{ assets('js/main.js') }}"></script>

    <!-- Page JS -->
    <script src="{{ assets('js/pages-auth.js') }}"></script>

    {{-- <script type="text/javascript">
        var signInWin;
        $("#login-google").click(function(e) {
            const left = (screen.width / 2) - (500 / 2);
            const top = (screen.height / 2) - (700 / 2);
            e.preventDefault();
            signinWin = window.open("{!! URL::to('auth/google/login') !!}", "SignIn",
                "width=500,height=700,toolbar=0,scrollbars=0,status=0,resizable=0,location=0,menuBar=0, top=" +
                top + ", left=" + left);
            const intervalId = setInterval(() => {
                if (signinWin?.closed) {
                    clearInterval(intervalId);
                    console.log(signinWin);
                }
            }, 1000);
        });
    </script> --}}
</body>

</html>
