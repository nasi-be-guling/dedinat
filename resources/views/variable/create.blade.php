@extends('layouts.app')
@section('title', 'Tambah Variable')
@section('content')
    @include('variable.form', [
        'action' => route('variable.store'),
        'method' => 'POST',
        'variable' => null
    ])
@endsection
