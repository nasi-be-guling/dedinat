<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Models\Role;

class LoginController extends Controller
{
    public function loginView()
    {
        return view('login');
    }

    public function login(Request $request): RedirectResponse
    {
        $this->validate($request, [
            'username' => 'required',
            'password' => 'required',
            // 'captcha' => 'required|captcha'
        ]);

        $login_type = filter_var($request->input('username'), FILTER_VALIDATE_EMAIL)
            ? 'email'
            : 'username';

        $request->merge([
            $login_type => $request->input('username'),
            'is_active' => true
        ]);

        if (Auth::attempt($request->only($login_type, 'password', 'is_active'))) {
            $authUser = auth()->user();
            if ($authUser->roles()->count() == 1) {
                $authUser->assignSingleRole($authUser->roles()->first());
                return redirect()->intended('home');
            } else {
                return redirect()->route('auth.get-role');
            }
        }

        return redirect()->back()
            ->withInput($request->only('username', 'remember'))
            ->withErrors([
                'username' => trans('auth.failed'),
            ]);
    }

    public function logout(): RedirectResponse
    {
        session()->flush();
        Auth::logout();
        return redirect('/login');
    }

    public function getRole()
    {
        if (auth()->user()->roles()->count() == 1) return redirect('home');

        return view('login-role');
    }

    public function setRole(Request $request): RedirectResponse
    {
        $roleId = $request->role;
        $role = Role::find($roleId);
        auth()->user()->assignSingleRole($role);
        return redirect('home');
    }
}
