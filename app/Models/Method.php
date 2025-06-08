<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Method extends Model
{
    protected $table = 'methods';
    protected $guarded = [];
    public $timestamps = true;

    public function items()
    {
        return $this->belongsToMany(Item::class, 'item_method');
    }
}