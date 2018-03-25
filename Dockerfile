FROM openshift/rhel7

COPY ./loader /
COPY OpenShift/loader.sh /
RUN chmod +x /loader.sh /loader

CMD ["/loader.sh"]
