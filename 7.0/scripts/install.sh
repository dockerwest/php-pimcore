#!/bin/sh

set -e

# ffmpeg comes from backports
echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main" \
    > /etc/apt/sources.list.d/backports.list
# java post install fails if not there
mkdir /usr/share/man/man1/

# install packages
apt-get update
apt-get install -y php7.0-gd php7.0-mysql php7.0-mcrypt php7.0-sqlite3 \
    php7.0-bz2 php7.0-xml php7.0-mbstring php7.0-zip php-redis php-memcached \
    php-imagick
apt-get install -y imagemagick inkscape pngnq pngcrush xvfb cabextract \
    poppler-utils xz-utils libreoffice libreoffice-math jpegoptim ffmpeg \
    html2text ghostscript

# wkhtmltopdf
apt-get install -y xfonts-75dpi
curl "http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-jessie-amd64.deb" \
    -o wkhtmltopdf-0.12.deb
dpkg -i wkhtmltopdf-0.12.deb
rm wkhtmltopdf-0.12.deb

apt-get clean -y

rm -rf /usr/share/man/man1/
