//Wynna February 2008


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
	
	location lReceiver = GetLocation(oReceiver);
	vector vReceiver = GetPositionFromLocation(lReceiver);
	vector vGem = Vector(vReceiver.x, vReceiver.y, vReceiver.z + 3.0);
	location lGem = Location(GetArea(oReceiver), vGem, 0.0); 
	object oGemPLC = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_deandragon_x_gem_plc", lGem);
    DestroyObject(oItem);
		
			 

	}