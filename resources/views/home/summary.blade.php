<div class="card" id="{{ $data['id'] }}">
    <div class="card-header d-flex justify-content-between pb-0">
        <div class="card-title mb-0">
            <h5 class="mb-0">{{ $data['title'] }}</h5>
        </div>
    </div>
    <div class="card-body">
        <div class="col-12 col-sm-4 col-md-12 col-lg-4">
            <div class="mt-lg-4 mt-lg-2 mb-lg-4 mb-2 pt-1">
                <h1 class="mb-0">{{ array_key_exists('count', $data) ? $data['count'] : 0 }}</h1>
                <p class="mb-0">Total</p>
            </div>
            <ul class="p-0 m-0">
                <li class="d-flex gap-3 align-items-center mb-lg-3 pt-2 pb-1">
                    <div class="badge rounded bg-label-primary p-1">
                        <i class="ti ti-ticket ti-sm"></i>
                    </div>
                    <div>
                        <h6 class="mb-0 text-nowrap">Aktif</h6>
                        <small
                            class="text-muted">{{ array_key_exists('count_active', $data) ? $data['count_active'] : 0 }}</small>
                    </div>
                </li>
                <li class="d-flex gap-3 align-items-center mb-lg-3 pb-1">
                    <div class="badge rounded bg-label-warning p-1">
                        <i class="ti ti-circle-check ti-sm"></i>
                    </div>
                    <div>
                        <h6 class="mb-0 text-nowrap">Mendekati Kadaluarsa</h6>
                        <small
                            class="text-muted">{{ array_key_exists('count_almost_expired', $data) ? $data['count_almost_expired'] : 0 }}</small>
                    </div>
                </li>
                <li class="d-flex gap-3 align-items-center pb-1">
                    <div class="badge rounded bg-label-danger p-1">
                        <i class="ti ti-clock ti-sm"></i>
                    </div>
                    <div>
                        <h6 class="mb-0 text-nowrap">Kadaluarsa</h6>
                        <small
                            class="text-muted">{{ array_key_exists('count_expired', $data) ? $data['count_expired'] : 0 }}</small>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
