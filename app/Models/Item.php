<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Method;

class Item extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'items';
    protected $guarded = [];
    protected $appends = ['method_id_html'];

    protected function getMethodIdHtmlAttribute()
    {
        $methodNames = $this->methods->pluck('name')->toArray();
        return implode('<br />', $methodNames);
    }

    public function getMethodIds(): array
    {
        return array_filter(explode(';', $this->method_id));
    }

    public function methods()
    {
        return $this->belongsToMany(Method::class, 'item_method');
    }

    public function _r_children(): HasMany
    {
        return $this->hasMany($this, 'item_id')
            ->orderBy('order_num', 'asc');
    }

    public function r_children(): HasMany
    {
        return $this->_r_children()->with('r_children');
    }

    public function r_variable(): BelongsTo
    {
        return $this->belongsTo(Variable::class, 'variable_id');
    }

    public function r_category(): BelongsTo
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(Item::class, 'item_id');
    }

    public function children(): HasMany
    {
        return $this->hasMany(Item::class, 'item_id');
    }

    public function getDescendantIds(): array
    {
        $ids = [];
        foreach ($this->children as $child) {
            $ids[] = $child->id;
            $ids = array_merge($ids, $child->getDescendantIds());
        }
        return $ids;
    }
}