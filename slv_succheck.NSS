//::///////////////////////////////////////////////
//:: FileName slv_success
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 3/30/2004 3:49:29 PM
//:://////////////////////////////////////////////
#include "silvy_univ_inc"
#include "acr_db_persist_i"
#include "silvy_univ_func"

int StartingConditional()
{
 
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    int nSchool = GetSilvyUniversitySchool(oProfessor);
    string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
    string sSuccess = GetCampaignString("SLV_UNI", sCurrentCourse, oStudent);

    // Inspect local variables

    if(sCurrentCourse == sSuccess)

        {return TRUE; }
        else
        {return FALSE;}
}