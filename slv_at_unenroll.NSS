//
// Enrolls a student in the University
//
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_db_persist_i"

void main()
{
   object oStudent;
   if((GetIsObjectValid(GetLocalObject(OBJECT_SELF, "oRodScribe"))) && ((GetIsDM(OBJECT_SELF)) || (GetIsDMPossessed(OBJECT_SELF)) ))

    {oStudent = GetLocalObject(OBJECT_SELF, "oStudent");
    }
	else if ((GetTag(OBJECT_SELF) == "003_cr_slv_registrar") || (GetTag(OBJECT_SELF) == "003_cr_slv_recordsclerk"))  
    {oStudent = GetPCSpeaker();
    }
    SetCampaignInt("SLV_UNI", SilvyUniversityEnrolledVarName,
       0, oStudent);
}