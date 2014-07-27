//Silvy Uni Item onUnAcquire.  
//Wynna February 2008


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_items_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_db_persist_i"


void main()
{	
	object oStudent = GetModuleItemLostBy();
    object oMod = GetModule();
	object oReceiver = GetModuleItemAcquiredBy();
	object oItem = GetModuleItemLost();
	
	
	object oEmptyPLC = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra100_bucket", GetLocation(oReceiver));
    DestroyObject(oItem);
		
			 

	}
	