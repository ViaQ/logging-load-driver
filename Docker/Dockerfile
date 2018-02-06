FROM registry.fedoraproject.org/fedora
RUN dnf -y install python
COPY ./loader /
RUN chmod +x /loader
#CMD ["/loader", "--msgpersec=10", "--report-interval=40"]
