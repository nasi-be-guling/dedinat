<!-- Menu -->
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
        <a href="{{ url('') }}" class="app-brand-link">
            <span class="app-brand-text demo menu-text fw-bold"
                style="margin-left: 0px !important;">{{ strtoupper(config('app.name')) }}</span>
        </a>
        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
            <i class="ti menu-toggle-icon d-none d-xl-block ti-sm align-middle"></i>
            <i class="ti ti-x d-block d-xl-none ti-sm align-middle"></i>
        </a>
    </div>
    <div class="menu-inner-shadow"></div>
    <ul class="menu-inner py-1">
        @foreach ($menus as $menu)
            @if ($menu->is_heading)
                <li class="menu-header small text-uppercase">
                    <span class="menu-header-text">{{ $menu->name }}</span>
                </li>
            @elseif ($menu->children->isNotEmpty())
                <li class="menu-item {{ request()->is(ltrim($menu->link, '/') . '*') ? 'open' : '' }}">
                    <a href="javascript:void(0);" class="menu-link menu-toggle">
                        <i class="menu-icon tf-icons {{ $menu->icon }}"></i>
                        <div>{{ $menu->name }}</div>
                    </a>
                    <ul class="menu-sub">
                        @foreach ($menu->children as $child)
                            <li class="menu-item {{ request()->is(ltrim($child->link, '/')) ? 'active' : '' }}">
                                <a href="{{ url($child->link) }}" class="menu-link">
                                    <i class="{{ $child->icon }}" style="font-family: 'tabler-icons'; font-style: normal; font-size: 1rem; margin-right: 0.5rem;"></i>
                                    <div>{{ $child->name }}</div>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </li>
            @else
                <li class="menu-item {{ request()->is(ltrim($menu->link, '/')) ? 'active' : '' }}">
                    <a href="{{ url($menu->link) }}" class="menu-link">
                        <i class="menu-icon tf-icons {{ $menu->icon ?? 'ti ti-circle-dot' }}"></i>
                        <div>{{ $menu->name }}</div>
                    </a>
                </li>
            @endif
        @endforeach
    </ul>
</aside>
<!-- / Menu -->
