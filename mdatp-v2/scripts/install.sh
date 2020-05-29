#!/bin/bash

# Matx controller
CTL="${BASEURL}index.php?/module/Matx/"

# Get the scripts in the proper directories
"${CURL[@]}" "${CTL}get_script/Matx.sh" -o "${MUNKIPATH}preflight.d/Matx.sh"

# Check exit status of curl
if [ $? = 0 ]; then
	# Make executable
	chmod a+x "${MUNKIPATH}preflight.d/Matx.sh"

	# Set preference to include this file in the preflight check
	setreportpref "Matx" "${CACHEPATH}Matx.txt"

else
	echo "Failed to download all required components!"
	rm -f "${MUNKIPATH}preflight.d/Matx.sh"

	# Signal that we had an error
	ERR=1
fi
