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
        $authUser = auth()->user();
        return (new EloquentDataTable($query))
            ->addColumn('parent_name', fn($row) => $row->parent?->name ?? '-')
            ->addColumn('variable_name', fn($row) => $row->r_variable?->name ?? '-')
            ->addColumn('category_name', fn($row) => $row->r_category?->name ?? '-')
            ->addColumn('action', function ($row) use ($authUser) {
                $btn = '';
                if ($authUser->hasRole(['superadmin', 'admin'])) {
                    $btn .= '<a href="' . route('item.edit', $row->id) . '" class="btn btn-icon btn-info rounded-pill waves-effect waves-light btn-edit" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"><i class="tf-icons ti ti-pencil"></i></a>';
                }
                if ($authUser->hasRole(['superadmin', 'admin'])) {
                    $deleteLink = route('item.destroy', $row->id);
                    $btn .= '<form action="' . $deleteLink . '" method="post" style="display:inline-block; margin-left:5px;">' . csrf_field() . method_field('delete') . '<button class="btn btn-icon btn-danger rounded-pill waves-effect waves-light btn-delete" data-bs-toggle="tooltip" data-bs-placement="top" title="Hapus"><i class="tf-icons ti ti-trash"></i></button></form>';
                }
                return $btn;
            })
            ->setRowId('id');
    }

    public function query(Item $model): QueryBuilder
    {
        return $model->newQuery()
            ->with(['r_variable', 'r_category', 'parent'])
            ->select('items.*');
    }

    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('item-table')
            ->addTableClass('dt-responsive table-hover')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->orderBy(0, 'asc')
            ->parameters([
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
            Column::make('order_num')->title('No. Urut'),
            Column::make('name')->title('Nama Item'),
            Column::make('parent_name')->title('Induk Item')->orderable(false)->searchable(false),
            Column::make('variable_name')->title('Nama Variabel')->orderable(false)->searchable(false),
            Column::make('category_name')->title('Nama Kategori')->orderable(false)->searchable(false),
            Column::computed('action')
                ->exportable(false)
                ->printable(false)
                ->width(160)
                ->addClass('btn-actions text-center'),
        ];
    }

    protected function filename(): string
    {
        return 'Item_' . date('YmdHis');
    }
}