//Conversation driven for all 2gp circus acts  
//Wynna May 2015


#include "acr_creature_i"



void ActionCreateWynPlace(string sPlace, location lLocPlace)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, sPlace, lLocPlace);
}

void ActionCreateWynPlacedEffect(string sPlacedEffect, location lLocPlace)
{
    CreateObject(OBJECT_TYPE_PLACED_EFFECT, sPlacedEffect, lLocPlace);
}

 
void main()
{
	object oPC = GetPCSpeaker();
		 
	if(GetLocalInt(OBJECT_SELF, "nIncrement") < 1)
			{int nPerformRandom = Random(20) + 1;
			 ActionSpeakString("*OOC: The performer rolls " + IntToString(nPerformRandom) + " on a Perform Check for this performance.*", TALKVOLUME_TALK);
			}
		

	//Magician
	if(GetTag(OBJECT_SELF) == "003_cr_circus_magician")
		{object oTarget = GetObjectByTag("circus_magician_target", 0);
		 int nSpellShield=417;
		 int nSpellGlobe=65;
		 int nSpellGate =183;
		 int nSpellColor =5;
		 int nSpellSound =167;
		 int nSpellBurning =10;
		 int nSpellMM =107;
		 int nSpellLightning =101;
		 int nSpellPrism =135;
		 int nSpellQuake =426;
		 int nSpellIce =368;
		 int nSpellFlamewall =58;
		 int nSpellImplode =87;
		 
		 if(WillSave(oPC, 15, SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF))
		 	{DelayCommand(IntToFloat(Random(20)), SendMessageToPC(oPC, "You see through this charlaton! All but the simplest of his spells are illusions!"));}
		 
		 DelayCommand(1.0, ActionSpeakString("We begin with some precautions! Mystra's might is nothing to toy with, and I will now cast protections upon myself! As for you...stand back! I cannot be held responsible should the Weave beguile you into coming too close, and you take harm!", TALKVOLUME_TALK));
		 DelayCommand(2.0, ActionCastFakeSpellAtObject(nSpellShield, OBJECT_SELF, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(5.0, ActionCastFakeSpellAtObject(nSpellGlobe, OBJECT_SELF, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(10.0, ActionSpeakString("Again I say, stand back! The show begins...now!", TALKVOLUME_TALK));
		 DelayCommand(12.0, ActionCastFakeSpellAtObject(nSpellColor, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(22.0, ActionSpeakString("And so the lights dance, mesmerizing and beautiful!", TALKVOLUME_TALK));
		 DelayCommand(25.0, ActionCastFakeSpellAtObject(nSpellGate, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(32.0, ActionSpeakString("What is spectacle without the fury of sound?", TALKVOLUME_TALK));
		 DelayCommand(40.0, ActionCastFakeSpellAtObject(nSpellSound, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(48.0, ActionSpeakString("But let us put an end to such creations non-physical. Know the power of flames!", TALKVOLUME_TALK));
		 DelayCommand(55.0, ActionCastFakeSpellAtObject(nSpellBurning, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(65.0, ActionSpeakString("And lightnings from the sky!", TALKVOLUME_TALK));
		 DelayCommand(69.0, ActionCastFakeSpellAtObject(nSpellLightning, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(75.0, ActionSpeakString("What can you trust, when you cannot trust the earth beneath your feet!", TALKVOLUME_TALK));
		 DelayCommand(78.0, ActionCastFakeSpellAtObject(nSpellQuake, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(90.0, ActionSpeakString("And when the grosser elements are not enough, summon the magic at Mystra's heart!", TALKVOLUME_TALK));
		 DelayCommand(93.0, ActionCastSpellAtObject(nSpellMM, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(97.0, ActionCastSpellAtObject(nSpellMM, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(101.0, ActionCastSpellAtObject(nSpellMM, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(105.0, ActionSpeakString("For my finale, fire...", TALKVOLUME_TALK));
		 DelayCommand(108.0, ActionCastFakeSpellAtObject(nSpellFlamewall, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(115.0, ActionSpeakString("...and ice!", TALKVOLUME_TALK));
		 DelayCommand(120.0, ActionCastFakeSpellAtObject(nSpellIce, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(125.0, ActionSpeakString("FINITO! The show is at an end!", TALKVOLUME_TALK));
		 DelayCommand(127.0, ActionCastFakeSpellAtObject(nSpellImplode, oTarget, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(127.5, ActionCastSpellAtObject(nSpellMM, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT));
		 DelayCommand(128.0, ActionSpeakString("And lightnings from the sky!", TALKVOLUME_TALK));
		 }

		
	//Horse Trainer
	if(GetTag(OBJECT_SELF) == "003_cr_circus_master_horses")
		{string sCreature = GetLocalString(OBJECT_SELF, "circus_master");
		 location lCreate = GetLocation(GetWaypointByTag(sCreature + "_create"));
		 object oGateIn = GetObjectByTag("big_top_west_north", 0);
		 effect eSpeedUp = EffectMovementSpeedIncrease(75);
		 object oHorse = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate, FALSE, sCreature + "01");
		 object oHorse2 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate, FALSE, sCreature + "02");
		 object oHorse3 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate, FALSE, sCreature + "03");
		 object oHorse4 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate, FALSE, sCreature + "04");
		 
		 object oHorseWP1=GetWaypointByTag("WP_" + sCreature + "_01");
		 object oHorseWP3=GetWaypointByTag("WP_" + sCreature + "_03");
		 object oHorseWP5=GetWaypointByTag("WP_" + sCreature + "_05");
		 object oHorseWP6=GetWaypointByTag("WP_" + sCreature + "_06");
		 object oHorseWP7=GetWaypointByTag("WP_" + sCreature + "_07");
		 object oHorseWP9=GetWaypointByTag("WP_" + sCreature + "_09");
		 object oHorseWP11=GetWaypointByTag("WP_" + sCreature + "_11");
		 object oHorseWP12=GetWaypointByTag("WP_" + sCreature + "_12");
		 
		 object oHorseWP1b=GetWaypointByTag("WP_" + sCreature + "2_01");
		 object oHorseWP3b=GetWaypointByTag("WP_" + sCreature + "2_03");
		 object oHorseWP5b=GetWaypointByTag("WP_" + sCreature + "2_05");
		 object oHorseWP6b=GetWaypointByTag("WP_" + sCreature + "2_06");
		 object oHorseWP7b=GetWaypointByTag("WP_" + sCreature + "2_07");
		 object oHorseWP9b=GetWaypointByTag("WP_" + sCreature + "2_09");
		 object oHorseWP11b=GetWaypointByTag("WP_" + sCreature + "2_11");
		 object oHorseWP12b=GetWaypointByTag("WP_" + sCreature + "2_12");
		 
		 ActionSpeakString("*Horses clomp up stairs at the back of the big top*", TALKVOLUME_TALK);
		 		 
		 DelayCommand(2.0, PlayAnimation(ANIMATION_LOOPING_DRUMPLAY, 1.0, 3.0));
		 DelayCommand(5.0, ActionSpeakString("Hup, my beauties! Over the fence!", TALKVOLUME_TALK));
		 
		 DelayCommand(3.0, AssignCommand(oHorse, ActionForceMoveToObject(oGateIn, TRUE, 1.0)));
		 DelayCommand(5.0, AssignCommand(oHorse, ActionJumpToObject(oHorseWP1, TRUE)));
		 DelayCommand(3.5, AssignCommand(oHorse2, ActionForceMoveToObject(oGateIn, TRUE, 1.0)));
		 DelayCommand(5.5, AssignCommand(oHorse2, ActionJumpToObject(oHorseWP11b, TRUE)));
		 
		 DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse, 120.0));
		 DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse2, 120.0));
		 DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse3, 120.0));
		 DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse4, 120.0));
		 
		 //Horse
		 DelayCommand(5.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP1, TRUE, 1.0)));
		 DelayCommand(7.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(9.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP5, TRUE, 1.0)));
		 DelayCommand(11.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(13.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP7, TRUE, 1.0)));
		 DelayCommand(15.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(17.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP11, TRUE, 1.0)));
		 DelayCommand(19.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(21.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP1, TRUE, 1.0)));
		 DelayCommand(23.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(25.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP5, TRUE, 1.0)));
		 DelayCommand(27.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(29.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP7, TRUE, 1.0)));
		 DelayCommand(31.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(33.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP11, TRUE, 1.0)));
		 DelayCommand(35.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(37.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(39.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(41.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(43.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(45.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(47.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(49.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(51.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(53.0, AssignCommand(oHorse, SetFacing(DIRECTION_NORTH)));
		 DelayCommand(60.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(62.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(64.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(66.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(68.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 
		 	 
		 //Horse2
		 DelayCommand(5.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP11b, TRUE, 1.0)));
		 DelayCommand(7.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(9.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP7b, TRUE, 1.0)));
		 DelayCommand(11.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(13.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP5b, TRUE, 1.0)));
		 DelayCommand(15.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(17.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP1b, TRUE, 1.0)));
		 DelayCommand(19.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP12b, TRUE, 1.0)));
		 DelayCommand(21.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP11b, TRUE, 1.0)));
		 DelayCommand(23.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(25.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP7b, TRUE, 1.0)));
		 DelayCommand(27.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(29.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP5b, TRUE, 1.0)));
		 DelayCommand(31.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(33.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP1b, TRUE, 1.0)));
		 DelayCommand(35.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(37.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP12b, TRUE, 1.0)));
		 DelayCommand(39.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(41.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP12b, TRUE, 1.0)));
		 DelayCommand(43.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(45.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP12b, TRUE, 1.0)));
		 DelayCommand(47.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(49.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP12b, TRUE, 1.0)));
		 DelayCommand(51.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(53.0, AssignCommand(oHorse2, SetFacing(DIRECTION_NORTH)));
		 DelayCommand(60.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(62.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12b, TRUE, 1.0)));
		 DelayCommand(64.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(66.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(68.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 
		 //Horse 3
		 DelayCommand(27.0, AssignCommand(oHorse3, ActionJumpToObject(oHorseWP1b, TRUE)));
		 DelayCommand(29.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(31.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP5b, TRUE, 1.0)));
		 DelayCommand(33.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(35.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP7b, TRUE, 1.0)));
		 DelayCommand(37.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(39.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(41.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(43.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(45.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(47.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(49.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(51.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(53.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(54.0, AssignCommand(oHorse3, SetFacing(DIRECTION_NORTH)));
		 DelayCommand(60.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12b, TRUE, 1.0)));
		 DelayCommand(62.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP3b, TRUE, 1.0)));
		 DelayCommand(64.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6b, TRUE, 1.0)));
		 DelayCommand(66.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP9b, TRUE, 1.0)));
		 DelayCommand(68.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12b, TRUE, 1.0)));
		 		 
		 //Horse4
		 DelayCommand(27.0, AssignCommand(oHorse4, ActionJumpToObject(oHorseWP11, TRUE)));
		 DelayCommand(29.0, AssignCommand(oHorse4, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(31.0, AssignCommand(oHorse4, ActionForceMoveToObject(oHorseWP7, TRUE, 1.0)));
		 DelayCommand(33.0, AssignCommand(oHorse4, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(35.0, AssignCommand(oHorse4, ActionForceMoveToObject(oHorseWP5, TRUE, 1.0)));
		 DelayCommand(37.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(39.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(41.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(43.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(45.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(47.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(49.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(51.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(53.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(54.0, AssignCommand(oHorse3, SetFacing(DIRECTION_NORTH)));
		 DelayCommand(60.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 DelayCommand(62.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP9, TRUE, 1.0)));
		 DelayCommand(64.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(66.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP3, TRUE, 1.0)));
		 DelayCommand(68.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP6, TRUE, 1.0)));
		 		 
		 
		 
		 DelayCommand(75.0, ActionSpeakString("Hup, my beauties! Back to your stall for well-deserved hay and rubdowns!", TALKVOLUME_TALK));
		 
		 DelayCommand(81.0, AssignCommand(oHorse, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(82.0, AssignCommand(oHorse2, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(83.0, AssignCommand(oHorse3, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 DelayCommand(84.0, AssignCommand(oHorse4, ActionForceMoveToObject(oHorseWP12, TRUE, 1.0)));
		 
		 DelayCommand(85.0, AssignCommand(oHorse, ActionJumpToLocation(lCreate)));
		 DelayCommand(86.0, AssignCommand(oHorse2, ActionJumpToLocation(lCreate)));
		 DelayCommand(87.0, AssignCommand(oHorse3, ActionJumpToLocation(lCreate)));
		 DelayCommand(88.0, AssignCommand(oHorse4, ActionJumpToLocation(lCreate)));
		 
		 
		 DelayCommand(90.0, ActionSpeakString("*The horses leap the fence with tossing manes and nickers of excitement. Hooves thud as they descend a flight of steps at the back of the tent.*", TALKVOLUME_TALK));
		 
		 DestroyObject(oHorse, 91.0);
		 DestroyObject(oHorse2, 91.5);
		 DestroyObject(oHorse3, 92.0);
		 DestroyObject(oHorse4, 92.5);
		 DelayCommand(95.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 5.0)));
		 }
		
	
	//Tiger Tamer
	if(GetTag(OBJECT_SELF) == "003_cr_circus_master_tigers")
		{object oTiger_Trick1WP = GetWaypointByTag("tiger_trick1_wp");
		 object oTiger_Trick2WP = GetWaypointByTag("tiger_trick2_wp");
		 object oTiger_Trick3WP = GetWaypointByTag("tiger_trick3_wp");
		 object oTiger_Trick4WP = GetWaypointByTag("tiger_trick4_wp");
		 object oTiger_Trick5WP = GetWaypointByTag("tiger_trick5_wp");
		 object oTiger_Trick6WP = GetWaypointByTag("tiger_trick6_wp");
		 object oTiger_Trick7WP = GetWaypointByTag("tiger_trick7_wp");
		 object oTiger_Trick8WP = GetWaypointByTag("tiger_trick8_wp");
		 object oTiger_Trick9WP = GetWaypointByTag("tiger_trick9_wp");
		 object oTiger_Trick2 = GetObjectByTag("tiger_trick2",0);
		 object oTiger_Trick3 = GetObjectByTag("tiger_trick3",0);
		 object oTigerWaterRope = GetObjectByTag("tiger_water_rope");
		 object oTigerWater1WP = GetWaypointByTag("tiger_water1_wp");
		 object oTigerWater2WP = GetWaypointByTag("tiger_water2_wp");
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick2, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick3, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick2WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick3WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick4WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick5WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick6WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick7WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick8WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_litfire",oTiger_Trick9WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_fx_waterwall_l_y",oTigerWater1WP, 1));
		 DestroyObject(GetNearestObjectByTag("circus_fx_waterwall_l_y",oTigerWater2WP, 1));
		 int nIncrement= GetLocalInt(OBJECT_SELF, "nIncrement");
		 
		 if(nIncrement == 0)
		 {
			 if(WillSave(oPC, 18, SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF))
			 	{DelayCommand(10.0, SendMessageToPC(oPC, "You see through this charlaton! His show is all illusion. The tigers are house cats under an illusion, chasing strings of toys dragged before them by carnival workers hidden beneath the floor!"));}
			 		 
			 string sCreature = GetLocalString(OBJECT_SELF, "circus_master");
			 location lCreate = GetLocation(GetWaypointByTag(sCreature + "_create"));
			 object oTiger = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
			 object oTiger2 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
			 object oTiger3 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
			 object oTiger4 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
			 object oTiger5 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
			 object oLadderUp = GetWaypointByTag("003_plc_circus_ladder_east_dn_WP");
			 object oLadderTop = GetWaypointByTag("003_plc_circus_ladder_east_up_WP");
			 object oMasterStand = GetWaypointByTag("tiger_master_stand");
			 object oTiger1WP = GetWaypointByTag("tiger1_wp");
			 object oTiger2WP = GetWaypointByTag("tiger2_wp");
			 object oTiger3WP = GetWaypointByTag("tiger3_wp");
			 object oTiger4WP = GetWaypointByTag("tiger4_wp");
			 object oTiger5WP = GetWaypointByTag("tiger5_wp");
			 object oTiger6WP = GetWaypointByTag("tiger6_wp");
			 
			 ActionSpeakString("*Tigers slink up a flight of stairs at the back of the big top*", TALKVOLUME_TALK);
			
			 DelayCommand(2.0, AssignCommand(OBJECT_SELF, ActionForceMoveToObject(oLadderUp, FALSE, 1.0)));
			 DelayCommand(4.0, AssignCommand(OBJECT_SELF, ActionJumpToObject(oLadderTop, TRUE)));
			 DelayCommand(5.0, AssignCommand(OBJECT_SELF, ActionForceMoveToObject(oMasterStand, FALSE, 1.0)));
			 DelayCommand(6.0, SetFacing(DIRECTION_SOUTH));
			 
			
			 DelayCommand(3.0, AssignCommand(oTiger, ActionForceMoveToObject(oTiger1WP, FALSE, 0.5)));
			 DelayCommand(3.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger2WP, FALSE, 0.5)));
			 DelayCommand(3.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger3WP, FALSE, 0.5)));
			 DelayCommand(3.0, AssignCommand(oTiger4, ActionForceMoveToObject(oTiger4WP, FALSE, 0.5)));
			 DelayCommand(3.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger5WP, FALSE, 0.5)));
			 DelayCommand(4.5, AssignCommand(oTiger, ActionJumpToObject(oTiger1WP, TRUE)));
			 DelayCommand(5.0, AssignCommand(oTiger2, ActionJumpToObject(oTiger2WP, TRUE)));
			 DelayCommand(5.5, AssignCommand(oTiger3, ActionJumpToObject(oTiger3WP, TRUE)));
			 DelayCommand(6.0, AssignCommand(oTiger4, ActionJumpToObject(oTiger4WP, TRUE)));
			 DelayCommand(6.5, AssignCommand(oTiger5, ActionJumpToObject(oTiger5WP, TRUE)));
			  
			 DelayCommand(7.0, ActionSpeakString("*Cracks whip*. Dangerous and deadly are these fanged beasts!", TALKVOLUME_TALK));
			 
			 DelayCommand(11.0, PlaySound("as_an_bearwolf1", FALSE));
			 DelayCommand(15.0, PlaySound("as_an_bearwolf2", FALSE));
			 DelayCommand(20.0, ActionSpeakString("*Cracks whip*. But not for me!", TALKVOLUME_TALK));
			 DelayCommand(21.0, PlaySound("as_an_bearwolf3", FALSE));
			 
			 DelayCommand(25.0, AssignCommand(oTiger, ActionJumpToObject(oTiger1WP, TRUE)));
			 DelayCommand(25.0, AssignCommand(oTiger2, ActionJumpToObject(oTiger2WP, TRUE)));
			 DelayCommand(25.0, AssignCommand(oTiger3, ActionJumpToObject(oTiger3WP, TRUE)));
			 DelayCommand(25.0, AssignCommand(oTiger4, ActionJumpToObject(oTiger4WP, TRUE)));
			 DelayCommand(25.0, AssignCommand(oTiger5, ActionJumpToObject(oTiger5WP, TRUE)));
			 DelayCommand(25.0, ActionSpeakString("I was raised on tiger's milk in the sands of Anauroch!", TALKVOLUME_TALK));
			 
			 DelayCommand(29.0, ActionSpeakString("I speak the language of my beasts!", TALKVOLUME_TALK));
			 DelayCommand(30.0, AssignCommand(oTiger, SetFacing(DIRECTION_SOUTH)));
			 DelayCommand(30.0, AssignCommand(oTiger2, SetFacing(DIRECTION_SOUTH)));
			 DelayCommand(30.0, AssignCommand(oTiger3, SetFacing(DIRECTION_SOUTH)));
			 DelayCommand(30.0, AssignCommand(oTiger4, SetFacing(DIRECTION_SOUTH)));
			 DelayCommand(30.0, AssignCommand(oTiger5, SetFacing(DIRECTION_SOUTH)));
			 
			 DelayCommand(34.0, ActionSpeakString("*Cracks whip*. Shadow, to your place!", TALKVOLUME_TALK));
			 DelayCommand(35.0, AssignCommand(oTiger, ActionForceMoveToObject(oTiger_Trick1WP, TRUE, 0.5)));
			 DelayCommand(36.0, AssignCommand(oTiger, SetFacing(DIRECTION_SOUTH)));
			 
			 DelayCommand(40.0, ActionSpeakString("*Cracks whip*. Redclaw, light the fire!", TALKVOLUME_TALK));
			 DelayCommand(42.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger_Trick2, FALSE, 1.0)));
			 DelayCommand(47.0, AssignCommand(oTiger2, ActionAttack(oTiger_Trick2, FALSE)));
			 DelayCommand(48.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick2))); 
			 DelayCommand(50.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger2WP, TRUE, 1.0)));
			 DelayCommand(51.0, PlaySound("as_an_bearwolf2", FALSE));
			 
			 DelayCommand(54.0, ActionSpeakString("*Cracks whip*. Stripes, light the fire!", TALKVOLUME_TALK));
			 DelayCommand(56.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger_Trick3, FALSE, 1.0)));
			 DelayCommand(59.0, AssignCommand(oTiger5, ActionAttack(oTiger_Trick3, FALSE)));
			 DelayCommand(62.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick3))); 
			 DelayCommand(63.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger5WP, TRUE, 1.0)));
			 DelayCommand(66.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick4WP))); 
			 DelayCommand(67.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick5WP))); 
			 DelayCommand(68.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick6WP))); 
			 DelayCommand(68.5, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick7WP))); 
			 DelayCommand(69.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick8WP))); 
			 DelayCommand(69.5, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick9WP))); 
			 
			 DelayCommand(75.0, AssignCommand(oTiger, ActionForceMoveToObject(oTiger1WP, TRUE, 1.0)));
			 DelayCommand(76.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger_Trick1WP, TRUE, 1.0)));
			 DelayCommand(77.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger6WP, TRUE, 1.0)));
			 DelayCommand(80.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger2WP, TRUE, 1.0)));
			 DelayCommand(81.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger_Trick1WP, TRUE, 1.0)));
			 DelayCommand(82.0, AssignCommand(oTiger4, ActionForceMoveToObject(oTiger6WP, TRUE, 1.0)));
			 DelayCommand(85.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger3WP, TRUE, 1.0)));
			 DelayCommand(86.0, AssignCommand(oTiger4, ActionForceMoveToObject(oTiger_Trick1WP, TRUE, 1.0)));
			 DelayCommand(87.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger6WP, TRUE, 1.0)));
			 DelayCommand(88.0, AssignCommand(oTiger4, ActionForceMoveToObject(oTiger4WP, TRUE, 1.0)));
			 DelayCommand(89.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger_Trick1WP, TRUE, 1.0)));
			
			 DelayCommand(90.0, AssignCommand(oTiger5, ActionJumpToLocation(GetLocation(oTiger_Trick1WP))));
			 DelayCommand(92.0, ActionSpeakString("*Cracks whip*. Si'vain, douse the flames!", TALKVOLUME_TALK));
			 DelayCommand(93.0, AssignCommand(oTiger, ActionForceMoveToObject(oTigerWaterRope, TRUE, 1.0)));
			 DelayCommand(94.0, AssignCommand(oTiger, ActionAttack(oTigerWaterRope, FALSE)));
			 DelayCommand(94.0, AssignCommand(oTiger2, ActionAttack(oTigerWaterRope, FALSE)));
			 DelayCommand(96.0, AssignCommand(oTiger3, ActionAttack(oTigerWaterRope, FALSE)));
			 DelayCommand(96.0, AssignCommand(oTiger4, ActionAttack(oTigerWaterRope, FALSE)));
			 DelayCommand(96.0, AssignCommand(oTiger5, ActionAttack(oTigerWaterRope, FALSE)));
			 DelayCommand(97.0, ActionCreateWynPlacedEffect("circus_fx_waterwall_l_y", GetLocation(oTigerWater1WP))); 
			 DelayCommand(98.0, ActionCreateWynPlacedEffect("circus_fx_waterwall_l_y", GetLocation(oTigerWater2WP))); 
			 
			 DelayCommand(99.0, PlaySound("as_an_bearwolf3", FALSE));
			 
			 DelayCommand(100.0, SetLocalInt(OBJECT_SELF, "nIncrement", 1));
			 DelayCommand(101.0, ExecuteScript("circus_npc_conv_execute2", OBJECT_SELF));
			 
			 DelayCommand(105.0, PlaySound("as_an_bearwolf2", FALSE));
			 
			 DelayCommand(105.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger5WP, TRUE, 1.0)));
			 		 
			 DelayCommand(106.0, AssignCommand(oTiger, SetFacing(DIRECTION_SOUTH)));
			 DelayCommand(106.0, AssignCommand(oTiger2, SetFacing(DIRECTION_SOUTH)));
			 DelayCommand(106.0, AssignCommand(oTiger3, SetFacing(DIRECTION_SOUTH)));
			 DelayCommand(106.0, AssignCommand(oTiger4, SetFacing(DIRECTION_SOUTH)));
			 DelayCommand(106.0, AssignCommand(oTiger5, SetFacing(DIRECTION_SOUTH)));
			 
			 DelayCommand(107.0, ActionSpeakString("*Back in your cage, all of you, and dine on raw meat for a show well played!", TALKVOLUME_TALK));
			 
			 DelayCommand(110.0, AssignCommand(oTiger, ActionForceMoveToLocation(GetLocation(OBJECT_SELF), FALSE, 30.0)));
			 DelayCommand(111.0, AssignCommand(oTiger2, ActionForceMoveToLocation(GetLocation(OBJECT_SELF), FALSE, 30.0)));
			 DelayCommand(112.0, AssignCommand(oTiger3, ActionForceMoveToLocation(GetLocation(OBJECT_SELF), FALSE, 30.0)));
			 DelayCommand(113.0, AssignCommand(oTiger4, ActionForceMoveToLocation(GetLocation(OBJECT_SELF), FALSE, 30.0)));
			 DelayCommand(114.0, AssignCommand(oTiger5, ActionForceMoveToLocation(GetLocation(OBJECT_SELF), FALSE, 30.0)));
			 
			 DelayCommand(115.0, ActionSpeakString("*They slip down a flight of stairs and dwindle more quickly than beasts of that size should.", TALKVOLUME_TALK));
			 DelayCommand(116.0, AssignCommand(oTiger, ActionForceMoveToLocation(lCreate, FALSE, 30.0)));
			 DelayCommand(117.0, AssignCommand(oTiger2, ActionForceMoveToLocation(lCreate, FALSE, 30.0)));
			 DelayCommand(118.0, AssignCommand(oTiger3, ActionForceMoveToLocation(lCreate, FALSE, 30.0)));
			 DelayCommand(119.0, AssignCommand(oTiger4, ActionForceMoveToLocation(lCreate, FALSE, 30.0)));
			 DelayCommand(120.0, AssignCommand(oTiger5, ActionForceMoveToLocation(lCreate, FALSE, 30.0)));
			 DelayCommand(121.0, AssignCommand(oTiger, ActionJumpToLocation(lCreate)));
			 DelayCommand(122.0, AssignCommand(oTiger2, ActionJumpToLocation(lCreate)));
			 DelayCommand(123.0, AssignCommand(oTiger3, ActionJumpToLocation(lCreate)));
			 DelayCommand(124.0, AssignCommand(oTiger4, ActionJumpToLocation(lCreate)));
			 DelayCommand(125.0, AssignCommand(oTiger5, ActionJumpToLocation(lCreate)));
			 
			 DestroyObject(oTiger, 126.0);
			 DestroyObject(oTiger2, 127.0);
			 DestroyObject(oTiger3, 128.0);
			 DestroyObject(oTiger4, 129.0);
			 DestroyObject(oTiger5, 130.0);
			 DelayCommand(131.0, AssignCommand(OBJECT_SELF, ActionForceMoveToLocation(GetLocation(oLadderTop))));
			 DelayCommand(132.0, AssignCommand(OBJECT_SELF, ActionJumpToObject(oLadderUp, TRUE)));
			 DelayCommand(133.0, SetFacing(DIRECTION_SOUTH));
			 DelayCommand(134.0, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 1.0));
		     }
			else
				{SetLocalInt(OBJECT_SELF, "nIncrement", 0);}
		 }
	
}			 			 