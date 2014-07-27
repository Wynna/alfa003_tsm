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
	 }	
}	