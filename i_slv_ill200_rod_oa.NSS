//Silvy Uni Item onAcquire.  
//Wynna February 2008
 

#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_items_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_db_persist_i"
#include "acr_quest_i"

void main()
{	
	object oStudent;
	object oGiver;
    object oMod = GetModule();

	object oItem;
 

    if(GetTag(GetModuleItemAcquired()) == "slv_ill200_rod")
        {oStudent = GetItemPossessor(GetObjectByTag("slv_ill200_rod", 0));
         oItem = GetObjectByTag("slv_ill200_rod");
         }

 
     string sItem = GetName(oItem);
 	
//Standard Illusion:
          
             if(GetTag(GetModuleItemAcquired()) == "slv_ill200_rod")
                    {if(ACR_RetrieveQuestState("slv_ill200", oStudent) == 1)
								{ACR_AddPersistentJournalQuestEntry("slv_ill200", 2, oStudent, 0, 0, 0, 0);
								}
					}
					

}			  