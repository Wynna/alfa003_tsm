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

void ActionCreateWynPlacedEffect(string sPlacedEffect, location lLocPlace)
{
    CreateObject(OBJECT_TYPE_PLACED_EFFECT, sPlacedEffect, lLocPlace);
}

void ReallyPlayCustomAnimation(object oObject, string sAnimationName, int nLooping, float fSpeed = 1.0f)
 {
    PlayCustomAnimation(oObject, sAnimationName, nLooping, fSpeed);
 }
 
void main()
{
	object oPC = GetPCSpeaker();
		 
	if(GetLocalInt(OBJECT_SELF, "nIncrement") < 1)
		{int nPerformRandom = Random(21);
		ActionSpeakString("*OOC: The performer rolls " + IntToString(nPerformRandom) + " on a Perform Check for this performance.*", TALKVOLUME_TALK);
		}
	
		// Fire Breather	
	if(GetTag(OBJECT_SELF) == "003_cr_circus_fire_breath")
		{location lFireCast=GetLocation(GetWaypointByTag("fire_cast_wp"));
		 location lFireStart=GetLocation(GetWaypointByTag("fire_start_wp"));
		 object oBrazier = GetNearestObjectByTag("003_plc_brazier", OBJECT_SELF, 1);
		 object oBrazierLit = GetNearestObjectByTag("003_plc_brazier_lit", OBJECT_SELF, 1);
		 location lBrazier = GetLocation(oBrazier);
		 object oTorch = GetNearestObjectByTag("003_plc_torch", OBJECT_SELF, 1);
		 object oTorchLit = GetNearestObjectByTag("003_plc_torch_lit", OBJECT_SELF, 1);
		 location lTorch = GetLocation(oTorch);
		 object oCandle = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 1);
		 object oCandleLit = GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 1);
		 location lCandle = GetLocation(oCandle);
		 object oCandle2 = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 2);
		 object oCandleLit2 = GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 2);
		 location lCandle2 = GetLocation(oCandle2);
		 object oCandle3 = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 3);
		 object oCandleLit3 = GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 3);
		 location lCandle3 = GetLocation(oCandle3);
		 object oCandle4 = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 4);
		 object oCandleLit4 = GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 4);
		 location lCandle4 = GetLocation(oCandle4);
		 object oCandle5 = GetNearestObjectByTag("003_plc_candle", OBJECT_SELF, 5);
		 object oCandleLit5 = GetNearestObjectByTag("003_plc_candle_lit", OBJECT_SELF, 5);
		 location lCandle5 = GetLocation(oCandle5);
		 int nSpell=10;
		 
		 ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK, 1.0, 2.0);
		 ActionMoveToLocation(lFireCast, FALSE);
		 DestroyObject(oBrazierLit);
		 DestroyObject(oTorchLit);
		 DestroyObject(oCandleLit);
		 DestroyObject(oCandleLit2);
		 DestroyObject(oCandleLit3);
		 DestroyObject(oCandleLit4);
		 DestroyObject(oCandleLit5);
		 DelayCommand(4.0, ActionCastSpellAtObject(nSpell, oBrazier, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(5.0, ActionCreateWynPlace("003_plc_brazier_lit" , GetLocation(oBrazier)));
		 DelayCommand(7.0, ActionCastSpellAtObject(nSpell, oTorch, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(8.0, ActionCreateWynPlace("003_plc_torch_lit" , GetLocation(oTorch)));
		 DelayCommand(10.0, ActionCastSpellAtObject(nSpell, oCandle, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(11.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle)));
		 DelayCommand(13.0, ActionCastSpellAtObject(nSpell, oCandle2, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(14.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle2)));
		 DelayCommand(16.0, ActionCastSpellAtObject(nSpell, oCandle3, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(17.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle3)));
		 DelayCommand(19.0, ActionCastSpellAtObject(nSpell, oCandle4, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(20.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle4)));
		 DelayCommand(22.0, ActionCastSpellAtObject(nSpell, oCandle5, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(23.0, ActionCreateWynPlace("003_plc_candle_lit" , GetLocation(oCandle5)));
		 DelayCommand(25.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 5.0)));
		 DelayCommand(26.0, ActionSpeakString("*Offers a wordless bow, coughing up smoke*", TALKVOLUME_TALK));
		 DelayCommand(28.0, ActionMoveToLocation(lFireStart, FALSE));
		 }
		
	// Dagger Thrower	
	if(GetTag(OBJECT_SELF) == "003_cr_circus_dagger_throw")
		{location lDaggerThrow=GetLocation(GetWaypointByTag("dagger_throw_wp"));
		 location lDaggerStart=GetLocation(GetWaypointByTag("dagger_start_wp"));
		 location lBeardedStart=GetLocation(GetWaypointByTag("bearded_start_wp"));
		 location lDagger;
		 object oDagger1WP = GetWaypointByTag("circus_dagger1_wp");
		 object oDagger1 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger1WP, 1);
		 location lDagger1 = GetLocation(oDagger1WP);
		 object oDagger2WP = GetWaypointByTag("circus_dagger2_wp");
		 object oDagger2 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger2WP, 1);
		 location lDagger2 = GetLocation(oDagger2WP);
		 object oDagger3WP = GetWaypointByTag("circus_dagger3_wp");
		 object oDagger3 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger3WP, 1);
		 location lDagger3 = GetLocation(oDagger3WP);
		 object oDagger4WP = GetWaypointByTag("circus_dagger4_wp");
		 object oDagger4 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger4WP, 1);
		 location lDagger4 = GetLocation(oDagger4WP);
		 object oDagger5WP = GetWaypointByTag("circus_dagger5_wp");
		 object oDagger5 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger5WP, 1);
		 location lDagger5 = GetLocation(oDagger1WP);
		 object oDagger6WP = GetWaypointByTag("circus_dagger6_wp");
		 object oDagger6 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger6WP, 1);
		 location lDagger6 = GetLocation(oDagger6WP);
		 object oDagger7WP = GetWaypointByTag("circus_dagger7_wp");
		 object oDagger7 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger7WP, 1);
		 location lDagger7 = GetLocation(oDagger7WP);
		 object oDagger8WP = GetWaypointByTag("circus_dagger8_wp");
		 object oDagger8 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger8WP, 1);
		 location lDagger8 = GetLocation(oDagger8WP);
		 object oDagger9WP = GetWaypointByTag("circus_dagger9_wp");
		 object oDagger9 = GetNearestObjectByTag("003_plc_circus_dagger", oDagger9WP, 1);
		 location lDagger9 = GetLocation(oDagger9WP);
		  
		 object oDaggerInv = GetItemPossessedBy(OBJECT_SELF, "abr_it_wpn_dagger_as");
		 object oDaggerTarget = GetObjectByTag("003_plc_circus_target_dagger", 0);
		 object oBeardedLady = GetObjectByTag("003_cr_circus_bearded_lady", 0);
		 int nIncrement= GetLocalInt(OBJECT_SELF, "nIncrement");
		 
		 if(nIncrement==0) 
			 {
			 ActionMoveToLocation(lDaggerThrow, FALSE);
			 DelayCommand(1.0, ActionSpeakString("Are you ready, my dear?", TALKVOLUME_TALK));
		     DelayCommand(2.0, ActionUnequipItem(oDaggerInv));
			 DelayCommand(5.0, AssignCommand(oBeardedLady, ActionSpeakString("Ready!", TALKVOLUME_TALK)));
		     DelayCommand(10.0, ExecuteScript("circus_npc_conv_execute", OBJECT_SELF));
			 }
		else if((nIncrement > 0) && (nIncrement < 10)) 
			 {
			 if(nIncrement==1)
			 	{lDagger=lDagger1;}
			 if(nIncrement==2)
			 	{lDagger=lDagger2;}
			 if(nIncrement==3)
			 	{lDagger=lDagger3;}
			 if(nIncrement==4)
			 	{lDagger=lDagger4;}
			 if(nIncrement==5)
			 	{lDagger=lDagger5;}
			 if(nIncrement==6)
			 	{lDagger=lDagger6;}
			 if(nIncrement==7)
			 	{lDagger=lDagger7;}
			 if(nIncrement==8)
			 	{lDagger=lDagger8;}
			 if(nIncrement==9)
			 	{lDagger=lDagger9;}
			 ActionMoveToLocation(lDaggerThrow, FALSE);
			 SetFacing(315.0, FALSE);
			 AssignCommand(oBeardedLady, ActionMoveToLocation(lBeardedStart, FALSE));
			 AssignCommand(oBeardedLady, SetFacing(135.0, FALSE));
			 ReallyPlayCustomAnimation(OBJECT_SELF, "*1attack01", 0, 1.0f);
			 ActionWait(4.0);
			 DelayCommand(3.0, ActionCreateWynPlace("003_plc_circus_dagger" , lDagger));
			 }
		else if(nIncrement==10)
			 {DelayCommand(1.0, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 1.0));
		  	 DelayCommand(1.5, AssignCommand(oBeardedLady, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 1.0)));
		  	 DelayCommand(2.0, ActionSpeakString("Not a scratch on her, nor a hair shaved!", TALKVOLUME_TALK));
		     DelayCommand(4.0, ActionForceMoveToObject(oDaggerTarget, FALSE, 1.0));
			 }
		else if(nIncrement==11)
		 	{DestroyObject(oDagger1);
			 DestroyObject(oDagger2);
			 DestroyObject(oDagger3);
			 DestroyObject(oDagger4);
			 DestroyObject(oDagger5);
			 DestroyObject(oDagger6);
			 DestroyObject(oDagger7);
			 DestroyObject(oDagger8);
			 DestroyObject(oDagger9);
			 DestroyObject(GetNearestObjectByTag("003_plc_circus_dagger", OBJECT_SELF, 1));
			 SetLocalInt(OBJECT_SELF, "nIncrement", 0);
		 	 DelayCommand(3.0, ActionMoveToLocation(lDaggerStart, FALSE));
			 }	
		 if(nIncrement<10)
		 	{nIncrement++;
			 SetLocalInt(OBJECT_SELF, "nIncrement", nIncrement);
			 DelayCommand(6.0, ExecuteScript("circus_npc_conv_execute", OBJECT_SELF));
			 }
		 else if(nIncrement==10)
		 	{nIncrement++;
			 SetLocalInt(OBJECT_SELF, "nIncrement", nIncrement);
			 DelayCommand(10.0, ExecuteScript("circus_npc_conv_execute", OBJECT_SELF));
			 }
			 
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
			 DelayCommand(4.0, ActionSpeakString("I see death. Death comes to all, but to some sooner than others. You shall die...", TALKVOLUME_TALK));
			 DelayCommand(8.0, ActionSpeakString(sDie, TALKVOLUME_TALK));
		  }
		 else
		 	{DelayCommand(2.0, ActionSpeakString("I cannot change the fate I have already seen for you.", TALKVOLUME_TALK));}
		}
 
	// Juggler	
	if(GetTag(OBJECT_SELF) == "003_cr_circus_juggler")
		{location lJuggle;
		 object oJuggle1=GetWaypointByTag("circus_juggle1");
		 location lJuggle1=GetLocation(oJuggle1);
		 object oJuggle2=GetWaypointByTag("circus_juggle2");
		 location lJuggle2=GetLocation(oJuggle2);
		 object oJuggle3=GetWaypointByTag("circus_juggle3");
		 location lJuggle3=GetLocation(oJuggle3);
		 object oJuggle4=GetWaypointByTag("circus_juggle4");
		 location lJuggle4=GetLocation(oJuggle4);
		 object oJuggle5=GetWaypointByTag("circus_juggle5");
		 location lJuggle5=GetLocation(oJuggle5);
		 object oJuggle6=GetWaypointByTag("circus_juggle6");
		 location lJuggle6=GetLocation(oJuggle6);
		 
		 location lJuggleb;
		 object oJuggle1b=GetWaypointByTag("circus_juggle1b");
		 location lJuggle1b=GetLocation(oJuggle1b);
		 object oJuggle2b=GetWaypointByTag("circus_juggle2b");
		 location lJuggle2b=GetLocation(oJuggle2b);
		 object oJuggle3b=GetWaypointByTag("circus_juggle3b");
		 location lJuggle3b=GetLocation(oJuggle3b);
		 object oJuggle4b=GetWaypointByTag("circus_juggle4b");
		 location lJuggle4b=GetLocation(oJuggle4b);
		 object oJuggle5b=GetWaypointByTag("circus_juggle5b");
		 location lJuggle5b=GetLocation(oJuggle5b);
		 object oJuggle6b=GetWaypointByTag("circus_juggle6b");
		 location lJuggle6b=GetLocation(oJuggle6b);
		 int nIncrement= 1 + GetLocalInt(OBJECT_SELF, "nIncrement");
		 if(nIncrement==20)
			 	{SpeakString("*Tosses sparking bottles and burning plates back and forth to his partner.*", TALKVOLUME_TALK);}
		    
		 object oJuggler2 = GetNearestObjectByTag(GetTag(OBJECT_SELF), OBJECT_SELF, 1);
		 
		 
		 SetLocalInt(OBJECT_SELF, "nIncrement", nIncrement);
		 DestroyObject(GetObjectByTag("circus_juggle_bottle", 0));
		 DestroyObject(GetObjectByTag("circus_juggle_plate", 0));
		 DestroyObject(GetObjectByTag("circus_juggle_pitcher", 0));
		 DestroyObject(GetObjectByTag("circus_juggle_bottle", 1));
		 DestroyObject(GetObjectByTag("circus_juggle_plate", 1));
		 DestroyObject(GetObjectByTag("circus_juggle_pitcher", 1));
		 
		 string sCreate="circus_juggle_bottle";
		 if(nIncrement < 31)
		 	{if((nIncrement==1)||(nIncrement==7)||(nIncrement==13)||(nIncrement==19)||(nIncrement==25))
				{lJuggle=lJuggle1;
				 lJuggleb=lJuggle1b;
				 PlayAnimation(ANIMATION_LOOPING_DANCE03, 1.0, 3.0);
				 ActionWait(3.0);
				 AssignCommand(oJuggler2, PlayAnimation(ANIMATION_LOOPING_DANCE03, 1.0, 3.0));
				 }
			 if((nIncrement==2)||(nIncrement==8)||(nIncrement==14)||(nIncrement==20)||(nIncrement==26))
				{lJuggle=lJuggle2;
				 lJuggleb=lJuggle2b;
				 }
			 if((nIncrement==3)||(nIncrement==9) ||(nIncrement==15)||(nIncrement==21)||(nIncrement==27))
				{lJuggle=lJuggle3;
				 lJuggleb=lJuggle3b;
				}
			 if((nIncrement==4)||(nIncrement==10)||(nIncrement==16)||(nIncrement==22)||(nIncrement==28))
				{lJuggle=lJuggle4;
				 lJuggleb=lJuggle4b;
				}
			 if((nIncrement==5)||(nIncrement==11)||(nIncrement==17)||(nIncrement==23)||(nIncrement==29))
				{lJuggle=lJuggle5;
				 lJuggleb=lJuggle5b;
				}
			 if((nIncrement==6)||(nIncrement==12)||(nIncrement==18)||(nIncrement==24)||(nIncrement==30))
				{lJuggle=lJuggle6;
				 lJuggleb=lJuggle6b;
				}
			 if((nIncrement==13)|| (nIncrement==15) || (nIncrement==17)|| (nIncrement==19)|| (nIncrement==21)|| (nIncrement==23)|| (nIncrement==25)|| (nIncrement==27)|| (nIncrement==29)|| (nIncrement==33)|| (nIncrement==36)|| (nIncrement==39)|| (nIncrement==42)|| (nIncrement==45)|| (nIncrement==48))
				{sCreate="circus_juggle_plate";}
			 if((nIncrement==13)|| (nIncrement==28) || (nIncrement==31)|| (nIncrement==34)|| (nIncrement==37)|| (nIncrement==40)|| (nIncrement==43)|| (nIncrement==46)|| (nIncrement==49))
				{sCreate="circus_juggle_pitcher";}
			 
			 	
			 ActionCreateWynPlace(sCreate, lJuggle);
			 ActionCreateWynPlace(sCreate, lJuggleb);
			 DelayCommand(1.0, ExecuteScript("circus_npc_conv_execute", OBJECT_SELF));
			 }
		else
			{SetLocalInt(OBJECT_SELF, "nIncrement", 0);
			PlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 5.0);
		 	SpeakString("Thank you, kind audience!", TALKVOLUME_TALK);
		    DelayCommand(1.0, AssignCommand(oJuggler2, ActionSpeakString("*Catches the crockery, landing bottle in pitcher and pitcher on plate, and bows over it.*", TALKVOLUME_TALK)));
		    }
		
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
		 DelayCommand(1.0, AssignCommand(OBJECT_SELF, PlaySound("as_cv_lute1", FALSE)));
		 
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
		 DelayCommand(12.0, AssignCommand(OBJECT_SELF, PlaySound("as_cv_lute1", FALSE)));
		 
		 DelayCommand(12.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(13.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(15.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(16.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(17.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(18.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(19.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 
		 DelayCommand(20.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(20.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE03, 1.0, 2.0)));
		 
		 DelayCommand(21.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(21.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BARDSONG, 1.0, 2.0)));
		 
		 DelayCommand(22.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(22.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_KNEELTALK, 1.0, 2.0)));
		 
		 DelayCommand(23.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(23.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE03, 1.0, 2.0)));
		 
		 DelayCommand(24.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(24.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BARDSONG, 1.0, 2.0)));
		 
		 DelayCommand(25.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(25.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE03, 1.0, 2.0)));
		 
		 DelayCommand(26.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP2, FALSE, 1.0)));
		 DelayCommand(28.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(30.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP4, FALSE, 1.0)));
		 DelayCommand(32.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBearWP5, FALSE, 1.0)));
		 DelayCommand(34.0, AssignCommand(OBJECT_SELF, ActionMoveToObject(oBear, FALSE, 1.0)));
		 DelayCommand(36.0, AssignCommand(OBJECT_SELF, ActionAttack(oBearWP3)));
		 DelayCommand(41.0, AssignCommand(OBJECT_SELF, SetFacing(DIRECTION_SOUTH, FALSE)));
		 DelayCommand(42.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 5.0)));
		 DelayCommand(42.0, AssignCommand(OBJECT_SELF, PlaySound("as_cv_lute1", FALSE)));
		 
		 DelayCommand(26.0, AssignCommand(oBear, ActionMoveToObject(oBearWP4, FALSE, 1.0)));
		 DelayCommand(28.0, AssignCommand(oBear, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(30.0, AssignCommand(oBear, ActionMoveToObject(oBearWP2, FALSE, 1.0)));
		 DelayCommand(32.0, AssignCommand(oBear, ActionMoveToObject(oBearWP5, FALSE, 1.0)));
		 DelayCommand(34.0, AssignCommand(oBear, ActionMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(36.0, AssignCommand(oBear, ActionAttack(oBearWP3)));
		 DelayCommand(38.0, AssignCommand(oBear, ActionMoveToObject(oBearWP3, FALSE, 1.0)));
		 DelayCommand(40.0, AssignCommand(oBear, ActionMoveToObject(OBJECT_SELF, FALSE, 1.0)));
		 DelayCommand(41.0, AssignCommand(oBear, SetFacing(DIRECTION_NORTH, FALSE)));
		 
		 DelayCommand(44.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(44.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE03, 1.0, 2.0)));
		 
		 DelayCommand(45.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(45.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BARDSONG, 1.0, 2.0)));
		 
		 DelayCommand(46.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(46.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_KNEELTALK, 1.0, 2.0)));
		 
		 DelayCommand(47.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0, 2.0)));
		 DelayCommand(47.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE03, 1.0, 2.0)));
		 
		 DelayCommand(48.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(48.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BARDSONG, 1.0, 2.0)));
		 
		 DelayCommand(49.0, AssignCommand(oBear, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0, 2.0)));
		 DelayCommand(49.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_DANCE03, 1.0, 2.0)));
		 
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
		 DelayCommand(63.0, AssignCommand(OBJECT_SELF, SetFacing(DIRECTION_SOUTH, FALSE)));
		 DelayCommand(64.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 2.0)));
		 DelayCommand(64.0, AssignCommand(OBJECT_SELF, PlaySound("as_cv_lute1", FALSE)));
		 
		 DelayCommand(66.0, AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 5.0)));
		 DelayCommand(67.0, ActionSpeakString("Our waltz is over; our dance card empty. Another coin buys another dance!", TALKVOLUME_TALK));
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
		
	//Snake Charmer
	if(GetTag(OBJECT_SELF) == "003_cr_circus_master_snakes")
		{string sCreature = GetLocalString(OBJECT_SELF, "circus_master");
		 string sCreature2 = GetLocalString(OBJECT_SELF, "circus_master2");
		 location lCreate = GetLocation(GetWaypointByTag(sCreature + "_create"));
		 object oSnake=CreateObject(OBJECT_TYPE_CREATURE, sCreature, lCreate);
		 object oSnake2=CreateObject(OBJECT_TYPE_CREATURE, sCreature2, lCreate);
		 DelayCommand(2.0, ActionSpeakString("Dance, my pets.", TALKVOLUME_TALK));
		 DelayCommand(3.0, PlayAnimation(ANIMATION_LOOPING_FLUTEPLAY, 1.0, 25.0));
		 DelayCommand(3.0, PlaySound("as_cv_flute1", FALSE));
		 
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
			 DelayCommand(93.0, AssignCommand(oTiger5, ActionForceMoveToObject(oTigerWaterRope, TRUE, 1.0)));
			 DelayCommand(96.0, AssignCommand(oTiger5, ActionAttack(oTigerWaterRope, FALSE)));
			 DelayCommand(97.0, ActionCreateWynPlacedEffect("circus_fx_waterwall_l_y", GetLocation(oTigerWater1WP))); 
			 DelayCommand(98.0, ActionCreateWynPlacedEffect("circus_fx_waterwall_l_y", GetLocation(oTigerWater2WP))); 
			 
			 DelayCommand(99.0, PlaySound("as_an_bearwolf3", FALSE));
			 
			 DelayCommand(100.0, SetLocalInt(OBJECT_SELF, "nIncrement", 1));
			 DelayCommand(101.0, ExecuteScript("circus_npc_conv_execute", OBJECT_SELF));
			 
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
		
	//Sword Swallower
   	if(GetTag(OBJECT_SELF) == "003_cr_circus_sw_swallow")
		{ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 1.0);
		 location lStart=GetLocation(GetWaypointByTag("swordswallow_start"));
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
		 object oSwordInv=GetItemPossessedBy(OBJECT_SELF, "abr_it_wpn_scimitar");
			  
		  
		 if(nIncrement == 1)
			 {ActionForceMoveToLocation(lStart, FALSE);
		 	  DelayCommand(1.0, ActionJumpToLocation(lStart));
		 	  DelayCommand(2.0, ActionUnequipItem(oSwordInv));
			  DelayCommand(3.0, SetFacing(DIRECTION_NORTH));
		 	  DelayCommand(4.0, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 1.0));
		      DelayCommand(5.0, ExecuteScript("circus_npc_conv_execute", OBJECT_SELF));
			 }
		 else if((nIncrement < 11) && (nIncrement > 1))
		 	{if((nIncrement==2)||(nIncrement==10))
				{lSword=lSword1;}
			 if((nIncrement==3)||(nIncrement==9))
				{lSword=lSword2;}
			 if((nIncrement==4)||(nIncrement==8))
				{lSword=lSword3;}
			 if((nIncrement==5)||(nIncrement==7))
				{lSword=lSword4;}
			 if(nIncrement==6)
				{lSword=lSword5;}
			 PlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 2.0);
			 ActionWait(2.0);
			 ActionCreateWynPlace("circus_sword_swallow_plc", lSword);
			 DelayCommand(2.0, ExecuteScript("circus_npc_conv_execute", OBJECT_SELF));
			 }
		else if(nIncrement == 12)
			{SetLocalInt(OBJECT_SELF, "nIncrement", 0);
			 SpeakString("*Bending backwards, inserts sword blade into mouth, carefully, the shiny blade descending an astonishing distance. Pulls it free, unbloodied, and sheathes it with a flourish.", TALKVOLUME_TALK);
		 	 ActionEquipItem(oSwordInv, INVENTORY_SLOT_RIGHTHAND);
			 PlayAnimation(ANIMATION_FIREFORGET_SALUTE, 1.0, 1.0);
		         
			}
		}
	
	
}			 			 