#!/bin/bash
FILEDEST="$(date +%m-%d--%H-%M-00)-${FILE##*/}"
echo "Archiving ${FILE} to s3://${S3_BUCKET}/${FILEDEST}"
cd ${FILE%/*} # cd into dir containing the current file
echo "Changed into $(pwd)"
if [ "${?}" -eq 0 ]; then
  #gzip ${file}
  mv ${FILE##*/} ${FILEDEST}
  /usr/local/bin/aws s3 cp ${FILEDEST} s3://${S3_BUCKET}
  rm ${FILEDEST}
  echo "${FILE} removed."
else
  echo "Error backing up file ${FILE}"
  exit 255
fi
