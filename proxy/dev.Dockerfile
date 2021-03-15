FROM nginx:1.19.6-alpine@sha256:c2ce58e024275728b00a554ac25628af25c54782865b3487b11c21cafb7fabda
LABEL NM <n0668674711@gmail.com>

ENV KEYCLOAK_PORT=8080
ENV NGINX_SERVER_NAME="demo.net"

RUN mkdir -p /opt/app
RUN apk add nano
COPY ./proxy/start.sh /opt/app/
COPY ./proxy/dev.nginx.conf /etc/nginx/conf.d/default.conf
COPY ./proxy/dev.certs/ /etc/nginx/conf.d/certs/
COPY ./proxy/html/ /usr/share/nginx/html/

RUN sed -i "s/\${KEYCLOAK_PORT}/$KEYCLOAK_PORT/g" /etc/nginx/conf.d/default.conf \
	&& sed -i "s/\${NGINX_SERVER_NAME}/$NGINX_SERVER_NAME/g" /etc/nginx/conf.d/default.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
RUN chmod +x /opt/app/start.sh


EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["/opt/app/start.sh"]
