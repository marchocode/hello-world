FROM ubuntu as builder

RUN apt update && apt install curl cron socat -y
RUN curl https://get.acme.sh | sh
RUN ln -s /root/.acme.sh/acme.sh /usr/local/bin/

COPY ./entrypoint.sh .
RUN chmod +x ./entrypoint.sh

VOLUME [ "/root/.acme.sh" ]

ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["bash"]