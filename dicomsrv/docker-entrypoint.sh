#!/usr/bin/env bash

sqlhost=$SQL_CONTAINER_NAME
sqlserver=$DB_NAME
username=$DB_USERNAME
password=$DB_PASSWORD

echo "
[sscscp]
MicroPACS                = sscscp

# Network configuration: server name and TCP/IP port#
MyACRNema                = CONQUESTSRV1
TCPPort                  = 5678

# Host for postgres or mysql only, name, username and password for database
SQLHost                  = $sqlhost
SQLServer                = $sqlserver
Username                 = $username
Password                 = $password
PostGres                 = 1
MySQL                    = 0
SQLite                   = 0
DoubleBackSlashToDB      = 1
UseEscapeStringConstants = 1

# Configure server
ImportExportDragAndDrop  = 1
ZipTime                  = 05:
UIDPrefix                = 99999.99999
EnableComputedFields     = 1

FileNameSyntax           = 4

# Configuration of compression for incoming images and archival
DroppedFileCompression   = un
IncomingCompression      = un
ArchiveCompression       = as

# For debug information
PACSName                 = CONQUESTSRV1
OperatorConsole          = 127.0.0.1
DebugLevel               = 0

# Configuration of disk(s) to store images
MAGDeviceFullThreshold   = 30
MAGDevices               = 1
MAGDevice0               = ./data/" > ./dicom.ini

/opt/conquest/dgate -v
