<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Child extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'childs';

    public function r_users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'user_has_childs', 'child_id', 'user_id');
    }
}
