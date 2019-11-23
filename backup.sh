#!/bin/bash

#Script to automate creating a backup from the shared samba server, encrypt the backup, and upload to AWS

TAR=/path/to/$(date +%Y%m%d).tar
GPG=/path/to/$(date +%Y%m%d).tar.gpg

if [ -f ~/complete ] #Check to see if the tar process is complete. The tar process creates this file in the home directory when complete
then

	python3 path/to/begin_gpg.py #Email that the GPG encryption process has begun

	gpg -r recipient@email.com -e $TAR #Encrypt the new tar

	python3 path/to/end_gpg.py #Email that the GPG encryption is complete

	python3 path/to/begin_upload.py #Email that the upload to AWS has begun

	aws s3 cp $GPG s3://bucket #Upload the encrypted tar to AWS

	python3 path/to/end_upload.py #Email that the upload has completed

	python3 path/to/begin_delete.py #Email that the clean-up process has begun

	rm $TAR #Remove the unencrypted tar

	rm $GPG #Remove the encrypted tar

	rm ~/complete #Remove the flag file

	python3 path/to/end_delete.py #Email that the clean-up process has completed

fi
