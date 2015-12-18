#!/bin/sh -eu 

# -- Initial Process
{
  trap 'cecho $red "$0($LINENO) \"${BASH_COMMAND}\"" ; exit 1' ERR
  readonly red=31; readonly green=32; readonly yellow=33; readonly blue=34
  cecho() { color=$1; shift; printf "\033[${color}m$@\033[m"; }
  error() { printf "\033[${red}m[ERROR] $@\033[m"; }
  warn() { printf "\033[${yellow}m[WARN] $@\033[m"; }
  info() { printf "\033[${blue}m[INFO] $@\033[m"; }
  success() { printf "\033[${green}m[SUCCESS] $@\033[m"; }
  readonly CMD_NAME=$(basename ${0})
  readonly CMD_PATH=$(cd `dirname ${0}` && pwd)
}

# -- Usage
function usage() {
  cat << EOD

  Usage:

    ${CMD_NAME} arguments [options]

  arguments:
    foo
    bar
    baz

  options:
    --environment, -e : Specify the environment(local, dev, stage and prod)
    --source, -s      : Source file directory
    --destination, -d : File export directory

EOD
  exit 1
}

usage

# -- Argument process
function arguments() {
  while [[ $# -gt 0 ]]; do
    case ${1} in
      --environment|-e)
        ENVIRONMENT=${2}
        shift;;
      --destination|-d)
        DESTINATION_DIR=${2}
        shift;;
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
}


