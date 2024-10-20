#! /bin/bash

cd ./authentication-be && composer install
cp ./.env.base ./.env
php artisan key:generate
php artisan migrate
php artisan vendor:publish --provider="PHPOpenSourceSaver\JWTAuth\Providers\LaravelServiceProvider"
php artisan jwt:secret | awk '{print "JWT_SECRET="$0}' >> output_file
