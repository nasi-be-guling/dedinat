<?php

namespace App\DataTables;

use App\Models\Assessment;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;

class AssessmentDataTable extends DataTable
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
                if ($authUser->hasRole(['superadmin', 'admin']) || $row->user_id == $authUser->id) {
                    $btn .= '<a href="' . route('assessment.show', $row->id) . '" class="btn btn-icon btn-secondary rounded-pill waves-effect waves-light btn-edit" data-bs-toggle="tooltip" data-bs-placement="top" title="Lihat"><i class="tf-icons ti ti-eye"></i></a>';
                }
                if ($authUser->hasRole(['superadmin', 'admin']) || ($authUser->can('assessment.delete') && $row->user_id == $authUser->id)) {
                    $deleteLink = route('assessment.destroy', $row->id);
                    $btn .= '<form action="' . $deleteLink . '" method="post">' . csrf_field() . method_field('delete') . '<button class="btn btn-icon btn-danger rounded-pill waves-effect waves-light btn-delete" data-bs-toggle="tooltip" data-bs-placement="top" title="Hapus"><i class="tf-icons ti ti-trash"></i></button></form>';
                }
                return $btn;
            })
            ->setRowId('id');
    }

    /**
     * Get the query source of dataTable.
     */
    public function query(Assessment $model): QueryBuilder
    {
        $authUser = auth()->user();
        if ($authUser->hasRole(['superadmin', 'admin'])) {
            return $model->newQuery()
                ->with(['r_child'])
                ->select('assessments.*');
        }
        return $model->newQuery()
            ->with(['r_child'])
            ->where('user_id', $authUser->id)
            ->select('assessments.*');
    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): \Yajra\DataTables\Html\Builder
    {
        return $this->builder()
            ->setTableId('assessment-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->parameters([
                'processing' => true,
                'serverSide' => true,
                'responsive' => true,
                'destroy'    => true, // ← biar aman jika ke-init ulang
                'drawCallback' => 'function() { $("[data-bs-toggle=tooltip]").tooltip(); }',
            ]);
    }

    /**
     * Get the dataTable columns definition.
     */
    public function getColumns(): array
    {
        return [
            Column::make('r_child.nama')
                ->title('Nama Anak'),
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
        return 'Assessment_' . date('YmdHis');
    }
}
