<div class="table-responsive">
    <table class="table table-bordered table-hover table-sticky">
        <thead>
            <tr>
                <th width="25" class="text-center" rowspan="2">No</th>
                <th rowspan="2">Item Instrumen</th>
                <th width="200" class="text-center" rowspan="2">Metode</th>
                <th width="50" colspan="2" class="text-center">Respon Anak</th>
            </tr>
            <tr>
                <th width="10" class="text-center">Ya</th>
                <th width="10" class="text-center">Tidak</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($items as $i => $item)
                <tr>
                    <td colspan="5" class="text-center"><b>{{ $item->name }}</b></td>
                </tr>
                @foreach ($item->r_items as $no => $t)
                    @php
                        $kode = $i . '_' . $no;
                    @endphp
                    <tr>
                        <td class="text-center"><b>{{ $no + 1 }}</b></td>
                        <td>{!! $t->name !!}</td>
                        <td class="text-center" style="white-space: pre;">{!! $t->method_id_html !!}</td>
                        <td class="text-center check">
                            <div class="form-check">
                                <input required name="skor-{{ $kode }}" class="form-check-input" type="radio"
                                    value="1" id="radioSkor-{{ $kode . '-1' }}">
                                <label class="form-check-label" for="radioSkor-{{ $kode . '-1' }}">Ya</label>
                            </div>
                        </td>
                        <td class="text-center check">
                            <div class="form-check">
                                <input required name="skor-{{ $kode }}" class="form-check-input" type="radio"
                                    value="0" id="radioSkor-{{ $kode . '-0' }}">
                                <label class="form-check-label" for="radioSkor-{{ $kode . '-0' }}">Tidak</label>
                            </div>
                        </td>
                    </tr>
                @endforeach
            @endforeach
        </tbody>
    </table>
</div>
