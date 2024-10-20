#! /bin/bash

cd ./authentication-be && composer install
mv ./env-base ./.env
php artisan migrate
php artisan vendor:publish --provider="PHPOpenSourceSaver\JWTAuth\Providers\LaravelServiceProvider"
php artisan jwt:secret | awk '{print "JWT_SECRET="$0}' >> output_file
