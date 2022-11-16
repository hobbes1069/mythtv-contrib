#!/bin/env bash

PLEXDIR=/var/lib/mythtv/plex

if [[ $# -eq 0 ]]; then
	# Run for all recordings
	/usr/local/bin/mythlink --link $PLEXDIR --format "%T - s%sse%ep"
	/usr/bin/symlinks -c $PLEXDIR
else
	# Run for a single recording, must be setup to triggered to run in mythbackend
	/usr/local/bin/mythlink --link $PLEXDIR --format "%T - s%sse%ep" \
		--chanid $1 --starttime $2
	/usr/bin/symlinks -c $PLEXDIR
fi
