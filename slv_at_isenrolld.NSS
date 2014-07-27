//::///////////////////////////////////////////////
//:: FileName slv_at_isenrolld
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/3/2005 9:15:33 PM
//:://////////////////////////////////////////////
#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{

    // Inspect local variables
    object oStudent = GetLocalObject(OBJECT_SELF, "oStudent");
 	if((GetTag(OBJECT_SELF) == "003_cr_slv_registrar") || (GetTag(OBJECT_SELF) == "003_cr_slv_recordsclerk")|| (GetTag(OBJECT_SELF) == "003_cr_slv_scribe"))
   		{oStudent = GetPCSpeaker();
		}
	
	if(IsStudentEnrolledInSilvyUniversity(oStudent))

    return TRUE;

    else
    return FALSE;
}