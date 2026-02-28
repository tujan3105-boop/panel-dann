
// Jalur Status Online Admin GantengDann (Jalur Web)
Route::get('/cek-admin-aktif', function () {
    \Illuminate\Support\Facades\Cache::put('admin-online', true, 120);
    return response()->json(['status' => 'online']);
});

Route::get('/cek-admin-status', function () {
    return response()->json(['online' => \Illuminate\Support\Facades\Cache::has('admin-online')]);
});
