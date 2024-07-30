<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\DB;
use App\Models\User;


class UserController extends Controller
{
    public function index()
    {
    }
    public function userView($id)
    {
        $users = User::where('user_id',$id)->first();
        $role  = DB::table('role_type_users')->get();
        return view('usermanagement.user_update',compact('users','role'));
    }

    public function getUser(Request $request)
    {
        return response()->json($request->user());
    }
}