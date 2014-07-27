//Secondary script for all tsm execute scripts
//Wynna February 2009


#include "acr_creature_i"
#include "acr_xp_i"
#include "acr_quest_i"









void main()
{ if(GetTag(OBJECT_SELF) == "003_cr_voice")
		{string sArea = "_catacombs";
   	     object oMyTrigger = GetLocalObject(OBJECT_SELF, "oMyTrigger");
		 object oMyHeadstone = GetLocalObject(OBJECT_SELF, "oMyHeadstone");
		 if(oMyHeadstone == OBJECT_INVALID)
		 	{oMyHeadstone = GetObjectByTag(GetTag(oMyTrigger) + sArea);
			 SetLocalObject(OBJECT_SELF, "oMyHeadstone", oMyHeadstone);
			 if(oMyHeadstone == OBJECT_INVALID)
			 	{oMyHeadstone = GetObjectByTag("sm_sylune_listener_catacombs");
				 SetLocalObject(OBJECT_SELF, "oMyHeadstone", oMyHeadstone);
				 }
			}
		 location lGoTo2 = GetLocalLocation(oMyHeadstone, "lGoTo2");
		 location lGoTo3 = GetLocalLocation(oMyHeadstone, "lGoTo3");
		 location lGoTo4 = GetLocalLocation(oMyHeadstone, "lGoTo4");
		 effect eKnockdown = EffectKnockdown();
		 effect eRippleExplode = EffectVisualEffect(507, FALSE);
		 effect eGlobeInvuln = EffectVisualEffect(512, FALSE);
		 effect ePrismatic = EffectVisualEffect(607, FALSE);
		 effect eRedGroundCircle = EffectVisualEffect(496, FALSE);
		 effect eGround1 = EffectVisualEffect(554, FALSE);
		 effect eGround2 = EffectVisualEffect(555, FALSE);
		 effect eGround3 = EffectVisualEffect(556, FALSE);
		 effect eFireExplosion = EffectVisualEffect(564, FALSE);
		 effect eSteamExplosion = EffectVisualEffect(569, FALSE);
		 effect eElectric = EffectVisualEffect(74, FALSE);
		 effect eDarkness = EffectVisualEffect(886, FALSE);
		 effect eFireCone = EffectVisualEffect(871, FALSE);
		 effect eFilaments = EffectVisualEffect(729, FALSE);
		 effect eHeal = EffectVisualEffect(70, FALSE);
		 effect ePestilence = EffectVisualEffect(538, FALSE);
		 effect eSongRunes = EffectVisualEffect(631, FALSE);
		 effect eHolyStrike = EffectVisualEffect(626, FALSE);
		 effect eRevolving = EffectVisualEffect(553, FALSE);
		 effect eCircle = EffectVisualEffect(700, FALSE);
		 effect eQuake = EffectVisualEffect(VFX_SPELL_HIT_EARTHQUAKE, FALSE);
		 effect eExpanding = EffectVisualEffect(552, FALSE);
		 effect eImplode = EffectVisualEffect(736, FALSE);
		 effect ePillar = EffectVisualEffect(999, FALSE);
		 effect eRipple = EffectVisualEffect(1045, FALSE);
		 effect eSonicImplode = EffectVisualEffect(1009, FALSE);
		 effect eRing = EffectVisualEffect(1010, FALSE);
		 effect eWhiteOut = EffectVisualEffect(778, FALSE);
		 object oSyluneGhost = GetLocalObject(OBJECT_SELF, "oSyluneGhost");
		 object oRedDragon = GetLocalObject(OBJECT_SELF, "oRedDragon");
			 
		 if(GetLocalInt(OBJECT_SELF, "Stage") == 2)
			{SetLocalInt(OBJECT_SELF, "Stage", 0);
			 object oSilverDragon = GetLocalObject(OBJECT_SELF, "oSilverDragon");
			 object oSylune = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deandragon_h_sylune", GetLocation(oSilverDragon));
			 SetLocalObject(OBJECT_SELF, "oSylune", oSylune);
			 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oSylune, 3.0);
			 DestroyObject(oSilverDragon);
			 SetLocalObject(OBJECT_SELF, "oSilverDragon", OBJECT_INVALID);
			 DelayCommand(2.0, AssignCommand(oSyluneGhost, ActionSpeakString("When the darkness cleared, Sylune was on the ground, in human shape, atop her staff. Battered and reeling, she knew that the beast before her must die, even is so must she. *Simply* She broke her staff. A Staff of the Magi. The conflagration that arose was like nothing ever seen before...", TALKVOLUME_TALK)));
			 DelayCommand(5.0, AssignCommand(oSylune,  ActionCastFakeSpellAtObject(SPELL_EARTHQUAKE, oRedDragon, PROJECTILE_PATH_TYPE_DEFAULT)));
			 DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePillar, oSylune, 3.0));
			 DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRipple, oSylune, 2.0));
			 DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSonicImplode, oSylune, 5.0));
			 DelayCommand(12.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRipple, oSylune, 3.0));
			 DelayCommand(13.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eWhiteOut, oSylune, 2.0));
			 DelayCommand(14.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eQuake, oSylune, 5.0));
			 DelayCommand(14.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eWhiteOut, oSylune, 2.0));
			 DelayCommand(15.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eWhiteOut, oSylune, 2.0));
			 DelayCommand(16.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eQuake, oSylune, 8.0));
			 DelayCommand(16.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eWhiteOut, oSylune, 2.0));
			 DelayCommand(17.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eWhiteOut, oSylune, 2.0));
			 DestroyObject(oSylune, 17.0);
			 DestroyObject(oRedDragon, 17.0);
			 DelayCommand(18.0, AssignCommand(oSyluneGhost, ActionSpeakString("...and when it passed, the dragon was no more, and neither was Sylune in a corporeal form. Gone, dead, but not forever. The immortal sister, translated to a spectral harper, continued existance and protection of her home, but never again would her sisters feel her embrace.", TALKVOLUME_TALK)));
			 DelayCommand(25.0, AssignCommand(oSyluneGhost, ActionSpeakString("This memorial honors Sylune, wizard, Harper, defender...sister. Gone, and never lost from our hearts.", TALKVOLUME_TALK)));
			 DestroyObject(oSyluneGhost, 26.0);
			 }
			 
	 	if(GetLocalInt(OBJECT_SELF, "Stage") == 1)
			{object oSylune = GetLocalObject(OBJECT_SELF, "oSylune");
			 object oSilverDragon = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deandragon_h_dragon2", GetLocation(oSylune));
			 SetLocalObject(OBJECT_SELF, "oSilverDragon", oSilverDragon);
			 DestroyObject(oSylune);
			 SetLocalObject(OBJECT_SELF, "oSylune", OBJECT_INVALID);
			 DelayCommand(1.0, AssignCommand(oRedDragon, ActionAttack(oSilverDragon)));
			 DelayCommand(1.5, AssignCommand(oRedDragon, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFireCone, oSilverDragon, 3.0)));
			 DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFireExplosion, oSilverDragon, 5.0));
			 DelayCommand(4.5, AssignCommand(oSilverDragon,  ActionCastFakeSpellAtObject(SPELL_SONG_OF_DISCORD, oRedDragon, PROJECTILE_PATH_TYPE_DEFAULT)));
			 DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGround3, oRedDragon, 5.0));
			 DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSongRunes, oRedDragon, 5.0));
			 DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHeal, oSilverDragon, 3.0));
			 DelayCommand(12.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlobeInvuln, oSilverDragon, 5.0));
			 DelayCommand(15.0, AssignCommand(oSyluneGhost, ActionSpeakString("Relentlessly, fighting tooth and claw against his, she cast the most powerful spells she had, one after another.", TALKVOLUME_TALK)));
			 DelayCommand(15.0, AssignCommand(oRedDragon, ClearAllActions(TRUE)));
			 DelayCommand(16.0, AssignCommand(oRedDragon, ActionAttack(oSilverDragon)));
			 DelayCommand(16.5, AssignCommand(oSilverDragon,  ActionCastFakeSpellAtObject(SPELL_SONG_OF_DISCORD, oRedDragon, PROJECTILE_PATH_TYPE_DEFAULT)));
			 DelayCommand(17.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHolyStrike, oRedDragon, 5.0));
			 DelayCommand(19.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRevolving, oRedDragon, 8.0));
			 DelayCommand(20.0, AssignCommand(oSilverDragon,  ActionCastFakeSpellAtObject(SPELL_EPIC_HELLBALL, oRedDragon, PROJECTILE_PATH_TYPE_DEFAULT)));
			 DelayCommand(21.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eImplode, oRedDragon, 8.0));
			 DelayCommand(24.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oRedDragon, 10.0));
			 DelayCommand(25.0, AssignCommand(oSyluneGhost, ActionSpeakString("The dragon fell, wounded in a hundred places, smoking and bloodied. She approached....", TALKVOLUME_TALK)));
			 DelayCommand(30.0, AssignCommand(oSylune, ClearAllActions(TRUE)));
			 DelayCommand(31.0, AssignCommand(oSylune, ActionForceMoveToObject(oRedDragon)));
			 DelayCommand(36.0, AssignCommand(oRedDragon, ActionAttack(oSilverDragon)));
			 DelayCommand(38.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFilaments, oSilverDragon, 5.0));
			 DelayCommand(39.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHeal, oRedDragon, 3.0));
			 DelayCommand(39.5, AssignCommand(oSyluneGhost, ActionSpeakString("Not for nothing had the draconic race been lords of Faerun so long before. The cunning creature lured her near and attacked the now drained mage with the foulest of magics.", TALKVOLUME_TALK)));
			 DelayCommand(40.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oSilverDragon, 8.0));
			 DelayCommand(42.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDarkness, oSilverDragon, 5.0));
						 
			 DelayCommand(43.0, SetLocalInt(OBJECT_SELF, "Stage", 2));
			 DelayCommand(44.5, ExecuteScript("tsm_npc_execute", OBJECT_SELF));
			 DelayCommand(45.5, AssignCommand(oRedDragon, ClearAllActions(TRUE)));
			}
		}	
		
			if((GetTag(OBJECT_SELF) == "003_cr_argent_marilee_stallings") && (GetLocalInt(OBJECT_SELF, "Stage") == 0))
					{object oEscort = GetLocalObject(OBJECT_SELF, "oEscort");
					 location lEscort = GetLocation(oEscort);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vBandit = Vector(vEscort.x + 10.0, vEscort.y + 10.0, vEscort.z);
					 location lBandit = Location(GetArea(OBJECT_SELF), vBandit, GetFacing(OBJECT_SELF));
					 object oBandit = CreateObject(OBJECT_TYPE_CREATURE, "03_silvy_commoner_pp", lBandit);
					 SetFirstName(oBandit, "Bandit");
					 AssignCommand(oBandit, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oBandit, ActionSpeakString("Your money or your life!", TALKVOLUME_TALK));
					 AssignCommand(oBandit, ActionAttack(oEscort, FALSE));
					 ChangeToStandardFaction(oBandit, STANDARD_FACTION_HOSTILE);
					 
					}
					
				if((GetTag(OBJECT_SELF) == "003_cr_argent_marilee_stallings") && (GetLocalInt(OBJECT_SELF, "Stage") == 1))
					{object oEscort = GetLocalObject(OBJECT_SELF, "oEscort");
					 location lEscort = GetLocation(oEscort);
					 vector vEscort = GetPositionFromLocation(lEscort);
					 vector vDog = Vector(vEscort.x + 20.0, vEscort.y + 20.0, vEscort.z);
					 location lDog = Location(GetArea(OBJECT_SELF), vDog, GetFacing(OBJECT_SELF));
					 object oDog1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_darovoi", lDog);
					 SetFirstName(oDog1, "Feral Dog");
					 AssignCommand(oDog1, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog1, ActionAttack(oEscort, FALSE));
					 ChangeToStandardFaction(oDog1, STANDARD_FACTION_HOSTILE);
					 object oDog2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_dom_dog_ahrnhand", lDog);
					 SetFirstName(oDog2, "Feral Dog");
					 AssignCommand(oDog2, SetFacingPoint(GetPositionFromLocation(GetLocation(OBJECT_SELF))));
					 AssignCommand(oDog2, ActionAttack(oEscort, FALSE));
					 ChangeToStandardFaction(oDog2, STANDARD_FACTION_HOSTILE);
					 
					}
}