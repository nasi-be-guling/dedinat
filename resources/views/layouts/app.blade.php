<!DOCTYPE html>

<html lang="en" class="light-style layout-navbar-fixed layout-menu-fixed" dir="ltr" data-theme="theme-default"
    data-assets-path="{{ assets('') . '/' }}" data-template="vertical-menu-template-starter">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="Pandu Yudhantara" name="author" />
    <meta content="{{ csrf_token() }}" name="csrf-token">
    <title>{{ strip_tags(config('app.name')) }} | @yield('title', 'Laravel') </title>
    <meta content="{{ config('app.name_long') }}" name="description" />
    @include('layouts.styles')
</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            @include('layouts.sider')
            <!-- Layout container -->
            <div class="layout-page">
                @include('layouts.header')
                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <div class="container-fluid flex-grow-1 container-p-y">
                        @if (session('notify'))
                            <div id="app-bstoast" class="bs-toast toast fade" role="alert" aria-live="assertive"
                                aria-atomic="true" data-bs-delay="2000"
                                style="position: absolute; right: 25px; margin-top: -85px;">
                                <div class="toast-header">
                                    <i class="ti ti-bell ti-xs me-2 text-{{ session('notify')['status'] }}"></i>
                                    <div class="me-auto fw-semibold">{{ session('notify')['title'] }}</div>
                                    <button type="button" class="btn-close" data-bs-dismiss="toast"
                                        aria-label="Close"></button>
                                </div>
                                <div class="toast-body" style="color: #6f6b7d; background-color: white;">
                                    {{ session('notify')['text'] }}</div>
                            </div>
                        @endif
                        @yield('content')
                    </div>
                    <!-- / Content -->
                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout container -->
        </div>
        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
        <!-- Drag Target Area To SlideIn Menu On Small Screens -->
        <div class="drag-target"></div>
        @if ($user->roles()->count() > 1)
            <div class="modal fade" id="pilihRole" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel1">Pilih Role</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <form action="{{ route('auth.set-role') }}" method="POST">
                            @csrf
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col mb-3">
                                        <label for="nameBasic" class="form-label">Role</label>
                                        <select class="selectpicker w-100" data-style="btn-default" name="role">
                                            @foreach (auth()->user()->roles()->get() as $role)
                                                <option value="{{ $role->id }}">{{ ucfirst($role->name) }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-label-secondary waves-effect"
                                    data-bs-dismiss="modal">
                                    Close
                                </button>
                                <button type="submit" class="btn btn-primary waves-effect waves-light">Pilih</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        @endif
    </div>
    <!-- / Layout wrapper -->
    @include('layouts.scripts')
</body>

</html>
