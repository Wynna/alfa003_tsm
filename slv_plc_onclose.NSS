//OnClose for all Silvy Uni placeables outside the classrooms
//Wynna December 2007


#include "acr_placeable_i"
#include "acr_tools_i"


void main()
{
	ACR_PlaceableOnClose();
    object oStudent = GetLastClosedBy();


	     			
if(GetTag(OBJECT_SELF) == "vala_cabinet")
	{object oCollBoxWP = GetWaypointByTag("Vala_CollBox_WP");
	 location lCollBox = GetLocation(oCollBoxWP);
	 object oStatic = GetLocalObject(OBJECT_SELF, "oStatic");
	 SetUseableFlag(oStatic, FALSE);
	 if(oStatic == OBJECT_INVALID)
	 	{object oStaticNew = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_wardrobe_large", GetLocation(OBJECT_SELF), FALSE, "vala_cabinet_static");
	 	 SetUseableFlag(oStaticNew, FALSE);
	     SetLocalObject(OBJECT_SELF, "oStatic", oStaticNew);
	 }
		{}
	 object oCollBox = GetLocalObject(OBJECT_SELF, "oCollBox");
	 if(oCollBox == OBJECT_INVALID)
	 	{object oCollBoxNew = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_dean_collision", lCollBox, FALSE, "vala_CollBox");
	 	 SetLocalObject(OBJECT_SELF, "oCollBox", oCollBoxNew);
	 }
		{}
	 DestroyObject(OBJECT_SELF, 15.0);
	 	}
	
		
if(GetTag(OBJECT_SELF) == "slv_trashcan")
	{DestroyInventory(OBJECT_SELF);
	 SpeakString("A puff of smoke goes up.", TALKVOLUME_TALK);
	}	
	
if(GetTag(OBJECT_SELF) == "dotr3_sarc_magus")
	{if(GetItemPossessedBy(OBJECT_SELF, "003_it_corpse_mummy") != OBJECT_INVALID)
	 	{effect eHoly = EffectVisualEffect(VFX_AOE_WEB_OF_PURITY, FALSE);
		 effect eHoly2 = EffectVisualEffect(VFX_DUR_LIGHT_WHITE_20, FALSE);
		 effect eHoly3 = EffectVisualEffect(VFX_CAST_SPELL_SPIRIT_EMERGE_GOOD, FALSE);
		 effect eHoly4 = EffectVisualEffect(VFX_DUR_BLAZING_AURA, FALSE);
		 effect eHoly5 = EffectVisualEffect(VFX_DUR_GLYPH_OF_WARDING, FALSE);
		 effect eHeal = EffectHeal(100);
		 object oGhost = GetObjectByTag("003_cr_dr_watchghost_m", 1);
		 object oGhost2 = GetObjectByTag("003_cr_dr_watchghost_m", 2);
		 object oGhost3 = GetObjectByTag("003_cr_dr_watchghost_f", 1);
		 object oGhost4 = GetObjectByTag("003_cr_dr_watchghost_f", 2);
		 object oSoundScream = GetObjectByTag("dotr_ScreamsMen");
		 object oSoundBattle = GetObjectByTag("dotr_BattleCriesGroup");
		 object oSoundWail = GetObjectByTag("dotr_WailsMen");
		 object oSoundCrying = GetObjectByTag("dotr_CryingMen");
		 
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly, OBJECT_SELF);
		 DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly2, OBJECT_SELF));
		 DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, OBJECT_SELF));
		 DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly4, OBJECT_SELF));
		 DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly5, OBJECT_SELF));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 0));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 2));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 3));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 4));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 5));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 0));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 2));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 3));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 4));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 5));
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, oGhost);
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, oGhost2);
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, oGhost3);
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eHoly3, oGhost4);
		 DestroyObject(oGhost, 3.0);
		 DestroyObject(oGhost2, 5.0);
		 DestroyObject(oGhost3, 7.0);
		 DestroyObject(oGhost, 9.0);
		 SoundObjectPlay(oSoundBattle);
		 SoundObjectPlay(oSoundScream);
		 SoundObjectPlay(oSoundCrying);
		 SoundObjectPlay(oSoundWail);
		 DelayCommand(5.0, SoundObjectStop(oSoundCrying));
		 DelayCommand(7.0, SoundObjectStop(oSoundWail));
		 DelayCommand(8.0, SoundObjectStop(oSoundScream));
		 DelayCommand(10.0, SoundObjectStop(oSoundBattle));
		 
	     DestroyInventory(OBJECT_SELF);
	 
		}
	 else
	 	{SpeakString("The lid refuses to close.", TALKVOLUME_TALK);}
		
		
	//Standard Transmutation

        if(GetTag(OBJECT_SELF) == "slv_tra200_forge") 
         {SendMessageToPC(oStudent, "Closed");
		  SetLocalObject(OBJECT_SELF, "oStudent", oStudent);
		  object oMyTrigAll = GetLocalObject(OBJECT_SELF, "oMyTrigAll");
		  if(oMyTrigAll == OBJECT_INVALID)
		  	{oMyTrigAll = GetNearestObjectByTag("slv_22.00", OBJECT_SELF);
			 SetLocalObject(OBJECT_SELF, "oMyTrigAll", oMyTrigAll);
			 }
		  object oMyFlameWP = GetLocalObject(OBJECT_SELF, "oMyFlameWP");
		  if (oMyFlameWP == OBJECT_INVALID)
			 {oMyFlameWP = GetWaypointByTag("Tra_All_Quests_Fire3_WP");
			  SetLocalObject(OBJECT_SELF, "oMyFlameWP", oMyFlameWP);
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
		  object oMySteamWP = GetLocalObject(OBJECT_SELF, "oMySteamWP");
		  if (oMySteamWP == OBJECT_INVALID)
			 {oMySteamWP = GetWaypointByTag("Tra_All_Quests_Steam2_WP");
			  SetLocalObject(OBJECT_SELF, "oMySteamWP", oMySteamWP);
			 }
		  effect eSplatDamage = EffectDamage(Random(5), DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL);
		  object oMyFlame = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_fire", GetLocation(oMyFlameWP));
		  SetLocalObject(oMyTrigAll, "oMyFlame", oMyFlame);
		  SetLocalObject(OBJECT_SELF, "oMyFlame", oMyFlame);
		  SendMessageToPC(oStudent, "The forge roars to life, the materials melting before your eyes with magical ease.");
		  DelayCommand( 1.0, AssignCommand(oMyFlame, PlaySound("furnace")));
          if(GetFirstItemInInventory(OBJECT_SELF) != OBJECT_INVALID)
            {int nCount = 0;
			 int nAlloy = 0;
			 int nDagger = 0;
			 int nOther = 0;
		     object oOre = GetFirstItemInInventory(OBJECT_SELF);
		     while (GetIsObjectValid(oOre))
		
		           {if(GetTag(oOre) == "slv_tra200_iron")
			            {nCount = nCount +1;
			             DestroyObject(oOre);
						 oOre = GetNextItemInInventory(OBJECT_SELF);
			             DelayCommand(IntToFloat(nCount * 3), SendMessageToPC(oStudent, "The number " + IntToString(nCount) +" chunk of iron ore melts away."));
			             }
			            else if(GetTag(oOre) == "slv_tra200_alloy")
			            {nAlloy = nDagger +1;
			             DestroyObject(oOre);
						 oOre = GetNextItemInInventory(OBJECT_SELF);
			             DelayCommand(IntToFloat(nAlloy * 3), SendMessageToPC(oStudent, "Alloy melts, adding its properties to the molten liquid."));
			             }
						 else if(GetTag(oOre) == "slv_tra200_rustydagger")
			            {if(GetItemHasItemProperty(oOre, ITEM_PROPERTY_ENHANCEMENT_BONUS))
							 {nAlloy = nAlloy +1;
				              DelayCommand(IntToFloat(nAlloy * 3), SendMessageToPC(oStudent, "The rusty dagger melts, adding the enhancements it bears to the molten liquid."));
				              }
					     else
						 	{DelayCommand(IntToFloat(nAlloy * 3), SendMessageToPC(oStudent, "The rusty dagger melts, sparks flying as the corrosion on it burns."));}
						 DestroyObject(oOre);
						 oOre = GetNextItemInInventory(OBJECT_SELF);
			             }
						else 
			            {nOther = nOther +1;
			             DestroyObject(oOre);
						 oOre = GetNextItemInInventory(OBJECT_SELF);
			             DelayCommand(IntToFloat(nOther * 7), SendMessageToPC(oStudent, "An unspecified material adds an impurity to the mix!"));
			             } 
				     }
		       
				DelayCommand(15.0, SendMessageToPC(oStudent, "A sluice opens up on the side of the forge and molten metal pours out into the shaping trough."));
			    DestroyInventory(OBJECT_SELF);
			    DelayCommand(15.0, AssignCommand(oMyTrough, PlaySound("steamlarge")));
			    DelayCommand(16.0, ExecuteScript("slv_plc_execute", OBJECT_SELF));
			      
			     DelayCommand(18.0, SendMessageToPC(oStudent, "When the shaping trough is full, the forge sluice closes and the molten steel settles, forming a skin as it starts to harden into a large ingot."));
			     DelayCommand(20.5, AssignCommand(oMyTrough, PlaySound("waterpump")));
			     DelayCommand(21.0, SendMessageToPC(oStudent, "Cooling water pours into the shaping trough."));
			     DelayCommand(30.0, DestroyObject(oMyFlame));
			             
				 if((nCount == 3) && (nAlloy == 1)&& (nDagger == 1) && (nOther == 0))
						{DelayCommand(25.0, SetLocalInt(OBJECT_SELF, "Steel", 1));
						 DelayCommand(30.0, ExecuteScript("slv_plc_execute", OBJECT_SELF));
			             if(GetCampaignString("SLV_UNI", "Elementary Transmutation", oStudent) == "Elementary Transmutation")
						 	{SetCampaignString("SLV_UNI", "Standard Transmutation", "Standard Transmutation", oStudent);
							}
			             if(ACR_RetrieveQuestState("slv_tra200", oStudent) == 1)
								{ACR_AddPersistentJournalQuestEntry("slv_tra200", 2, oStudent, 0, 0, 0, 0);
								}
							DelayCommand(31.0, SendMessageToPC(oStudent, "The trough now holds a recognizable bar of steel, cooling rapidly."));
					     }
					
			else if((nCount != 4) || (nAlloy != 1) || (nOther != 0))
						{DelayCommand(30.0, SetUseableFlag(oMyTrough, TRUE));
						 DelayCommand(31.0, SendMessageToPC(oStudent, "The trough now holds an amorphous blob of slag.  Something must have gone wrong with the transmutation!"));
					     CreateItemOnObject("slv_tra200_slag", oMyTrough, 1);
					  	}
			}
             else
             {DelayCommand(2.0, SendMessageToPC(oStudent, "There is nothing in the forge."));
              DelayCommand(30.0, DestroyObject(oMyFlame));
             }
          }
	 }	
}	