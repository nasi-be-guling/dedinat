<?php

namespace App\DataTables;

use App\Models\Child;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\EloquentDataTable;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Yajra\DataTables\Html\Builder as HtmlBuilder;

class ChildDataTable extends DataTable
{
    /**
     * Build the DataTable class.
     *
     * @param QueryBuilder $query
     */
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        return (new EloquentDataTable($query))
            ->addColumn('action', function ($row) {
                $deleteForm = '';
                if (auth()->user()->can('child.delete')) {
                    $deleteForm = '<form action="' . route('child.destroy', $row->id) . '" method="POST" class="d-inline">'
                                . csrf_field()
                                . method_field('DELETE')
                                . '<button type="submit" class="btn btn-sm btn-danger" data-bs-toggle="tooltip" title="Hapus">'
                                . '<i class="ti ti-trash"></i></button></form>';
                }

                return $deleteForm;
            })
            ->rawColumns(['action']) // penting agar kolom HTML tidak di-escape
            ->setRowId('id');
    }

    /**
     * Get the query source of dataTable.
     */
    public function query(Child $model): QueryBuilder
    {
        $authUser = auth()->user();

        if ($authUser->hasRole(['superadmin', 'admin'])) {
            return $model->newQuery()->select('childs.*');
        }

        return $model->newQuery()
            ->whereHas('r_users', function ($query) use ($authUser) {
                $query->where('user_id', $authUser->id);
            })
            ->select('childs.*');
    }

    /**
     * Optional method to use the HTML builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('childs')
            ->addTableClass('table-bordered table-hover dt-responsive w-100')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->orderBy(0, 'asc')
            ->parameters([
                'drawCallback' => 'function() { $("[data-bs-toggle=tooltip]").tooltip(); }',
            ])
            ->buttons([
                Button::make('excel'),
                Button::make('csv'),
                Button::make('pdf'),
                Button::make('print'),
                Button::make('reset'),
                Button::make('reload'),
            ]);
    }

    /**
     * Get the DataTable columns.
     */
    public function getColumns(): array
    {
        return [
            Column::make('nama')->title('Nama Anak'),
            Column::make('alamat')->title('Alamat'),
            Column::make('umur')->title('Umur'),
            Column::make('jenis_kebutuhan')->title('Jenis Kebutuhan'),
            Column::computed('action')
                ->title('Aksi')
                ->exportable(false)
                ->printable(false)
                ->width(80)
                ->addClass('text-center'),
        ];
    }

    /**
     * Filename for export.
     */
    protected function filename(): string
    {
        return 'Child_' . date('YmdHis');
    }
}
    