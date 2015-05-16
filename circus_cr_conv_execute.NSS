//Conversation driven for all circus acts  
//Wynna May 2015


#include "acr_creature_i"


void ActionCreateWyn(string sCreature, location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, sCreature, lLoc);
}

void ActionCreateWynPlace(string sPlace, location lLocPlace)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, sPlace, lLocPlace);
}

void main()
{
	object oPC = GetPCSpeaker();
	
	int nPerformRandom = Random(21);
	ActionSpeakString("*OOC: The performer rolls " + IntToString(nPerformRandom) + " on a Perform Check for this performance.*", TALKVOLUME_TALK);

	
		// Fire Breather	
	if(GetTag(OBJECT_SELF) == "003_cr_circus_fire_breath")
		{object oBrazier = GetNearestObjectByTag("003_plc_brazier", OBJECT_SELF, 1);
		 location lBrazier = GetLocation(oBrazier);
		 object oTorch = GetNearestObjectByTag("003_plc_torch", OBJECT_SELF, 1);
		 location lTorch = GetLocation(oTorch);
		 object oCandle = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 1);
		 location lCandle = GetLocation(oCandle);
		 object oCandle2 = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 2);
		 location lCandle2 = GetLocation(oCandle2);
		 object oCandle3 = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 3);
		 location lCandle3 = GetLocation(oCandle3);
		 object oCandle4 = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 4);
		 location lCandle4 = GetLocation(oCandle4);
		 object oCandle5 = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 5);
		 location lCandle5 = GetLocation(oCandle5);
		 int nSpell=10;
		 
		 ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK, 1.0, 2.0);
		 DelayCommand(2.0, ActionCastSpellAtObject(nSpell, oBrazier, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(4.0, ActionCreateWynPlace("003_plc_brazier_lit" , GetLocation(oBrazier)));
		 DelayCommand(5.0, ActionCastSpellAtObject(nSpell, oTorch, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(6.0, ActionCreateWynPlace("003_plc_torch_lit" , GetLocation(oTorch)));
		 DelayCommand(8.0, ActionCastSpellAtObject(nSpell, oCandle, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(9.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle)));
		 DelayCommand(9.0, ActionCastSpellAtObject(nSpell, oCandle2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(9.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle2)));
		 DelayCommand(10.0, ActionCastSpellAtObject(nSpell, oCandle3, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(9.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle3)));
		 DelayCommand(11.0, ActionCastSpellAtObject(nSpell, oCandle4, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(9.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle4)));
		 DelayCommand(12.0, ActionCastSpellAtObject(nSpell, oCandle5, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(9.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle5)));
		 DelayCommand(15.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 5.0)));
		 DelayCommand(17.0, ActionSpeakString("*Offers a wordless bow, coughing up smoke*", TALKVOLUME_TALK));
		 }
		
	//Fortune Teller
    if(GetTag(OBJECT_SELF) == "003_cr_circus_waterweird")
        {if(GetLocalString(GetArea(OBJECT_SELF), GetName(oPC)) != GetName(oPC))
			{SetLocalString(GetArea(OBJECT_SELF), GetName(oPC), GetName(oPC));
		 	 string sDie = "a peaceful death in your old age, surrounded by loved ones.";
			 int nDie = Random(21);
			 
			 if(nDie==1)
			 	{sDie="in battle, winning glory for your cause.";}
			 if(nDie==2)
			 	{sDie="a poor man's death, choking on not enough to eat and buried in a paupers grave.";}
			 if(nDie==3)
			 	{sDie="to a bandit's blade in your heart on a dark country road.";}
			 if(nDie==4)
			 	{sDie="by a thief's blade across your throat in a fetid alley of a crowded city.";}
			 if(nDie==5)
			 	{sDie="of a broken heart, wasting away for love unrequited.";}
			 if(nDie==6)
			 	{sDie="a gruesome death of decapitation, with your head mounted on a pike above enemy gates.";}
			 if(nDie==7)
			 	{sDie="in a cannibal's cookpot, with tribal shamen dancing around the flames.";}
			 if(nDie==8)
			 	{sDie="by an act of a deity to whom you gave your faith.";}
			 if(nDie==9)
			 	{sDie="by treachery, from betrayal unlooked for.";}
			 if(nDie==10)
			 	{sDie="by hanging, stretching your neck on a magistrate's rope.";}
			 if(nDie==11)
			 	{sDie="in a fall, plummeting from a height to your death on rocks below.";}
			 if(nDie==12)
			 	{sDie="by drowning, choking on seawater while Umberlee laughs and the wreckage of a ship sinks beneath the waves.";}
			 if(nDie==13)
			 	{sDie="by fire, skin charring, fat melting, bones cracking in the heat before blessed oblivion claims you.";}
			 if(nDie==14)
			 	{sDie="only to rise again, cursed undead for your acts.";}
			 if(nDie==15)
			 	{sDie="lost and alone, with no one to mark your passing, nor bury your remains.";}
			 if(nDie==16)
			 	{sDie="by freezing, shivering your last on a floe of ice as your blood congeals and frost forms on your eyes.";}
			 if(nDie==17)
			 	{sDie="by quicksand, sinking into the shifting sands as they close overhead, with your struggles only serving to bring the sands pouring onto your head.";}
			 if(nDie==18)
			 	{sDie="of disease, coughing up blood and covered in festering boils.";}
			 if(nDie==19)
			 	{sDie="by poison, delivered in a draught by the hand of one you thought a friend.";}
			 if(nDie==20)
			 	{sDie="to hungry nature, your flesh feeding the flesh of creatures less civilized.";}
			 
			 DelayCommand(2.0, ActionSpeakString("Let me gaze into the waters of your soul.", TALKVOLUME_TALK));
			 DelayCommand(3.0, ActionSpeakString("I see death. Death comes to all, but to some sooner than others. You shall die...", TALKVOLUME_TALK));
			 DelayCommand(8.0, ActionSpeakString(sDie, TALKVOLUME_TALK));
		  }
		 else
		 	{DelayCommand(2.0, ActionSpeakString("I cannot change the fate I have already seen for you.", TALKVOLUME_TALK));}
		}
 
	// Juggler	
	if(GetTag(OBJECT_SELF) == "003_cr_circus_juggler")
		{ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 30.0);
		 object oJuggle1=GetWaypointByTag("circus_juggle1");
		 location lJuggle;
		 location lJuggle1=GetLocation(oJuggle1);
		 object oJuggle2=GetWaypointByTag("circus_juggle2");
		 location lJuggle2=GetLocation(oJuggle2);
		 object oJuggle3=GetWaypointByTag("circus_juggle3");
		 location lJuggle3=GetLocation(oJuggle3);
		 object oJuggle4=GetWaypointByTag("circus_juggle4");
		 location lJuggle4=GetLocation(oJuggle4);
		 object oJuggle5=GetWaypointByTag("circus_juggle5");
		 location lJuggle5=GetLocation(oJuggle5);
		 int nIncrement= 1 + GetLocalInt(OBJECT_SELF, "nIncrement");
		 SetLocalInt(OBJECT_SELF, "nIncrement", nIncrement);
		 DestroyObject(GetObjectByTag("circus_juggle_bottle", 0));
		 if(nIncrement < 6)
		 	{if(nIncrement=1)
				{lJuggle=lJuggle1;}
			 if(nIncrement=2)
				{lJuggle=lJuggle2;}
			 if(nIncrement=3)
				{lJuggle=lJuggle3;}
			 if(nIncrement=4)
				{lJuggle=lJuggle4;}
			 if(nIncrement=5)
				{lJuggle=lJuggle5;}
			 ActionCreateWynPlace("circus_juggle_bottle", lJuggle);
			 DelayCommand(2.0, ExecuteScript("circus_cr_conv_execute", OBJECT_SELF));
			 }
		else
			{SetLocalInt(OBJECT_SELF, "nIncrement", 0);}
		
		}			
		
	//Magician
	if(GetTag(OBJECT_SELF) == "003_cr_circus_magician")
		{object oTarget = GetObjectByTag("circus_magician_target", 0);
		 int nSpellShield=417;
		 int nSpellGlobe=65;
		 int nSpellGate =63;
		 int nSpellColor =24;
		 int nSpellSound =167;
		 int nSpellBurning =10;
		 int nSpellMM =107;
		 int nSpellLightning =101;
		 int nSpellPrism =135;
		 int nSpellQuake =426;
		 int nSpellIce =368;
		 int nSpellFlamewall =191;
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

	//Dancing Bear
    if(GetTag(OBJECT_SELF) == "003_cr_circus_master_bears")
        {string sCreature = GetLocalString(OBJECT_SELF, "circus_master");
		 object oBear = GetNearestObjectByTag(sCreature, OBJECT_SELF, 1);
		 object oBearWP1 = GetWaypointByTag("dancing_bear1_wp");
		 object oBearWP2 = GetWaypointByTag("dancing_bear2_wp");
		 object oBearWP3 = GetWaypointByTag("dancing_bear3_wp");
		 object oBearWP4 = GetWaypointByTag("dancing_bear4_wp");
		 object oBearWP5 = GetWaypointByTag("dancing_bear5_wp");
		 DelayCommand(1.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 2.0)));
		 
		 DelayCommand(2.0, AssignCommand(oBear, ActionMoveToObject(oBearWP2, FALSE, 1.0)));
		 DelayCommand(3.0, AssignCommand(oBear, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(4.0, AssignCommand(oBear, ActionMoveToObject(oBearWP4, FALSE, 1.0)));
		 DelayCommand(5.0, AssignCommand(oBear, ActionMoveToObject(oBearWP5, FALSE, 1.0)));
		 DelayCommand(6.0, AssignCommand(oBear, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(7.0, AssignCommand(oBear, ActionAttack(oBearWP3)));
		 DelayCommand(8.0, AssignCommand(oBear, ActionMoveToObject(oBearWP1, FALSE, 1.0)));
		 DelayCommand(10.0, AssignCommand(oBear, ActionMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(11.0, AssignCommand(oBear, SetFacing(DIRECTION_SOUTH, FALSE)));
		 
		 DelayCommand(2.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP4, FALSE, 1.0)));
		 DelayCommand(3.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(4.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP2, FALSE, 1.0)));
		 DelayCommand(5.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP5, FALSE, 1.0)));
		 DelayCommand(6.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(7.0, AssignCommand(OBJECT_SELF, ActionAttack(oBearWP3)));
		 DelayCommand(10.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(11.0, AssignCommand(OBJECT_SELF, SetFacing(DIRECTION_NORTH, FALSE)));
		 DelayCommand(12.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 5.0)));
		 
		 DelayCommand(12.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(13.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(15.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_STANDUP, 1.0, 2.0)));
		 DelayCommand(16.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(17.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(18.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(19.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(20.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(20.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(21.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(21.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(22.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(22.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(23.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_STANDUP, 1.0, 2.0)));
		 DelayCommand(23.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(24.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(24.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(25.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(25.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 
		 DelayCommand(26.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP2, FALSE, 1.0)));
		 DelayCommand(28.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(30.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP4, FALSE, 1.0)));
		 DelayCommand(32.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP5, FALSE, 1.0)));
		 DelayCommand(34.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBear, FALSE, 1.0)));
		 DelayCommand(36.0, AssignCommand(OBJECT_SELF, ActionAttack(oBearWP3)));
		 DelayCommand(41.0, AssignCommand(OBJECT_SELF, SetFacing(DIRECTION_SOUTH, FALSE)));
		 DelayCommand(42.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 5.0)));
		 
		 DelayCommand(26.0, AssignCommand(oBear, ActionMoveToObject(oBearWP4, FALSE, 1.0)));
		 DelayCommand(28.0, AssignCommand(oBear, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(30.0, AssignCommand(oBear, ActionMoveToObject(oBearWP2, FALSE, 1.0)));
		 DelayCommand(32.0, AssignCommand(oBear, ActionMoveToObject(oBearWP5, FALSE, 1.0)));
		 DelayCommand(34.0, AssignCommand(oBear, ActionMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(36.0, AssignCommand(oBear, ActionAttack(oBearWP3)));
		 DelayCommand(38.0, AssignCommand(oBear, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(40.0, AssignCommand(oBear, ActionMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(41.0, AssignCommand(oBear, SetFacing(DIRECTION_NORTH, FALSE)));
		 
		 DelayCommand(44.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(44.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(45.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(45.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(46.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(46.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(47.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_STANDUP, 1.0, 2.0)));
		 DelayCommand(47.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(48.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(48.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(49.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(49.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 
		 DelayCommand(50.0, AssignCommand(oBear, ActionMoveToObject(oBearWP2, FALSE, 1.0)));
		 DelayCommand(52.0, AssignCommand(oBear, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(54.0, AssignCommand(oBear, ActionMoveToObject(oBearWP4, FALSE, 1.0)));
		 DelayCommand(56.0, AssignCommand(oBear, ActionMoveToObject(oBearWP5, FALSE, 1.0)));
		 DelayCommand(58.0, AssignCommand(oBear, ActionMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(60.0, AssignCommand(oBear, ActionAttack(oBearWP3)));
		 DelayCommand(62.0, AssignCommand(oBear, ActionMoveToObject(oBearWP1, FALSE, 1.0)));
		 DelayCommand(63.0, AssignCommand(oBear, SetFacing(DIRECTION_SOUTH, FALSE)));
		 
		 DelayCommand(50.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP4, FALSE, 1.0)));
		 DelayCommand(52.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(54.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP2, FALSE, 1.0)));
		 DelayCommand(56.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP5, FALSE, 1.0)));
		 DelayCommand(58.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBear, FALSE, 1.0)));
		 DelayCommand(60.0, AssignCommand(OBJECT_SELF, ActionAttack(oBearWP3)));
		 DelayCommand(62.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(63.0, AssignCommand(OBJECT_SELF, SetFacing(DIRECTION_NORTH, FALSE)));
		 DelayCommand(64.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 5.0)));
		 
		 DelayCommand(65.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 5.0)));
		 DelayCommand(67.0, ActionSpeakString("Our waltz is over; our dance card empty. Another coin buys another dance!", TALKVOLUME_TALK));
		 }
	
	//Horse Trainer
	if(GetTag(OBJECT_SELF) == "003_cr_circus_master_horses")
		{string sCreature = GetLocalString(OBJECT_SELF, "circus_master");
		 location lCreate = GetLocation(GetWaypointByTag(sCreature + "_create"));
		 object oGateIn = GetObjectByTag("big_top_west_north", 0);
		 effect eSpeedUp = EffectMovementSpeedIncrease(75);
		 object oHorse = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oHorse2 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oHorse3 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oHorse4 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oHorse5 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 DelayCommand(2.0, PlayAnimation(ANIMATION_LOOPING_DRUMPLAY, 1.0, 30.0));
		 DelayCommand(2.0, ActionSpeakString("Hup, my beauties! Over the fence! *One by one, the horses leap the fence, in perfect formation.*", TALKVOLUME_TALK));
		 
		 DelayCommand(3.0, AssignCommand(oHorse, ActionForceMoveToObject(oGateIn, TRUE, 1.0)));
		 DelayCommand(5.0, AssignCommand(oHorse, ActionJumpToObject(OBJECT_SELF, TRUE)));
		 DelayCommand(3.5, AssignCommand(oHorse2, ActionForceMoveToObject(oGateIn, TRUE, 1.0)));
		 DelayCommand(5.5, AssignCommand(oHorse2, ActionJumpToObject(OBJECT_SELF, TRUE)));
		 DelayCommand(4.0, AssignCommand(oHorse3, ActionForceMoveToObject(oGateIn, TRUE, 1.0)));
		 DelayCommand(6.0, AssignCommand(oHorse3, ActionJumpToObject(OBJECT_SELF, TRUE)));
		 DelayCommand(4.5, AssignCommand(oHorse4, ActionForceMoveToObject(oGateIn, TRUE, 1.0)));
		 DelayCommand(6.5, AssignCommand(oHorse4, ActionJumpToObject(OBJECT_SELF, TRUE)));
		 DelayCommand(5.0, AssignCommand(oHorse5, ActionForceMoveToObject(oGateIn, TRUE, 1.0)));
		 DelayCommand(7.0, AssignCommand(oHorse5, ActionJumpToObject(OBJECT_SELF, TRUE)));
		 
		 DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse, 120.0));
		 DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse2, 120.0));
		 DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse3, 120.0));
		 DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse4, 120.0));
		 DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpeedUp, oHorse5, 120.0));
		 
		 DelayCommand(118.0, AssignCommand(oHorse, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 DelayCommand(118.5, AssignCommand(oHorse2, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 DelayCommand(119.0, AssignCommand(oHorse3, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 DelayCommand(119.5, AssignCommand(oHorse4, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 DelayCommand(120.0, AssignCommand(oHorse5, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 
		 DelayCommand(120.0, ActionSpeakString("Hup, my beauties! Back to your stall for well-deserved hay and rubdowns!", TALKVOLUME_TALK));
		 DelayCommand(125.0, ActionSpeakString("*The horses leap the fence with tossing manes and nickers of excitement. Hooves thud as they descend a flight of steps at the back of the tent.*", TALKVOLUME_TALK));
		 
		 DestroyObject(oHorse, 125.0);
		 DestroyObject(oHorse2, 125.5);
		 DestroyObject(oHorse3, 126.0);
		 DestroyObject(oHorse4, 126.5);
		 DestroyObject(oHorse5, 127.0);
		 }
		
	//Snake Charmer
	if(GetTag(OBJECT_SELF) == "003_cr_circus_master_snakes")
		{string sCreature = GetLocalString(OBJECT_SELF, "circus_master");
		 string sCreature2 = GetLocalString(OBJECT_SELF, "circus_master2");
		 location lCreate = GetLocation(GetWaypointByTag(sCreature + "_create"));
		 object oSnake=CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oSnake2=CreateObject(OBJECT_TYPE_CREATURE, sCreature2, lCreate);
		 DelayCommand(2.0, ActionSpeakString("Dance, my pets.", TALKVOLUME_TALK));
		 DelayCommand(3.0, PlayAnimation(ANIMATION_LOOPING_FLUTEPLAY, 1.0, 25.0));
		 
		 DelayCommand(5.0, AssignCommand(oSnake, ActionAttack(oSnake2)));
		 DelayCommand(6.0, AssignCommand(oSnake2, ActionAttack(oSnake)));
		 DelayCommand(7.0, AssignCommand(oSnake, ActionAttack(oSnake2)));
		 DelayCommand(8.0, AssignCommand(oSnake2, ActionAttack(oSnake)));
		 DelayCommand(9.0, AssignCommand(oSnake, ActionAttack(oSnake2)));
		 DelayCommand(10.0, AssignCommand(oSnake2, ActionAttack(oSnake)));
		 
		 DelayCommand(25.0, AssignCommand(oSnake, ActionAttack(oSnake2)));
		 DelayCommand(26.0, AssignCommand(oSnake2, ActionAttack(oSnake)));
		 DelayCommand(27.0, AssignCommand(oSnake, ActionAttack(oSnake2)));
		 DelayCommand(28.0, AssignCommand(oSnake2, ActionAttack(oSnake)));
		 DelayCommand(29.0, AssignCommand(oSnake, ActionAttack(oSnake2)));
		 DelayCommand(30.0, AssignCommand(oSnake2, ActionAttack(oSnake)));
		 
		 DelayCommand(31.0, AssignCommand(oSnake, ActionForceMoveToLocation(lCreate, FALSE, 30.0)));
		 DelayCommand(31.5, AssignCommand(oSnake2, ActionForceMoveToLocation(lCreate, FALSE, 30.0)));
		 
		 
		 DestroyObject(oSnake, 35.0);
		 DestroyObject(oSnake2, 35.0);
		 DelayCommand(31.0, ActionSpeakString("*Perhaps for more gold they might dance longer. *Unctuous grin with hand held out.*", TALKVOLUME_TALK));
		 }
		
	//Tiger Tamer
	if(GetTag(OBJECT_SELF) == "003_cr_circus_master_tigers")
		{if(WillSave(oPC, 15, SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF))
		 	{DelayCommand(10.0, SendMessageToPC(oPC, "You see through this charlaton! His show is all illusion. The tigers are house cats, chasing strings of toys dragged before them by carnival workers hidden in the obstacle course!"));}
		 
		 
		 string sCreature = GetLocalString(OBJECT_SELF, "circus_master");
		 location lCreate = GetLocation(GetWaypointByTag(sCreature + "_create"));
		 object oTiger = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oTiger2 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oTiger3 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oTiger4 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oTiger5 = CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oLadderUp = GetWaypointByTag("003_plc_circus_ladder_east_dn_WP");
		 object oLadderTop = GetWaypointByTag("003_plc_circus_ladder_east_up_WP");
		 object oTiger1WP = GetWaypointByTag("tiger1_wp");
		 object oTiger2WP = GetWaypointByTag("tiger2_wp");
		 object oTiger3WP = GetWaypointByTag("tiger3_wp");
		 object oTiger4WP = GetWaypointByTag("tiger4_wp");
		 object oTiger5WP = GetWaypointByTag("tiger5_wp");
		 object oTiger_Trick1WP = GetWaypointByTag("tiger_trick1_wp");
		 object oTiger_Trick2WP = GetWaypointByTag("tiger_trick2_wp");
		 object oTiger_Trick2 = GetObjectByTag("tiger_trick2",0);
		 object oTiger_Trick3WP = GetWaypointByTag("tiger_trick3_wp");
		 object oTiger_Trick3 = GetObjectByTag("tiger_trick3",0);
		 object oTiger_Trick4WP = GetWaypointByTag("tiger_trick4_wp");
		 object oTiger_Trick5WP = GetWaypointByTag("tiger_trick5_wp");
		 effect eHeal=EffectHeal(50);
		 
		 DelayCommand(2.0, AssignCommand(OBJECT_SELF, ActionForceMoveToObject(oLadderUp, FALSE, 1.0)));
		 DelayCommand(3.0, AssignCommand(oTiger, ActionForceMoveToObject(oTiger1WP, FALSE, 1.0)));
		 DelayCommand(3.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger2WP, FALSE, 1.0)));
		 DelayCommand(3.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger3WP, FALSE, 1.0)));
		 DelayCommand(3.0, AssignCommand(oTiger4, ActionForceMoveToObject(oTiger4WP, FALSE, 1.0)));
		 DelayCommand(3.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger5WP, FALSE, 1.0)));
		 DelayCommand(4.5, AssignCommand(OBJECT_SELF, ActionJumpToObject(oLadderTop, TRUE)));
		 
		 DelayCommand(7.0, ActionSpeakString("*Cracks whip*. Dangerous and deadly, and hard to control are these fanged beasts!", TALKVOLUME_TALK));
		 DelayCommand(12.0, AssignCommand(oTiger, ActionAttack(oTiger2, FALSE)));
		 DelayCommand(12.5, AssignCommand(oTiger2, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(12.75, AssignCommand(oTiger3, ActionAttack(oTiger2, FALSE)));
		 DelayCommand(13.0, AssignCommand(oTiger, ActionAttack(oTiger5, FALSE)));
		 DelayCommand(13.5, AssignCommand(oTiger5, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(14.0, AssignCommand(oTiger, ActionAttack(oTiger2, FALSE)));
		 DelayCommand(15.5, AssignCommand(oTiger2, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(15.75, AssignCommand(oTiger3, ActionAttack(oTiger2, FALSE)));
		 DelayCommand(16.0, AssignCommand(oTiger, ActionAttack(oTiger5, FALSE)));
		 DelayCommand(17.5, AssignCommand(oTiger5, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(20.0, ActionSpeakString("*Cracks whip*. But not for me! I was raised on tiger's milk and raw flesh in the sands of Anauroch, and I speak the language of my beasts!", TALKVOLUME_TALK));
		 
		 DelayCommand(25.0, AssignCommand(oTiger, ActionForceMoveToObject(oTiger1WP, FALSE, 1.0)));
		 DelayCommand(25.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger2WP, FALSE, 1.0)));
		 DelayCommand(25.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger3WP, FALSE, 1.0)));
		 DelayCommand(25.0, AssignCommand(oTiger4, ActionForceMoveToObject(oTiger4WP, FALSE, 1.0)));
		 DelayCommand(25.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger5WP, FALSE, 1.0)));
		 
		 DelayCommand(30.0, AssignCommand(oTiger, SetFacing(DIRECTION_SOUTH)));
		 DelayCommand(30.0, AssignCommand(oTiger2, SetFacing(DIRECTION_SOUTH)));
		 DelayCommand(30.0, AssignCommand(oTiger3, SetFacing(DIRECTION_SOUTH)));
		 DelayCommand(30.0, AssignCommand(oTiger4, SetFacing(DIRECTION_SOUTH)));
		 DelayCommand(30.0, AssignCommand(oTiger5, SetFacing(DIRECTION_SOUTH)));
		 
		 DelayCommand(34.0, ActionSpeakString("*Cracks whip*. Shadow, to your place!", TALKVOLUME_TALK));
		 DelayCommand(35.0, AssignCommand(oTiger, ActionForceMoveToObject(oTiger_Trick1WP, TRUE, 1.0)));
		 
		 DelayCommand(40.0, ActionSpeakString("*Cracks whip*. Redclaw, light the fire!", TALKVOLUME_TALK));
		 DelayCommand(42.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger_Trick2, FALSE, 1.0)));
		 DelayCommand(47.0, AssignCommand(oTiger2, ActionAttack(oTiger_Trick2, FALSE)));
		 DelayCommand(48.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick2))); 
		 DelayCommand(50.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger_Trick2WP, TRUE, 1.0)));
		 
		 DelayCommand(54.0, ActionSpeakString("*Cracks whip*. Stripes, light the fire!", TALKVOLUME_TALK));
		 DelayCommand(56.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger_Trick2, FALSE, 1.0)));
		 DelayCommand(59.0, AssignCommand(oTiger3, ActionAttack(oTiger_Trick2, FALSE)));
		 DelayCommand(62.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick3))); 
		 DelayCommand(63.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger_Trick3WP, TRUE, 1.0)));
		 DelayCommand(66.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick4WP))); 
		 DelayCommand(67.0, ActionCreateWynPlace("circus_litfire", GetLocation(oTiger_Trick5WP))); 
		 
		 
		 DelayCommand(70.0, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger_Trick4WP, FALSE, 1.0)));
		 DelayCommand(72.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger_Trick4WP, FALSE, 1.0)));
		 DelayCommand(74.0, AssignCommand(oTiger4, ActionForceMoveToObject(oTiger_Trick4WP, FALSE, 1.0)));
		 
		 
		 
		 DelayCommand(80.0, AssignCommand(oTiger4, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 DelayCommand(82.0, AssignCommand(oTiger5, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 DelayCommand(84.0, ActionSpeakString("*Cracks whip*. Back! Back! You will obey me!", TALKVOLUME_TALK));
		 
		 DelayCommand(88.0, AssignCommand(OBJECT_SELF, ActionAttack(oTiger4, FALSE)));
		 		 
		 DelayCommand(88.0, AssignCommand(oTiger, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 DelayCommand(89.0, AssignCommand(oTiger2, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 DelayCommand(90.0, AssignCommand(oTiger3, ActionForceMoveToObject(OBJECT_SELF, TRUE, 1.0)));
		 
		 DelayCommand(91.0, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(91.5, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(93.0, AssignCommand(oTiger2, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(95.0, AssignCommand(oTiger3, ActionAttack(oTiger2, FALSE)));
		 DelayCommand(96.0, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(96.5, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(97.0, AssignCommand(oTiger2, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(98.0, AssignCommand(oTiger3, ActionAttack(oTiger, FALSE)));
		 DelayCommand(99.0, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(100.5, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(101.0, AssignCommand(oTiger2, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(102.0, AssignCommand(oTiger3, ActionAttack(oTiger2, FALSE)));
		 DelayCommand(103.0, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(104.5, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(105.0, AssignCommand(oTiger2, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(105.5, AssignCommand(oTiger3, ActionAttack(oTiger, FALSE)));
		 
		 DelayCommand(106.0, ActionSpeakString("*Cracks whip into the fighting tigers*", TALKVOLUME_TALK));
		 
		 DelayCommand(108.0, AssignCommand(oTiger4, ActionForceMoveToObject(oTiger4WP, TRUE, 1.0)));
		 DelayCommand(109.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTiger5WP, TRUE, 1.0)));
		 		 
		 DelayCommand(110.0, ActionSpeakString("Cunning creatures, solitary and territorial. They are capable of fighting together to assert their dominance over me, should I ever lose my alpha status!", TALKVOLUME_TALK));
		 
		 DelayCommand(110.5, AssignCommand(oTiger, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(111.0, AssignCommand(oTiger2, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(112.0, AssignCommand(oTiger3, ActionAttack(oTiger2, FALSE)));
		 DelayCommand(115.0, AssignCommand(oTiger2, ActionAttack(oTiger3, FALSE)));
		 DelayCommand(117.0, AssignCommand(oTiger3, ActionAttack(oTiger2, FALSE)));
		 
		 DelayCommand(120.0, ActionSpeakString("*Cracks whip* But that is not today! ", TALKVOLUME_TALK));
		 
		 DelayCommand(121.0, AssignCommand(oTiger, ActionForceMoveToObject(oTiger1WP, TRUE, 1.0)));
		 DelayCommand(121.5, AssignCommand(oTiger2, ActionForceMoveToObject(oTiger2WP, TRUE, 1.0)));
		 DelayCommand(122.0, AssignCommand(oTiger3, ActionForceMoveToObject(oTiger3WP, TRUE, 1.0)));
		 
		 DelayCommand(125.0, AssignCommand(oTiger, SetFacing(DIRECTION_SOUTH)));
		 DelayCommand(125.0, AssignCommand(oTiger2, SetFacing(DIRECTION_SOUTH)));
		 DelayCommand(125.0, AssignCommand(oTiger3, SetFacing(DIRECTION_SOUTH)));
		 DelayCommand(125.0, AssignCommand(oTiger4, SetFacing(DIRECTION_SOUTH)));
		 DelayCommand(125.0, AssignCommand(oTiger5, SetFacing(DIRECTION_SOUTH)));
		 
		 DelayCommand(125.0, ActionSpeakString("*Back in your cage, all of you, and dine on raw meat for a show well played!", TALKVOLUME_TALK));
		 DelayCommand(130.0, ActionSpeakString("*The tigers stretch, all rage and fury gone. Rumbling deep-throated purrs, they stretch, one by one, luxuriously. They slip down a flight of stairs and dwindle more quickly than beasts of that size should.", TALKVOLUME_TALK));
		 
		 DelayCommand(131.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTiger));
		 DelayCommand(131.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTiger2));
		 DelayCommand(132.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTiger3));
		 DelayCommand(132.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTiger4));
		 DelayCommand(133.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTiger5));
		 
		 DelayCommand(135.0, AssignCommand(oTiger, ActionForceMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(135.5, AssignCommand(oTiger2, ActionForceMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(136.0, AssignCommand(oTiger3, ActionForceMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(136.5, AssignCommand(oTiger4, ActionForceMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(136.0, AssignCommand(oTiger5, ActionForceMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 
		 DelayCommand(145.0, AssignCommand(oTiger, ActionForceMoveToLocation(lCreate, TRUE, 1.0)));
		 DelayCommand(145.5, AssignCommand(oTiger2, ActionForceMoveToLocation(lCreate, TRUE, 1.0)));
		 DelayCommand(145.0, AssignCommand(oTiger3, ActionForceMoveToLocation(lCreate, TRUE, 1.0)));
		 DelayCommand(145.5, AssignCommand(oTiger4, ActionForceMoveToLocation(lCreate, TRUE, 1.0)));
		 DelayCommand(145.0, AssignCommand(oTiger5, ActionForceMoveToLocation(lCreate, TRUE, 1.0)));
		 
		 DestroyObject(GetObjectByTag("circus_litfire", 2), 150.0);
		 DestroyObject(GetObjectByTag("circus_litfire", 1), 151.0);
		 DestroyObject(GetObjectByTag("circus_litfire", 0), 152.0);
		 DestroyObject(oTiger, 155.0);
		 DestroyObject(oTiger2, 156.0);
		 DestroyObject(oTiger3, 157.0);
		 DestroyObject(oTiger4, 158.0);
		 DestroyObject(oTiger5, 159.0);
		 DelayCommand(160.0, AssignCommand(OBJECT_SELF, ActionJumpToObject(oLadderUp, TRUE)));
		 }
		
	//Sword Swallower
   	if(GetTag(OBJECT_SELF) == "003_cr_circus_sw_swallow")
		{ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 30.0);
		 location lSword;
		 object oSword1=GetWaypointByTag("circus_sword1");
		 location lSword1=GetLocation(oSword1);
		 object oSword2=GetWaypointByTag("circus_sword2");
		 location lSword2=GetLocation(oSword2);
		 object oSword3=GetWaypointByTag("circus_sword3");
		 location lSword3=GetLocation(oSword3);
		 object oSword4=GetWaypointByTag("circus_sword4");
		 location lSword4=GetLocation(oSword4);
		 object oSword5=GetWaypointByTag("circus_sword5");
		 location lSword5=GetLocation(oSword5);
		 int nIncrement= 1 + GetLocalInt(OBJECT_SELF, "nIncrement");
		 SetLocalInt(OBJECT_SELF, "nIncrement", nIncrement);
		 DestroyObject(GetObjectByTag("circus_sword_swallow_plc", 0));
		 if(nIncrement < 6)
		 	{if(nIncrement=1)
				{lSword=lSword1;}
			 if(nIncrement=2)
				{lSword=lSword2;}
			 if(nIncrement=3)
				{lSword=lSword3;}
			 if(nIncrement=4)
				{lSword=lSword4;}
			 if(nIncrement=5)
				{lSword=lSword5;}
			 ActionCreateWynPlace("circus_sword_swallow_plc", lSword);
			 DelayCommand(2.0, ExecuteScript("circus_cr_conv_execute", OBJECT_SELF));
			 }
		else
			{SetLocalInt(OBJECT_SELF, "nIncrement", 0);}
		}
	
DestroyObject(GetNearestObjectByTag("circus_litfire", OBJECT_SELF, 3), 160.0);					   
DestroyObject(GetNearestObjectByTag("circus_litfire", OBJECT_SELF, 2), 161.0);					   
DestroyObject(GetNearestObjectByTag("circus_litfire", OBJECT_SELF, 1), 162.0);					   
DestroyObject(GetNearestObjectByTag("003_plc_brazier_lit", OBJECT_SELF, 1), 122.0);					   
DestroyObject(GetNearestObjectByTag("003_plc_torch_lit", OBJECT_SELF, 1), 122.0);					   
DestroyObject(GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 1), 122.0);					   
DestroyObject(GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 1), 122.0);					   
DestroyObject(GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 1), 122.0);					   
DestroyObject(GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 1), 122.0);					   
DestroyObject(GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 1), 122.0);					   
	
}			 			 