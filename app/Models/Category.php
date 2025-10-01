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

    /**
     * Evaluasi rumus kategori berbasis hitungan YA per subs.
     * Mendukung placeholder {{A}}, {{B}}, ... dan juga granular {{A1}}, {{A.1}}, {{B3}}, dst.
     * Placeholder yang tidak ada dianggap 0.
     * Operator yang didukung: + - * / % ( )  dan komparasi > < >= <= == != serta AND/OR atau && ||.
     */
    public function evaluateScore(array $subs): string
    {
        $rumus = (string) $this->rumus;

        // Normalisasi key skor ke UPPER dan alfanumerik (A.1 => A1)
        $subsUpper = [];
        foreach ($subs as $k => $v) {
            $key = preg_replace('/[^A-Z0-9]/', '', strtoupper((string) $k)); // A.1 -> A1
            $subsUpper[$key] = (int) $v;
        }

        // Agregasi huruf (A, B, ...) dari token rinci (A1, A2, ...)
        $aggregated = [];
        foreach ($subsUpper as $key => $val) {
            if (preg_match('/^[A-Z]+[0-9]+$/', $key)) {
                $letter = preg_replace('/[0-9]+$/', '', $key); // A1 -> A
                $aggregated[$letter] = ($aggregated[$letter] ?? 0) + $val;
            } elseif (preg_match('/^[A-Z]+$/', $key)) {
                $aggregated[$key] = ($aggregated[$key] ?? 0) + $val;
            }
        }

        // Gabungkan: agregat + token spesifik (specific override aggregate bila sama)
        $scoreMap = array_merge($aggregated, $subsUpper);

        // Ganti semua {{TOKEN}} -> angka; TOKEN boleh huruf+angka serta titik/underscore/dash
        $expr = preg_replace_callback('/\{\{\s*([A-Za-z][A-Za-z0-9._-]*)\s*\}\}/', function ($m) use ($scoreMap) {
            $raw = strtoupper($m[1]);                         // contoh: A.1
            $key = preg_replace('/[^A-Z0-9]/', '', $raw);     // -> A1
            return (string) ($scoreMap[$key] ?? 0);
        }, $rumus);

        // Dukungan AND/OR (case-insensitive) → && / ||
        $expr = preg_replace('/\bAND\b/i', '&&', $expr);
        $expr = preg_replace('/\bOR\b/i',  '||', $expr);

        // Sanitasi sebelum eval: hanya izinkan angka, operator dasar, spasi & tanda kurung
        if (preg_match('/[^0-9\+\-\*\/\%\(\)\.\s<>=!&|]/', $expr)) {
            \Log::warning('Rumus kategori mengandung karakter tidak diizinkan', ['rumus' => $this->rumus, 'expr' => $expr]);
            return 'Normal';
        }

        try {
            $ok = eval('return ('.$expr.');');
            return $ok ? 'Diduga' : 'Normal';
        } catch (\Throwable $e) {
            \Log::error("Gagal evaluasi rumus kategori ID {$this->id}: {$e->getMessage()}", ['expr' => $expr]);
            return 'Error';
        }
    }
}
