#!/usr/bin/env bash
#
# Pype-setup
# Linux mongodb server launcher
#

# Full path of the current script
THIS=`readlink -f "${BASH_SOURCE[0]}" 2>/dev/null||echo $0`
# The directory where current script resides
DIR=`dirname "${THIS}"`

# basic Setup
export PYPE_STUDIO_TEMPLATES="$(cd $DIR/../ ; pwd)"
export PYPE_SETUP_ROOT="$(cd $DIR/../../../ ; pwd)"
# Directory, where will be local evironment. Should be accessible for all
CONDA_SHARED="/tmp"

# debugging
export PYPE_DEBUG=1
export PYPE_DEBUG_STDOUT=0

# maintain python environment
SYNC_ENV=0 # will synchronize remote with local
REMOTE_ENV_ON=0 # will switch to remote

# Load colors definitions for easy output coloring
source "$PYPE_SETUP_ROOT/bin/colors.sh"

echo -e "${IGreen}>>>${RST} ${BIWhite}Welcome to Pipe Club${RST}"
echo -e "${IGreen}>>>${RST} launching Conda ..."

# Launch Conda
source "$PYPE_SETUP_ROOT/bin/launch_conda.sh"

# export PYTHONPATH="$PYPE_SETUP_ROOT"

export AVALON_DB="avalon"
export AVALON_MONGO_PORT="27072"
export AVALON_MONGO="mongodb://localhost:$AVALON_MONGO_PORT"
export AVALON_DB_DATA="/tmp/mongo_db_data"

echo -e "${IGreen}>>>${RST} launching local mongo server ..."
python "$PYPE_SETUP_ROOT/app/local_mongo_server.py" "$@"
