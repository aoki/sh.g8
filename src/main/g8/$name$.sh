#!/bin/sh -eu 

source ./modules/cmdinfo.sh
source ./modules/cecho.sh
source ./modules/usage.sh

info "Infomation Message\n"
error "Error Message\n"
warn "Warning Message\n"
success "Success!!\n\n"

usage

while [[ $# -gt 0 ]]; do
  case ${1} in
    --verbose|-V)
      VERBOSE_MODE=true
      set -x
      ;;
    --help|-h)
      usage;;
    *)
      OTHERS_ARGS=${@}
      ;;
  esac
  shift
done
