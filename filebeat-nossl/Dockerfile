FROM centos:7

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.5.0-x86_64.rpm && \
    rpm -i filebeat-5.5.0-x86_64.rpm && \
    rm -f filebeat-5.5.0-x86_64.rpm && \
    mkdir -p /etc/filebeat

COPY conf/filebeat.yml /etc/filebeat/filebeat.yml

RUN chmod 600 /etc/filebeat/filebeat.yml

ENTRYPOINT ["/usr/bin/filebeat.sh", "-e", "-v"]
CMD ["-c", "/etc/filebeat/filebeat.yml"]