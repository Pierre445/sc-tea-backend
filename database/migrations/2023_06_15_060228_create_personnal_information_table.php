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
        Schema::create('personnal_information', function (Blueprint $table) {
            $table->id();
            $table->string('company');
            $table->string('adresse');
            $table->integer('postalCode');
            $table->string('city');
            $table->string('phoneNumber');
            $table->foreignId('userId')->constrained('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('personnal_information');
    }
};
