#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "silvy_univ_inc"
#include "acr_quest_i"

void main ()
{

object oStudent = GetPCSpeaker();
struct SilvyUniversityCourseInfo sInfo;

SetCampaignString("SLV_UNI", "Senior AbjurationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Senior ConjurationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Senior DivinationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Senior EnchantmentInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Senior EvocationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Senior IllusionInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Senior NecromancyInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);
SetCampaignString("SLV_UNI", "Senior TransmutationInfo", "Group advanced by " + GetName(OBJECT_SELF), oStudent);

SetCampaignString("SLV_UNI", "Senior Abjuration", "Senior Abjuration", oStudent);
SetCampaignString("SLV_UNI", "Senior Conjuration", "Senior Conjuration", oStudent);
SetCampaignString("SLV_UNI", "Senior Divination", "Senior Divination", oStudent);
SetCampaignString("SLV_UNI", "Senior Enchantment", "Senior Enchantment", oStudent);
SetCampaignString("SLV_UNI", "Senior Evocation", "Senior Evocation", oStudent);
SetCampaignString("SLV_UNI", "Senior Illusion", "Senior Illusion", oStudent);
SetCampaignString("SLV_UNI", "Senior Necromancy", "Senior Necromancy", oStudent);
SetCampaignString("SLV_UNI", "Senior Transmutation", "Senior Transmutation", oStudent);

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
       
ACR_AddPersistentJournalQuestEntry("slv_abj200", 3, oStudent, FALSE, FALSE, FALSE, 0);
DelayCommand(2.0, ACR_AddPersistentJournalQuestEntry("slv_con200", 3, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(4.0, ACR_AddPersistentJournalQuestEntry("slv_div200", 3, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(6.0, ACR_AddPersistentJournalQuestEntry("slv_enc200", 3, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(8.0, ACR_AddPersistentJournalQuestEntry("slv_evo200", 3, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(10.0, ACR_AddPersistentJournalQuestEntry("slv_ill200", 3, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(12.0, ACR_AddPersistentJournalQuestEntry("slv_nec200", 3, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(14.0, ACR_AddPersistentJournalQuestEntry("slv_tra200", 3, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(16.0, ACR_AddPersistentJournalQuestEntry("slv_abj300", 4, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(18.0, ACR_AddPersistentJournalQuestEntry("slv_con300", 4, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(20.0, ACR_AddPersistentJournalQuestEntry("slv_div300", 4, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(22.0, ACR_AddPersistentJournalQuestEntry("slv_enc300", 4, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(24.0, ACR_AddPersistentJournalQuestEntry("slv_evo300", 4, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(26.0, ACR_AddPersistentJournalQuestEntry("slv_ill300", 4, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(28.0, ACR_AddPersistentJournalQuestEntry("slv_nec300", 4, oStudent, FALSE, FALSE, FALSE, 0));
DelayCommand(30.0, ACR_AddPersistentJournalQuestEntry("slv_tra300", 4, oStudent, FALSE, FALSE, FALSE, 0));

DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_credit_400"));
}