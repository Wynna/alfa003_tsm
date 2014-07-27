//Vault of Sages Trigger OnExit. All triggers.
//Wynna March 2008


#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"

void main()
{	
	ACR_TriggerOnExit();
	object oPC = GetExitingObject();
	object oBench1 = GetNearestObjectByTag("pat_mid_bench06", OBJECT_SELF, 1);
	object oBench2 = GetNearestObjectByTag("pat_mid_bench06", OBJECT_SELF, 1);
	
		SetUseableFlag(oBench1, FALSE);
		SetUseableFlag(oBench2, FALSE);
		
	
}