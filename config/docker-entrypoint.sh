#!/bin/bash

set -e

INICONFIG=./dicom.ini



sed 's/^\(MyACRNema\s*= \).*$/\1'"$AE_TITLE"'/' -i $INICONFIG
sed  's/^\(SQLHost\s*= \).*$/\1'"$SQL_HOST"'/' -i $INICONFIG
sed  's/^\(SQLServer\s*= \).*$/\1'"$DB_NAME"'/' -i $INICONFIG
sed  's/^\(Username\s*= \).*$/\1'"$DB_USERNAME"'/' -i $INICONFIG
sed  's/^\(Password\s*= \).*$/\1'"$DB_PASSWORD"'/' -i $INICONFIG
sed  's/^\(IncomingCompression\s*= \).*$/\1'"$INCOMING_COMPRESSION"'/' -i $INICONFIG
sed  's/^\(FileNameSyntax\s*= \).*$/\1'"$FILE_NAME_SYNTAX"'/' -i $INICONFIG



if [ -n "$SQL_HOST" ]; then
 mkdir -p ./data/incoming
fi

/opt/conquest/dgate -v
