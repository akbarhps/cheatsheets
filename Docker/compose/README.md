# Docker Compose Example


> [Official Documantation](https://docs.docker.com/compose/#compose-documentation)


- `version: '3.9'` versi dari docker-compose  
---


- `services:` berisikan services yang akan dijalankan
- `mongo:` merupakan nama service (bukan nama container ataupun image)
- `container_name:` nama container yang akan digunakan
- `image:` nama image yang akan digunakan
- `ports:` port yang diekspos oleh container dan port yang di ekspos oleh image
- `networks:` merupakan nama dari network docker (digunakan untuk menghubungkan beberapa container dalam 1 network, digunakan untuk bisa mengakses database dari container lain)  
---


- `networks:` berisikan daftar networks yang ada pada docker
- `java_network:` merupakan nama networks di docker-compose (sama seperti mongo diatas)
- `name:` nama network yang sudah di create di docker


## Cara Menjalankan Docker Compose


- `docker-compose up` untuk create container yang ada di dalam docker-compose dan menjalakan isi dari docker-compose
- `docker-compose down` untuk menghentikan dan menghapus container yang ada di dalam docker-compose 
- `docker-compose start` untuk menjalankan tanpa create container
- `docker-compose stop` untuk menghentikan tanpa menghapus container
- `-d` untuk menjalakan di background


> Command lainnya cek di `docker-compose`