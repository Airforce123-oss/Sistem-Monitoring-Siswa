<?php

namespace App\Http\Controllers\Api;

use App\Models\Section;
use App\Http\Controllers\Controller;
use App\Http\Requests\ListSectionsData;
use App\Http\Resources\SectionResource;

class SectionController extends Controller
{
    public function __invoke(ListSectionsData $request)
    {
        $gender_id = $request->gender_id;

        return SectionResource::collection(Section::where('gender_id', $gender_id)->get());
    }
}