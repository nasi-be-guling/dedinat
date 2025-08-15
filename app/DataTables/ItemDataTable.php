<?php

namespace App\DataTables;

use App\Models\Item;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;

class ItemDataTable extends DataTable
{
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        return (new EloquentDataTable($query))
            ->addColumn('method', fn ($row) => $row->method_id_html)
            ->addColumn('parent', fn ($row) => $row->parent?->name ?? '-')
            ->addColumn('action', function ($row) {
                $edit = route('item.edit', $row->id);
                $delete = route('item.destroy', $row->id);
                return view('components.action-buttons', compact('edit', 'delete'))->render();
            })
            ->rawColumns(['method', 'action']);
    }

    public function query(Item $model): QueryBuilder
    {
        return $model->newQuery()
            ->with(['r_variable', 'r_category', 'methods'])  // ← ini penting kalau pakai relasi metode
            ->select('items.*');
    }

    public function html(): \Yajra\DataTables\Html\Builder
    {
        return $this->builder()
            ->setTableId('item-table')
            ->addTableClass('dt-responsive table-hover')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->orderBy(0, 'asc')
            ->parameters([
                'processing' => true,   // ✅ indikator loading
                'serverSide' => true,   // ✅ mode server-side
                'responsive' => true,   // ✅ layout responsif
                'destroy'    => true,   // ✅ boleh re-init tanpa error
                'drawCallback' => 'function() { $("[data-bs-toggle=tooltip]").tooltip(); }'
            ])
            ->buttons([
                Button::make('excel'),
                Button::make('pdf'),
                Button::make('print')
            ]);
    }

    public function getColumns(): array
    {
        return [
            Column::make('order_num')->title('No'),
            Column::make('name')->title('Nama Item'),
            Column::make('parent')->title('Parent'),
            Column::make('r_variable.name')->title('Variabel'),
            Column::make('r_category.name')->title('Kategori'),
            Column::computed('method')->title('Metode'),
            Column::computed('action')->exportable(false)->printable(false)->width(100)->addClass('text-center'),
        ];
    }

    protected function filename(): string
    {
        return 'Item_' . date('YmdHis');
    }
}