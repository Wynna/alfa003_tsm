#include "silvy_univ_inc"
#include "silvy_univ_func"

 


void main()
{
    object oItem = OBJECT_SELF;
    object oUser = GetItemActivator();
    object oStudent = oUser;
    string sSchool = GetLocalString(oStudent, "sSchool");
	object oTrig = GetLocalObject(oStudent, "LastTrig");
	int nSchool = GetSilvyUniversitySchool(oTrig);
	string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
    int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
    string sLevel = IntToString(nLevel);
    effect eShimmer = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE, FALSE);
    effect eGlimmer = EffectVisualEffect(VFX_DUR_PIXIEDUST, FALSE);
    
   //Elementary Divination 
 
    string sTag = GetTag(OBJECT_SELF);
	
	GiveXPToCreature(oUser, 5000);
   
       
}