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

 	public static function getItems($categoryId): Collection | array
{
    return static::query()
        ->select('id', 'subs', 'name', 'order_num') // pastikan subs & order_num ikut
        ->with([
            'r_items' => function ($q) use ($categoryId) {
                $q->where('category_id', $categoryId)
                  ->orderBy('order_num', 'asc');
            },
            'r_items.r_children' => function ($q) use ($categoryId) {
                $q->where('category_id', $categoryId)
                  ->orderBy('order_num', 'asc');
            },
        ])
        ->whereHas('r_items', function ($q) use ($categoryId) {
            $q->where('category_id', $categoryId);
        })
        ->orderBy('order_num', 'asc') // urut antar-Variable (A1, A2, A3 …)
        ->get();
}
}
