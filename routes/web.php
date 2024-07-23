<?php

use App\Http\Controllers\Admin\AdminAuthController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\ClassController;
use App\Http\Controllers\PenilaianController;
use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use App\Http\Controllers\TugasController;
use App\Http\Controllers\RoleTypeController;
use App\Http\Controllers\MataPelajaranController;
use App\Http\Controllers\FileUploadController;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::resource('students', StudentController::class);
    Route::resource('kelas', ClassController::class);
    Route::get('/api/sections', [StudentController::class, 'getSections']);
    Route::resource('/Profile', ProfileController::class);
    Route::resource('/tugas', TugasController::class);
    Route::get('/tugasTambah', [TugasController::class, 'tambahTugas'])->name('tugas.tambah');
    Route::get('/tugasEdit', [TugasController::class, 'editTugas'])->name('tugas.edit');
    Route::resource('/penilaian', PenilaianController::class);
    Route::resource('/mataPelajaran', MataPelajaranController::class);
});

// Admin routes
Route::group(['prefix' => 'admin', 'middleware' => 'redirectAdmin'], function () {
    Route::get('login', [AdminAuthController::class, 'showLoginForm'])->name('admin.login');
    Route::post('login', [AdminAuthController::class, 'login'])->name('admin.login.post');
    Route::get('register', [AdminAuthController::class, 'showRegisterForm'])->name('admin.register');
    Route::post('register', [AdminAuthController::class, 'register'])->name('admin.register.post');
    Route::post('logout', [AdminAuthController::class, 'logout'])->name('admin.logout');
});

Route::middleware(['auth:admin'])->prefix('admin')->group(function () {
    Route::get('/dashboard', [AdminController::class, 'index'])->name('admin.dashboard');
});

// Routes for specific dashboards based on role
Route::middleware(['auth'])->group(function () {
    Route::get('/studentsDashboard', [StudentController::class, 'dashboardStudent'])->name('student.dashboard');
    Route::get('/absensiSiswa', [StudentController::class, 'absensiSiswa'])->name('student.absensiSiswa');

    Route::get('/teachersDashboard', [TeacherController::class, 'dashboardTeacher'])->name('teacher.dashboard');
    Route::get('/bukuPenghubung', [TeacherController::class, 'bukuPenghubung'])->name('teacher.bukuPenghubung');
    Route::resource('teachers', TeacherController::class);
});

// Endpoint to fetch role types
Route::get('/role-types', [RoleTypeController::class, 'index']);

require __DIR__ . '/auth.php';
require __DIR__ . '/admin-auth.php';
