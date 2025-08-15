<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Menu extends Model
{
    use HasFactory, SoftDeletes;

    protected $guarded = [];

    public function _children()
    {
        $roleId = DB::table('model_has_roles')
            ->where('model_id', Auth::id())
            ->value('role_id');

        if ($roleId == 1) {
            // Superadmin dapat semua menu anak
            return $this->hasMany(self::class, 'menu_id')
                        ->orderBy('no_urut', 'asc');
        } else {
            $menuIds = DB::table('role_has_menus')
                        ->where('role_id', $roleId)
                        ->pluck('menu_id');

            return $this->hasMany(self::class, 'menu_id')
                        ->whereIn('id', $menuIds)
                        ->orderBy('no_urut', 'asc');
        }
    }

    public function children()
    {
        // Non-recursive: hanya ambil 1 level anak
        return $this->_children();
    }

    public static function getMenus()
    {
        $roleId = DB::table('model_has_roles')
                    ->where('model_id', Auth::id())
                    ->value('role_id');

        if ($roleId == 1) {
            // Superadmin dapat semua menu utama beserta anaknya
            return self::with('children')
                    ->whereNull('menu_id')
                    ->orderBy('no_urut', 'asc')
                    ->get();
        } else {
            $menuIds = DB::table('role_has_menus')
                        ->where('role_id', $roleId)
                        ->pluck('menu_id');

            return self::with('children')
                    ->whereNull('menu_id')
                    ->whereIn('id', $menuIds)
                    ->orderBy('no_urut', 'asc')
                    ->get();
        }
    }
}
