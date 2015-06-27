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
	
	if((GetTag(oItem) == "slv_deandragon_k_keepsake") && (ACR_RetrieveQuestState("slv_deandragon_k", oTaker) == 5) && ((GetIsPC(oTaker)) || (GetIsDMPossessed(oTaker))))
        {SendMessageToPC(oTaker, "You have acquired a rock.");
		 DelayCommand(7.0, SendMessageToPC(oTaker, "Written on the inside of the box is the word: 'Kossoth'."));
		 ACR_AddPersistentJournalQuestEntry("slv_deandragon_k", 6, oTaker);
		 if(GetTag(oBox) == "slv_deandragon_lockbox_plc")
		 	{DestroyObject(oBox);
			}
		 
	   }
					

}			  