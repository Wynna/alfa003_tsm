//Felbarr Trigger OnEnter. All triggers.
//Wynna April 2009



#include "acr_trigger_i"
#include "acr_spawn_i"


void main()
{	
	ACR_TriggerOnEnter();
	object oPC = GetEnteringObject();
    object oMod = GetModule();
	

//Raven speaks

if((GetTag(OBJECT_SELF) == "felbarr_raven") && (GetIsPC(oPC)))
	{
	object oRaven = GetLocalObject(OBJECT_SELF, "Raven");
	
	if (oRaven == OBJECT_INVALID)
		{oRaven = GetObjectByTag("003_cr_npc_fel_raven");
		 SetLocalObject(OBJECT_SELF, "oRaven", oRaven);
		 }
	string sRaven;
	int nRandom = Random(10);
	if((nRandom < 6) && (GetRacialType(oPC) == RACIAL_TYPE_HALFLING))
		{sRaven = "Calass. Calass! *Rawk!*";}
	if((nRandom < 6) && (GetRacialType(oPC) == RACIAL_TYPE_HALFORC))
		{sRaven = "Sargh! Sargh! *Rawk!*";}
	if(nRandom > 6)
		{sRaven = "Papers please! *Rawk!* Papers please!";}
	if(nRandom > 7)
		{sRaven = "*Rawk!* No admittance. No admittance!";}
	if(nRandom > 8)
		{sRaven = "Axes high!";}
		
	
	AssignCommand(oRaven, ActionSpeakString(sRaven, TALKVOLUME_TALK));
	}	

		
}