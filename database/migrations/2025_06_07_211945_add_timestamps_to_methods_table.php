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
        Schema::table('methods', function (Blueprint $table) {
            $table->timestamps();      // Tambah created_at dan updated_at
            $table->softDeletes();     // Tambah deleted_at untuk soft delete
        });
    }

    public function down(): void
    {
        Schema::table('methods', function (Blueprint $table) {
            $table->dropTimestamps();
            $table->dropSoftDeletes();
        });
    }
};
