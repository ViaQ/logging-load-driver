FROM openshift/rhel7

COPY ./loader /
COPY ./loader.sh /
RUN chmod +x /loader.sh /loader

CMD ["/loader.sh"]
