<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

-   [Simple, fast routing engine](https://laravel.com/docs/routing).
-   [Powerful dependency injection container](https://laravel.com/docs/container).
-   Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
-   Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
-   Database agnostic [schema migrations](https://laravel.com/docs/migrations).
-   [Robust background job processing](https://laravel.com/docs/queues).
-   [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

You may also try the [Laravel Bootcamp](https://bootcamp.laravel.com), where you will be guided through building a modern Laravel application from scratch.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 2000 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell).

### Premium Partners

-   **[Vehikl](https://vehikl.com/)**
-   **[Tighten Co.](https://tighten.co)**
-   **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
-   **[64 Robots](https://64robots.com)**
-   **[Cubet Techno Labs](https://cubettech.com)**
-   **[Cyber-Duck](https://cyber-duck.co.uk)**
-   **[Many](https://www.many.co.uk)**
-   **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
-   **[DevSquad](https://devsquad.com)**
-   **[Curotec](https://www.curotec.com/services/technologies/laravel/)**
-   **[OP.GG](https://op.gg)**
-   **[WebReinvent](https://webreinvent.com/?utm_source=laravel&utm_medium=github&utm_campaign=patreon-sponsors)**
-   **[Lendio](https://lendio.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

## Deployment

When you're ready to deploy your Laravel application to production, there are some important things you can do to make sure your application is running as efficiently as possible.

### Server Requirement

The Laravel framework has a few system requirements. You should ensure that your web server has the following minimum PHP version and extensions:

-   PHP >= 8.1
-   Ctype PHP Extension
-   cURL PHP Extension
-   DOM PHP Extension
-   Fileinfo PHP Extension
-   Filter PHP Extension
-   Hash PHP Extension
-   Mbstring PHP Extension
-   OpenSSL PHP Extension
-   PCRE PHP Extension
-   PDO PHP Extension
-   Session PHP Extension
-   Tokenizer PHP Extension
-   XML PHP Extension

### Application Deployment

#### Install Composer Dependencies

> composer install --optimize-autoloader --no-dev

#### Add Environment Variables

> cp .env.example .env

#### Add App Key

> php artisan key:generate

#### Folder Permission

> chmod -R 775 storage

> chmod -R 775 bootstrap/cache


# Laravel + Docker (WSL2) Setup

Proyek ini menggunakan Laravel 10 dengan Docker dan WSL2. Semua container disiapkan untuk development tanpa rebuild image terus-menerus, dan Composer sudah tersedia di dalam container PHP.

---

## 📁 Struktur Direktori

```
dedi-nataniel/
├── app/
├── db_denat.sql
├── .env
├── docker/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── nginx/
│       └── conf.d/
│           └── default.conf
└── ...
```

---

## ⚙️ Konfigurasi

### 📄 `.env` (potongan penting)

```env
APP_URL=http://localhost:8000

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=db_dedinat
DB_USERNAME=root
DB_PASSWORD=root
```

---

### 📄 `docker-compose.yml`

Letakkan di `docker/docker-compose.yml`

```yaml
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: laravel-app
    working_dir: /var/www/html
    volumes:
      - ../:/var/www/html
    ports:
      - "9000:9000"
    depends_on:
      - mysql
    networks:
      - laravel

  web:
    image: nginx:stable
    container_name: laravel-nginx
    ports:
      - "8000:80"
    volumes:
      - ../:/var/www/html
      - ./nginx/conf.d:/etc/nginx/conf.d
    depends_on:
      - app
    networks:
      - laravel

  mysql:
    image: mariadb:10.5
    container_name: laravel-mysql
    ports:
      - "3306:3306"
    environment:
      MYSQL_DATABASE: db_dedinat
      MYSQL_ROOT_PASSWORD: root
      MYSQL_USER: laravel
      MYSQL_PASSWORD: laravel
    volumes:
      - dbdata:/var/lib/mysql
    networks:
      - laravel

volumes:
  dbdata:

networks:
  laravel:
```

---

### 📄 `Dockerfile`

Letakkan di `docker/Dockerfile`

```dockerfile
FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git curl unzip libzip-dev zip libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libxml2-dev libgd-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql zip mbstring exif pcntl bcmath gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
```

---

### 📄 `default.conf`

Letakkan di `docker/nginx/conf.d/default.conf`

```nginx
server {
    listen 80;
    index index.php index.html;
    root /var/www/html/public;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass app:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

---

## 🚀 Langkah Instalasi

Jalankan perintah-perintah ini dari WSL2:

```bash
cd ~/www/dedi-nataniel/docker

# Build container (sekali saja)
docker compose build

# Jalankan semua container
docker compose up -d
```

---

## 🔧 Setup Laravel

Masuk ke container PHP:

```bash
docker compose exec app bash
```

Di dalam container:

```bash
# Tandai direktori project sebagai aman untuk git
git config --global --add safe.directory /var/www/html

# Install dependency Laravel
composer install

# Generate app key
php artisan key:generate

# Jalankan migrasi
php artisan migrate
```

---

## 📂 Import Database SQL

Dari WSL2 host:

```bash
docker exec -i laravel-mysql mysql -u root -proot db_dedinat < ../db_denat.sql
```

---

## 🌐 Akses Aplikasi

Buka di browser:

```
http://localhost:8000
```

---

## 🪥 Perintah Tambahan

```bash
# Restart semua container
docker compose down
docker compose up -d

# Clear dan cache config Laravel
php artisan config:clear
php artisan config:cache
```

---

## ✅ Siap Digunakan

Laravel siap digunakan di lingkungan Docker + WSL2. 

UPDATE 27 Mei 2025, tolong tambahkan di env paling bawah:

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
GOOGLE_REDIRECT_URI=http://127.0.0.1:8000/auth/google/callback
GOOGLE_CLIENT_ID=526284485212-ke6s7v24fkjhas373uclp9r6t5id7l62.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=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