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
        Schema::create('perjanjian_kerjasamas', function (Blueprint $table) {
            $table->id();
            $table->string('jenis_kerjasama');
            $table->date('tanggal_kerjasama');
            $table->string('pihak_pertama');
            $table->string('pihak_kedua');
            $table->date('masa_berlaku')->nullable();
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
        Schema::dropIfExists('perjanjian_kerjasamas');
    }
};
