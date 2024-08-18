<!-- Navbar -->
<nav class="layout-navbar container-fluid navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
    id="layout-navbar">
    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
            <i class="ti ti-menu-2 ti-sm"></i>
        </a>
    </div>
    <div class="navbar-nav-right d-flex align-items-center justify-content-between" id="navbar-collapse">
        <div class="navbar-nav align-items-center">
            <a class="nav-link style-switcher-toggle hide-arrow" href="javascript:void(0);">
                <i class="ti ti-sm"></i>
            </a>
        </div>
        <div class="navbar-nav align-items-center flex-row">
            {{-- <img src="{{ assets('img/branding/logo.png') }}" style="height: 24px; margin-right: 5px;" /> --}}
            <a id="header-text" style="font-size: 20px; font-weight: bold;">{{ config('app.name_long') }}</a>
        </div>
        <ul class="navbar-nav flex-row align-items-center">
            <!-- User -->
            @php
                $avatarSrc =
                    $user->avatar_url && Str::startsWith($user->avatar_url, 'http')
                        ? $user->avatar_url
                        : Avatar::create($user->name)->toBase64();
            @endphp
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                        <img src="{{ $avatarSrc }}" alt class="h-auto rounded-circle" />
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item" href="#">
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar avatar-online">
                                        <img src="{{ $avatarSrc }}" alt class="h-auto rounded-circle" />
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <span
                                        class="fw-semibold d-block">{{ $user->name ? Str::limit($user->name, 25) : '' }}</span>
                                    <small
                                        class="text-muted">{{ $user->email ? Str::limit($user->email, 25) : '' }}</small>
                                </div>
                            </div>
                        </a>
                    </li>
                    @if ($user->roles()->count() > 1)
                        <li>
                            <a href="#pilihRole" class="dropdown-item" data-bs-toggle="modal">
                                <i class="ti ti-server me-2 ti-sm"></i>
                                <span class="align-middle">Ubah Role</span>
                            </a>
                        </li>
                    @endif
                    <li>
                        <a class="dropdown-item" href="/master/user/change-password">
                            <i class="ti ti-key me-2 ti-sm"></i>
                            <span class="align-middle">Change Password</span>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="{{ route('child.create') }}">
                            <i class="ti ti-user-plus me-2 ti-sm"></i>
                            <span class="align-middle">Tambah Data Anak</span>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="{{ route('assessment.create') }}">
                            <i class="ti ti-address-book me-2 ti-sm"></i>
                            <span class="align-middle">Tambah Asesmen</span>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li>
                        <a class="dropdown-item" href="/logout">
                            <i class="ti ti-logout me-2 ti-sm"></i>
                            <span class="align-middle">Log Out</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!--/ User -->
        </ul>
    </div>
</nav>
<!-- / Navbar -->
