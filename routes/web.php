<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

$c = 'App\Http\Controllers';

Route::controller(App\Http\Controllers\Auth\LoginController::class)->group(function () {
    Route::get('/login', 'loginView')->name('login');
    Route::post('/login', 'login');
    Route::get('/logout', 'logout');
    Route::post('/logout', 'logout');
});

Route::get('/auth/get-role', $c . '\Auth\LoginController@getRole')->name('auth.get-role');
Route::post('/auth/set-role', $c . '\Auth\LoginController@setRole')->name('auth.set-role');
Route::get('/auth/google/login', $c . '\Auth\GoogleController@login')->name('google.login');
Route::get('/auth/google/callback', $c . '\Auth\GoogleController@callback')->name('google.callback');
Route::get('/auth/facebook/login', $c . '\Auth\FacebookController@login')->name('facebook.login');
Route::get('/auth/facebook/callback', $c . '\Auth\FacebookController@callback')->name('facebook.callback');

Route::middleware(['auth'])->group(function () use ($c) {
    Route::redirect('/', '/home');
    Route::get('/home', $c . '\HomeController@index')->name('home');

    Route::prefix('/master')->group(function () use ($c) {
        Route::get('/user/change-password', $c . '\UserController@changePasswordView')->name('user.change-password-view');
        Route::post('/user/change-password', $c . '\UserController@changePassword')->name('user.change-password');
        Route::post('/user/reset-password/{user}', $c . '\UserController@resetPassword')->name('user.reset-password');
        Route::resource('/user', $c . '\UserController');
        Route::resource('/variable', $c . '\VariableController')->except('show');
        Route::resource('/item', $c . '\ItemController')->except('show');
        Route::resource('/child', $c . '\ChildController')->except('show');
    });
    Route::post('/assessment/generate-form', $c . '\AssessmentController@generateForm');
    Route::get('/assessment/generate-form/{id}', $c . '\AssessmentController@generateFormGet');
    Route::resource('/assessment', $c . '\AssessmentController')->except('edit', 'update');
});
