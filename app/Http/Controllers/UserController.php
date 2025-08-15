<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Menu;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use App\DataTables\UsersDataTable;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class UserController extends Controller
{
    public function __construct()
    {
        if (Auth::check() && Auth::user()->role !== 'superadmin') {
            abort(403, 'Akses hanya untuk superadmin');
        }
    }
    public function index(UsersDataTable $dataTable)
    {
        $user = auth()->user();
        $roleIds = $user?->roles->pluck('id') ?? collect();

        $allowed = DB::table('role_has_menus')
            ->whereIn('role_id', $roleIds)
            ->pluck('menu_id');

        $menus = Menu::with(['children' => function ($q) use ($allowed) {
                $q->whereIn('id', $allowed)->orderBy('no_urut');
            }])
            ->whereNull('menu_id')
            ->whereIn('id', $allowed)
            ->orWhere(function ($q) {
                $q->whereNull('menu_id')->where('is_heading', 1);
            })
            ->orderBy('no_urut')
            ->get()
            ->filter(fn ($m) => $m->is_heading || $m->children->isNotEmpty());

        return $dataTable->render('user.index', [
            'menus' => $menus,
        ]);
    }

    public function create()
    {
        $roles = Role::pluck('name');
        return view('user.create', compact('roles'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:100',
            'username' => 'required|string|max:50|unique:users,username',
            'email' => 'required|email|max:100|unique:users,email',
            'password' => 'required|string|min:6|confirmed',
            'role_id' => 'required|string|exists:roles,name',
        ]);

        $user = User::create([
            'name'     => $request->name,
            'username' => $request->username,
            'email'    => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $user->syncRoles($request->role_id);

        return redirect()->route('user.index')->with('success', 'Pengguna berhasil ditambahkan');
    }

    public function edit(User $user)
    {
        $roles = Role::pluck('name');
        return view('user.edit', ['data' => $user, 'roles' => $roles]);
    }

    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required|string|max:100',
            'username' => 'required|string|max:50|unique:users,username,' . $user->id,
            'email' => 'required|email|max:100|unique:users,email,' . $user->id,
            'role_id' => 'required|string|exists:roles,name',
        ]);

        $user->update([
            'name'     => $request->name,
            'username' => $request->username,
            'email'    => $request->email,
        ]);

        $user->syncRoles($request->role_id);

        return redirect()->route('user.index')->with('success', 'Pengguna berhasil diperbarui');
    }

    public function destroy(User $user)
    {
        $user->delete();
        return redirect()->route('user.index')->with('success', 'Pengguna berhasil dihapus');
    }

    public function changePassword()
    {
        return view('user.change-password');
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'old_password' => 'required|string',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $user = auth()->user();

        if (!Hash::check($request->old_password, $user->password)) {
            return back()->withErrors(['old_password' => 'Password lama tidak sesuai']);
        }

        $user->update([
            'password' => Hash::make($request->password),
        ]);

        return redirect()->route('user.index')->with('success', 'Password berhasil diperbarui');
    }
}
