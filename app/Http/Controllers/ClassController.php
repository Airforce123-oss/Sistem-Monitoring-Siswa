<?php

namespace App\Http\Controllers;

use App\Models\ClassesForStudent;
use Illuminate\Http\Request;
use App\Models\Section;
use App\Http\Resources\ClassesResource;
use App\Http\Requests\StoreClassesRequest;


class ClassController extends Controller
{
    /*
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
    */

    // divider

    public function index(Request $request)
    {

        $itemsPerPage = $request->input('itemsPerPage', 10); // Default to 10 items per page
        $currentPage = $request->input('currentPage', 1); // Default to the first page

       $classesQuery = ClassesForStudent::query();
       $classes_for_student = $classesQuery->paginate($itemsPerPage, ['*'], 'page', $currentPage)
                               ->appends($request->only('search', 'itemsPerPage', 'currentPage'));


        return inertia('Kelas/index', [
            'classes_for_student' => ClassesResource::collection($classes_for_student),
        ]);
    }

    public function store(StoreClassesRequest $request)
    {
        ClassesForStudent::create($request->validated());
        return redirect()->route('matapelajaran.index');
    }

    public function getSections(Request $request)
    {
        $classesId = $request->query('class_id');
        if (!$classesId) {
            return response()->json(['error' => 'Class ID is required'], 400);
        }

        $sections = Section::where('class_id', $classesId)->get();

        return response()->json($sections);
    }

    public function update(StoreClassesRequest $request, $id)
    {
        $classForStudent = ClassesForStudent::findOrFail($id);
        $classForStudent->update($request->validated());
        return redirect()->route('matapelajaran.index');
    }

    public function destroy($id)
    {
        $mapel = ClassesForStudent::findOrFail($id);
        $mapel->delete();
        return redirect()->route('matapelajaran.index');
    }


}
