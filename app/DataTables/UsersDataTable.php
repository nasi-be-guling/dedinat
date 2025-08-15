<?php

namespace App\DataTables;

use App\Models\User;
use Illuminate\Database\Eloquent\Builder;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\EloquentDataTable;

class UsersDataTable extends DataTable
{
    public function dataTable($query): EloquentDataTable
    {
        return (new EloquentDataTable($query))
            ->addIndexColumn()
            ->addColumn('role', function ($user) {
                return $user->getRoleNames()->first() ?? '-';
            })
            ->addColumn('action', function ($user) {
                $editUrl = route('user.edit', $user->id);
                $deleteUrl = route('user.destroy', $user->id);

                return view('components.datatables.action', compact('editUrl', 'deleteUrl', 'user'))->render();
            })
            ->rawColumns(['action']);
    }

    public function query(User $model): Builder
    {
        return $model->newQuery()->select('id', 'name', 'username', 'email');
    }

    public function html()
    {
        return $this->builder()
            ->setTableId('user-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->responsive(true)
            ->addTableClass('table-bordered table-hover dt-responsive nowrap')
            ->processing(true)
            ->serverSide(true);
    }

    protected function getColumns(): array
    {
        return [
            ['data' => 'id',       'name' => 'id',       'title' => 'ID'],
            ['data' => 'name',     'name' => 'name',     'title' => 'Nama'],
            ['data' => 'username', 'name' => 'username', 'title' => 'Username'],
            ['data' => 'email',    'name' => 'email',    'title' => 'Email'],
            ['data' => 'role',     'name' => 'role',     'title' => 'Role', 'orderable' => false, 'searchable' => false],
            ['data' => 'action',   'name' => 'action',   'title' => 'Aksi', 'orderable' => false, 'searchable' => false],
        ];
    }

    protected function filename(): string
    {
        return 'Users_' . date('YmdHis');
    }
}
