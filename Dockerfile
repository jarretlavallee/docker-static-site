FROM nginx:latest
MAINTAINER Jarret Lavallee <jarret.lavallee@gmail.com>

RUN apt-get -q update && \
    apt-get install -y git && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/* $HOME/.cache

ADD conf/default.conf /etc/nginx/conf.d/default.conf
ADD scripts/start.sh /start.sh

EXPOSE 80

CMD ["/start.sh"]
