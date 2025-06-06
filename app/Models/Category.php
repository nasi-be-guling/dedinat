<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'categories';
    
    protected $fillable = [
        'name',
        'rumus',
        'footer_diduga',
        'footer_normal'
    ];

    public function items()
    {
        return $this->hasMany(Item::class);
    }

    public function evaluateScore(array $subs): string
    {
        $rumus = $this->rumus;

        // Ganti placeholder seperti {{A}}, {{B}}, dst dengan nilai actual dari array $subs
        foreach ($subs as $key => $val) {
            $rumus = str_replace('{{' . $key . '}}', $val, $rumus);
        }

        // Backup: kalau ada subs yang belum dihitung (misal {{C}}), ganti jadi 0
        $rumus = preg_replace('/\{\{([A-Z])\}\}/', '0', $rumus);

        // Ubah simbol logika ke versi PHP (opsional, hanya untuk debug lebih jelas)
        $rumusEval = str_replace(['||', '&&'], [' or ', ' and '], $rumus);

        // Evaluasi ekspresi
        try {
            $result = eval("return ({$rumusEval}) ? 'Diduga' : 'Normal';");
            return $result;
        } catch (\Throwable $e) {
            \Log::error("Gagal evaluasi rumus kategori ID {$this->id}: {$e->getMessage()}");
            return 'Error';
        }
    }

}
