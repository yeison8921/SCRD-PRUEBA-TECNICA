<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vehiculo extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'placa',
        'modelo',
        'capacidad',
        'conductor_id',
    ];

    protected $appends = ['nombre'];

    public function getNombreAttribute()
    {
        return 'Vehículo con placa ' . trim($this->placa);
    }
}
