<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('classes_for_student', function (Blueprint $table) {
            $table->id('id_kelas');
            $table->string('nama_kelas', 60);
            $table->string('kode_kelas', 40);
            $table->timestamps();
        });

             // Insert default data
             DB::table('classes_for_student')->insert([
                ['id_kelas' => 1, 'nama_kelas' => 'Kelas 1', 'kode_kelas' => 'MK-1561560093'],
                ['id_kelas' => 2, 'nama_kelas' => 'Kelas 2', 'kode_kelas' => 'MK-1561560129'],
                ['id_kelas' => 3, 'nama_kelas' => 'Kelas 3', 'kode_kelas' => 'MK-1561871991'],
                ['id_kelas' => 4, 'nama_kelas' => 'Kelas 4', 'kode_kelas' => 'MK-1561872004'],
                ['id_kelas' => 5, 'nama_kelas' => 'Kelas 5', 'kode_kelas' => 'MK-1561872013'],
                ['id_kelas' => 6, 'nama_kelas' => 'Kelas 6', 'kode_kelas' => 'MK-1561872026'],
                ['id_kelas' => 7, 'nama_kelas' => 'Kelas 7', 'kode_kelas' => 'MK-1561872043'],
                ['id_kelas' => 8, 'nama_kelas' => 'Kelas 8', 'kode_kelas' => 'MK-1615002340'],
            ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('classes_for_student');
    }
};
