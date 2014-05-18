FROM codekoala/arch-s6
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

RUN pacman -Sqyu --noconfirm --needed --noprogressbar skydns2-git etcd

# environment variables
ENV ETCD_DATA_DIR /var/lib/etcd
ENV ETCD_MACHINES http://127.0.0.1:4001

# setup services
ADD run-etcd /services/etcd/run
ADD run-skydns2 /services/skydns2/run

CMD ["/usr/bin/s6-svscan", "/services"]
