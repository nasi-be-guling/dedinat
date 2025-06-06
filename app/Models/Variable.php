<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Variable extends Model
{
    use HasFactory;

    public $timestamps = false;
    protected $guarded = [];

    public function r_items(): HasMany
    {
        return $this->hasMany(Item::class, 'variable_id')
            ->whereNull('item_id')
            ->orderBy('order_num', 'asc');
    }

    public function items()
    {
        return $this->hasMany(\App\Models\AssessmentItem::class, 'variable_id');
    }

    public static function getItems($id): Collection | array
    {
        return Variable::with([
            'r_items' => function ($q) use ($id) {
                $q->where('category_id', $id);
            },
            'r_items.r_children'
        ])
            ->whereHas('r_items')
            ->get();
    }
}
