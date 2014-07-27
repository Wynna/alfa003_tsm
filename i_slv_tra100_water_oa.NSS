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
    object oMod = GetModule();
	object oShieldPLC = GetLocalObject(OBJECT_SELF, "oShieldPLC");
	effect eSplatDamage = EffectDamage(2, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL);
 object oItem;
 	effect eCut = EffectDamage( 1, DAMAGE_TYPE_SLASHING, DAMAGE_POWER_NORMAL, TRUE);


 	if(GetTag(GetModuleItemAcquired()) == "slv_tra100_empty")
        {oStudent = GetItemPossessor(GetObjectByTag("slv_tra100_empty"));
         oItem = GetObjectByTag("slv_tra100_empty");
         object oGiver = GetModuleItemLostBy();
		 }	 
     string sItem = GetName(oItem);
 	
	//Elementary Transmutation
				if((GetTag(oItem) == "slv_tra100_water") && (GetIsPC(oStudent)))  
					{if(GetHasSpellEffect(SPELL_EXPEDITIOUS_RETREAT, oStudent))
						{SendMessageToPC(oStudent, "Your extra speed might compensate for the rate of evaporation of the water.");
						 }
					  else	
						 {SendMessageToPC(oStudent, "The water evaporates faster with every passing second.");
						  }
					  DelayCommand(4.0, SetLocalInt(oStudent, "Evaporated", 1));
					  DelayCommand(5.0, DestroyObject(oItem));
					}	
						 
				if((GetTag(oItem) == "slv_tra100_water") && (GetTag(oStudent) == "slv_tra100_brazier"))  
					{object oFire1 = GetLocalObject(OBJECT_SELF, "oFire1");
					 if(oFire1 == OBJECT_INVALID)
					 	{oFire1 = GetObjectByTag("slv_tra100_fire1");
						 SetLocalObject(OBJECT_SELF, "oFire1", oFire1);
						 }
					 object oFire2 = GetLocalObject(OBJECT_SELF, "oFire2");
					 if(oFire2 == OBJECT_INVALID)
					 	{oFire2 = GetObjectByTag("slv_tra100_fire2");
						 SetLocalObject(OBJECT_SELF, "oFire2", oFire2);
						 }
					 object oSmoke = GetLocalObject(OBJECT_SELF, "oSmoke");
					 if(oSmoke == OBJECT_INVALID)
					 	{oSmoke = GetObjectByTag("slv_tra100_smoke");
						 SetLocalObject(OBJECT_SELF, "oSmoke", oSmoke);
						 }
					 object oMyWaterWP = GetLocalObject(OBJECT_SELF, "oMyWaterWP");
					 if (oMyWaterWP == OBJECT_INVALID)
						{oMyWaterWP = GetWaypointByTag("Tra_All_Quests_Water_WP");
						 SetLocalObject(OBJECT_SELF, "oMyWaterWP", oMyWaterWP);
						}
					 ACR_SetPersistentString(oStudent, "Elemental Transmutation", "Elementary Transmutation");
                     object oSteam = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra100_steam", GetLocation(oMyWaterWP));
					 SetLocalObject(oStudent, "oSteam", oSteam);
					 object oSteamRoom = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra100_steamroom", GetLocation(oMyWaterWP));
					 SetLocalObject(oStudent, "oSteamRoom", oSteamRoom);
					 SendMessageToPC(oGiver, "As you pour the water into the firepit, steam billows and hisses.");
					 if(ReflexSave(oStudent, 10, SAVING_THROW_TYPE_NONE, OBJECT_SELF) == 1)
			           	{SendMessageToPC(oGiver, "The cloud of steam rises to the ceiling without harming you.");
			           	}
			           	else
			           	{SendMessageToPC(oGiver, "Hot steam sears your skin!");
			             ApplyEffectToObject(DURATION_TYPE_INSTANT, eSplatDamage, oGiver);
			            }
					 DestroyObject(oFire2);
					 DelayCommand(3.0, DestroyObject(oFire1));
					 DelayCommand(5.0, DestroyObject(oSmoke));
					 DelayCommand(6.0, DestroyObject(oSteam));
					 DelayCommand(5.0, SendMessageToPC(oGiver, "When the steam passes, the smoke dissipates. The flames are gone and so is the water. You doused the fire before the water evaporated!"));
					 DelayCommand(8.0, SendMessageToPC(oGiver, "Engraved on the nozzle of the fire pipe where the words had been obscured by the flames is the inscription: 'Sometimes opposites attract, sometimes they cancel each other and sometimes they cause a wonderful explosion. Know thy materials."));
					 DelayCommand(10.0, DestroyObject(oSteamRoom));
					 }
		
}			  