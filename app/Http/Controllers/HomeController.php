<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Variable;

class HomeController extends AppController
{
    public function index()
    {
        // dd($this->user->getSingleRole()->name);
        if ($this->user->hasRole(['superadmin', 'admin'])) {
            return view('home.admin');
        } else if ($this->user->hasRole('user')) {
            $childs = $this->user->r_childs()->get();
            if (count($childs) <= 0) return redirect()->route('child.create');
            $categories = Category::get();
            return view('assessment.create', compact('childs', 'categories'));
        }
    }
}
