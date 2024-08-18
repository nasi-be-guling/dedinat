<?php

namespace App\DataTables;

use App\Models\Variable;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;

class VariableDataTable extends DataTable
{
    /**
     * Build the DataTable class.
     *
     * @param QueryBuilder $query Results from query() method.
     */
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        $authUser = auth()->user();
        return (new EloquentDataTable($query))
            ->addColumn('action', function ($row) use ($authUser) {
                $btn = '';
                if ($authUser->hasRole(['superadmin', 'admin'])) {
                    $btn .= '<a href="' . route('variable.edit', $row->id) . '" class="btn btn-icon btn-info rounded-pill waves-effect waves-light btn-edit" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"><i class="tf-icons ti ti-pencil"></i></a>';
                }
                if ($authUser->hasRole(['superadmin', 'admin'])) {
                    $deleteLink = route('variable.destroy', $row->id);
                    $btn .= '<form action="' . $deleteLink . '" method="post">' . csrf_field() . method_field('delete') . '<button class="btn btn-icon btn-danger rounded-pill waves-effect waves-light btn-delete" data-bs-toggle="tooltip" data-bs-placement="top" title="Hapus"><i class="tf-icons ti ti-trash"></i></button></form>';
                }
                return $btn;
            })
            ->setRowId('id');
    }

    /**
     * Get the query source of dataTable.
     */
    public function query(Variable $model): QueryBuilder
    {
        if (auth()->user()->hasRole(['superadmin', 'admin']))
            return $model->newQuery()
                ->select('variables.*');
    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('variable-table')
            ->addTableClass('dt-responsive table-hover')
            ->columns($this->getColumns())
            ->minifiedAjax()
            // ->dom('Bfrtip')
            ->orderBy(1, 'asc')
            // ->selectStyleSingle()
            ->pageLength(25)
            ->lengthMenu([[25, 50, 100, -1], [25, 50, 100, "Semua"]])
            ->languageSearch("Cari")
            ->parameters([
                'drawCallback' => 'function() { $("[data-bs-toggle=tooltip]").tooltip(); }'
            ])
            ->buttons([
                Button::make('excel'),
                Button::make('pdf'),
                Button::make('print')
            ]);
    }

    /**
     * Get the dataTable columns definition.
     */
    public function getColumns(): array
    {
        return [
            Column::make('nama')->title('Nama Variable'),
            Column::make('no_urut')->title('No. Urut')->width(50),
            Column::computed('action')
                ->exportable(false)
                ->printable(false)
                ->width(160)
                ->addClass('btn-actions text-center'),
        ];
    }

    /**
     * Get the filename for export.
     */
    protected function filename(): string
    {
        return 'Variable_' . date('YmdHis');
    }
}
