FROM debian:latest

RUN apt update && apt install nginx curl socat cron -y
RUN curl https://get.acme.sh | sh

EXPOSE 80
EXPOSE 443

COPY ./entrypoint.sh .
COPY ./nginx.conf /etc/nginx

RUN chmod +x ./entrypoint.sh

RUN ln -s /root/.acme.sh/acme.sh /usr/local/bin/

ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["nginx", "-g", "daemon off;"]