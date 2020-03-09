#!/bin/sh

# Script to collect data
# and put the data into outputfile

# Makes /cache in same directory and outputs file there
CWD=$(dirname $0)
CACHEDIR="$CWD/cache/"
OUTPUT_FILE="${CACHEDIR}mdatp.txt"
SEPARATOR=' = '

# Skip manual check
if [ "$1" = 'manualcheck' ]; then
	echo 'Manual check: skipping'
	exit 0
fi

# Create cache dir if it does not exist
mkdir -p "${CACHEDIR}"

# print healthy : "false" or "true"
healthy=$(grep "healthy" ${CACHEDIR}mdatp-health.txt)
healthy="${healthy#*: }"
# echo "$healthy"

# print versonEngine : "###.##.##"
versionEngine=$(grep "versionEngine" ${CACHEDIR}mdatp-health.txt)
versionEngine="${versionEngine#*: }"
versionEngine="${versionEngine//\"/}"
# echo "$versionEngine"

# Output data here
echo "item1${SEPARATOR}$healthy" > ${OUTPUT_FILE}
echo "item2${SEPARATOR}$versionEngine" >> ${OUTPUT_FILE}

# Test without the source txt file
# echo "healthy${SEPARATOR}Yes" > ${OUTPUT_FILE}
# echo "versionEngine${SEPARATOR}10.10.10" >> ${OUTPUT_FILE}
