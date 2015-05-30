//Conversation driven for Jenny's circus act
//Wynna May 2015


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
		 
	
	//Water Genasi Acrobat	
	if((GetTag(OBJECT_SELF) == "003_cr_circus_jenny") && (GetTag(GetArea(OBJECT_SELF)) == "003_travelling_circus_int_bigtp"))
			{	object oXavier = GetObjectByTag("003_cr_firegen_xavier", 0);
		 			  object oJenny = OBJECT_SELF;
					  object oLadderCenterWestUp = GetWaypointByTag("003_plc_circus_ladder_cw_up_WP");
					  location lLadderCenterWestUp = GetLocation(oLadderCenterWestUp);
					  object oLadderCenterWestDown = GetWaypointByTag("003_plc_circus_ladder_cw_dn_WP");
					  location lLadderCenterWestDown = GetLocation(oLadderCenterWestDown);
					  object oLute = GetItemPossessedBy(oXavier, "abr_it_msc_lute");
					  /*object oHide=GetWaypointByTag("hiding_wp");
					  object oJenny2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_circus_jenny", GetLocation(oHide));
					  object oMephit = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deanphoenix_firemeph", GetLocation(oHide));
					  int nPerformRandom = Random(20) + 1;
					  int nPerformRandom2 = Random(20) + 1;
					  int nBonus=10;
					  int nPerform = nPerformRandom + nBonus;
					  int nPerform2 = nPerformRandom2 + nBonus;
					  AssignCommand(oXavier, ActionSpeakString("*OOC: The Ringmaster rolls " + IntToString(nPerform) + " on a Perform Check for this performance.*", TALKVOLUME_TALK));
					  DelayCommand(2.0, ActionSpeakString("*OOC: The Acrobat rolls " + IntToString(nPerform2) + " on a Perform Check for this performance.*", TALKVOLUME_TALK));
			
					  object oDagger = GetItemPossessedBy(oJenny, "abr_it_wpn_dagger_as");
					  object oLadderCenterEastUp = GetWaypointByTag("003_plc_circus_ladder_ce_up_WP");
					  location lLadderCenterEastUp = GetLocation(oLadderCenterEastUp);
					  object oLadderCenterEastDown = GetWaypointByTag("003_plc_circus_ladder_ce_dn_WP");
					  location lLadderCenterEastDown = GetLocation(oLadderCenterEastDown);
					  object oLadderHighwireDown = GetWaypointByTag("003_plc_circus_ladder_hw_up_WP");
					  location lLadderHighwireDown = GetLocation(oLadderHighwireDown);
					  object oLadderHighwireUp = GetWaypointByTag("003_plc_circus_ladder_hw_up_WP");
					  location lLadderHighwireUp = GetLocation(oLadderHighwireUp);
					  object oLadderHighwireGap = GetWaypointByTag("highwire_gap_south_WP");
					  location lLadderHighwireGap = GetLocation(oLadderHighwireGap);
					  location lLadderPlatformWestUp = GetLocation(GetWaypointByTag("003_plc_circus_ladder_pw_up_WP"));
					  location lLadderPlatformWestDown = GetLocation(GetWaypointByTag("003_plc_circus_ladder_pw_up_WP"));
					  location lLadderPlatformEastUp = GetLocation(GetWaypointByTag("003_plc_circus_ladder_pe_up_WP"));
					  location lLadderPlatformEastDown = GetLocation(GetWaypointByTag("003_plc_circus_ladder_pe_up_WP"));
					  object oSplashdownWest = GetWaypointByTag("splashdown_west_wp");
					  location lSplashdownWest = GetLocation(oSplashdownWest);
					  object oSplashdownWestEnd=GetWaypointByTag("splashdown_west_end_wp");
					  location lSplashdownWestEnd = GetLocation(oSplashdownWestEnd);
					  object oSplashdownEast = GetWaypointByTag("splashdown_east_wp");
					  location lSplashdownEast = GetLocation(oSplashdownEast);
					  object oSplashdownEastEnd=GetWaypointByTag("splashdown_east_end_wp");
					  location lSplashdownEastEnd = GetLocation(oSplashdownEastEnd);
					  location lWaterChuteStart = GetLocation(GetWaypointByTag("chute_start_wp"));
					  location lWaterChuteEnd = GetLocation(GetWaypointByTag("chute_end_wp"));
					  location lFountain = GetLocation(GetWaypointByTag("fountain_wp"));
					  object oHighwireCartwheel1=GetWaypointByTag("003_plc_circus_hw_1_WP");
					  location lHighwireCartwheel1= GetLocation(oHighwireCartwheel1);
					  object oHighwireCartwheel2=GetWaypointByTag("003_plc_circus_hw_2_WP");
					  location lHighwireCartwheel2= GetLocation(oHighwireCartwheel2);
					  object oHighwireCartwheel3=GetWaypointByTag("003_plc_circus_hw_3_WP");
					  location lHighwireCartwheel3= GetLocation(oHighwireCartwheel3);
					  object oHighwireCartwheel4=GetWaypointByTag("003_plc_circus_hw_4_WP");
					  location lHighwireCartwheel4= GetLocation(oHighwireCartwheel4);
					  object oHighwireCartwheel5=GetWaypointByTag("003_plc_circus_hw_5_WP");
					  location lHighwireCartwheel5= GetLocation(oHighwireCartwheel5);
					  object oHighwireCartwheel6=GetWaypointByTag("003_plc_circus_hw_6_WP");
					  location lHighwireCartwheel6= GetLocation(oHighwireCartwheel6);
					  object oExitTankRear=GetWaypointByTag("circus_highwire_fall_wp");
					  location lExitTank=GetLocation(oExitTankRear);
					  location lJennyEnd = GetLocation(GetWaypointByTag("jenny_end_wp"));
					  location lXavierEnd = GetLocation(GetWaypointByTag("xavier_end_wp"));
					  location lJennyStart = GetLocation(GetWaypointByTag("jenny_start_wp"));
					  location lXavierStart = GetLocation(GetWaypointByTag("xavier_start_wp"));
					  effect eFire=EffectVisualEffect(VFX_DUR_FIRE, FALSE);
					  effect eLightning=EffectVisualEffect(VFX_HIT_SPELL_LIGHTNING, FALSE);
					  effect eWater=EffectVisualEffect(VFX_IMP_PULSE_WATER, FALSE);
					  effect eKnockdown=EffectKnockdown();
					  object oFountainBall=GetObjectByTag("fountain_collball");
					  int nAppearance=GetAppearanceType(oJenny);
					 */
					 
					  DelayCommand(1.0, AssignCommand(oXavier, ActionCastSpellAtObject(SPELL_EAGLES_SPLENDOR, oJenny, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
					  DelayCommand(3.0, AssignCommand(oJenny, SetFacing(DIRECTION_SOUTH, FALSE)));
					  DelayCommand(4.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 2.0)));
					  DelayCommand(4.0, AssignCommand(oJenny, ActionWait(2.0)));
					  DelayCommand(6.0, AssignCommand(oJenny, ActionForceMoveToLocation(lLadderCenterWestDown, TRUE, 30.0)));
					  DelayCommand(7.0, AssignCommand(oJenny, SetFacing(DIRECTION_SOUTH, FALSE)));
					  DelayCommand(9.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE, 1.0, 2.0)));
					  DelayCommand(9.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(10.0, AssignCommand(oJenny, SetFacing(DIRECTION_NORTH, FALSE)));
					  DelayCommand(11.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_BARDSONG, 1.0, 2.0)));
					  DelayCommand(11.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(11.0, AssignCommand(oXavier, SetFacing(DIRECTION_SOUTH, FALSE)));
					  DelayCommand(12.0, AssignCommand(oJenny, ActionSpeakString("*Climbs.*", TALKVOLUME_TALK)));
					  DelayCommand(12.0, AssignCommand(oXavier, ActionCastSpellAtObject(SPELL_JOYFUL_NOISE, oXavier, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
					  DelayCommand(13.0, AssignCommand(oXavier, ActionEquipItem(oLute, INVENTORY_SLOT_RIGHTHAND)));
					  DelayCommand(14.0, AssignCommand(oJenny, ActionJumpToLocation(lLadderCenterWestUp)));
					 
					   
					  DelayCommand(15.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(15.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(15.5, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(15.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_BARDSONG, 1.0, 2.0)));
					  DelayCommand(15.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(16.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0)));
					  DelayCommand(16.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(16.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(16.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(16.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(18.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_DRUMIDLEFIDGET, 1.0, 2.0)));
					  DelayCommand(18.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(20.0, AssignCommand(oXavier, ActionSpeakString("*Speaks rhythmically, in a deep, resonant voice.*", TALKVOLUME_TALK)));
					  DelayCommand(21.0, ExecuteScript("circus_npc_conv_execute_xj1", oJenny));
					  
					  /*DelayCommand(22.0, AssignCommand(oJenny, ActionSpeakString("*Stretches.*", TALKVOLUME_TALK)));
					  DelayCommand(22.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_WILDSHAPE, 1.0, 2.0)));
					  DelayCommand(22.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(25.0, AssignCommand(oXavier, ActionSpeakString("The time, ladies and gentleman, may be yesterday or a hundred years past.", TALKVOLUME_TALK)));
					  DelayCommand(30.0, AssignCommand(oXavier, ActionSpeakString("The place, though, quite certainly, is a secluded cove in the warm tropical waters of the Lake of Steam.", TALKVOLUME_TALK)));
					  DelayCommand(30.0, AssignCommand(oJenny, SetFacing(DIRECTION_EAST, FALSE)));
					  
					  int nPC = 1;
					  object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oXavier, nPC);
					  while((oPC != OBJECT_INVALID) && (nPC < 6))
					  	{DelayCommand(31.0, AssignCommand(oXavier, ActionUseFeat(FEAT_BARDSONG_FASCINATE, oPC)));
					  	 DelayCommand(32.0, SendMessageToPC(oPC, "You feel the fascination of the ringmaster's voice."));
						 int nWillSave= WillSave(oPC, nPerform, SAVING_THROW_TYPE_MIND_SPELLS, oXavier);
						 if(nWillSave==0)
							{DelayCommand(37.0, SendMessageToPC(oPC, "He draws you in with his voice, and you are lost in the story."));}
						 else if(nWillSave==1)
							{DelayCommand(37.0, SendMessageToPC(oPC, "His narration is skilled, but you are proof against common circus hypnotism!"));}
						 else if(nWillSave==2)
							{DelayCommand(37.0, SendMessageToPC(oPC, "Luckily, such oratorical tricks have no effect on you and you can enjoy the show without being deluded."));}
						 nPC++;
						 oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oXavier, nPC);
						}
						
					  
					  DelayCommand(40.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(40.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(40.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(43.0, AssignCommand(oXavier, ActionSpeakString("To the lake he came, a prince of thieves, of fiery laugh and no domain.", TALKVOLUME_TALK)));
					  DelayCommand(45.0, AssignCommand(oMephit, ActionJumpToLocation(lLadderCenterEastUp)));
					  DelayCommand(46.0, AssignCommand(oMephit, SetFacing(DIRECTION_WEST, FALSE)));
					  
					  DelayCommand(48.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lLadderCenterEastUp)); 
				 	  DelayCommand(50.0, AssignCommand(oXavier, ActionSpeakString("There lived three sisters, daughters of the waters.", TALKVOLUME_TALK)));
					  DelayCommand(53.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_DANCE01, 1.0, 2.0)));
					  DelayCommand(53.0, AssignCommand(oJenny, ActionWait(2.0)));
					  DelayCommand(55.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_DANCE01, 1.0, 2.0)));
					  DelayCommand(55.0, AssignCommand(oJenny, ActionWait(2.0)));
					  DelayCommand(55.0, AssignCommand(oXavier, ActionSpeakString("The first was childish.", TALKVOLUME_TALK)));
					  DelayCommand(56.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lLadderCenterWestUp)); 
				 	  DelayCommand(62.0, AssignCommand(oXavier, ActionSpeakString("The second a fool.", TALKVOLUME_TALK)));
					  DelayCommand(62.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_DANCE02, 1.0, 5.0)));
					  DelayCommand(62.0, AssignCommand(oJenny, ActionWait(3.0)));
					  DelayCommand(65.0, AssignCommand(oXavier, ActionSpeakString("The third and most beautiful his heart did rule.", TALKVOLUME_TALK)));
					  
					  DelayCommand(66.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(66.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(66.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(70.0, AssignCommand(oXavier, ActionSpeakString("He desired her--oh how he desired her.", TALKVOLUME_TALK)));
					  DelayCommand(75.0, AssignCommand(oXavier, ActionSpeakString("Who would not? Her touch, her tears, to taste her sweat.", TALKVOLUME_TALK)));
					  DelayCommand(80.0, AssignCommand(oXavier, ActionSpeakString("Her wiles, her guiles, her soft-footed step.", TALKVOLUME_TALK)));
					  
					  DelayCommand(80.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(80.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(80.0, AssignCommand(oXavier, ActionWait(3.0)));
					  					  
					  DelayCommand(85.0, ReallyPlayCustomAnimation(oJenny, "*kickcircle", 1, 1.0f));
					  DelayCommand(86.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lHighwireCartwheel1)); 
				 	  DelayCommand(86.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel1)));
					  DelayCommand(88.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lHighwireCartwheel2)); 
				 	  DelayCommand(88.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel2)));
					  
					  DelayCommand(90.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(90.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(90.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(90.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lHighwireCartwheel3)); 
				 	  DelayCommand(90.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel3)));
					  DelayCommand(92.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lLadderHighwireUp)); 
					  DelayCommand(92.0, AssignCommand(oJenny, ActionJumpToLocation(lLadderHighwireUp)));
					  DelayCommand(94.0, AssignCommand(oJenny, ActionSpeakString("*Cartwheels through lights.*", TALKVOLUME_TALK)));
					  DelayCommand(95.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lHighwireCartwheel4)); 
				 	  DelayCommand(95.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel4)));
					  DelayCommand(97.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lHighwireCartwheel5)); 
				 	  DelayCommand(97.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel5)));
					  DelayCommand(99.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lHighwireCartwheel6)); 
				 	  DelayCommand(99.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel6)));
					  DelayCommand(100.0, AssignCommand(oJenny, SetFacing(DIRECTION_WEST, FALSE)));
					  DelayCommand(100.0, AssignCommand(oMephit, ActionJumpToLocation(lLadderCenterWestUp)));
					  DelayCommand(100.0, AssignCommand(oMephit, SetFacing(DIRECTION_EAST, FALSE)));
					  
					  DelayCommand(100.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(100.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(100.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(103.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_DRUMIDLEFIDGET, 1.0, 2.0)));
					  DelayCommand(103.0, AssignCommand(oJenny, ActionWait(2.0)));
					  DelayCommand(108.0, AssignCommand(oJenny, ActionForceMoveToObject(oHighwireCartwheel5, TRUE, 1.0, 30.0)));
					  DelayCommand(110.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(110.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(110.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(110.0, ReallyPlayCustomAnimation(oJenny, "*whirlwind", 1, 1.0f));
					  DelayCommand(111.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel5)));
					  DelayCommand(112.0, ReallyPlayCustomAnimation(oJenny, "*whirlwind", 1, 1.0f));
					  DelayCommand(113.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel4)));
					  DelayCommand(114.0, ReallyPlayCustomAnimation(oJenny, "*whirlwind", 1, 1.0f));
					  DelayCommand(115.0, AssignCommand(oJenny, ActionSpeakString("*Somersaults along highwire.*", TALKVOLUME_TALK)));
					  DelayCommand(116.5, AssignCommand(oJenny, ActionJumpToLocation(lLadderHighwireUp)));
					  DelayCommand(117.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel3)));
					  
					  DelayCommand(120.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(120.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(120.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(118.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel2)));
					  DelayCommand(119.0, AssignCommand(oJenny, SetFacing(DIRECTION_EAST, FALSE)));
					  DelayCommand(120.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_BARDSONG, 1.0, 2.0)));
					  DelayCommand(120.0, AssignCommand(oJenny, ActionWait(1.0)));
					 
					  DelayCommand(121.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_DANCE02, 1.0, 4.0)));
					  DelayCommand(121.0, AssignCommand(oJenny, ActionWait(4.0)));
					  DelayCommand(125.0, ReallyPlayCustomAnimation(oJenny, "*deflect", 1, 1.0f));
					  DelayCommand(127.0, ReallyPlayCustomAnimation(oJenny, "*parry", 1, 1.0f));
					  DelayCommand(129.0, ReallyPlayCustomAnimation(oJenny, "*dodge02", 1, 1.0f));
					  
					  DelayCommand(130.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(130.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(130.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(131.0, ReallyPlayCustomAnimation(oJenny, "*parry", 1, 1.0f));
					  DelayCommand(135.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_DANCE02, 1.0, 5.0)));
					  DelayCommand(135.0, AssignCommand(oJenny, ActionWait(5.0)));
					  
					  DelayCommand(140.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(140.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(140.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(140.0, ReallyPlayCustomAnimation(oJenny, "*sneak", 1, 1.0f));
					  DelayCommand(143.0, AssignCommand(oXavier, ActionSpeakString("A thief of men's purses as well as their hearts.", TALKVOLUME_TALK)));
					  DelayCommand(143.0, AssignCommand(oJenny, ActionForceMoveToLocation(lHighwireCartwheel3, FALSE, 30.0)));
					  DelayCommand(145.0, ReallyPlayCustomAnimation(oJenny, "*sneak", 1, 1.0f));
					  DelayCommand(148.0, AssignCommand(oJenny, ActionForceMoveToLocation(lLadderHighwireUp, FALSE, 30.0)));
					  DelayCommand(150.0, ReallyPlayCustomAnimation(oJenny, "*sneak", 1, 1.0f));
					  
					  DelayCommand(150.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(150.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(150.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(153.0, AssignCommand(oXavier, ActionSpeakString("Waylaying night bathers by playing a part...", TALKVOLUME_TALK)));
					  
					  DelayCommand(153.0, AssignCommand(oJenny, ActionForceMoveToLocation(lHighwireCartwheel4, FALSE, 30.0)));
					  DelayCommand(155.0, ReallyPlayCustomAnimation(oJenny, "*sneak", 1, 1.0f));
					  DelayCommand(158.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_KNEELIDLE, 1.0, 5.0)));
					  DelayCommand(158.0, AssignCommand(oJenny, ActionWait(5.0)));
					  
					  DelayCommand(160.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(160.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(160.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(163.0, AssignCommand(oXavier, ActionSpeakString("...a mermaid afloat in nothing but skin singing so sweetly to tempt them in.", TALKVOLUME_TALK)));
					  
					  DelayCommand(170.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(170.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(170.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(170.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_STEAL, 1.0, 1.0)));
					  DelayCommand(170.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(173.0, AssignCommand(oXavier, ActionSpeakString("Rifling of pouches and fight if she must, fleeing to water forever her trust.", TALKVOLUME_TALK)));
					  DelayCommand(173.0, ReallyPlayCustomAnimation(oJenny, "*dodge02", 1, 1.0f));
					  DelayCommand(174.0, ReallyPlayCustomAnimation(oJenny, "*sneakattack", 1, 1.0f));
					  DelayCommand(177.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 1.0)));
					  DelayCommand(177.0, AssignCommand(oJenny, ActionWait(1.0)));
					  
					  DelayCommand(178.0, AssignCommand(oJenny, SetFacing(DIRECTION_EAST, FALSE)));
					  DelayCommand(178.0, ReallyPlayCustomAnimation(oJenny, "*jumpback", 1, 1.0f));
					  DelayCommand(179.0, AssignCommand(oJenny, ActionSpeakString("*Backflips.*", TALKVOLUME_TALK)));
					  
					  DelayCommand(180.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(180.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(180.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(180.0, AssignCommand(oJenny, SetFacing(DIRECTION_EAST, FALSE)));
					  DelayCommand(181.0, ReallyPlayCustomAnimation(oJenny, "*jumpback", 1, 1.0f));
					  DelayCommand(181.5, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel4)));
					  DelayCommand(182.0, ReallyPlayCustomAnimation(oJenny, "*knockdownB", 1, 1.0f));
					  DelayCommand(184.0, ReallyPlayCustomAnimation(oJenny, "%", 0, 1.0f));
					  
					  DelayCommand(184.5, ReallyPlayCustomAnimation(oJenny, "*jumpback", 1, 1.0f));
					  DelayCommand(185.0, AssignCommand(oJenny, ActionJumpToLocation(lLadderHighwireUp)));
					  DelayCommand(185.5, ReallyPlayCustomAnimation(oJenny, "*knockdownB", 1, 1.0f));
					  DelayCommand(187.5, ReallyPlayCustomAnimation(oJenny, "%", 0, 1.0f));
					  
					  DelayCommand(188.0, ReallyPlayCustomAnimation(oJenny, "*jumpback", 1, 1.0f));
					  DelayCommand(188.5, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel3)));
					  DelayCommand(189.0, ReallyPlayCustomAnimation(oJenny, "*knockdownB", 1, 1.0f));
					  DelayCommand(191.0, ReallyPlayCustomAnimation(oJenny, "%", 0, 1.0f));
					  
					  DelayCommand(191.0, AssignCommand(oXavier, ActionSpeakString("Dancing her joy over treasures unjust.", TALKVOLUME_TALK)));
					  DelayCommand(191.5, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_DANCE02, 1.0, 5.0)));
					  DelayCommand(191.5, AssignCommand(oJenny, ActionWait(5.0)));
					    
					  DelayCommand(190.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(190.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(190.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(193.0, AssignCommand(oXavier, ActionSpeakString("Audacious and swift the trap that he set...", TALKVOLUME_TALK)));
					  DelayCommand(198.0, AssignCommand(oXavier, ActionSpeakString("...required in no part that he ever get wet. *Chuckles*", TALKVOLUME_TALK)));
					  DelayCommand(200.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(200.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(200.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(203.0, AssignCommand(oXavier, ActionSpeakString("A gem on the shore lured the lurer out...", TALKVOLUME_TALK)));
					  DelayCommand(204.0, AssignCommand(oMephit, SetFacing(DIRECTION_WEST, FALSE)));
					  
					  DelayCommand(201.0, AssignCommand(oJenny, SetFacing(DIRECTION_WEST, FALSE)));
					  DelayCommand(203.0, ReallyPlayCustomAnimation(oJenny, "*sneak", 1, 1.0f));
					  DelayCommand(206.0, AssignCommand(oJenny, ActionForceMoveToLocation(lHighwireCartwheel2, FALSE, 30.0)));
					  
					  DelayCommand(210.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(210.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(210.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(211.0, AssignCommand(oJenny, ActionForceMoveToLocation(lHighwireCartwheel1, FALSE, 30.0)));
					  DelayCommand(213.0, ReallyPlayCustomAnimation(oJenny, "*sneak", 1, 1.0f));
					  DelayCommand(216.0, AssignCommand(oJenny, ActionForceMoveToLocation(lLadderCenterWestUp, FALSE, 30.0)));
					  DelayCommand(218.0, ReallyPlayCustomAnimation(oJenny, "*sneak", 1, 1.0f));
					  
					  DelayCommand(220.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(220.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(220.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(221.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_KNEELIDLE, 1.0, 3.0)));
					  DelayCommand(221.0, AssignCommand(oJenny, ActionWait(3.0)));
					  DelayCommand(224.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_STEAL, 1.0, 3.0)));
					  DelayCommand(224.0, AssignCommand(oJenny, ActionWait(2.0)));
					  DelayCommand(225.0, AssignCommand(oMephit, SetFacing(DIRECTION_EAST, FALSE)));
					  DelayCommand(226.0, ReallyPlayCustomAnimation(oJenny, "*sneakattack", 1, 1.0f));
					  
					  DelayCommand(228.0, AssignCommand(oXavier, ActionSpeakString("...from her element cool to his end without doubt.", TALKVOLUME_TALK)));
					  DelayCommand(228.0, ReallyPlayCustomAnimation(oJenny, "*jumpback", 1, 1.0f));
					  DelayCommand(228.5, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel1)));
					  DelayCommand(229.0, AssignCommand(oJenny, SetFacing(DIRECTION_WEST, FALSE)));
					  DelayCommand(229.5, ReallyPlayCustomAnimation(oJenny, "*whirlwind", 1, 1.0f));
					  
					  DelayCommand(230.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(230.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(230.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(230.0, AssignCommand(oMephit, ActionForceMoveToLocation(lHighwireCartwheel1, FALSE, 30.0)));
					  
					  DelayCommand(230.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel2)));
					  DelayCommand(230.0, AssignCommand(oMephit, ActionForceMoveToLocation(lHighwireCartwheel2, FALSE, 30.0)));
					  DelayCommand(230.5, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_SPASM, 1.0, 3.0)));
					  DelayCommand(230.5, AssignCommand(oJenny, ActionWait(3.0)));
					  
					  DelayCommand(232.0, AssignCommand(oMephit, ActionCastFakeSpellAtObject(SPELL_DOMINATE_PERSON, oJenny, PROJECTILE_PATH_TYPE_DEFAULT)));
					  DelayCommand(233.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_COLLAPSE, 1.0, 2.0)));
					  DelayCommand(233.0, AssignCommand(oJenny, ActionWait(2.0)));
					  DelayCommand(235.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eKnockdown, oJenny, 7.0)); 
					  DelayCommand(242.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_KNEELDAMAGE, 1.0, 2.0)));
					  DelayCommand(242.0, AssignCommand(oJenny, ActionWait(2.0)));
					  DelayCommand(239.0, AssignCommand(oMephit, ActionCastFakeSpellAtObject(SPELL_CHARM_PERSON, oJenny, PROJECTILE_PATH_TYPE_DEFAULT)));
					  
					  DelayCommand(240.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(240.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(240.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(243.0, AssignCommand(oXavier, ActionSpeakString("Ho! First but not last time, the beauty surprised him, taking forms to defy him.", TALKVOLUME_TALK)));
					  
					  DelayCommand(244.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_STANDUP, 1.0, 3.0)));
					  DelayCommand(244.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(245.0, AssignCommand(oJenny, SetFacing(DIRECTION_WEST, FALSE)));
					  DelayCommand(246.0, ReallyPlayCustomAnimation(oJenny, "*kickcircle", 1, 1.0f));
					  DelayCommand(248.0, AssignCommand(oXavier, ActionSpeakString("Desperate swirling melting whirling, into waterspout ever twirling...", TALKVOLUME_TALK)));
					  DelayCommand(249.0, SetCreatureAppearanceType(oJenny, APPEARANCE_TYPE_ELEMENTAL_WATER_ELDER));
					  DelayCommand(250.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(250.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(250.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(253.0, AssignCommand(oXavier, ActionSpeakString("...turned to rain by heat unfurling from his ardent need.", TALKVOLUME_TALK)));
					  
					  DelayCommand(260.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(260.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(260.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(260.0, SetCreatureAppearanceType(oJenny, nAppearance));
					  DelayCommand(262.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_SPASM, 1.0, 3.0)));
					  DelayCommand(262.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(262.0, AssignCommand(oMephit, ActionForceMoveToLocation(GetLocation(oJenny), FALSE, 30.0)));
					  
					  DelayCommand(263.0, AssignCommand(oJenny, SetFacing(DIRECTION_WEST, FALSE)));
					  DelayCommand(264.0, ReallyPlayCustomAnimation(oJenny, "*whirlwind", 1, 1.0f));
					  DelayCommand(265.0, AssignCommand(oXavier, ActionSpeakString("Pouring through hot hands again, into maelstrom transformed then.", TALKVOLUME_TALK)));
					  DelayCommand(267.0, SetCreatureAppearanceType(oJenny, APPEARANCE_TYPE_ELEMENTAL_WATER));
					  DelayCommand(268.0, ReallyPlayCustomAnimation(oJenny, "%", 0, 1.0f));
					  
					  DelayCommand(270.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(270.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(270.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(273.0, AssignCommand(oXavier, ActionSpeakString("He stopped this drain with fires hot, and the lass was truly caught.", TALKVOLUME_TALK)));
					  DelayCommand(274.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFire, oJenny, 8.0)); 
					  
					  DelayCommand(275.0, SetCreatureAppearanceType(oJenny, nAppearance));
					  DelayCommand(278.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eKnockdown, oJenny, 5.0)); 
					  DelayCommand(278.0, AssignCommand(oMephit, SetFacing(DIRECTION_EAST, FALSE)));
					  DelayCommand(279.0, AssignCommand(oMephit, ActionCastFakeSpellAtObject(SPELL_CHARM_PERSON, oJenny, PROJECTILE_PATH_TYPE_DEFAULT)));
					  
					  DelayCommand(280.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(280.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(280.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(283.0, AssignCommand(oXavier, ActionSpeakString("Steaming like her homeland lake, at captivity hurled hate.", TALKVOLUME_TALK)));
					  
					  DelayCommand(285.0, AssignCommand(oJenny, ActionEquipItem(oDagger, INVENTORY_SLOT_RIGHTHAND)));
					  DelayCommand(286.0, AssignCommand(oJenny, SetFacing(DIRECTION_WEST, FALSE)));
					  DelayCommand(288.0, AssignCommand(oXavier, ActionSpeakString("Transforms spent, she struck with blade but not for naught is armor made.", TALKVOLUME_TALK)));
					  
					  DelayCommand(290.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(290.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(290.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(290.0, ReallyPlayCustomAnimation(oJenny, "*attack01", 0, 1.0f));
					  DelayCommand(293.0, ReallyPlayCustomAnimation(oJenny, "%", 0, 1.0f));
					  
					  DelayCommand(293.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_KNEELIDLE, 1.0, 3.0)));
					  DelayCommand(293.0, AssignCommand(oJenny, ActionWait(3.0)));
					  DelayCommand(298.0, ReallyPlayCustomAnimation(oJenny, "*deflect", 1, 1.0f));
					  
					  DelayCommand(300.0, AssignCommand(oJenny, ActionUnequipItem(oDagger)));
					  DelayCommand(300.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(300.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(300.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(303.0, AssignCommand(oXavier, ActionSpeakString("Blade turned back she wriggled free...", TALKVOLUME_TALK)));
					  DelayCommand(305.0, AssignCommand(oXavier, ActionSpeakString("...and slipping from him on a knee...", TALKVOLUME_TALK)));
					  DelayCommand(306.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_KNEELDEATH, 1.0, 1.0)));
					  DelayCommand(306.0, AssignCommand(oJenny, ActionWait(3.0)));
					  DelayCommand(310.0, ReallyPlayCustomAnimation(oJenny, "%", 0, 1.0f));
					  
					  DelayCommand(310.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(310.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(310.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(313.0, AssignCommand(oXavier, ActionSpeakString("...into lake she did plunge...", TALKVOLUME_TALK)));
					  
					  DelayCommand(312.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 1.0)));
					  DelayCommand(312.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(312.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eWater, oJenny, 1.0)); 
					  DelayCommand(313.5, AssignCommand(oJenny, ActionSpeakString("*Swan dives*", TALKVOLUME_TALK)));
					  
					  DelayCommand(314.0, AssignCommand(oJenny, ActionJumpToLocation(lSplashdownEast)));
					  
					  DelayCommand(320.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(320.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(320.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(323.0, AssignCommand(oXavier, ActionSpeakString("...but his touch could not expunge.", TALKVOLUME_TALK)));
					  
					  DelayCommand(323.0, AssignCommand(oJenny, ActionForceMoveToLocation(lSplashdownEastEnd, FALSE, 30.0)));
					   
					  DelayCommand(330.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(330.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(330.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(333.0, AssignCommand(oXavier, ActionSpeakString("Swimming, steaming, wanting, needing...", TALKVOLUME_TALK)));
					  
					  DelayCommand(333.0, AssignCommand(oJenny, ActionJumpToLocation(lExitTank)));
					  DelayCommand(334.0, SetCreatureAppearanceType(oJenny, nAppearance));
					  
					  DelayCommand(335.0, AssignCommand(oJenny, ActionForceMoveToLocation(lLadderPlatformWestDown, FALSE, 30.0)));
					  DelayCommand(336.0, AssignCommand(oJenny, ActionSpeakString("*Climbs*", TALKVOLUME_TALK)));
					  DelayCommand(336.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lLadderPlatformWestUp)); 
				 	  DelayCommand(337.0, AssignCommand(oJenny, ActionJumpToLocation(lLadderPlatformWestUp)));
					  DelayCommand(338.0, AssignCommand(oJenny, SetFacing(DIRECTION_SOUTH, FALSE)));
					  DelayCommand(338.0, AssignCommand(oXavier, ActionSpeakString("...danger smoulders, fires seeded ...", TALKVOLUME_TALK)));
					  
					  DelayCommand(340.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(340.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(340.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(343.0, AssignCommand(oXavier, ActionSpeakString("...where ne'er fires ever burned...", TALKVOLUME_TALK)));
					  DelayCommand(340.0, ActionCreateWynPlacedEffect("circus_fx_spotlight", lLadderHighwireGap)); 
				 	  DelayCommand(340.0, AssignCommand(oJenny, ActionJumpToLocation(lLadderHighwireGap)));
					  DelayCommand(341.0, AssignCommand(oJenny, ActionSpeakString("*Cartwheels across a tension wire.*", TALKVOLUME_TALK)));
					  DelayCommand(342.0, ReallyPlayCustomAnimation(oJenny, "*kickcircle", 1, 1.0f));
					  DelayCommand(343.0, AssignCommand(oMephit, ActionForceMoveToLocation(lLadderCenterEastUp, FALSE, 30.0)));
					  DelayCommand(345.0, AssignCommand(oJenny, ActionJumpToLocation(lLadderHighwireDown)));
					  DelayCommand(348.0, AssignCommand(oXavier, ActionSpeakString("...found onshore when sun returned.", TALKVOLUME_TALK)));
					  DelayCommand(349.0, AssignCommand(oMephit, SetFacing(DIRECTION_EAST, FALSE)));
					  
					  DelayCommand(350.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(350.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(350.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(351.0, AssignCommand(oJenny, ActionJumpToLocation(lLadderHighwireUp)));
					  DelayCommand(353.0, AssignCommand(oJenny, ActionForceMoveToLocation(lHighwireCartwheel1, FALSE, 30.0)));
					  DelayCommand(355.0, AssignCommand(oJenny, SetFacing(DIRECTION_WEST, FALSE)));
					  
					  DelayCommand(357.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_BARDSONG, 1.0, 1.0)));
					  DelayCommand(357.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(358.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 3.0)));
					  DelayCommand(358.0, AssignCommand(oJenny, ActionWait(3.0)));
					  
					  DelayCommand(360.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(360.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(360.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(361.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_KNEELDAMAGE, 1.0, 5.0)));
					  DelayCommand(361.0, AssignCommand(oJenny, ActionWait(5.0)));
					  DelayCommand(366.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_DANCE02, 1.0, 7.0)));
					  DelayCommand(366.0, AssignCommand(oJenny, ActionWait(7.0)));
					  
					  DelayCommand(370.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(370.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(370.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(373.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel2)));
					  DelayCommand(375.0, AssignCommand(oJenny, ActionJumpToLocation(lHighwireCartwheel3)));
					  DelayCommand(375.0, AssignCommand(oMephit, ActionJumpToLocation(lHighwireCartwheel2)));
					  DelayCommand(377.0, AssignCommand(oMephit, ActionJumpToLocation(lHighwireCartwheel3)));
					  DelayCommand(377.0, AssignCommand(oJenny, ActionSpeakString("*Backflips off highwire*", TALKVOLUME_TALK)));
					  DestroyObject(oMephit, 378.0);
					  
					  DelayCommand(378.0, AssignCommand(oJenny, ActionJumpToLocation(lWaterChuteStart)));
					  
					  DelayCommand(380.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(380.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(380.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  //DelayCommand(380.0, AssignCommand(oJenny, ActionForceMoveToLocation(lSplashdownWestEnd, FALSE, 30.0)));
					  //DelayCommand(380.0, AssignCommand(oJenny, ActionJumpToLocation(lWaterChuteStart)));
					  DelayCommand(387.0, AssignCommand(oJenny, ActionForceMoveToLocation(lWaterChuteEnd, FALSE, 30.0)));
					  DelayCommand(389.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLightning, oJenny, 2.0)); 
					  
					  DelayCommand(390.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(390.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(390.0, AssignCommand(oXavier, ActionWait(3.0)));
					  
					  DelayCommand(391.0, AssignCommand(oJenny, ActionSpeakString("*Vanishes in a flash of blue lightnings!*", TALKVOLUME_TALK)));
					  DelayCommand(392.0, AssignCommand(oJenny, ActionJumpToLocation(GetLocation(oHide))));
					  DelayCommand(393.0, SetCreatureAppearanceType(oJenny, nAppearance));
					  
					  DelayCommand(400.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(400.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(400.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(403.0, AssignCommand(oXavier, ActionSpeakString("Many years have come and gone and the gem is long since spent.", TALKVOLUME_TALK)));
					  DelayCommand(408.0, AssignCommand(oXavier, ActionSpeakString("Fire and water they make steam, or is that she harbors dreams...", TALKVOLUME_TALK)));
					  DelayCommand(410.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(410.0, AssignCommand(oXavier, PlaySound("as_cv_lute1", FALSE)));
			          DelayCommand(410.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(413.0, AssignCommand(oXavier, ActionSpeakString("Of scalding what she cannot 'scape?", TALKVOLUME_TALK)));
					  DestroyObject(oFountainBall, 416.0);
					  DelayCommand(417.0, AssignCommand(oJenny, ActionJumpToLocation(lFountain)));
					  DelayCommand(418.0, AssignCommand(oXavier, ActionSpeakString("Or swimming to her far lost lake?", TALKVOLUME_TALK)));
					  
					  DelayCommand(419.0, AssignCommand(oJenny, ActionSpeakString("*Pops up inside the fountain!*", TALKVOLUME_TALK)));
					  DelayCommand(420.0, AssignCommand(oJenny, SetFacing(DIRECTION_SOUTH, FALSE)));
					  DelayCommand(421.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 2.0)));
					  DelayCommand(421.0, AssignCommand(oJenny, ActionWait(2.0)));
					  DelayCommand(423.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE, 1.0, 1.0)));
					  DelayCommand(423.0, AssignCommand(oJenny, ActionWait(1.0)));
					   
					  nPC = 1;
					  oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oXavier, nPC);
					  while((oPC != OBJECT_INVALID) && (nPC < 6))
					  	{DelayCommand(425.0, AssignCommand(oXavier, ActionUseFeat(FEAT_BARDSONG_FASCINATE, oPC)));
					  	 nPC++;
						 oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oXavier, nPC);
						}
						
					   
					  DelayCommand(425.0, AssignCommand(oJenny, ActionForceMoveToLocation(lJennyEnd, FALSE, 30.0)));
					  DelayCommand(427.0, AssignCommand(oXavier, ActionForceMoveToLocation(lXavierEnd, FALSE, 30.0)));
					  DelayCommand(430.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_LOOPING_GUITARPLAY, 1.0, 3.0)));
			 		  DelayCommand(430.0, AssignCommand(oXavier, ActionWait(3.0)));
					  DelayCommand(430.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_LOOPING_DANCE02, 1.0, 3.0)));
					  DelayCommand(430.0, AssignCommand(oJenny, ActionWait(3.0)));
					  DelayCommand(433.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 3.0)));
					  DelayCommand(433.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(433.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 3.0)));
					  DelayCommand(433.0, AssignCommand(oXavier, ActionWait(1.0)));
					  DelayCommand(445.0, AssignCommand(oXavier, ActionSpeakString("Thank you for coming! That's the show tonight, ladies and gentlemen!", TALKVOLUME_TALK)));
					  DelayCommand(447.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 3.0)));
					  DelayCommand(447.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(447.0, AssignCommand(oXavier, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0, 3.0)));
					  DelayCommand(447.0, AssignCommand(oXavier, ActionWait(1.0)));
					  DelayCommand(449.0, AssignCommand(oJenny, ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING, 1.0, 3.0)));
					  DelayCommand(449.0, AssignCommand(oJenny, ActionWait(1.0)));
					  DelayCommand(450.0, AssignCommand(oJenny, ActionForceMoveToLocation(lJennyStart, FALSE, 30.0)));
					  DelayCommand(450.0, AssignCommand(oXavier, ActionForceMoveToLocation(lXavierStart, FALSE, 30.0)));
					  
					  DelayCommand(452.0, AssignCommand(oJenny, ActionJumpToLocation(lJennyStart)));
					  DelayCommand(452.0, ReallyPlayCustomAnimation(oJenny, "%", 0, 1.0f));
					  DelayCommand(455.0, ExecuteScript("circus_npc_conv_execute_xj2", OBJECT_SELF));
					 */
					  
				  
		}
}			 			 