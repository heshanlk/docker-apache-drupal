FROM pataquets/apache-php:5.3

EXPOSE 80
VOLUME /app

ADD files/etc/php5/ /etc/php5/

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      php5-curl \
      php5-gd \
      php5-mysql \
      php5-pgsql \
      php5-sqlite \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/ \
  && \
  a2enmod rewrite

CMD \
  rm -rf /var/www && \
  ln -s /app /var/www
  
RUN chown www-data:www-data /var/www
