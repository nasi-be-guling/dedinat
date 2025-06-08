<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ItemMethodSeeder extends Seeder
{
    public function run(): void
    {
        $items = DB::table('items')->get();

        foreach ($items as $item) {
            $methodIds = explode(';', $item->method_id);
            foreach ($methodIds as $methodId) {
                $methodId = trim($methodId);
                if ($methodId !== '' && is_numeric($methodId) && (int)$methodId > 0) {
                    // Cek apakah method benar-benar ada
                    $exists = DB::table('methods')->where('id', (int)$methodId)->exists();
                    if ($exists) {
                        DB::table('item_method')->insert([
                            'item_id' => $item->id,
                            'method_id' => (int)$methodId,
                        ]);
                    }
                }
            }
        }
    }
}
