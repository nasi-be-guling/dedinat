@if ($menu)
    @if ($menu->is_heading == 0)
        @php $hasSubMenu = count($menu->children) > 0; @endphp
        <li class="menu-item {{ str_contains(request()->fullUrl(), $menu->link) ? 'active open' : '' }}">
            <a href="{{ $hasSubMenu ? ' javascript:void(0);' : url($menu->link) }}"
                class="menu-link {{ $hasSubMenu ? 'menu-toggle' : '' }}">
                <i class="menu-icon tf-icons ti {{ $menu->icon }}"></i>
                <div>{{ $menu->name }}</div>
            </a>
            @if ($hasSubMenu)
                <ul class="menu-sub">
                    @foreach ($menu->children as $menu)
                        @include('layouts.menu', $menu)
                    @endforeach
                </ul>
            @endif
        </li>
    @else
        <li class="menu-header small text-uppercase">
            <span class="menu-header-text">{{ $menu->name }}</span>
        </li>
    @endif
@endif
