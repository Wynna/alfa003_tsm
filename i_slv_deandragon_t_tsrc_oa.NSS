//Silvy Uni Item onAcquire.  
//Wynna February 2008


#include "acr_items_i"

#include "acr_quest_i"


void main()
{	object oTaker = GetModuleItemAcquiredBy();
	object oItem = GetModuleItemAcquired();
	object oBox = GetModuleItemLostBy();
	object oArea = GetArea(oTaker);
	
	if((GetTag(oItem) == "slv_deandragon_t_tsrc") && (ACR_RetrieveQuestState("slv_deandragon_t", oTaker) == 1) && ((GetIsPC(oTaker)) || (GetIsDMPossessed(oTaker))))
        {ACR_AddPersistentJournalQuestEntry("slv_deandragon_t", 2, oTaker);
		 
	   }
					

}			  