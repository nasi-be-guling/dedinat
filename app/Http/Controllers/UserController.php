<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DataTables\UsersDataTable;
use App\Models\User;
use DB;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;

class UserController extends AppController
{
    public function index(UsersDataTable $dataTable)
    {
        if (!auth()->user()->can('user.read')) return redirect('home');

        return $dataTable->render('user.index');
    }

    public function create()
    {
        if (!auth()->user()->can('user.create')) return redirect('home');

        $roles = Role::orderBy('id', 'asc')->pluck('name', 'id');
        return view('user.create', compact('roles'));
    }

    public function store(Request $request)
    {
        if (!auth()->user()->can('user.create')) return redirect('home');

        $this->validate($request, [
            'name' => 'required',
            'username' => 'required|min:4|unique:App\Models\User,username',
            'email' => 'required|email|unique:App\Models\User,email',
            'password' => 'required|min:4|confirmed',
            'role_id' => 'required',
        ]);

        DB::beginTransaction();
        try {
            $d = new User();
            $d->name = $request->name;
            $d->username = $request->username;
            $d->email = $request->email;
            $d->password = bcrypt($request->password);
            $d->save();

            $d->assignRole($request->role_id);

            DB::commit();

            notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil menghapus pengguna']);
        } catch (\Throwable $th) {
            \Bugsnag::notifyException($th);
            notify(['status' => 'danger', 'title' => 'Gagal', 'text' => 'Gagal menambah pengguna']);
        }
        return redirect('/master/user');
    }

    public function edit($id)
    {
        if (!auth()->user()->can('user.update')) return redirect('home');

        $data = User::find($id);
        $roles = Role::orderBy('id', 'asc')->pluck('name', 'id');
        return view('user.edit', compact('data', 'roles'));
    }

    public function update($id, Request $request)
    {
        if (!auth()->user()->can('user.update')) return redirect('home');

        $this->validate($request, [
            'username' => ['required', Rule::unique('users')->ignore($id)],
            'email' => ['required', Rule::unique('users')->ignore($id)],
            'name' => 'required',
            'role_id' => 'required',
        ]);

        DB::beginTransaction();
        try {
            $d = User::find($id);
            $d->name = $request->name;
            $d->username = $request->username;
            $d->email = $request->email;
            $d->save();

            $d->syncRoles($request->role_id);

            DB::commit();

            notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil mengubah pengguna']);
        } catch (\Throwable $th) {
            \Bugsnag::notifyException($th);
            notify(['status' => 'danger', 'title' => 'Gagal', 'text' => 'Gagal mengubah pengguna']);
        }
        return redirect('/master/user');
    }

    public function destroy($id)
    {
        if (!auth()->user()->can('user.delete')) return redirect('home');

        try {
            User::destroy($id);
            notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil menghapus pengguna']);
        } catch (\Throwable $th) {
            \Bugsnag::notifyException($th);
            notify(['status' => 'danger', 'title' => 'Gagal', 'text' => 'Gagal menghapus pengguna']);
        }
        return redirect('/master/user');
    }

    public function changePasswordView()
    {
        return view('user.change-password');
    }

    public function changePassword(Request $request)
    {
        $this->validate($request, [
            'old_password' => 'current_password',
            'password' => 'required|confirmed',
        ], [], [
            'old_password' => 'Password'
        ]);

        DB::beginTransaction();
        try {
            $d = User::find(auth()->user()->id);
            $d->password = bcrypt($request->password);
            $d->save();
            DB::commit();
            notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil mengubah password']);
        } catch (\Throwable $th) {
            \Bugsnag::notifyException($th);
            notify(['status' => 'danger', 'title' => 'Gagal', 'text' => 'Gagal mengubah password']);
        }
        return redirect('/master/user');
    }

    public function resetPassword($id)
    {
        if (!auth()->user()->can('user.reset-password')) return redirect('home');

        DB::beginTransaction();
        try {
            $d = User::find($id);
            $d->password = bcrypt($d->username);
            $d->save();
            DB::commit();
            notify(['status' => 'success', 'title' => 'Sukses', 'text' => 'Berhasil mereset password']);
        } catch (\Throwable $th) {
            \Bugsnag::notifyException($th);
            notify(['status' => 'danger', 'title' => 'Gagal', 'text' => 'Gagal mereset password']);
        }
        return redirect('/master/user');
    }
}
