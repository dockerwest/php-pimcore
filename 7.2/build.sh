#!/bin/sh
docker pull dockerwest/php:7.2

docker build --no-cache -t dockerwest/php-pimcore:7.2 .
