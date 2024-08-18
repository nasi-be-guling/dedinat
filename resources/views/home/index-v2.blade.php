@extends('layouts.app')
@section('title', 'Home')
@section('content')
    <div class="card">
        <h5 class="card-header text-center mb-4">
            INSTRUMEN ASESMEN RISIKO BENCANA PADA ANAK BERKEBUTUHAN KHUSUS
        </h5>
        <div class="card-body">
            <form action="{{ route('assessment.store') }}" method="post">
                @csrf
                @php
                    // dd($variable);
                @endphp
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label text-right" for="child">Anak</label>
                    <div class="col-sm-10">
                        <select class="form-select @error('child') is-invalid @enderror" name="child"">
                            @foreach ($childs as $child)
                                <option value="{{ $child->id }}">{{ $child->nama }}</option>
                            @endforeach
                        </select>
                        @error('child')
                            <div class=" invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="accordion" id="accordionWithIcon">
                        @foreach ($variable as $i => $v)
                            <div class="accordion-item active">
                                <h2 class="accordion-header d-flex align-items-center">
                                    <button type="button" class="accordion-button" data-bs-toggle="collapse"
                                        data-bs-target="#accordionWithIcon-{{ $i }}" aria-expanded="true">
                                        <i class="mdi mdi-chart-bar me-2"></i>
                                        {{ $v->nama }}
                                    </button>
                                </h2>
                                <div id="accordionWithIcon-{{ $i }}" class="accordion-collapse collapse show">
                                    <div class="accordion-body">
                                        @foreach ($v->r_items()->get() as $item)
                                            {{ $item->nama }}
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-bs5/datatables.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/css/pages/cards-advance.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/libs/select2/select2.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/fonts/materialdesignicons.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/fonts/flag-icons.css') }}" />
@endpush

@push('scripts')
    <script src="{{ assets('vendor/libs/datatables-bs5/datatables-bootstrap5.js') }}"></script>
    <script src="{{ assets('vendor/libs/select2/select2.js') }}"></script>
    <script type="text/javascript">
        function blockUI(el) {
            $(el).block({
                message: '<div class="sk-wave mx-auto"><div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div> <div class="sk-rect sk-wave-rect"></div></div>',
                css: {
                    backgroundColor: 'transparent',
                    color: '#fff',
                    border: '0'
                },
                overlayCSS: {
                    opacity: 0.5
                }
            });
        }

        $(document).ready(function() {});
    </script>
@endpush
