<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::controller(ApiController::class)->name('api.')->group(function () {
    Route::get('perizinan-dasar-summary-html', 'perizinanDasarSummaryHtml')->name('perizinan-dasar-summary-html');
    Route::get('perizinan-dasar-datatable', 'perizinanDasarDatatable')->name('perizinan-dasar-datatable');
    Route::get('perizinan-dasar', 'perizinanDasar')->name('perizinan-dasar');

    Route::get('izin-produksi-summary-html', 'izinProduksiSummaryHtml')->name('izin-produksi-summary-html');
    Route::get('izin-produksi-datatable', 'izinProduksiDatatable')->name('izin-produksi-datatable');
    Route::get('izin-produksi', 'izinProduksi')->name('izin-produksi');

    Route::get('perjanjian-kerjasama-summary-html', 'perjanjianKerjasamaSummaryHtml')->name('perjanjian-kerjasama-summary-html');
    Route::get('perjanjian-kerjasama-datatable', 'perjanjianKerjasamaDatatable')->name('perjanjian-kerjasama-datatable');
    Route::get('perjanjian-kerjasama', 'perjanjianKerjasama')->name('perjanjian-kerjasama');
});
