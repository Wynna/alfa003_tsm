//OnSpellCastAt for all Silvy Uni creatures
//Wynna February 2008


#include "acr_creature_i"
#include "acr_db_persist_i"
#include "acr_quest_i"
#include "003_silverymoon_i"
					
					
void main()
{
	ACR_CreatureOnSpellCastAt();
    object oStudent = GetLastSpellCaster();
    object oArea = GetArea(OBJECT_SELF);

//Elementary Enchantment
if(((GetTag(OBJECT_SELF) == "003_cr_slv_enc100eyes")|| (GetTag(OBJECT_SELF)== "003_cr_slv_enc100giant")) && (GetIsPC(oStudent))  && ((GetLastSpell()== SPELL_SLEEP) || (GetLastSpell()== SPELL_DEEP_SLUMBER)))
       			{RemoveSilverymoonWards( OBJECT_SELF );
				  if(GetLocalInt(oStudent, "Slept")!= 1)
					{AssignCommand(GetObjectByTag("003_cr_slv_enc100giant"), ActionPlayAnimation(ANIMATION_FIREFORGET_LAYDOWN, 1.0f, 30.0f));
					 SendMessageToPC(oStudent, "Your low level Enchantment [Mind Affecting] spell functions. A hollow voice speaks softly from no place you can discern: 'Student dispensation granted.'");
			    	 DelayCommand(2.0, SendMessageToPC(oStudent, "The giant rolls over, peacefully asleep. One by one the floating eyes narrow to slits, exactly as if eyelids were drooping over them. They seem to sleep."));
			  		 SetLocalInt(oStudent, "Slept", 1);
					 }
			    }

//Standard Enchantment
if((GetTag(OBJECT_SELF) == "003_cr_slv_procenc2") && (GetIsPC(oStudent)) && ((GetLastSpell()== SPELL_CHARM_PERSON)) || (GetLastSpell()== SPELL_CHARM_MONSTER)  )

               {   object oExit = GetLocalObject(OBJECT_SELF, "oExit");
				    if(oExit == OBJECT_INVALID)
						{oExit = GetObjectByTag("slv_door_Enchantment1");
                    	SetLocalObject(OBJECT_SELF, "oExit", oExit);
						}
					object oDown = GetLocalObject(OBJECT_SELF, "oDown");
				    if(oDown == OBJECT_INVALID)
						{oDown = GetWaypointByTag("GL2_Down_AT");
                    	SetLocalObject(OBJECT_SELF, "oDown", oDown);
						}
				    object oProfessor = GetLocalObject(OBJECT_SELF, "oProfessor");
					if(oProfessor == OBJECT_INVALID)
						{oProfessor = GetObjectByTag("003_cr_slv_profenc");
						 if(oProfessor == OBJECT_INVALID)
						 	{oProfessor = GetWaypointByTag("003_cr_slv_profenc_Class");
						    }
						 SetLocalObject(OBJECT_SELF, "oProfessor", oProfessor);
						 }
					object oMyMirrorWP = GetLocalObject(OBJECT_SELF, "oMyMirrorWP");
					if (oMyMirrorWP == OBJECT_INVALID)
						{oMyMirrorWP = GetWaypointByTag("Enc_All_Quests_Mirror_WP");
						 SetLocalObject(OBJECT_SELF, "oMyMirrorWP", oMyMirrorWP);
						}
							
				 ClearAllActions(TRUE);
				 SetLocalInt(OBJECT_SELF, "Charmed", 1);
				 ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_COMMONER);
				 SetCampaignString("SLV_UNI", "Standard Enchantment", "Standard Enchantment", oStudent);
				 if(ACR_RetrieveQuestState("slv_enc200", oStudent) == 1)
						{DelayCommand(4.0, ACR_AddPersistentJournalQuestEntry("slv_enc200", 2, oStudent, 0, 0, 0, 0));
						}
				DelayCommand(2.0, SendMessageToPC(oStudent, "The proctor hands you the piece of the mirror and folds your fingers around it."));
				DelayCommand(4.0,  ActionSpeakString("This grows dull. Master Silverbrook insists I teach. So, I've taught. *Shrugs* Take this.", TALKVOLUME_TALK));
				object oHandMirror = CreateItemOnObject("slv_enc200_handmirror", oStudent, 1);
				DelayCommand(5.1,  ActionForceMoveToObject(oProfessor, TRUE, 0.0));
				DelayCommand(6.0,  ActionSpeakString("*Elvish* Master Silverbrook, by my expert opinion, this student is ready to face a truly hostile enchanter. *Sweetly* Thank you, dear Master, for allowing me to exhibit the uses of Charm. Pretending to be hostile was most amusing for me.*/E*", TALKVOLUME_TALK));
				DelayCommand(15.0, ActionForceMoveToObject(oMyMirrorWP, TRUE, 0.0));
						
			}
				   
		//Standard Evocation	 
		 
	if(GetTag(OBJECT_SELF) == "003_cr_slv_incinder")
        {ClearAllActions(TRUE);
         SpeakString("*Crackles with laughter*  Not me!!  Sssstupid meat!", TALKVOLUME_TALK);
         ClearAllActions(TRUE);
         ActionMoveAwayFromObject(oStudent, TRUE, 10.0);
         DelayCommand(5.0, ActionMoveToObject(oStudent, FALSE, 2.0));
         DelayCommand(5.5, ClearAllActions(TRUE));
         }
    

 //Elementary Illusion
     if(GetTag(OBJECT_SELF) == "003_cr_slv_ill100boy")
	     {object oMyBearWP = GetLocalObject(OBJECT_SELF, "oMyBearWP");
		 if (oMyBearWP == OBJECT_INVALID)
			{oMyBearWP = GetWaypointByTag("Ill_All_Quests_Bear_WP");
			 SetLocalObject(OBJECT_SELF, "oMyBearWP", oMyBearWP);
			 }
		 object oMyBear = GetLocalObject(OBJECT_SELF, "oMyBear");
		 if (oMyBear == OBJECT_INVALID)
			{oMyBear = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100bear", GetLocation(oMyBearWP));
		 	 SetLocalObject(OBJECT_SELF, "oMyBear", oMyBear);
			 }
	     object oMyBearskin = GetLocalObject(OBJECT_SELF, "oMyBearskin");
		 if (oMyBearskin == OBJECT_INVALID)
			{oMyBearskin = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_ill100_bearskin", GetLocation(oMyBearWP));
			SetLocalObject(OBJECT_SELF, "oMyBearskin", oMyBearskin);
			 }
	      SpeakString("Hey!  What are you doing to me!  SNOUT!!  Here, boy!", TALKVOLUME_TALK);
	      SetLocalInt(oStudent, "HurtBoy", 1);
	      DestroyObject(oMyBearskin);
          SendMessageToPC(oStudent, "The bearskin rug on the ground rises up, shakes off, yawns a mighty yawn...and is revealed as a real bear cub, previously under an illusion.");
	      DelayCommand(2.0, SendMessageToPC(oStudent, "The bear cub gives the air a deep sniff, then its beady eyes fix on the boy and next on you.  It lumbers a step closer to you, then stops to shake its head violently, fur bristling.  It roars, shaking the room....and vanishes, as does the boy."));
	      DelayCommand(2.5, AssignCommand(oMyBear, PlaySound("as_an_dragonror1")));
	      DestroyObject(oMyBear, 3.0);
	      DestroyObject(OBJECT_SELF, 3.1);
	      }

    if((GetTag(OBJECT_SELF) == "003_cr_slv_ill100imp") || (GetTag(OBJECT_SELF) == "003_cr_slv_ill100pixie")) 
         {ClearAllActions(TRUE);
          DestroyObject(OBJECT_SELF);
          }
	
		  

		   	  
		  	  
	 //Standard Necromancy
    if(GetTag(OBJECT_SELF) == "003_cr_slv_nec200rat") 
        {ActionMoveToObject(GetWaypointByTag("Nec_All_Quests_RatDestroy_WP"), TRUE, 0.0);
        }
    
	if(GetTag(OBJECT_SELF) == "003_cr_slv_nec200zombie") 
        {if((GetLastSpell() == 3001) || (GetLastSpell() ==3006))
			{ClearAllActions(TRUE);
			 ActionMoveToObject(GetWaypointByTag("Nec_All_Quests_Skull_WP"), TRUE, 0.0);
         	 SendMessageToPC(oStudent, "The zombie drops the body!  It falls, striking the lever on the way down. The lever drops into the closed position and the gate rattles down.");
			}
		
	     if(GetLastSpell() == SPELL_RAY_OF_ENFEEBLEMENT)
	        {ClearAllActions(TRUE);
			 SendMessageToPC(oStudent, "The zombie can't hold the weight of the body!  It falls, striking the lever on the way down. The lever drops into the closed position and the gate rattles down.");
			ActionMoveToObject(GetWaypointByTag("Nec_All_Quests_Zombie_WP"), TRUE, 0.0);
         	}
		object oMyCorpseDownWP = GetLocalObject(OBJECT_SELF, "oMyCorpseDownWP");
		 if (oMyCorpseDownWP == OBJECT_INVALID)
			 {oMyCorpseDownWP = GetWaypointByTag("Nec_All_Quests_Corpse2Down_WP");
			  SetLocalObject(OBJECT_SELF, "oMyCorpseDownWP", oMyCorpseDownWP);
			 }
		 object oMyCorpse = GetLocalObject(OBJECT_SELF, "oMyCorpse");
		 if(oMyCorpse == OBJECT_INVALID)
		 	{oMyCorpse = GetObjectByTag("slv_nec200_corpse");
			 }
		 object oMyLever = GetLocalObject(OBJECT_SELF, "oMyLever");
		 if(oMyLever == OBJECT_INVALID)
		 	{oMyLever = GetObjectByTag("Nec_All_Quests_Lever3");
			 SetLocalObject(OBJECT_SELF, "oMyLever", oMyLever);
			 }
		 
         DestroyObject(oMyCorpse);
         int nState = GetLocalInt(oMyLever, "State");
		 object oMyGate = GetLocalObject(oMyLever, "oMyGate");
		 if(oMyGate == OBJECT_INVALID)
		 	{oMyGate = GetObjectByTag(GetTag(oMyLever) + "_Gate");
			 SetLocalObject(oMyLever, "oMyGate", oMyGate);
			 }
		 object oMyGateWP;
		 object oMyGateNew;
		 if(nState == 1)
		 	{oMyGateWP = GetWaypointByTag(GetTag(oMyLever) + "D_WP");
			 oMyGateNew = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_gate", GetLocation(oMyGateWP), FALSE, GetTag(OBJECT_SELF) + "_Gate");
		 	}
		 else if(nState == 0)
		 	{oMyGateWP = GetWaypointByTag(GetTag(oMyLever) + "U_WP");
			 oMyGateNew = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_mc_jail02", GetLocation(oMyGateWP), FALSE, GetTag(OBJECT_SELF) + "_Gate");
		 	}
		 DestroyObject(oMyGate);
		 SetLocalObject(oMyLever, "oMyGate", OBJECT_INVALID);
		 SetLocalObject(oMyLever, "oMyGate", oMyGateNew);
		 object oMyCorpseDown = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_corpse2", GetLocation(oMyCorpseDownWP));
         SetLocalObject(OBJECT_SELF, "oMyCorpseDown", oMyCorpseDown);
		 }

		 
// Quill feather static		 
	if(FindSubString(GetTag(OBJECT_SELF), "chicken") != -1) 
		{ClearAllActions(TRUE);
		ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_COMMONER);
		if((GetLastSpell() == SPELL_BLINDNESS_AND_DEAFNESS) || (GetLastSpell() == SPELL_CAUSE_FEAR) || (GetLastSpell() == SPELL_CHARM_MONSTER) 
		||(GetLastSpell() == SPELL_CHARM_PERSON_OR_ANIMAL) ||(GetLastSpell() == SPELL_DAZE) ||(GetLastSpell() == SPELL_DOMINATE_ANIMAL) 
		||(GetLastSpell() == SPELL_DOMINATE_MONSTER) ||(GetLastSpell() == SPELL_ENTANGLE) ||(GetLastSpell() == SPELL_FEAR) ||(GetLastSpell() == SPELL_FEEBLEMIND) 
		||(GetLastSpell() == SPELL_FLARE) ||(GetLastSpell() == SPELL_GREASE)||(GetLastSpell() == SPELL_HOLD_ANIMAL) ||(GetLastSpell() == SPELL_HOLD_MONSTER) ||(GetLastSpell() == SPELL_SCARE) 
		||(GetLastSpell() == SPELL_SLEEP) ||(GetLastSpell() == SPELL_STINKING_CLOUD) ||(GetLastSpell() == SPELL_TOUCH_OF_FATIGUE) 
		||(GetLastSpell() == SPELL_VINE_MINE_ENTANGLE) ||(GetLastSpell() == SPELL_VINE_MINE_HAMPER_MOVEMENT) ||(GetLastSpell() == SPELL_WEB) ||(GetLastSpell() == SPELL_GUST_OF_WIND))
			{SendMessageToPC(oStudent, "Either the shock of the spell or the chicken's own movements knock loose some feathers that flutter to your feet.");
			 CreateObject(OBJECT_TYPE_ITEM, "slv_quill_feather", GetLocation(oStudent));
		 	 CreateObject(OBJECT_TYPE_ITEM, "slv_quill_feather", GetLocation(oStudent));
			 if(Random(2) == 1)
			 	{CreateObject(OBJECT_TYPE_ITEM, "slv_quill_feather", GetLocation(oStudent));}
			 if(Random(2) == 1)
			 	{CreateObject(OBJECT_TYPE_ITEM, "slv_quill_feather", GetLocation(oStudent));}
			 if(Random(2) == 1)
			 	{CreateObject(OBJECT_TYPE_ITEM, "slv_quill_feather", GetLocation(oStudent));}
			
			 }
		}
     
	// slv_deandragon_q Phoenix		 
	if(GetTag(OBJECT_SELF) == "abr_cr_mb_phoenix")
		{ClearAllActions(TRUE);
		ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_COMMONER);
		if((GetLastSpell() == SPELL_BLINDNESS_AND_DEAFNESS) || (GetLastSpell() == SPELL_CAUSE_FEAR) || (GetLastSpell() == SPELL_CHARM_MONSTER) 
		||(GetLastSpell() == SPELL_CHARM_PERSON_OR_ANIMAL) ||(GetLastSpell() == SPELL_DAZE) ||(GetLastSpell() == SPELL_DOMINATE_ANIMAL) 
		||(GetLastSpell() == SPELL_DOMINATE_MONSTER) ||(GetLastSpell() == SPELL_ENTANGLE) ||(GetLastSpell() == SPELL_FEAR) ||(GetLastSpell() == SPELL_FEEBLEMIND) 
		||(GetLastSpell() == SPELL_FLARE) ||(GetLastSpell() == SPELL_GREASE)||(GetLastSpell() == SPELL_HOLD_ANIMAL) ||(GetLastSpell() == SPELL_HOLD_MONSTER) ||(GetLastSpell() == SPELL_SCARE) 
		||(GetLastSpell() == SPELL_SLEEP) ||(GetLastSpell() == SPELL_STINKING_CLOUD) ||(GetLastSpell() == SPELL_TOUCH_OF_FATIGUE) 
		||(GetLastSpell() == SPELL_VINE_MINE_ENTANGLE) ||(GetLastSpell() == SPELL_VINE_MINE_HAMPER_MOVEMENT) ||(GetLastSpell() == SPELL_WEB) ||(GetLastSpell() == SPELL_GUST_OF_WIND))
			{SendMessageToPC(oStudent, "Either the shock of the spell or the phoenix's own movements knock loose some feathers that flutter to your feet.");
			 CreateObject(OBJECT_TYPE_ITEM, "003_it_harvest_phx_feather", GetLocation(oStudent));
		 	 CreateObject(OBJECT_TYPE_ITEM, "003_it_harvest_phx_feather", GetLocation(oStudent));
			 if(Random(2) == 1)
			 	{CreateObject(OBJECT_TYPE_ITEM, "003_it_harvest_phx_feather", GetLocation(oStudent));}
			 if(Random(2) == 1)
			 	{CreateObject(OBJECT_TYPE_ITEM, "003_it_harvest_phx_feather", GetLocation(oStudent));}
			 if(Random(2) == 1)
			 	{CreateObject(OBJECT_TYPE_ITEM, "003_it_harvest_phx_feather", GetLocation(oStudent));}
			
			 }
		}
		
 	// slv_deandragon_u Flit		 
	if((GetTag(OBJECT_SELF) == "003_cr_slv_flit") && (ACR_RetrieveQuestState("slv_deandragon_u", oStudent) == 1))
		{ClearAllActions(TRUE);
		ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_COMMONER);
		if((GetLastSpell() == SPELL_BLINDNESS_AND_DEAFNESS) || (GetLastSpell() == SPELL_CAUSE_FEAR) || (GetLastSpell() == SPELL_CHARM_MONSTER) 
		||(GetLastSpell() == SPELL_CHARM_PERSON_OR_ANIMAL) ||(GetLastSpell() == SPELL_DAZE) ||(GetLastSpell() == SPELL_DOMINATE_ANIMAL) 
		||(GetLastSpell() == SPELL_DOMINATE_MONSTER) ||(GetLastSpell() == SPELL_ENTANGLE) ||(GetLastSpell() == SPELL_FEAR) ||(GetLastSpell() == SPELL_FEEBLEMIND) 
		||(GetLastSpell() == SPELL_FLARE) ||(GetLastSpell() == SPELL_GREASE)||(GetLastSpell() == SPELL_HOLD_ANIMAL) ||(GetLastSpell() == SPELL_HOLD_MONSTER) ||(GetLastSpell() == SPELL_SCARE) 
		||(GetLastSpell() == SPELL_SLEEP) ||(GetLastSpell() == SPELL_STINKING_CLOUD) ||(GetLastSpell() == SPELL_TOUCH_OF_FATIGUE) 
		||(GetLastSpell() == SPELL_VINE_MINE_ENTANGLE) ||(GetLastSpell() == SPELL_VINE_MINE_HAMPER_MOVEMENT) ||(GetLastSpell() == SPELL_WEB) ||(GetLastSpell() == SPELL_GUST_OF_WIND))
			{ACR_AddPersistentJournalQuestEntry("slv_deandragon_u", 2, oStudent, FALSE, FALSE, FALSE, 0);
			 SendMessageToPC(oStudent, "The little bat sinks in mid-air at your spell, hovering with slower flaps of its wings, but was it the spell or by choice? The bat's beady brown eyes follow your movements keenly...and then it lifts with a flutter of leathery wings and ducks its head to slide free of the fine chain. It leaves behind the small bronze key and a squeak ringing in your ears that sounds suspiciously impertinent.");
			 CreateItemOnObject("slv_key_stacks", oStudent, 1);
		 	 DestroyObject(OBJECT_SELF, 3.0);
			 }
		}
       	   	  
}