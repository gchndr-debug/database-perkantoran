# Database Perkantoran (`db_perkantoran`)

Repository ini berisi rancangan dan struktur basis data relasional (MySQL/MariaDB) untuk sistem manajemen data perkantoran yang mencakup pengelolaan departemen, jabatan, data karyawan, proyek perusahaan, serta penugasan tim.

## Struktur Tabel & Relasi

Database ini terdiri dari **5 tabel utama** yang saling berelasi menggunakan *Primary Key* dan *Foreign Key*:

1. **`departemen`** — Menyimpan data unit kerja atau divisi yang ada di dalam perusahaan.
2. **`jabatan`** — Menyimpan daftar posisi/jabatan beserta detail struktur tugasnya.
3. **`karyawan`** — Menyimpan data induk pegawai yang terhubung dengan tabel `departemen` dan `jabatan`.
4. **`proyek`** — Menyimpan daftar proyek yang sedang berjalan atau direncanakan perusahaan.
5. **`penugasan`** — Tabel relasi (*junction/detail*) yang mencatat pembagian tugas karyawan ke dalam masing-masing proyek.

## Teknologi yang Digunakan

* **DBMS:** MySQL / MariaDB
* **Tools:** XAMPP & phpMyAdmin
* **Bahasa Query:** SQL (DDL & DML)

## Cara Menggunakan (Import ke Localhost)

1. Unduh file `db_perkantoran.sql` dari repository ini.
2. Buka **XAMPP Control Panel**, lalu jalankan module **Apache** dan **MySQL**.
3. Akses **phpMyAdmin** melalui browser di alamat `http://localhost/phpmyadmin`.
4. Buat database baru dengan nama `db_perkantoran`.
5. Pilih database tersebut, masuk ke tab **Import**, pilih file `db_perkantoran.sql`, lalu klik **Go / Import**.

---
*Dibuat oleh **Ngo Kuang Yong Gunawan Chandrawinata** — Siswa XI TJKT, SMK Paramita Maitreya Duri.*
