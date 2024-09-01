<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Item extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'items';
    protected $guarded = [];
    protected $appends = ['method_id_html'];

    protected function getMethodIdHtmlAttribute()
    {
        $return = "";
        $methods = explode(';', $this->method_id);
        foreach ($methods as $method) {
            $return .= $method . "<br />";
        }
        return $return;
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
}
