<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class dataSiswaController extends Controller
{
    public function index1()
    {
        return Inertia::render('Admin/DataSiswa');
    }
}
