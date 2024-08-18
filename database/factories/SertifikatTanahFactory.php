<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\SertifikatTanah>
 */
class SertifikatTanahFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'no_sertifikat' => Str::uuid(),
            'nama_sertifikat' => fake()->name('male'),
            'tahun' => rand(2000, 2024),
            'penerbit' => fake()->company(),
            'luas' => rand(150, 2000),
        ];
    }
}
