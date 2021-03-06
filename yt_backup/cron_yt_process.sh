YT_IMPORT_LOCATION=$1
YT_URLS_AND_LOCATIONS=${YT_IMPORT_LOCATION}data.txt
YT_ARCHIVE_FILE=${YT_IMPORT_LOCATION}archive.txt

touch ${YT_ARCHIVE_FILE} # Make sure the archive file exists

# Run the downloader for each Youtube URL
cat ${YT_URLS_AND_LOCATIONS} | while read line
do
  line_split=( $line )
  YOUTUBE_URL=${line_split[0]}
  OUTPUT=${line_split[1]}
  /usr/local/bin/youtube-dl -o "${OUTPUT}" --youtube-skip-dash-manifest "${YOUTUBE_URL}" --no-warnings -i --download-archive "${YT_ARCHIVE_FILE}" -e
done
