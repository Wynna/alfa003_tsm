#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "silvy_univ_inc"

void main ()
{


object oStudent = GetPCSpeaker();
struct SilvyUniversityCourseInfo sInfo;
    

SetCampaignString("SLV_UNI", "Elementary AbjurationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Elementary ConjurationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Elementary DivinationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Elementary EnchantmentInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Elementary EvocationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Elementary IllusionInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Elementary NecromancyInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Elementary TransmutationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);

SetCampaignString("SLV_UNI", "Elementary Abjuration", "Elementary Abjuration", oStudent);
SetCampaignString("SLV_UNI", "Elementary Conjuration", "Elementary Conjuration", oStudent);
SetCampaignString("SLV_UNI", "Elementary Divination", "Elementary Divination", oStudent);
SetCampaignString("SLV_UNI", "Elementary Enchantment", "Elementary Enchantment", oStudent);
SetCampaignString("SLV_UNI", "Elementary Evocation", "Elementary Evocation", oStudent);
SetCampaignString("SLV_UNI", "Elementary Illusion", "Elementary Illusion", oStudent);
SetCampaignString("SLV_UNI", "Elementary Necromancy", "Elementary Necromancy", oStudent);
SetCampaignString("SLV_UNI", "Elementary Transmutation", "Elementary Transmutation", oStudent);

SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration);
sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, OBJECT_SELF);
RegisterSilvyUniversityStudent(oStudent, sInfo);
sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, OBJECT_SELF);
AdvanceSilvyUniversityStudent(oStudent, sInfo);
SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration);
sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, OBJECT_SELF);
RegisterSilvyUniversityStudent(oStudent, sInfo);
sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, OBJECT_SELF);
AdvanceSilvyUniversityStudent(oStudent, sInfo);
SetSilvyUniversitySchool(SilvyUniversitySchoolDivination);
sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, OBJECT_SELF);
RegisterSilvyUniversityStudent(oStudent, sInfo);
sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, OBJECT_SELF);
AdvanceSilvyUniversityStudent(oStudent, sInfo);
SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment);
sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, OBJECT_SELF);
RegisterSilvyUniversityStudent(oStudent, sInfo);
sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, OBJECT_SELF);
AdvanceSilvyUniversityStudent(oStudent, sInfo);
SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation);
sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, OBJECT_SELF);
RegisterSilvyUniversityStudent(oStudent, sInfo);
sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, OBJECT_SELF);
AdvanceSilvyUniversityStudent(oStudent, sInfo);
SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion);
sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, OBJECT_SELF);
RegisterSilvyUniversityStudent(oStudent, sInfo);
sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, OBJECT_SELF);
AdvanceSilvyUniversityStudent(oStudent, sInfo);
SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy);
sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, OBJECT_SELF);
sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, OBJECT_SELF);
RegisterSilvyUniversityStudent(oStudent, sInfo);
AdvanceSilvyUniversityStudent(oStudent, sInfo);
SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation);
sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, OBJECT_SELF);
RegisterSilvyUniversityStudent(oStudent, sInfo);
sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, OBJECT_SELF);
AdvanceSilvyUniversityStudent(oStudent, sInfo);
       
   		     
DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_credit_100"));
}