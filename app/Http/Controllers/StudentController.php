<?php

namespace App\Http\Controllers;

use App\Http\Resources\ClassesResource;
use App\Http\Resources\StudentResource;
use App\Http\Requests\StoreStudentRequest;
use App\Http\Requests\UpdateStudentRequest;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Classes;

class studentController extends Controller
{
    public function index(Request $request)
    {

        $studentQuery = Student::query();

        $studentQuery = $this->applySearch($studentQuery, request('search'));

        return inertia('Students/index', [
            'students' => StudentResource::collection(
                $studentQuery->paginate(5)
            ),
            'search' => request('search') ?? ''
        ]);

    }

    protected function applySearch(Builder $query, $search)
    {
        return $query->when($search, function ($query, $search) {
            $query->where('name', 'like', '%' . $search . '%');
        });
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
    public function edit(Student $student)
    {
        $classes = ClassesResource::collection(Classes::all());

        return inertia('Students/edit', [
            'student' => StudentResource::make($student),
            'classes' => $classes
        ]);
    }
    public function update(UpdateStudentRequest $request, Student $student)
    {
        $student->update($request->validated());

        return redirect()->route('students.index');
    }
    public function destroy(Student $student)
    {
        $student->delete();

        return redirect()->route('students.index');
    }
}
