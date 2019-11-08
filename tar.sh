#!/bin/bash

#Script to automate creating a tar archive from the shared samba server

python3 path/to/begin_tar.py #Email that the tar process has started

tar -cf ~/upload.tar path/to/samba/share #Archive the samba directory to a tar file

python3 ~/end_tar.py #Email that the tar process has ended

touch ~/complete
