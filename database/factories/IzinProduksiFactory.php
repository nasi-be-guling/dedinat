<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Carbon\Carbon;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\IzinProduksi>
 */
class IzinProduksiFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $tglTerbit = Carbon::now()->addDays(rand(-90, 0));
        $status = ['pengajuan', 'sertifikat'];
        return [
            'no_pengajuan' => Str::uuid(),
            'nama' => fake()->firstNameMale(),
            'tanggal_terbit' => $tglTerbit,
            // 'masa_berlaku' => Carbon::createFromDate($tglTerbit)->addDays(rand(90, 365)),
            'masa_berlaku' => Carbon::createFromDate($tglTerbit)->addDays(rand(-20, 365)),
            'status' => $status[rand(0, 1)],
        ];
    }
}
