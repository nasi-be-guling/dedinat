<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Menu extends Model
{
    use HasFactory, SoftDeletes;
    // protected $fillable = ['menu_id', 'name', 'link', 'icon'];
    protected $guarded = [];

    public function _children()
    {
        $roleId = \DB::table('model_has_roles')
            ->where('model_id', auth()->user()->id)
            ->first();

        if ($roleId) {
            $roleId = $roleId->role_id;
            if ($roleId == 1) {
                // superadmin dapat semua menu
                return $this->hasMany($this, 'menu_id')
                    ->orderBy('no_urut', 'asc');
            } else {
                $menuIds = \DB::table('role_has_menus')
                    ->where('role_id', $roleId)
                    ->pluck('menu_id');

                return $this->hasMany($this, 'menu_id')
                    ->whereIn('id', $menuIds)
                    ->orderBy('no_urut', 'asc');
            }
        }
    }

    public function children()
    {
        return $this->_children()->with('children');
    }

    public static function getMenus()
    {
        $roleId = \DB::table('model_has_roles')
            ->where('model_id', auth()->user()->id)
            ->first();

        $menus = [];
        if ($roleId) {
            $roleId = $roleId->role_id;
            if ($roleId == 1) {
                // superadmin dapat semua menu
                $menus = self::with('children')
                    ->whereNull('menu_id')
                    ->orderBy('no_urut', 'asc')
                    ->get();
            } else {
                $menuIds = \DB::table('role_has_menus')
                    ->where('role_id', $roleId)
                    ->pluck('menu_id');
                $menus = self::with('children')
                    ->whereNull('menu_id')
                    ->whereIn('id', $menuIds)
                    ->orderBy('no_urut', 'asc')
                    ->get();
            }
        }
        return $menus;
    }
}
