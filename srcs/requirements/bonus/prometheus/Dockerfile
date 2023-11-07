FROM alpine:latest

RUN addgroup -S prometheus && adduser -S prometheus -G prometheus

RUN apk update && apk add --no-cache curl tar

RUN curl -L -o prometheus.tar.gz "https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz" && \
  tar xvf prometheus.tar.gz --strip-components=1 && \
  mkdir -p /etc/prometheus /prometheus_data && \
  mv prometheus /bin/prometheus && \
  mv promtool /bin/promtool && \
  mv consoles /etc/prometheus && \
  mv console_libraries /etc/prometheus && \
  mv prometheus.yml /etc/prometheus/prometheus.yml && \
  chown -R prometheus:prometheus /etc/prometheus /prometheus_data

USER prometheus

WORKDIR /prometheus_data

EXPOSE 9090

ENTRYPOINT [ "/bin/prometheus" ]

CMD [ "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/prometheus_data", "--web.enable-lifecycle" ]

