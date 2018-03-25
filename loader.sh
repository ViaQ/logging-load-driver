#!/bin/bash

/loader --report-interval=${REPORT_INTERVAL} --total-size=${TOTAL_SIZE} --payload-gen=${PAYLOAD_GEN} --distribution=${DISTRIBUTION} --stddev=${STDDEV} --output=${OUTPUT} --report=${REPORT} ${PAYLOAD_SIZE}
