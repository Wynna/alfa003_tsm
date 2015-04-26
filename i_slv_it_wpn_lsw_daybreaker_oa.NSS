//Silvy Uni Item onAcquire.  
//Wynna February 2008


#include "acr_items_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_db_persist_i"
#include "acr_quest_i"


void main()
{	object oTaker = GetModuleItemAcquiredBy();
	object oItem = GetModuleItemAcquired();
	object oBox = GetModuleItemLostBy();
	object oArea = GetArea(oTaker);
	
	if((GetTag(oItem) == "slv_it_wpn_lsw_daybreaker") && (ACR_RetrieveQuestState("slv_deandragon_m", oTaker) == 2) && ((GetIsPC(oTaker)) || (GetIsDMPossessed(oTaker))))
        {SendMessageToPC(oTaker, "The moment you lay a hand on this blackened hunk of metal, a warmth spreads up your arm and seems to go straight to your heart.");
		 DelayCommand(4.0, SendMessageToPC(oTaker, "A tickle in your mind becomes a word. 'Daybreaker'."));
		 DelayCommand(4.0, ACR_AddPersistentJournalQuestEntry("slv_deandragon_m", 3, oTaker));
		 
	   }
					

}			  