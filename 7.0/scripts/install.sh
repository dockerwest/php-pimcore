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
    php-imagick php7.0-intl php7.0-soap
apt-get install -y imagemagick inkscape pngnq pngcrush xvfb cabextract \
    poppler-utils xz-utils libreoffice libreoffice-math jpegoptim ffmpeg \
    html2text ghostscript exiftool

# wkhtmltopdf
apt-get install -y xfonts-75dpi
curl -LO https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
tar -xf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
cp -a wkhtmltox/bin/wkhtmltopdf /usr/local/bin/
rm -rf wkhtmltox wkhtmltox-0.12.4_linux-generic-amd64.tar.xz

apt-get clean -y

rm -rf /usr/share/man/man1/
