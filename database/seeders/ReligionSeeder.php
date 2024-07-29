<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ReligionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('religions')->insert([
            ['name' => 'Islam'],
            ['name' => 'Kristen'],
            ['name' => 'Hindu'],
            ['name' => 'Buddha'],
            ['name' => 'Konghucu'],
            // Tambahkan data lain sesuai kebutuhan
        ]);
    }
}
