<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Vehiculo;
use Illuminate\Http\Request;

class VehiculoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $vehiculos = Vehiculo::all();
        return response()->json($vehiculos, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $vehiculo = new Vehiculo();
        $vehiculo->create($request->all());
        return response()->json(['message' => 'Vehículo creado exitosamente'], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Vehiculo  $vehiculo
     * @return \Illuminate\Http\Response
     */
    public function show(Vehiculo $vehiculo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Vehiculo  $vehiculo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Vehiculo $vehiculo)
    {
        $vehiculo = Vehiculo::find($vehiculo->id);
        $vehiculo->update($request->all());
        return response()->json(['message' => 'Vehículo aactualizado exitosamente'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Vehiculo  $vehiculo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Vehiculo $vehiculo)
    {
        //
    }
    public function getVehiculosByConductor(Request $request)
    {
        $vehiculos = new Vehiculo;
        if ($request->filtro == 'asociados') {
            $vehiculos = $vehiculos::where('conductor_id', $request->conductor_id);
        } else {
            $vehiculos = $vehiculos::where('conductor_id', '!=', $request->conductor_id)->OrWhereNull('conductor_id');
        }

        $vehiculos = $vehiculos->get();
        return response()->json($vehiculos);
    }
}
