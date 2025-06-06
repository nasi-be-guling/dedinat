@extends('layouts.app')
@section('title', 'Variable')

@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between">
        <h5>Daftar Variable</h5>
        <a href="{{ route('variable.create') }}" class="btn btn-primary btn-sm">Tambah Variable</a>
    </div>
    <div class="card-body">
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama Variable</th>
                    <th>No. Urut</th>
                    <th>Subs</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @forelse($variables as $variable)
                <tr>
                    <td>{{ $variable->id }}</td>
                    <td>{{ $variable->name }}</td>
                    <td>{{ $variable->order_num }}</td>
                    <td>{{ $variable->subs }}</td>
                    <td>
                        <a href="{{ route('variable.edit', $variable->id) }}" class="btn btn-sm btn-warning">Edit</a>
                        <form action="{{ route('variable.destroy', $variable->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button class="btn btn-sm btn-danger" onclick="return confirm('Yakin hapus?')">Hapus</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr><td colspan="5" class="text-center">Belum ada data.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
