<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mapel extends Model
{
    use HasFactory;

    protected $table = 'master_mapel';

    protected $fillable = [
        'kode_mapel',
        'mapel',
    ];
    public function section()
    {
        return $this->belongsTo(Section::class);
    }
}
