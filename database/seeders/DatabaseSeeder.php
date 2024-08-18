<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\AktaPendirian;
use App\Models\IzinProduksi;
use App\Models\PerizinanDasar;
use App\Models\PerjanjianKerjasama;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use App\Models\Menu;
use App\Models\SertifikatTanah;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // $this->generateInitialSeeder();
        // $this->generateTestingSeeder();
    }

    public function generateInitialSeeder(): void
    {
        Role::insert([
            ['name' => 'superadmin', 'guard_name' => 'web'],
            ['name' => 'admin', 'guard_name' => 'web'],
            ['name' => 'user', 'guard_name' => 'web'],
        ]);
        Permission::insert([
            ['name' => '*.update', 'guard_name' => 'web'],
            ['name' => '*.delete', 'guard_name' => 'web'],
            ['name' => 'reset password user', 'guard_name' => 'web'],
        ]);

        $user1 = User::factory()->create([
            'name' => 'Super Admin',
            'username' => 'superadmin',
            'email' => 'superadmin@email.com',
            'password' => bcrypt('superadmin'),
        ]);
        $user1->assignRole('superadmin');
        $user1->givePermissionTo(['*.update', '*.delete', 'reset password user']);

        $user2 = User::factory()->create([
            'name' => 'Admin',
            'username' => 'admin',
            'email' => 'admin@email.com',
            'password' => bcrypt('admin'),
        ]);
        $user2->assignRole('admin');

        $user3 = User::factory()->create([
            'name' => 'User',
            'username' => 'user',
            'email' => 'user@email.com',
            'password' => bcrypt('user'),
        ]);
        $user3->assignRole('user');

        Menu::insert([
            [
                'link' => '/home',
                'name' => 'Home',
                'icon' => 'ti-smart-home',
                'no_urut' => 1,
                'menu_id' => null,
                'is_heading' => 0,
            ],
            [
                'link' => '/master',
                'name' => 'Data Master',
                'icon' => 'ti-lifebuoy',
                'no_urut' => 2,
                'menu_id' => null,
                'is_heading' => 0,
            ],
            [
                'link' => '/master/user',
                'name' => 'Master Pengguna',
                'icon' => 'ti-users',
                'no_urut' => 1,
                'menu_id' => 2,
                'is_heading' => 0,
            ],
            [
                'link' => '/master/nama-perizinan',
                'name' => 'Nama Perizinan',
                'icon' => 'ti-id',
                'no_urut' => 2,
                'menu_id' => 2,
                'is_heading' => 0,
            ],
            [
                'link' => 'perizinan',
                'name' => 'PERIZINAN',
                'icon' => null,
                'no_urut' => 3,
                'menu_id' => null,
                'is_heading' => 1,
            ],
            [
                'link' => '/perizinan-dasar',
                'name' => 'Perizinan Dasar',
                'icon' => 'ti-address-book',
                'no_urut' => 4,
                'menu_id' => null,
                'is_heading' => 0,
            ],
            [
                'link' => '/akta-pendirian',
                'name' => 'Akta Pendirian',
                'icon' => 'ti-file-analytics',
                'no_urut' => 5,
                'menu_id' => null,
                'is_heading' => 0,
            ],
            [
                'link' => '/sertifikat-tanah',
                'name' => 'Sertifikat Tanah',
                'icon' => 'ti-file-certificate',
                'no_urut' => 6,
                'menu_id' => null,
                'is_heading' => 0,
            ],
            [
                'link' => '/izin-produksi',
                'name' => 'Izin Produksi',
                'icon' => 'ti-file-database',
                'no_urut' => 7,
                'menu_id' => null,
                'is_heading' => 0,
            ],
            [
                'link' => '/izin-produksi/pengajuan',
                'name' => 'Pengajuan',
                'icon' => 'ti-file-database',
                'no_urut' => 1,
                'menu_id' => 9,
                'is_heading' => 0,
            ],
            [
                'link' => '/izin-produksi/sertifikat',
                'name' => 'Sertifikat',
                'icon' => 'ti-file-database',
                'no_urut' => 2,
                'menu_id' => 9,
                'is_heading' => 0,
            ],
            [
                'link' => '/perjanjian-kerjasama',
                'name' => 'Perjanjian Kerjasama',
                'icon' => 'ti-file-invoice',
                'no_urut' => 8,
                'menu_id' => null,
                'is_heading' => 0,
            ],
        ]);
    }

    public function generateTestingSeeder(): void
    {
        // User::factory(150)->create();
        PerizinanDasar::factory(rand(1000, 1500))->create();
        IzinProduksi::factory(rand(1000, 1500))->create();
        PerjanjianKerjasama::factory(rand(1000, 1500))->create();
        AktaPendirian::factory(rand(1000, 1500))->create();
        SertifikatTanah::factory(rand(1000, 1500))->create();
    }
}
