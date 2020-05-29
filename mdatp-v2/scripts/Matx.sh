#!/bin/sh
# Script to collect data into outputfile

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

# run MDATP healh check
/usr/local/bin/mdatp --health > ${CACHEDIR}mdatp-health.txt

healthy=$(grep "healthy" ${CACHEDIR}mdatp-health.txt)
healthy="${healthy#*: }"

versionEngine=$(grep "versionEngine" ${CACHEDIR}mdatp-health.txt)
versionEngine="${versionEngine#*: }"
versionEngine="${versionEngine//\"/}"

# definitionsUpdated Needs to be corrected
definitionsUpdated=$(grep "definitionsUpdated" ${CACHEDIR}mdatp-health.txt)
definitionsUpdated="${definitionsUpdated:0:57}"
definitionsUpdated="${definitionsUpdated//\"/}"
definitionsUpdated="${definitionsUpdated#*: }"
#definitionsUpdated="${definitionsUpdated//\"/}"
#definitionsUpdated={date -d $definitionsUpdated}
definitionsUpdated=$(date -r "$definitionsUpdated")

# Run to see Formating
# definitionsUpdated=$(date -j -f "$definitionsUpdated")


definitionsUpdatedMinutesAgo=$(grep "definitionsUpdatedMinutesAgo" ${CACHEDIR}mdatp-health.txt)
definitionsUpdatedMinutesAgo="${definitionsUpdatedMinutesAgo#*: }"
definitionsUpdatedMinutesAgo="${definitionsUpdatedMinutesAgo//\"/}"

definitionsVersion=$(grep "definitionsVersion" ${CACHEDIR}mdatp-health.txt)
definitionsVersion="${definitionsVersion#*: }"


# Output data
echo "item1${SEPARATOR}$healthy" > ${OUTPUT_FILE}
echo "item2${SEPARATOR}$versionEngine" >> ${OUTPUT_FILE}
echo "item3${SEPARATOR}$definitionsUpdated" >> ${OUTPUT_FILE}
echo "item4${SEPARATOR}$definitionsUpdatedMinutesAgo" >> ${OUTPUT_FILE}
echo "item5${SEPARATOR}$definitionsVersion" >> ${OUTPUT_FILE}

# Test without the source txt file
# echo "healthy${SEPARATOR}Yes" > ${OUTPUT_FILE}
# echo "versionEngine${SEPARATOR}10.10.10" >> ${OUTPUT_FILE}
