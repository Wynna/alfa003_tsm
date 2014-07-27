//Silvy Uni Item onAcquire.  
//Wynna February 2008
 

#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_items_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_db_persist_i"


void main()
{	
	object oStudent;
	object oItem;
 

    if(GetTag(GetModuleItemAcquired()) == "slv_div200_shard")
        {oStudent = GetItemPossessor(GetObjectByTag("slv_div200_shard", 0));
         oItem = GetObjectByTag("slv_div200_shard");
         }

 
     string sItem = GetName(oItem);
 	
//Standard Divination:
          
             if(GetTag(GetModuleItemAcquired()) == "slv_div200_shard")
                    {FloatingTextStringOnCreature("The shard of obsidian feels warm to your touch. In tiny, black reflection, you seem to see Master Clarvue's smiling face briefly, before it fades.", oStudent, FALSE);
                     SetCampaignString("SLV_UNI", "Standard Divination", "Standard Divination", oStudent);
                     }
					

}			  