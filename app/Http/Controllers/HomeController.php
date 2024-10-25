<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Variable;

class HomeController extends AppController
{
    public function index()
    {
        return view('home.welcome');
    }

    public function start()
    {
        $childs = $this->user->r_childs()->get();
        // : jika tidak ada data anak, maka akan dialihkan ke halaman create data anak
        if (count($childs) <= 0)
            return redirect()->route('child.create');

        // : jika sudah ada data anak, maka akan dialihkan ke halaman create assessment
        $categories = Category::get();
        return view('assessment.create', compact('childs', 'categories'));
    }
}
