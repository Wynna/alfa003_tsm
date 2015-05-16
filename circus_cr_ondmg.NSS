//OnDeath for circus creatures 
//Wynna May 2015


#include "acr_creature_i"

void main()
{
	string sRealResRef = GetLocalString(OBJECT_SELF, "menagerie_real_resref");
    string sRealDescript = GetLocalString(OBJECT_SELF, "menagerie_real_animal");
    int nDamage=GetMaxHitPoints(OBJECT_SELF)-GetCurrentHitPoints(OBJECT_SELF);		 		
	object oHurt = CreateObject(OBJECT_TYPE_CREATURE, sRealResRef, GetLocation(OBJECT_SELF));
	effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_NORMAL, TRUE);
	AssignCommand(oHurt, ActionSpeakString("The illusion on this creature is revealed.", TALKVOLUME_TALK));
	AssignCommand(oHurt, ActionSpeakString(sRealDescript, TALKVOLUME_TALK));
	DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDamage, oHurt));
	DestroyObject(OBJECT_SELF, 2.0);
	
	 
		     
}