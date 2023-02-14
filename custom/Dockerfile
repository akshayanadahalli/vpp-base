FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
                ca-certificates \
                curl \
                gnupg \
                iproute2 \
                iputils-ping \
                openssh-server \
                vim \
        && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

RUN echo 'root:docker' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

WORKDIR /vpp

COPY *.deb ./

COPY start.sh /start.sh

RUN set -eux; \
        apt-get update && apt-get install -y -V ./*.deb; \
        dpkg-query -f '${Version}\n' -W vpp > /vpp/version; \
        rm -rf /var/lib/apt/lists/*;

#RUN service ssh start
EXPOSE 22

RUN mkdir -p /var/log/vpp

CMD ["/start.sh"]
