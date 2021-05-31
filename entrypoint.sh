#!/bin/bash
set -Eeo pipefail

export ORACLE_HOME=/opt/instantclient_21_1
export LD_LIBRARY_PATH=$ORACLE_HOME
export SQLPATH=$ORACLE_HOME
export PATH=$ORACLE_HOME:$PATH

sleep 0.3s;

exec "$@"