#-----------------------------------------------------------------------------#
# Usage
#-----------------------------------------------------------------------------#

function usage() {
  cat << EOD

  Usage:

    ${CMD_PATH} requireArg [options]

  requireArg:
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