<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class AssessmentItem extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'assessment_items';

    public function _r_children(): HasMany
    {
        return $this->hasMany($this, 'item_id')
            ->orderBy('item_no_urut', 'asc');
    }

    public function r_children(): HasMany
    {
        return $this->_r_children()->with('r_children');
    }

    public function r_items(): BelongsTo
    {
        return $this->belongsTo(Assessment::class, 'assessment_id');
    }

    public function r_item(): BelongsTo
    {
        return $this->belongsTo(Item::class, 'item_id');
    }
}
