### Image build Environments
**DBMS:** используемая СУБД
- mariadb
- postgres
- sqlite
- precompiled
- dbase

### Container Environments

**AE_TITLE:**
**SQL_HOST:**
**DB_NAME:**
**DB_USERNAME:**
**DB_PASSWORD:**
**INCOMING_COMPRESSION:**
- un - uncompressed
- j1,j2=lossless jpeg
- j3..j6=lossy jpeg
- n1..n4=nki private
- jk=lossless jpeg2000
- jl=lossy jpeg2000

**FILE_NAME_SYNTAX:**
- 0 (original):
filename = ID[8]_Name[8]\Series#_Image#_Time.v2
- 1 (safer version of original):
filename = ID[8]_Name[8]\Series#_Image#_TimeCounter.v2
- 2 (include series UID in filename to ensure names sort by series):
filename = ID[8]_Name[8]\Seriesuid_Series#_Image#_TimeCounter.v2
- 3 (Uses patient ID as directory name and sets DICOM-RT required flags):
filename = ID[16]\Seriesuid_Series#_Image#_TimeCounter.v2
- 4 (same as 3, but data is stored in chapter 10 format):
filename = ID[16]\Seriesuid_Series#_Image#_TimeCounter.dcm
- 5 (sets DICOM-RT required flags, uses untruncated patient name as directory):
filename = Name\Seriesuid_Series#_Image#_TimeCounter.v2
- 6 (standard DICOM directory structure starting at patient root):
filename = ID[32]\Studyuid\Seriesuid\Imageuid.v2
- 7 (standard DICOM directory structure starting at study root):
filename = Studyuid\Seriesuid\Imageuid.v2
- 8 (standard patient root DICOM directory structure in chapter 10 format):
filename = ID[32]\Studyuid\Seriesuid\Imageuid.dcm
- 9 (standard study root DICOM directory structure in chapter 10 format):
filename = Studyuid\Seriesuid\Imageuid.dcm
- 10(all files in one directory)
filename = Images\Imageuid.dcm
- 11(patient name as directory, UIDS as subdirectories)
filename = Name\StudyUID\SeriesUID\Imageuid.dcm
- 12(patient name_id as directory, modality_studyid\series\sop.dcm)
filename = Name_ID\Modality_StudyID\ SeriesID\Imageuid.dcm


#### Rebuild базы, при первом запуске
docker exec -ti dicomsrv ./dgate -v -r
