#!/bin/sh -eu 

source ./modules/cmdinfo.sh
source ./modules/cecho.sh
source ./modules/usage.sh

while [[ $# -gt 0 ]]; do
  case ${1} in
    --verbose|-V)
      VERBOSE_MODE=true;;
    --help|-h)
      usage;;
    *)
      OTHERS_ARGS=${@}
      ;;
  esac
  shift
done
