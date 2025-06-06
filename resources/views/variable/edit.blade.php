@extends('layouts.app')
@section('title', 'Edit Variable')
@section('content')
    @include('variable.form', [
        'action' => route('variable.update', $variable->id),
        'method' => 'PATCH',
        'variable' => $variable
    ])
@endsection
