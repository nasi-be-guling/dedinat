<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sertifikat_tanahs', function (Blueprint $table) {
            $table->id();
            $table->string('no_sertifikat');
            $table->string('nama_sertifikat');
            $table->year('tahun');
            $table->string('penerbit');
            $table->integer('luas');
            $table->string('file_path')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sertifikat_tanahs');
    }
};
