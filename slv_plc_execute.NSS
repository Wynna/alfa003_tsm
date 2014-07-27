//Execute script for commands that can't be delayed except with a (DelayCommand(ExecuteScript))
//Wynna May 2008


#include "acr_placeable_i"
#include "acr_db_persist_i"
#include "acr_tools_i"
#include "acr_quest_i"
					

void main()
{
	ACR_PlaceableOnSpellCastAt();
    object oStudent = GetLocalObject(OBJECT_SELF, "oStudent");
    object oArea = GetArea(OBJECT_SELF);
	effect eCutDamage = EffectDamage(1, DAMAGE_TYPE_SLASHING, DAMAGE_POWER_NORMAL);
    effect eSplatDamage = EffectDamage(Random(5), DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL);
    effect eColderDamage = EffectDamage(Random(6), DAMAGE_TYPE_COLD, DAMAGE_POWER_NORMAL);
    effect ePoison = EffectDamage(1, DAMAGE_TYPE_ACID, DAMAGE_POWER_NORMAL);
    effect eGas = EffectVisualEffect(VFX_COM_CHUNK_GREEN_SMALL);
    


        //Standard Transmutation

        if(GetTag(OBJECT_SELF) == "slv_tra200_forge")  
         		{object oMyTrigAll = GetLocalObject(OBJECT_SELF, "oMyTrigAll");
					  if(oMyTrigAll == OBJECT_INVALID)
					  	{oMyTrigAll = GetNearestObjectByTag("slv_22.00", OBJECT_SELF);
						 SetLocalObject(OBJECT_SELF, "oMyTrigAll", oMyTrigAll);
						 }
				 object oMySteamWP = GetLocalObject(OBJECT_SELF, "oMySteamWP");
				 if (oMySteamWP == OBJECT_INVALID)
					 {oMySteamWP = GetWaypointByTag("Tra_All_Quests_Steam2_WP");
					  SetLocalObject(OBJECT_SELF, "oMySteamWP", oMySteamWP);
					 }
				  object oMySteelWP = GetLocalObject(OBJECT_SELF, "oMySteelWP");
				  if (oMySteelWP == OBJECT_INVALID)
					 {oMySteelWP = GetWaypointByTag("Tra_All_Quests_Steel_WP");
					  SetLocalObject(OBJECT_SELF, "oMySteelWP", oMySteelWP);
					 }
				 object oMyTrough = GetLocalObject(OBJECT_SELF, "oMyTrough");
				 if (oMyTrough == OBJECT_INVALID)
					 {oMyTrough = GetObjectByTag("slv_tra200_trough");
					  SetLocalObject(OBJECT_SELF, "oMyTrough", oMyTrough);
					}
				  if(GetLocalInt(OBJECT_SELF, "Steel") != 1)
				  	{ object oMySteam = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_steam", GetLocation(oMySteamWP));
					  SetLocalObject(oMyTrigAll, "oMySteam", oMySteam);
					  DelayCommand(17.0, DestroyObject(oMySteam));
				      DelayCommand(18.0, SetLocalObject(oMyTrigAll, "oMySteam", OBJECT_INVALID));
				      DelayCommand(18.0, SetLocalObject(OBJECT_SELF, "oMySteam", OBJECT_INVALID));
				      if(ReflexSave(oStudent, 10, SAVING_THROW_TYPE_NONE, OBJECT_SELF) == 1)
							{DelayCommand(3.0, SendMessageToPC(oStudent, "Luckily, you were far enough away to avoid being splattered by molten steel."));
						   }
						    else
						  {DelayCommand(3.0, SendMessageToPC(oStudent, "Hot droplets of molten metal splatter your skin!"));
						   ApplyEffectToObject(DURATION_TYPE_INSTANT, eSplatDamage, oStudent);
						   }
					}
				  else if(GetLocalInt(OBJECT_SELF, "Steel") == 1)
				  	{CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra200_ingot_steel", GetLocation(oMySteelWP));
					  SetLocalInt(OBJECT_SELF, "Steel", 0);
					  SetUseableFlag(oMyTrough, FALSE);
					  }
				}					   		   
}