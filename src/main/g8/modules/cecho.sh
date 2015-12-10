#-----------------------------------------------------------------------------#
# Color echo
#-----------------------------------------------------------------------------#

{
  trap 'cecho $red "$0($LINENO) \"${BASH_COMMAND}\"" ; exit 1' ERR
  readonly red=31; readonly green=32; readonly yellow=33; readonly blue=34
  cecho() { color=$1; shift; printf "\033[${color}m$@\033[m"; }
  error() { printf "\033[${red}m[ERROR] $@\033[m"; }
  warn() { printf "\033[${yellow}m[WARN] $@\033[m"; }
  info() { printf "\033[${blue}m[INFO] $@\033[m"; }
  success() { printf "\033[${green}m[SUCCESS] $@\033[m"; }
}
