<?php

namespace App\Http\Controllers\Api;

use App\Models\Gender;
use App\Http\Controllers\Controller;
use App\Http\Requests\ListSectionsData;
use App\Http\Resources\GenderResource;

class SectionController extends Controller
{
    public function __invoke(ListSectionsData $request)
    {
        $gender_id = $request->gender_id;

        return GenderResource::collection(Gender::where('gender_id', $gender_id)->get());
    }
}