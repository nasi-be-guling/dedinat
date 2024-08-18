<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Carbon\Carbon;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\AktaPendirian>
 */
class AktaPendirianFactory extends Factory
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
            'no_akta' => Str::uuid(),
            'nama_notaris' => fake()->name(),
            'tanggal' => $tglTerbit,
            'pengesahan' => Carbon::createFromDate($tglTerbit)->addDays(rand(90, 365)),
        ];
    }
}
