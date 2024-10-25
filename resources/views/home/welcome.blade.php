@extends('layouts.app')
@section('title', 'Home')

@section('content')
    <div class="card mb-4">
        <div class="card-body">
            <div class="col-12">
                <div id="swiper-gallery" style="height: 100vh !important;">
                    <div class="swiper gallery-top">
                        <div class="swiper-wrapper">
                            @foreach ([1, 2, 3, 4, 5, 6, 7, 8] as $item)
                                <div class="swiper-slide"
                                    style="background-image: url(assets/img/banner/banner{{ $item }}.png)">
                                </div>
                            @endforeach
                        </div>
                        <div class="swiper-button-next swiper-button-white"></div>
                        <div class="swiper-button-prev swiper-button-white"></div>
                    </div>
                    <div class="swiper gallery-thumbs">
                        <div class="swiper-wrapper">
                            @foreach ([1, 2, 3, 4, 5, 6, 7, 8] as $item)
                                <div class="swiper-slide"
                                    style="background-image: url(assets/img/banner/banner{{ $item }}.png)">
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 text-center mt-4">
                <a type="button" class="btn btn-md btn-primary waves-effect waves-light col-sm-3" style="color: white;"
                    href="{{ route('home.start') }}">Mulai</a>
            </div>
        </div>
    </div>
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ assets('vendor/libs/swiper/swiper.css') }}" />
    <link rel="stylesheet" href="{{ assets('vendor/css/pages/ui-carousel.css') }}" />
@endpush

@push('scripts')
    <script src="{{ assets('vendor/libs/swiper/swiper.js') }}"></script>
    <script src="{{ assets('js/ui-carousel.js') }}"></script>
@endpush
