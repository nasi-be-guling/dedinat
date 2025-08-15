<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Auth;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        foreach (glob(app_path() . '/Helpers/*.php') as $filename) {
            require_once($filename);
        }
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // View::composer('*', function ($view) {
        //     $role = null;

        //     try {
        //         if (Auth::check()) {
        //             $role = Auth::user()->role;
        //         }
        //     } catch (\Throwable $e) {
        //         $role = null;
        //     }

        //     $menus = [
        //         ['label' => 'DASHBOARD', 'is_heading' => 1],
        //         ['label' => 'Home', 'url' => '/home', 'icon' => 'ti ti-home', 'is_heading' => 0],
        //     ];

        //     if (in_array($role, ['superadmin', 'admin'])) {
        //         $menus[] = ['label' => 'MASTER DATA', 'is_heading' => 1];
        //         $manajemenChildren = [
        //             ['label' => 'Kategori', 'url' => '/master/category', 'icon' => 'ti ti-tag'],
        //             ['label' => 'Variable', 'url' => '/master/variable', 'icon' => 'ti ti-adjustments'],
        //             ['label' => 'Item', 'url' => '/master/item', 'icon' => 'ti ti-list-check'],
        //             ['label' => 'Anak', 'url' => '/master/child', 'icon' => 'ti ti-user'],
        //         ];

        //         if ($role === 'superadmin') {
        //             $manajemenChildren[] = ['label' => 'User', 'url' => '/master/user', 'icon' => 'ti ti-users'];
        //         }

        //         $menus[] = [
        //             'label' => 'Manajemen',
        //             'icon' => 'ti ti-database',
        //             'is_heading' => 0,
        //             'children' => $manajemenChildren
        //         ];

        //         $menus[] = ['label' => 'Assessment', 'url' => '/assessment', 'icon' => 'ti ti-clipboard-check', 'is_heading' => 0];
        //     }

        //     if ($role === 'user') {
        //         $menus[] = ['label' => 'DATA ANAK', 'is_heading' => 1];
        //         $menus[] = ['label' => 'Tambah Anak', 'url' => '/master/child/create', 'icon' => 'ti ti-user-plus', 'is_heading' => 0];
        //         $menus[] = ['label' => 'Assessment', 'url' => '/assessment/create', 'icon' => 'ti ti-clipboard-plus', 'is_heading' => 0];
        //     }

        //     $view->with('menus', $menus);
        // });
    }
}
