<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MataPelajaranController extends Controller
{
    public function index()
    {
        return inertia('Mata Pelajaran/index');

    }
}
