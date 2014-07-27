//OnUse for all Dean's Exam (deandragon) placeables 
//Wynna February 2009


#include "acr_placeable_i"
#include "acr_xp_i"
#include "acr_quest_i"
#include "acr_spawn_i"






void main()
{
	ACR_PlaceableOnOpen();

	
	//deandragon_d dragon berry harvesting
	if((GetTag(OBJECT_SELF) == "deandragon_d_dragonberry1") || (GetTag(OBJECT_SELF) == "deandragon_d_dragonberry2")|| (GetTag(OBJECT_SELF) == "deandragon_d_dragonberry3"))
	   {object oQuester = GetLocalObject(OBJECT_SELF, "oQuester");
		if(oQuester == OBJECT_INVALID)
			{oQuester = GetLastOpenedBy();}
		object oKnife = GetItemPossessedBy(oQuester, "003_it_wpn_dragontalon");
		
		if((oKnife == OBJECT_INVALID) && (GetLocalInt(OBJECT_SELF, "Frozen") != 1))
			{SendMessageToPC(oQuester, "The delicate clusters of fruit have thick, fibrous stems. While attempting to snap some free, they bruise, the rich red juice dripping like blood onto the ground.  The berries drain to nothing but empty, withered skin. You will need something exceptionally sharp to cut these stems without bruising the next bunch of fruit...whenever that ripens.");
			 DestroyInventory(OBJECT_SELF);
			 DestroyObject(OBJECT_SELF);
			 }
		if((oKnife == OBJECT_INVALID) && (GetLocalInt(OBJECT_SELF, "Frozen") == 1))
			{SendMessageToPC(oQuester, "The frozen clusters of fruit have thick, fibrous stems. While attempting to snap some free, the warmth from your hand thaws the berries and they bruise. Rich red juice drips onto the ground. The berries drain to nothing but empty, withered skin. You will need something exceptionally sharp to cut these stems without bruising the next bunch of fruit...whenever that ripens.");
			 DestroyInventory(OBJECT_SELF);
			 DestroyObject(OBJECT_SELF);
			 }	
		if((oKnife != OBJECT_INVALID) && (GetLocalInt(OBJECT_SELF, "Frozen") != 1)&& (GetLocalInt(oQuester, "BlessedWeapon") == 1))
			{SendMessageToPC(oQuester, "You use a surgically sharp knife to slice the delicate clusters of fruit from the bush, but the fruit is so delicate that the pressure of your hand bruises it.  For a moment they seem fine, but the instant the blessed blade is no longer in contact with the stem, the berries drain to nothing but empty, withered skin, clearly useless. Frozen berries would not have been so delicate.");
			 DestroyInventory(OBJECT_SELF);
			 DestroyObject(OBJECT_SELF);
			 }	
		if((oKnife != OBJECT_INVALID) && (GetLocalInt(OBJECT_SELF, "Frozen") != 1)&& (GetLocalInt(oQuester, "BlessedWeapon") != 1))
			{SendMessageToPC(oQuester, "You use a surgically sharp knife to slice the delicate clusters of fruit from the bush, but the fruit is so delicate that the pressure of your hand bruises it.  The berries drain to nothing but empty, withered skin, clearly useless. Frozen berries would not have been so delicate.");
			 DestroyInventory(OBJECT_SELF);
			 DestroyObject(OBJECT_SELF);
			 }	
		if((oKnife != OBJECT_INVALID) && (GetLocalInt(OBJECT_SELF, "Frozen") == 1)&& (GetLocalInt(oQuester, "BlessedWeapon") != 1))
			{SendMessageToPC(oQuester, "You use a surgically sharp knife to slice the frozen clusters of fruit from the bush, but the fruit is so delicate that the warmth of your hand melts away the frost and bruises the berries.  They drain to nothing but empty, withered skin, clearly useless.");
			 DestroyInventory(OBJECT_SELF);
			 DestroyObject(OBJECT_SELF);
			 }	
		if((oKnife != OBJECT_INVALID) && (GetLocalInt(OBJECT_SELF, "Frozen") == 1) && (GetLocalInt(oQuester, "BlessedWeapon") == 1))
			{SendMessageToPC(oQuester, "You use a surgically sharp, blessed knife to slice the frozen clusters of fruit from the bush. The berries actually seem to plump up beneath the frost at the touch of the blade.");
			 object oBerries = CreateItemOnObject("003_it_food_dragonberry", OBJECT_SELF, 2);
			 SetLocalObject(oQuester, GetTag(OBJECT_SELF) + "_berries", oBerries);
			 }
		SetUseableFlag(OBJECT_SELF, FALSE);
		}
		
//deandragon_e_fire trap disabling and container unlocking
	if(GetTag(OBJECT_SELF) == "slv_deandragon_e_firetrap") 
		   {SendMessageToPC(GetLastOpenedBy(), "A mephit darts out of the jaws of the fire trap!");
		    CreateObject(OBJECT_TYPE_CREATURE, "003_cr_mephit_fire", GetLocation(GetLastOpenedBy()));
			}
}