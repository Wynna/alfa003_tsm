#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "003_silverymoon_i"
#include "acr_quest_i"
#include "acr_placeable_i"

  //Created by Wynna; November 4, 2008


void main()
{
    object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    object oGoTo = GetWaypointByTag("felbar_temp_teleport");
	location lGoTo = GetLocation(oGoTo);
	RemoveSilverymoonWards(oUser );
	 
  //One-time, one-way device to teleport to the teleportation platform of the Master's Hall at the Lady's College
	 if(ACR_RetrieveQuestState("slv_deandragon_e_earth", oUser) == 3)
	 	{if(GetItemPossessedBy(oUser, "slv_deandragon_e_earth_gem") != OBJECT_INVALID)
			{DestroyObject(GetItemPossessedBy(oUser, "slv_deandragon_e_earth_gem"));
			 CreateItemOnObject("abr_it_gem_033b", oUser, 1);
			 ACR_AddPersistentJournalQuestEntry("slv_deandragon_e_earth", 3, oUser, 0, 0, 0, 0);
			 }
		} 
	 if(ACR_RetrieveQuestState("slv_deandragon_e_air", oUser) == 3)
	 	{if(GetItemPossessedBy(oUser, "slv_deandragon_e_air_gem") != OBJECT_INVALID)
			{DestroyObject(GetItemPossessedBy(oUser, "slv_deandragon_e_air_gem"));
			 CreateItemOnObject("abr_it_gem_086b", oUser, 1);
			 ACR_AddPersistentJournalQuestEntry("slv_deandragon_e_air", 3, oUser, 0, 0, 0, 0);
			 }
		} 
	if(ACR_RetrieveQuestState("slv_deandragon_e_fire", oUser) == 3)
	 	{if(GetItemPossessedBy(oUser, "slv_deandragon_e_fire_gem") != OBJECT_INVALID)
			{DestroyObject(GetItemPossessedBy(oUser, "slv_deandragon_e_fire_gem"));
			 CreateItemOnObject("abr_it_gem_010b", oUser, 1);
			 ACR_AddPersistentJournalQuestEntry("slv_deandragon_e_fire", 3, oUser, 0, 0, 0, 0);
			 }
		} 
	if(ACR_RetrieveQuestState("slv_deandragon_e_water", oUser) == 3)
	 	{if(GetItemPossessedBy(oUser, "slv_deandragon_e_water_gem") != OBJECT_INVALID)
			{DestroyObject(GetItemPossessedBy(oUser, "slv_deandragon_e_water_gem"));
			 CreateItemOnObject("abr_it_gem_080", oUser, 1);
			 ACR_AddPersistentJournalQuestEntry("slv_deandragon_e_water", 3, oUser, 0, 0, 0, 0);
			 }
		} 
	SetLocalInt(GetEnteringObject(), "Landed", 0);
	 AssignCommand(oUser, ActionJumpToLocation(lGoTo));
	 DelayCommand(10.0, DestroyObject(oItem));
	
	 
}