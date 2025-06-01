@extends('layouts.app')

@section('title', 'Kategori')

@section('content')
<div class="card">
    <div class="card-header">
        <h5>Daftar Kategori</h5>
        <a href="{{ route('category.create') }}" class="btn btn-primary btn-sm float-end">Tambah Kategori</a>
    </div>
    <div class="card-body">
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>Rumus</th>
                    <th>Footer Diduga</th>        {{-- Tambahan --}}
                    <th>Footer Normal</th>        {{-- Tambahan --}}
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @foreach($categories as $cat)
                <tr>
                    <td>{{ $cat->id }}</td>
                    <td>{{ $cat->name }}</td>
                    <td>{{ $cat->rumus }}</td>
                    <td>{{ $cat->footer_diduga }}</td>     {{-- Tambahan --}}
                    <td>{{ $cat->footer_normal }}</td>     {{-- Tambahan --}}
                    <td>
                        <a href="{{ route('category.edit', $cat->id) }}" class="btn btn-sm btn-warning">Edit</a>
                        <form action="{{ route('category.destroy', $cat->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button class="btn btn-sm btn-danger" onclick="return confirm('Yakin hapus?')">Hapus</button>
                        </form>
                    </td>
                </tr>
                @endforeach
                @if($categories->isEmpty())
                <tr><td colspan="4" class="text-center">Belum ada data.</td></tr>
                @endif
            </tbody>
        </table>
    </div>
</div>
@endsection
