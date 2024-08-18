<?php

namespace Database\Factories;

use App\Models\NamaPerizinan;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\PerizinanDasar>
 */
class PerizinanDasarFactory extends Factory
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
            'no_perizinan' => Str::uuid(),
            'nama_perizinans_id' => NamaPerizinan::factory(),
            'tanggal_terbit' => $tglTerbit,
            // 'tanggal_berlaku' => Carbon::createFromDate($tglTerbit)->addDays(rand(90, 365)),
            'tanggal_berlaku' => Carbon::createFromDate($tglTerbit)->addDays(rand(-20, 365)),
        ];
    }
}
