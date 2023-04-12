<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Conductor extends Model
{
    use HasFactory;
    use SoftDeletes;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'conductores';

    protected $fillable = [
        'identificacion',
        'nombre',
        'apellido',
        'telefono',
        'direccion',
    ];

    protected $appends = ['full_name'];

    public function getFullNameAttribute()
    {
        return trim($this->nombre) . ' ' . trim($this->apellido);
    }
}
