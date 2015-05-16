//OnDeath for circus creatures 
//Wynna May 2015


#include "acr_creature_i"

void main()
{
	location lKilled = GetLocalLocation(OBJECT_SELF, "lKilled");
	string sRealResRef = GetLocalString(OBJECT_SELF, "menagerie_real_resref");
    string sRealDescript = GetLocalString(OBJECT_SELF, "menagerie_real_animal");
    		 		
	object oKilled = CreateObject(OBJECT_TYPE_CREATURE, sRealResRef, lKilled);
	effect eKill = EffectDeath(FALSE, TRUE, TRUE, TRUE);
	AssignCommand(oKilled, ActionSpeakString("In death, the illusion on this creature is revealed.", TALKVOLUME_TALK));
	AssignCommand(oKilled, ActionSpeakString(sRealDescript, TALKVOLUME_TALK));
	DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eKill, oKilled));
	
	 
		     
}