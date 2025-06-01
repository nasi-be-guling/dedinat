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
}
