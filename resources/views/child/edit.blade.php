@extends('layouts.app')
@section('title', 'Edit Anak')
@section('content')
<div class="card">
    <div class="card-header"><h5>Edit Data Anak</h5></div>
    <div class="card-body">
        <form action="{{ route('child.update', $child->id) }}" method="POST">
            @method('PUT')
            @include('child.form')
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>
@endsection
