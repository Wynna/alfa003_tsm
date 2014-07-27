//Silvy Uni Item onAcquire.  
//Wynna February 2008


#include "acr_items_i"
#include "acr_quest_i"


void main()
{	object oDropper = GetModuleItemLostBy();
	object oItem = GetModuleItemLost();
	if((GetTag(GetArea(oDropper)) == "5g_ext_silvypass_east_sundabar") && (GetLocalInt(oDropper, "HeatRep") == 1))
			{object oPhoenix = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_mb_phoenix", GetLocation(oItem));
				 DelayCommand(1.0, AssignCommand(oPhoenix, ActionSpeakString("*Streaks down from the sky and lands on the beetle gland, clutching it in one claw and ripping at it with its beak", TALKVOLUME_TALK)));
				 DestroyObject(oItem, 2.0);
				 DelayCommand(5.0, AssignCommand(oPhoenix, ActionAttack(oDropper, FALSE)));				
		}
			
				

}			  