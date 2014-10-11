Test Application
=======================

Installation
------------

1. Cone git repository

2. Install database by `psql`:


    ```
    psql -Upostgres -c 'CREATE DATABASE catalog'
    psql -Upostgres < ./install/dump.pgsql.sql
    ```

3. Run application by `php` 5.4+ build-in server:


    ```
    php -S localhost:8888 -t public/ public/index.php
    ```
