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
        Schema::table('assessment_items', function (Blueprint $table) {
            $table->string('subs', 4)->nullable()->after('score');
        });
    }

    public function down(): void
    {
        Schema::table('assessment_items', function (Blueprint $table) {
            $table->dropColumn('subs');
        });
    }
};
