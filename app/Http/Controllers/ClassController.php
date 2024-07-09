<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Classes;

class ClassController extends Controller
{
    public function index()
    {
        return inertia('Kelas/index', [
        ]);
    }
    public function create()
    {
        //$classes = ClassesResource::collection(Classes::all());

        return inertia('Kelas/create');
    }
}
