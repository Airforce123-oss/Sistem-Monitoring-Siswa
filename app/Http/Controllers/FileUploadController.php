<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class FileUploadController extends Controller
{
    public function upload(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:pdf,doc,docx|max:2048',
        ]);

        if ($request->file('file')->isValid()) {
            $path = $request->file('file')->store('uploads', 'public');
            return response()->json(['path' => $path], 200);
        }

        return response()->json(['error' => 'Invalid file upload'], 400);
    }
}
