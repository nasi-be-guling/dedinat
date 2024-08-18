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
            $this->menu = Menu::getMenus();

            view()->share([
                'user' => $this->user,
                'menus' => $this->menu,
            ]);

            $response = $next($request);

            //lanjutkan ke request selanjutnya
            return $response;
        });
    }
}
