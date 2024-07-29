<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\StudentResource;
use App\Http\Resources\ClassesResource;
use App\Http\Requests\StoreStudentRequest;
use App\Http\Requests\UpdateStudentRequest;
use App\Models\Student;
use App\Models\Classes;
use App\Models\Section;
use Illuminate\Database\Eloquent\Builder;



class TeacherController extends Controller
{
    public function dashboardTeacher() {
        return inertia('Teachers/Dashboard');
    }

    public function bukuPenghubungDashboard() {
        return inertia('Teachers/BukuPenghubung/index');
    }
    public function index(Request $request)
    {

        $studentQuery = Student::query();

     
       // applysearch work
       $this->applySearch($studentQuery, $request->search);

         // Paginasi dengan nomor halaman dan tambahkan parameter pencarian ke link paginasi
        $students = $studentQuery->paginate(10)->appends($request->only('search'));

        return inertia('Teachers/index', [
            'students' => StudentResource::collection($students),
            'search' => $request->input('search', '')
        ]);

    }
    protected function applySearch(Builder $query, $search)
    {
        return $query->when($search, function ($query, $search) {
            $query->where('name', 'like', '%' . $search . '%');
        });
    }

}

