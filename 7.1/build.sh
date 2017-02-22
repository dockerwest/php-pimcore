#!/bin/sh
docker pull dockerwest/php:7.1

docker build --no-cache -t dockerwest/php-pimcore:7.1 .
