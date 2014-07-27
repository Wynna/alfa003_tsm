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

// Proctor conversation local variables driving conditionals

	if(((GetTag(oProfessor) == "003_cr_slv_procabj") ||(GetTag(oProfessor) == "003_cr_slv_studabj") ||(GetTag(oProfessor) == "003_cr_slv_incinder")) && ((FindSubString(GetCampaignString("SLV_UNI", "Advanced AbjurationInfo", oStudent), "Register") != -1) && (GetCampaignString("SLV_UNI", "Advanced Abjuration", oStudent) != "Advanced Abjuration")))
		{return TRUE; } 
	else if(((GetTag(oProfessor) == "003_cr_slv_proccon") ||(GetTag(oProfessor) == "003_cr_slv_scribe") ||(GetTag(oProfessor) == "003_cr_slv_celestwolf")) && ((FindSubString(GetCampaignString("SLV_UNI", "Advanced ConjurationInfo", oStudent), "Register") != -1)&& (GetCampaignString("SLV_UNI", "Advanced Conjuration", oStudent) != "Advanced Conjuration")))
		{return TRUE; }
	else if(((GetTag(oProfessor) == "003_cr_slv_procdiv") ||(GetTag(oProfessor) == "003_cr_slv_studdiv") ||(GetTag(oProfessor) == "003_cr_slv_dean")) && ((FindSubString(GetCampaignString("SLV_UNI", "Advanced DivinationInfo", oStudent), "Register") != -1)&& (GetCampaignString("SLV_UNI", "Advanced Divination", oStudent) != "Advanced Divination")))
		{return TRUE; }
	else if(((GetTag(oProfessor) == "003_cr_slv_procenc") ||(GetTag(oProfessor) == "003_cr_slv_procenc2") ||(GetTag(oProfessor) == "003_cr_slv_enc100giant")) && ((FindSubString(GetCampaignString("SLV_UNI", "Advanced EnchantmentInfo", oStudent), "Register") != -1)&& (GetCampaignString("SLV_UNI", "Advanced Enchantment", oStudent) != "Advanced Enchantment")))
		{return TRUE; }
	else if(((GetTag(oProfessor) == "003_cr_slv_procevo") ||(GetTag(oProfessor) == "003_cr_slv_studevo") ||(GetTag(oProfessor) == "003_cr_slv_registrar")) && ((FindSubString(GetCampaignString("SLV_UNI", "Advanced EvocationInfo", oStudent), "Register") != -1)&& (GetCampaignString("SLV_UNI", "Advanced Evocation", oStudent) != "Advanced Evocation")))
		{return TRUE; }
	else if(((GetTag(oProfessor) == "003_cr_slv_procill") ||(GetTag(oProfessor) == "003_cr_slv_ill100boy") ||(GetTag(oProfessor) == "003_cr_slv_ill100cub")) && ((FindSubString(GetCampaignString("SLV_UNI", "Advanced IllusionInfo", oStudent), "Register") != -1)&& (GetCampaignString("SLV_UNI", "Advanced Illusion", oStudent) != "Advanced Illusion")))
		{return TRUE; }
	else if(((GetTag(oProfessor) == "003_cr_slv_procnec") ||(GetTag(oProfessor) == "003_cr_slv_studnec") ||(GetTag(oProfessor) == "003_cr_slv_nec200zombie")) && ((FindSubString(GetCampaignString("SLV_UNI", "Advanced NecromancyInfo", oStudent), "Register") != -1)&& (GetCampaignString("SLV_UNI", "Advanced Necromancy", oStudent) != "Advanced Necromancy")))
		{return TRUE; }
	else if(((GetTag(oProfessor) == "003_cr_slv_proctra") ||(GetTag(oProfessor) == "003_cr_slv_studtra") ||(GetTag(oProfessor) == "003_cr_slv_belad")) && ((FindSubString(GetCampaignString("SLV_UNI", "Advanced TransmutationInfo", oStudent), "Register") != -1)&& (GetCampaignString("SLV_UNI", "Advanced Transmutation", oStudent) != "Advanced Transmutation")))
		{return TRUE; }
	
	
        
        else
        {return FALSE;}
}