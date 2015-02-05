//Silvy Uni Item onAcquire.  
//Wynna February 2008


#include "acr_items_i"
#include "acr_quest_i"


void main()
{	object oTaker = GetModuleItemAcquiredBy();
	object oItem = GetModuleItemAcquired();
	 if(ACR_RetrieveQuestState("slv_deandragon_q", oTaker) == 3)
				{ACR_AddPersistentJournalQuestEntry("slv_deandragon_q", 4, oTaker);
				}
			
				

}			  