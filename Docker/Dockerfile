FROM registry.fedoraproject.org/fedora

ENV MSGPERSEC=0 REPORT_INTERVAL=10 PAYLOAD_SIZE=1024 \
    DISTRIBUTION=gaussian PAYLOAD_GEN=random \
    STDDEV=32 OUTPUT=stdout REPORT=inline \
    TOTAL_SIZE=0

RUN dnf -y install python
COPY ./loader /
RUN chmod +x /loader
# build like this:
# docker build -t loader-container .
# run like this:
# contid=$( docker run -e MSGPERSEC=10 -e STDDEV=16 -d loader-container )
# docker logs $contid
# docker stop $contid
# docker rm $contid
CMD /loader --msgpersec=${MSGPERSEC} --report-interval=${REPORT_INTERVAL} --total-size=${TOTAL_SIZE} --distribution=${DISTRIBUTION} --payload-gen=${PAYLOAD_GEN} --stddev=${STDDEV} --output=${OUTPUT} --report=${REPORT} --log-format=${LOGFORMAT} ${PAYLOAD_SIZE} 
