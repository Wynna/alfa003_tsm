//OnUse for all Dean's Exam (deandragon) placeables 
//Wynna February 2009


#include "acr_placeable_i"
#include "acr_xp_i"
#include "acr_quest_i"
#include "acr_i"

void main()
{
	ACR_PlaceableOnPhysicalAttacked();

	object oAttacker = GetLastAttacker();
	//Deandragon E shovel
		 	
	 if(GetTag(OBJECT_SELF) == "slv_deandragon_shovel_plc") 
	    {SendMessageToPC(oAttacker, "You pick up the tool.");
		object oShovelItem = CreateItemOnObject("slv_deandragon_shovel", oAttacker, 1);
		DestroyObject(OBJECT_SELF);
		return;
		}
					
				
	
}