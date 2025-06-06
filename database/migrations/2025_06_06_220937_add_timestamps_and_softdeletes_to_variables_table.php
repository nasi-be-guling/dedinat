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
        Schema::table('variables', function (Blueprint $table) {
            // Kolom created_at dan updated_at
            $table->timestamps();

            // Kolom deleted_at untuk soft deletes (opsional)
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::table('variables', function (Blueprint $table) {
            $table->dropColumn(['created_at', 'updated_at', 'deleted_at']);
        });
    }
};
