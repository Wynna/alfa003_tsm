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
	object oItem = GetItemActivated();
 	object oStudent = GetItemActivator();
	string sItem = GetName(oItem);
	object oTarget = GetItemActivatedTarget();
	object oMyTrigAll = GetObjectByTag("Tra_All"); 
	effect eSplatDamage = EffectDamage(2, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL);
   	
					 	
				
		//Elementary Transmutation
				if(GetTag(oTarget) == "slv_tra100_brazier")
				    {SendMessageToPC(oStudent, "You managed to reach the brazier before the water evaporated! Steam bursts upward from the searingly hot coals.");
					 DestroyObject(oItem);
					 
					 object oFire1 = GetLocalObject(oMyTrigAll, "oFire1");
					 if(oFire1 == OBJECT_INVALID)
					 	{oFire1 = GetObjectByTag("slv_tra100_fire1");
						 SetLocalObject(oMyTrigAll, "oFire1", oFire1);
						 }
					 object oFire2 = GetLocalObject(oMyTrigAll, "oFire2");
					 if(oFire2 == OBJECT_INVALID)
					 	{oFire2 = GetObjectByTag("slv_tra100_fire2");
						 SetLocalObject(oMyTrigAll, "oFire2", oFire2);
						 }
					 object oSmoke = GetLocalObject(oMyTrigAll, "oSmoke");
					 if(oSmoke == OBJECT_INVALID)
					 	{oSmoke = GetObjectByTag("slv_tra100_smoke");
						 SetLocalObject(oMyTrigAll, "oSmoke", oSmoke);
						 }
					 object oMyWaterWP = GetLocalObject(oMyTrigAll, "oMyWaterWP");
					 if (oMyWaterWP == OBJECT_INVALID)
						{oMyWaterWP = GetWaypointByTag("Tra_All_Quests_Water_WP");
						 SetLocalObject(oMyTrigAll, "oMyWaterWP", oMyWaterWP);
						}
					 SetCampaignString("SLV_UNI", "Elementary Transmutation", "Elementary Transmutation", oStudent);
                     object oSteam = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra100_steam", GetLocation(oMyWaterWP));
					 SetLocalObject(oMyTrigAll, "oSteam", oSteam);
					 object oSteamRoom = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra100_steamroom", GetLocation(oMyWaterWP));
					 SetLocalObject(oMyTrigAll, "oSteamRoom", oSteamRoom);
					 SendMessageToPC(oStudent, "As you empty the bucket onto the firepit, steam billows and hisses.");
					 if(ReflexSave(oStudent, 10, SAVING_THROW_TYPE_NONE, OBJECT_SELF) == 1)
			           	{SendMessageToPC(oStudent, "The cloud of steam rises to the ceiling without harming you.");
			           	}
			           	else
			           	{SendMessageToPC(oStudent, "Hot steam sears your skin!");
			             ApplyEffectToObject(DURATION_TYPE_INSTANT, eSplatDamage, oStudent);
			            }
					 DestroyObject(oFire2);
					 DelayCommand(3.0, DestroyObject(oFire1));
					 SetLocalObject(oMyTrigAll, "oFire1", OBJECT_INVALID);
					 DelayCommand(5.0, DestroyObject(oSmoke));
					 SetLocalObject(oMyTrigAll, "oSmoke", OBJECT_INVALID);
					 DelayCommand(6.0, DestroyObject(oSteam));
					 SetLocalObject(oMyTrigAll, "oSteam", OBJECT_INVALID);
					 DelayCommand(5.0, SendMessageToPC(oStudent, "When the steam passes, the smoke dissipates. The flames are gone and so is the water. You doused the fire before the water evaporated!"));
					 DelayCommand(8.0, SendMessageToPC(oStudent, "Engraved on the nozzle of the fire pipe where the words had been obscured by the flames is the inscription: 'Sometimes opposites attract, sometimes they cancel each other and sometimes they cause a wonderful explosion. Know thy materials."));
					 DelayCommand(10.0, DestroyObject(oSteamRoom));
					 SetLocalObject(oMyTrigAll, "oSteamRoom", OBJECT_INVALID);
					 }
					 
					else
					{SendMessageToPC(oStudent, "Your bucket is empty.");
					}
					
				object oMyEmpty = CreateItemOnObject("slv_tra100_empty", oStudent, 1);
				SetLocalObject(oMyTrigAll, "oMyEmpty", oMyEmpty);
						 
}			  