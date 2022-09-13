FROM alpine:3.13
RUN apk --no-cache add openssh-client
COPY ssh_config /root/.ssh/ssh_config
RUN chmod 644 /root/.ssh/ssh_config
ENTRYPOINT ["ssh"]