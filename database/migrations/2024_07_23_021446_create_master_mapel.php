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
        Schema::create('master_mapel', function (Blueprint $table) {
            $table->id('id_mapel'); // Primary key column
            $table->string('kode_mapel', 40);
            $table->string('mapel', 60);
            $table->timestamps();
        });

        // Insert default data
        DB::table('master_mapel')->insert([
            ['id_mapel' => 1, 'kode_mapel' => 'MP-1561560093', 'mapel' => 'Bahasa Indonesia'],
            ['id_mapel' => 2, 'kode_mapel' => 'MP-1561560129', 'mapel' => 'Matematika'],
            ['id_mapel' => 3, 'kode_mapel' => 'MP-1561871991', 'mapel' => 'Biologi'],
            ['id_mapel' => 4, 'kode_mapel' => 'MP-1561872004', 'mapel' => 'Sejarah'],
            ['id_mapel' => 5, 'kode_mapel' => 'MP-1561872013', 'mapel' => 'Teknologi Informasi'],
            ['id_mapel' => 6, 'kode_mapel' => 'MP-1561872026', 'mapel' => 'Seni Budaya'],
            ['id_mapel' => 7, 'kode_mapel' => 'MP-1561872043', 'mapel' => 'Bahasa Inggris'],
            ['id_mapel' => 8, 'kode_mapel' => 'MP-1615002340', 'mapel' => 'Ilmu Pengetahuan Alam'],
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('master_mapel');
    }
};
