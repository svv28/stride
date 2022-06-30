#!/bin/bash

set -eu
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DEPLOYMENT_NAME="$1"
NUM_STRIDE_NODES="$2"

# import dependencies
source ${SCRIPT_DIR}/testnet_vars.sh $DEPLOYMENT_NAME

echo "Cleaning state"
rm -rf $STATE $STATE/keys.txt

STATE=$SCRIPT_DIR/state
mkdir -p $STATE
touch $STATE/keys.txt

source ${SCRIPT_DIR}/setup_stride_state.sh $NUM_STRIDE_NODES
source ${SCRIPT_DIR}/setup_gaia_state.sh 
source ${SCRIPT_DIR}/setup_hermes_state.sh
source ${SCRIPT_DIR}/setup_icq_state.sh $DEPLOYMENT_NAME

echo "Done"