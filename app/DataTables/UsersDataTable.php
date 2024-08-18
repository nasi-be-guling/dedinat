<?php

namespace App\DataTables;

use App\Models\User;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;

class UsersDataTable extends DataTable
{
    /**
     * Build the DataTable class.
     *
     * @param QueryBuilder $query Results from query() method.
     */
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        return (new EloquentDataTable($query))
            ->addColumn('action', function ($row) {
                $btn = '-';

                if (auth()->user()->can('user.update')) {
                    $updateLink = route('user.edit', $row->id);
                    $btn = '<a href="' . $updateLink . '" type="button" class="btn btn-icon btn-info rounded-pill waves-effect waves-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit Pengguna"><i class="tf-icons ti ti-pencil"></i></a>';
                }

                if (auth()->user()->can('user.reset-password')) {
                    $resetLink = route('user.reset-password', $row->id);
                    $btn .= '<form action="' . $resetLink . '" method="post">' . csrf_field() . '<button class="btn btn-icon btn-primary rounded-pill waves-effect waves-light btn-reset" data-bs-toggle="tooltip" data-bs-placement="top" title="Reset Password Pengguna"><i class="tf-icons ti ti-refresh"></i></button></form>';
                }

                if (auth()->user()->can('user.delete')) {
                    $deleteLink = route('user.destroy', $row->id);
                    $btn .= '<form action="' . $deleteLink . '" method="post">' . csrf_field() . method_field('delete') . '<button class="btn btn-icon btn-danger rounded-pill waves-effect waves-light btn-delete" data-bs-toggle="tooltip" data-bs-placement="top" title="Hapus Pengguna"><i class="tf-icons ti ti-trash"></i></button></form>';
                }

                return $btn;
            })
            ->editColumn('created_at', function ($d) {
                return \Carbon\Carbon::parse($d->created_at)->locale(config('app.locale'))->isoFormat('DD MMMM YYYY');
            })
            // ->editColumn('updated_at', function ($d) {
            //     return \Carbon\Carbon::parse($d->updated_at)->locale(config('app.locale'))->isoFormat('DD MMMM YYYY');
            // })
            ->setRowId('id');
    }

    /**
     * Get the query source of dataTable.
     */
    public function query(User $model): QueryBuilder
    {
        return $model->newQuery()
            ->select('users.*');
    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('users')
            ->addTableClass('dt-responsive table-hover')
            ->columns($this->getColumns())
            ->searchPanes(true)
            ->minifiedAjax()
            ->dom('Bfrtip')
            ->orderBy(0, 'asc')
            // ->selectStyleSingle()
            ->parameters([
                'drawCallback' => 'function() { $("[data-bs-toggle=tooltip]").tooltip(); }'
            ])
            ->buttons([
                Button::make('excel'),
                Button::make('pdf'),
                Button::make('print'),
            ]);
    }

    /**
     * Get the dataTable columns definition.
     */
    public function getColumns(): array
    {
        return [
            Column::make('username'),
            Column::make('email'),
            Column::make('name')->title('Nama Pengguna'),
            Column::make('created_at')->title('Dibuat Tanggal'),
            // Column::make('updated_at')->title('Diubah Tanggal'),
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
        return 'Users_' . date('YmdHis');
    }
}
