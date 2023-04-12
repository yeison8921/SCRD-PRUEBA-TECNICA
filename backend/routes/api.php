<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\VehiculoController;
use App\Http\Controllers\Api\ConductorController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('vehiculos', VehiculoController::class);
Route::post('getVehiculosAsignadosConductor', [VehiculoController::class, 'getVehiculosAsignadosConductor']);
Route::post('getVehiculosNoAsignadosConductor', [VehiculoController::class, 'getVehiculosNoAsignadosConductor']);
Route::apiResource('conductores', ConductorController::class);
