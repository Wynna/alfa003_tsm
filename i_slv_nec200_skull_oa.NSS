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
	object oGiver;
 	object oItem;
 

 	if(GetTag(GetModuleItemAcquired()) == "slv_nec200_skull")
        {oStudent = GetItemPossessor(GetObjectByTag("slv_nec200_skull"));
         oItem = GetObjectByTag("slv_nec200_skull");
         }
		 
 string sItem = GetName(oItem);
 	
	//Standard Necromancy
				if((GetTag(GetModuleItemAcquired()) == "slv_nec200_skull") && (GetTag(GetArea(oStudent)) == "6d_int_silvy_ladycol_class_lvl"))
                    {SendMessageToPC(oStudent, "As you pick up the skull, you see a very fine inscription engraved into the browbone that reads: 'Property of College of Necromancy. Please return to Mistress Ostelle.'");
                    SetCampaignString("SLV_UNI", "Standard Necromancy", "Standard Necromancy", oStudent);
                    DelayCommand(5.0, ACR_AddPersistentJournalQuestEntry("slv_nec200", 2, oStudent, 0, 0, 0, 0));
		     		}
					

}			  