#!/bin/sh
docker pull blackikeeagle/php-debian:5.6

docker build --no-cache -t blackikeeagle/php-pimcore:5.6 .
