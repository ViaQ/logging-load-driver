# Dockerfile for OpenShift (origin or enterprise)
FROM openshift/rhel7

COPY ./loader /
COPY ./loader.sh /
RUN chmod +x /loader.sh /loader

# Run application via loader.sh which reads container $variables
# set by a DeploymentConfig.
# $variables required by loader.sh:
# REPORT_INTERVAL
# TOTAL_SIZE
# PAYLOAD_GEN
# DISTRIBUTION
# STDDEV
# OUTPUT
# REPORT
# PAYLOAD_SIZE
CMD ["/loader.sh"]
