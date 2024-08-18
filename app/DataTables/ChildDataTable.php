<?php

namespace App\DataTables;

use App\Models\Child;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;

use function Laravel\Prompts\select;

class ChildDataTable extends DataTable
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
            ->addColumn('action', function ($row) {
                $btn = '';
                if (auth()->user()->can('child.delete')) {
                    $deleteLink = route('child.destroy', $row->id);
                    $btn .= '<form action="' . $deleteLink . '" method="post">' . csrf_field() . method_field('delete') . '<button class="btn btn-icon btn-danger rounded-pill waves-effect waves-light btn-delete" data-bs-toggle="tooltip" data-bs-placement="top" title="Hapus Data Anak"><i class="tf-icons ti ti-trash"></i></button></form>';
                }
                return $btn;
            })
            ->setRowId('id');
    }

    /**
     * Get the query source of dataTable.
     */
    public function query(Child $model): QueryBuilder
    {
        $authUser = auth()->user();
        if ($authUser->hasRole(['superadmin', 'admin'])) {
            return $model->newQuery()
                ->with('r_users')
                ->select('childs.*');
        } else {
            return $model->newQuery()
                ->with('r_users')
                ->whereHas('r_users', function ($q) use ($authUser) {
                    $q->where('user_id', $authUser->id);
                })
                ->select('childs.*');
        }
    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('childs')
            ->addTableClass('dt-responsive table-hover')
            ->columns($this->getColumns())
            ->minifiedAjax()
            //->dom('Bfrtip')
            ->orderBy(0, 'asc')
            // ->selectStyleSingle()
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
            Column::make('nama'),
            Column::make('alamat'),
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
        return 'Child_' . date('YmdHis');
    }
}
