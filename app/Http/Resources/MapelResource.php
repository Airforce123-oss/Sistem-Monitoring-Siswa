<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MapelResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */

    public function toArray(Request $request): array
    {
        return [
            'id_mapel' => $this->id_mapel,
            'kode_mapel' => $this->kode_mapel,
            'mapel' => $this->mapel,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
