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
        Schema::create('izin_produksis', function (Blueprint $table) {
            $table->id();
            $table->string('no_pengajuan');
            $table->string('nama');
            $table->date('tanggal_terbit')->nullable();
            $table->date('masa_berlaku')->nullable();
            $table->string('status');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('izin_produksis');
    }
};
