//Silvy Uni Item onAcquire.  
//Wynna April 2015


#include "acr_items_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_db_persist_i"
#include "acr_quest_i"


void main()
{	object oTaker = GetModuleItemAcquiredBy();
	object oItem = GetModuleItemAcquired();
	
	if((ACR_RetrieveQuestState("slv_deandragon_u", oTaker) == 4) && ((GetIsPC(oTaker)) || (GetIsDMPossessed(oTaker))))
        {SendMessageToPC(oTaker, "You have acquired a necklace of twisted white hair, woven through the totem of a Sky Pony pegasus carved in bone.");
		 ACR_AddPersistentJournalQuestEntry("slv_deandragon_u", 5, oTaker);
		 object oFlit = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_flit", GetLocation(oTaker));	 
	     AssignCommand(oFlit, ActionSpeakString("*A little bat drops from the rafters, opens its beaky mouth and...speaks.*  'The keyword is: 'Undergrads'", TALKVOLUME_TALK)); 
	     DestroyObject(oFlit, 5.0);
	   }
					

}			  