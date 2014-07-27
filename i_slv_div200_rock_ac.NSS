#include "silvy_univ_inc"
#include "silvy_univ_func"

 


void main()
{
    object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    object oStudent = oUser;
    string sSchool = GetLocalString(oStudent, "sSchool");
	object oTrig = GetLocalObject(oStudent, "LastTrig");
	int nSchool = GetSilvyUniversitySchool(oTrig);
	string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
    int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
    string sLevel = IntToString(nLevel);
    effect eFlint = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL);
                
   //Standard Divination 
 
    
         if ((GetTag(oItem) == "slv_div200_rock") && (GetTag(GetItemActivatedTarget()) == "slv_div200_target"))

             {if(GetHasSpellEffect(SPELL_TRUE_STRIKE, oStudent))
                {SendMessageToPC(oStudent, "The chunk of flint flies true and strikes the steel at the heart of the target!");
                ApplyEffectToObject( DURATION_TYPE_INSTANT, eFlint, GetItemActivatedTarget(), 0.0);
                object oTarget = GetItemActivatedTarget();
				}
                  
              else
                {SendMessageToPC(oStudent, "The missile fails to hit dead center.");
                }
			}
              
            
}