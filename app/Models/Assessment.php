<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Assessment extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'assessments';

    public function r_user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id')
            ->withTrashed();
    }

    public function r_child(): BelongsTo
    {
        return $this->belongsTo(Child::class, 'child_id')
            ->withTrashed();
    }

    public function r_items(): HasMany
    {
        return $this->hasMany(AssessmentItem::class, 'assessment_id');
    }
}
