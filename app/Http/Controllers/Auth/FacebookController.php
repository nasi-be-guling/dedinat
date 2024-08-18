<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;

class FacebookController extends Controller
{
    public function login()
    {
        return Socialite::driver('facebook')->redirect();
    }

    public function callback()
    {
        $facebookUser = Socialite::driver('facebook')->user();
        $user = User::updateOrCreate([
            'email' => $facebookUser->getEmail(),
        ], [
            'username' => $facebookUser->getEmail(),
            'email' => $facebookUser->getEmail(),
            'name' => $facebookUser->getName(),
            'password' => bcrypt($facebookUser->getEmail()),
        ]);
        $user->assignRole('user');
        auth()->login($user);
        return redirect('home');
    }
}
