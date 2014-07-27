#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "silvy_univ_inc"

void main ()
{


object oStudent = GetPCSpeaker();
struct SilvyUniversityCourseInfo sInfo;

SetCampaignString("SLV_UNI", "Advanced AbjurationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Advanced ConjurationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Advanced DivinationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Advanced EnchantmentInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Advanced EvocationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Advanced IllusionInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Advanced NecromancyInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Advanced TransmutationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);

SetCampaignString("SLV_UNI", "Advanced Abjuration", "Advanced Abjuration", oStudent);
SetCampaignString("SLV_UNI", "Advanced Conjuration", "Advanced Conjuration", oStudent);
SetCampaignString("SLV_UNI", "Advanced Divination", "Advanced Divination", oStudent);
SetCampaignString("SLV_UNI", "Advanced Enchantment", "Advanced Enchantment", oStudent);
SetCampaignString("SLV_UNI", "Advanced Evocation", "Advanced Evocation", oStudent);
SetCampaignString("SLV_UNI", "Advanced Illusion", "Advanced Illusion", oStudent);
SetCampaignString("SLV_UNI", "Advanced Necromancy", "Advanced Necromancy", oStudent);
SetCampaignString("SLV_UNI", "Advanced Transmutation", "Advanced Transmutation", oStudent);

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
       

DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_credit_300"));
}