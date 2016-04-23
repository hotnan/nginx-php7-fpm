Docker image - Nginx with PHP7 and FPM
--------------------------------------

### Details
- Nginx 1.8.1
- PHP 7.0.5
- PHP-FPM

### Configuration
- Document root for Nginx default vhost: /var/www/html

### Build image
        docker build -t skywidesoft/nginx-php7-fpm .

### Push image
        docker push skywidesoft/nginx-php7-fpm

### Run container
        docker run -d --name=nginx-php-test1 -p=80:80 -v /Users/clarence/docker-data/nginx-php-1/www/default:/var/www/html skywidesoft/nginx-php7-fpm
