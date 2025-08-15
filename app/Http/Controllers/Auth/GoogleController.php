<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;

class GoogleController extends Controller
{
    public function login()
    {
        return Socialite::driver('google')->redirect();
    }

    public function callback(Request $request)
    {
        if (!$request->has('code') || $request->has('denied')) {
            return redirect('/login');
        }

        try {
            $googleUser = Socialite::driver('google')->user();
        } catch (\Laravel\Socialite\Two\InvalidStateException $e) {
            // fallback saat state gagal (biasa di local dev)
            $googleUser = Socialite::driver('google')->stateless()->user();
        }

        $isUserExists = User::where('email', $googleUser->getEmail())->first();

        if ($isUserExists) {
            $isUserExists->assignRole('user');
            auth()->login($isUserExists);
            return redirect('home');
        }

        $user = User::updateOrCreate([
            'email' => $googleUser->getEmail(),
        ], [
            'username' => $googleUser->getEmail(),
            'email' => $googleUser->getEmail(),
            'name' => $googleUser->getName(),
            'password' => bcrypt($googleUser->getEmail()),
            'avatar_url' => $googleUser->getAvatar(),
        ]);

        $user->assignRole('user');
        auth()->login($user);

        return redirect('home');
    }
}
