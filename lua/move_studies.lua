src = os.getenv('AE_TITLE')
dest = os.getenv('DEST_AE_TITLE')


std = newdicomobject()
std.QueryRetrieveLevel = 'PATIENT'
std.PatientID = os.getenv('PATIENT_ID')
std.Modality = os.getenv('MODALITY')

dicommove(src, dest, std)
