<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PersonnalInformation extends Model
{
    use HasFactory;

    protected $fillable = ['company' ,'phoneNumber', 'adresse','postalCode','city','userId'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
