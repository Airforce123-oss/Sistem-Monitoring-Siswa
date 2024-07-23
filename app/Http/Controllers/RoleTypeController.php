<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\RoleTypeUser;

class RoleTypeController extends Controller
{
    public function index()
    {
        $roles = RoleTypeUser::all();
        return response()->json($roles);
    }
}

