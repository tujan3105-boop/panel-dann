<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Cache;

/*
|--------------------------------------------------------------------------
| API Routes - Modded by GantengDann
|--------------------------------------------------------------------------
*/

Route::get('/admin-is-active', function () {
    Cache::put('admin-online', true, 120); // Admin dianggap online selama 2 menit
    return response()->json(['status' => 'online']);
});

Route::get('/check-admin-status', function () {
    return response()->json(['online' => Cache::has('admin-online')]);
});

// Jalur bawaan Pterodactyl/HexTyl di bawah sini
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
