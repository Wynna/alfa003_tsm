//Silvy Uni Item onAcquire.  
//Wynna February 2008


#include "acr_items_i"
#include "acr_quest_i"


void main()
{	object oDropper = GetModuleItemLostBy();
	object oItem = GetModuleItemLost();
	if((GetTag(GetArea(oDropper)) == "5g_ext_silvypass_east_sundabar") && (GetLocalInt(oDropper, "HeatRep") == 1))
			{object oPhoenix = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_mb_phoenix", GetLocation(oItem));
				 DelayCommand(3.0, AssignCommand(oPhoenix, ActionSpeakString("*Streaks down from the sky and lands on the beetle gland, clutching it in one claw and ripping at it with its beak", TALKVOLUME_TALK)));
				 DestroyObject(oItem, 5.0);
				 DelayCommand(7.0, AssignCommand(oPhoenix, ActionAttack(oDropper, FALSE)));				
				 DelayCommand(7.5, AssignCommand(oPhoenix, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE)));
				 }
			
				

}			  