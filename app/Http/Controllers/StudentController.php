<?php

namespace App\Http\Controllers;

use App\Http\Resources\ClassesResource;
use App\Http\Resources\StudentResource;
use App\Http\Requests\StoreStudentRequest;
use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Classes;

class studentController extends Controller
{
    public function index()
    {
        $students = StudentResource::collection(Student::paginate(15));

        return inertia('Students/index', [
            'students' => $students,
        ]);
    }
    public function create()
    {
        $classes = ClassesResource::collection(Classes::all());

        return inertia('Students/create', [
            'classes' => $classes
        ]);
    }
    public function store(StoreStudentRequest $request)
    {
        Student::create($request->validated());

        return redirect()->route('students.index');
    }

}
