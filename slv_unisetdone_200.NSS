#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "silvy_univ_inc"

void main ()
{


object oStudent = GetPCSpeaker();
struct SilvyUniversityCourseInfo sInfo;

SetCampaignString("SLV_UNI", "Standard AbjurationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Standard ConjurationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Standard DivinationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Standard EnchantmentInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Standard EvocationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Standard IllusionInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Standard NecromancyInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Standard TransmutationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);

SetCampaignString("SLV_UNI", "Standard Abjuration", "Standard Abjuration", oStudent);
SetCampaignString("SLV_UNI", "Standard Conjuration", "Standard Conjuration", oStudent);
SetCampaignString("SLV_UNI", "Standard Divination", "Standard Divination", oStudent);
SetCampaignString("SLV_UNI", "Standard Enchantment", "Standard Enchantment", oStudent);
SetCampaignString("SLV_UNI", "Standard Evocation", "Standard Evocation", oStudent);
SetCampaignString("SLV_UNI", "Standard Illusion", "Standard Illusion", oStudent);
SetCampaignString("SLV_UNI", "Standard Necromancy", "Standard Necromancy", oStudent);
SetCampaignString("SLV_UNI", "Standard Transmutation", "Standard Transmutation", oStudent);

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
       
   
DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_credit_200"));
}