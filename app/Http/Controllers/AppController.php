<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;

class AppController extends Controller
{
    protected $user;
    protected $menu;

    public function __construct()
    {
        $this->middleware('auth');

        $this->middleware(function ($request, $next) {
            $this->user = auth()->user();

            if (!view()->shared('menus')) {
                $this->menu = Menu::getMenus();
                view()->share('menus', $this->menu);
            }

            view()->share('user', $this->user);

            return $next($request);
        });
    }
}
