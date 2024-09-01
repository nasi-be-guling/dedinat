<p class="text-center" style="font-size: 1.5em; color: #c2410c;">{{ $quote?->text }}</p>

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
                @if (count($item->r_items) > 0)
                    <tr>
                        <td colspan="5" class="text-center"><b>{{ $az[$i] . '. ' . $item->name }}</b></td>
                    </tr>
                @endif
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
        <tfoot>
            <tr style="background-color: #fde68a">
                <td colspan="3" style="text-align: right"><b>{{ $category->footer_diduga }}</b></td>
                <td colspan="2"><b>Diduga</b></td>
            </tr>
            <tr style="background-color: #d9f99d">
                <td colspan="3" style="text-align: right"><b>{{ $category->footer_normal }}</b></td>
                <td colspan="2"><b>Normal</b></td>
            </tr>
            <tr style="background-color: #ddd6fe">
                <td colspan="3" style="text-align: right"><b>Hasil</b></td>
                <td id="tdHasil" colspan="2" style="font-weight: bolder"></td>
            </tr>
        </tfoot>
    </table>
</div>
