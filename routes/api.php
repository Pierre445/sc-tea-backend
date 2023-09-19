<?php

use App\Http\Controllers\API\PersonnalInformationController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\CartController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProductsController;
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

// Routes API pour chacun des actions suivant
// GET,POST,HEAD,DELETE,PUT,OPTION
Route::post('login',[UserController::class,'loginUser'])->name('login');
Route::post('register',[UserController::class,'register'])->name('register');
Route::get('list',[UserController::class,'index'])->name('list');
//Route::post('register',[UserController::class,'store'])->name('create');
//Route::put('update/{id}',[UserController::class,'update'])->name('update');
Route::resource('products',ProductsController::class);
Route::get('userConnected',[UserController::class,'UserConnected']);

Route::group(['middleware' => 'auth:sanctum'],function(){
    
    Route::resource('user',UserController::class);
    
    Route::resource('personnalInformation',PersonnalInformationController::class);
    Route::delete('logout',[UserController::class,'logout'])->name('logout');

    Route::get('cart/increase/{id}',[CartController::class, 'increase']);
    Route::get('cart/decrease/{id}',[CartController::class, 'decrease']);
    
    Route::get('cart/count', [CartController::class, 'count'])
        ->name('cart.count');

     Route::resource('cart', CartController::class);

     Route::get('/userCount', function (Request $request) {
        return $request->user();
    });
     
});


//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});
