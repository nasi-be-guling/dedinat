<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Carbon\Carbon;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\PerjanjianKerjasama>
 */
class PerjanjianKerjasamaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $tglTerbit = Carbon::now()->addDays(rand(-90, 0));
        return [
            'jenis_kerjasama' => fake()->name(),
            'pihak_pertama' => fake()->name('male'),
            'pihak_kedua' => fake()->name('female'),
            'tanggal_kerjasama' => $tglTerbit,
            // 'masa_berlaku' => Carbon::createFromDate($tglTerbit)->addDays(rand(90, 365)),
            'masa_berlaku' => Carbon::createFromDate($tglTerbit)->addDays(rand(-20, 365)),
        ];
    }
}
