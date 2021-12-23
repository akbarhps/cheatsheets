# Membuat Container dengan Image MYSQL


```bash
docker run --name namacontainer -p 3306:3306 mysql:latest -e MYSQL_ROOT_PASSWORD=password
```

- `-p` digunakan untuk set port yang akan di ekspos docker, dengan urutan:
  - `3306` yang pertama merupakan port yang digunakan untuk di akses dari luar (untuk mempermudah maka disamakan dengan default database)
  - `3306` yang kedua merupakan port yang di ekspos oleh databasenya (defaultnya 3306)
- `mysql:latest` nama image database dan tag nya (cek di [Docker Hub](www.hub.docker.com))
- `-e` merupakan environment variable
  - `MYSQL_ROOT_PASSWORD=password` merupakan variable wajib ketika membuat container mysql
  - jika tidak membuat `MYSQL_ROOT_PASSWORD` maka container tidak akan bisa dijalankan



# Mengakses MYSQL CLI dari Docker Container


Untuk membuka CLI pada container

```bash
docker exec -it namacontainer bash
```

kemudian untuk mengakses MYSQL ketikkan:

```bash
mysql -p
```

> Setelah melakukan `mysql -p` masukkan `MYSQL_ROOT_PASSWORD` ketika membuat container