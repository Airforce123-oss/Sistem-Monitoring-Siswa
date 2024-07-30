<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Classes;
use App\Models\Section;
use App\Models\Student;
use App\Models\Gender;
use App\Models\NoInduk;
use App\Models\Religion;
use Illuminate\Database\Eloquent\Factories\Sequence;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use Faker\Factory as Faker;

class ClassesSeeder extends Seeder
{
    protected $faker;

    public function __construct()
    {
        $this->faker = Faker::create();
    }

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
    // Ambil semua record dari tabel no_induks
    $noInduks = NoInduk::all();

    if ($noInduks->isEmpty()) {
        $this->command->error('NoInduks data is missing.');
        return;
    }

    // Definisikan nama kelas dan jumlahnya
    $classNames = [
        'X' => 6,
        'XI' => 6,
        'XII' => 4,
    ];

    $genders = Gender::all();
    $religions = Religion::all();

    if ($genders->isEmpty() || $religions->isEmpty()) {
        $this->command->error('Genders or religions data is missing.');
        return;
    }

    foreach ($classNames as $prefix => $count) {
        for ($i = 1; $i <= $count; $i++) {
            $className = "{$prefix}-{$i}";
            $class = Classes::updateOrCreate(['name' => $className]);

            $sections = ['Section A', 'Section B', 'Section C'];
            foreach ($sections as $sectionName) {
                $section = Section::updateOrCreate([
                    'class_id' => $class->id,
                    'name' => $sectionName,
                ]);

                for ($j = 0; $j < 5; $j++) {
                    // Ambil ID no_induk acak
                    $noInduk = $noInduks->random();

                    // Buat atau update student
                    Student::updateOrCreate(
                        ['no_induk_id' => $noInduk->id,
                            'class_id' => $class->id,
                            'section_id' => $section->id,
                            'gender_id' => $genders->random()->id,
                            'religion_id' => $religions->random()->id,
                            'name' => $this->faker->name,
                            'email' => $this->faker->unique()->safeEmail,
                        ]
                    );
                }
            }
        }
    }
    }

    /**
     * Generate a unique student name.
     */
    protected function generateStudentName($index, $sectionName): string
    {
        return 'Student ' . $index . ' - ' . $sectionName;
    }
}
