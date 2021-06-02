FROM registry.fedoraproject.org/fedora:34

ENV MSGPERSEC=0 REPORT_INTERVAL=10 PAYLOAD_SIZE=1024 \
    DISTRIBUTION=gaussian PAYLOAD_GEN=random \
    STDDEV=32 OUTPUT=stdout REPORT=inline \
    TOTAL_SIZE=0

COPY ./loader /usr/bin/loader

RUN dnf -y install pypy3 && chmod +x /usr/bin/loader && dnf -y clean all && rm -rf /var/cache/dnf
# run like this:
#   $ contid=$( podman run -e MSGPERSEC=10 -e STDDEV=16 -d loader-container )
#   $ podman logs ${contid}
#   $ podman stop ${contid}
#   $ podman rm ${contid}
CMD /usr/bin/loader --msgpersec=${MSGPERSEC} --report-interval=${REPORT_INTERVAL} --total-size=${TOTAL_SIZE} --distribution=${DISTRIBUTION} --payload-gen=${PAYLOAD_GEN} --stddev=${STDDEV} --output=${OUTPUT} --report=${REPORT} ${PAYLOAD_SIZE}
