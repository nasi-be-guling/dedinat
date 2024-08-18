<?php
if (!function_exists('assets')) {
    function assets($path, $secure = null)
    {
        return asset('assets/' . trim($path, '/'), $secure);
    }
}
