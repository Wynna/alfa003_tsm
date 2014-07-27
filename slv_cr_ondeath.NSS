//OnDeath for all Silvy Uni creatures 
//Wynna February 2008


#include "acr_creature_i"

void main()
{
	ACR_CreatureOnDeath();
    object oStudent = GetLastKiller();
    effect eKnockdown = EffectKnockdown();
	effect eStruck = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);			

	

  
    //Elementary Enchantment
    if(GetTag(OBJECT_SELF) == "003_cr_slv_enc100eyes")
       {object oMyTrigAll = GetLocalObject(OBJECT_SELF, "Enc_All");
						 if(oMyTrigAll == OBJECT_INVALID)
							{oMyTrigAll = GetNearestObjectByTag("slv_in22.00", OBJECT_SELF, 1);
							 SetLocalObject(OBJECT_SELF, "Enc_All", oMyTrigAll);
						    }
						 object oMyGiantWP = GetLocalObject(OBJECT_SELF, "oMyGiantWP");
						 if (oMyGiantWP == OBJECT_INVALID)
								{oMyGiantWP = GetWaypointByTag("Enc_All_Quests_Giant_WP");
								 SetLocalObject(OBJECT_SELF, "oMyGiantWP", oMyGiantWP);
								 }
						 object oMyMirror = GetLocalObject(OBJECT_SELF, "oMyMirror");
						 if (oMyMirror == OBJECT_INVALID)
								{oMyMirror = GetObjectByTag("slv_enc100_plc_mirror");
								 SetLocalObject(OBJECT_SELF, "oMyMirror", oMyMirror);
								 }
						 object oMyGiant = GetLocalObject(OBJECT_SELF, "oMyGiant");
						 if (oMyGiant == OBJECT_INVALID)
								{oMyGiant = GetObjectByTag("003_cr_slv_enc100giant");
								 SetLocalObject(OBJECT_SELF, "oMyGiant", oMyGiant);
								 }
						 object oMyEye1 = GetLocalObject(OBJECT_SELF, "oMyEye1");
						 if (oMyEye1 == OBJECT_INVALID)
								{oMyEye1 = GetObjectByTag("003_cr_slv_enc100eyes", 0);
								 SetLocalObject(OBJECT_SELF, "oMyEye1", oMyEye1);
								 SetLocalObject(oMyGiant, "oMyEye1", oMyEye1);
								 SetLocalObject(oMyEye1, "oMyGiant", oMyGiant);
								 }	
						object oMyEye2 = GetLocalObject(OBJECT_SELF, "oMyEye2");
						 if (oMyEye2 == OBJECT_INVALID)
								{oMyEye2 = GetObjectByTag("003_cr_slv_enc100eyes", 1);
								 SetLocalObject(OBJECT_SELF, "oMyEye2", oMyEye2);
								 SetLocalObject(oMyGiant, "oMyEye2", oMyEye2);
								 SetLocalObject(oMyEye2, "oMyGiant", oMyGiant);
								 }	
						object oMyEye3 = GetLocalObject(OBJECT_SELF, "oMyEye3");
						 if (oMyEye3 == OBJECT_INVALID)
								{oMyEye3 =GetObjectByTag("003_cr_slv_enc100eyes", 2);
								 SetLocalObject(OBJECT_SELF, "oMyEye3", oMyEye3);
								 SetLocalObject(oMyGiant, "oMyEye3", oMyEye3);
								 SetLocalObject(oMyEye3, "oMyGiant", oMyGiant);
								 }	
						object oMyEye4 = GetLocalObject(OBJECT_SELF, "oMyEye4");
						 if (oMyEye4 == OBJECT_INVALID)
								{oMyEye4 = GetObjectByTag("003_cr_slv_enc100eyes", 3);
								 SetLocalObject(OBJECT_SELF, "oMyEye4", oMyEye4);
								 SetLocalObject(oMyGiant, "oMyEye4", oMyEye4);
								 SetLocalObject(oMyEye4, "oMyGiant", oMyGiant);
								 }	
						object oMyEye5 = GetLocalObject(OBJECT_SELF, "oMyEye5");
						 if (oMyEye5 == OBJECT_INVALID)
								{oMyEye5 = GetObjectByTag("003_cr_slv_enc100eyes", 4);
								 SetLocalObject(OBJECT_SELF, "oMyEye5", oMyEye5);
								 SetLocalObject(oMyGiant, "oMyEye5", oMyEye5);
								 SetLocalObject(oMyEye5, "oMyGiant", oMyGiant);
								 }	
						
						     AssignCommand(oMyEye1, ClearAllActions(TRUE));
					         AssignCommand(oMyEye2, ClearAllActions(TRUE));
					         AssignCommand(oMyEye3, ClearAllActions(TRUE));
					         AssignCommand(oMyEye4, ClearAllActions(TRUE));
					         AssignCommand(oMyEye5, ClearAllActions(TRUE));
						     if(GetLocalInt(oStudent, "AngryMessage") != 1)
							     {SetLocalInt(oStudent, "AngryMessage", 1);
						         AssignCommand(oStudent, PlaySound("as_cv_bell2"));
						         object oMyGiant2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_enc100giant", GetLocation(oMyGiant));
								 SetLocalObject(OBJECT_SELF, "oMyGiant2", oMyGiant2);
								 SetLocalObject(oMyTrigAll, "oMyGiant2", oMyGiant2);
								 DestroyObject(oMyGiant);
								 SetLocalObject(oMyTrigAll, "oMyGiant", OBJECT_INVALID);
								 SendMessageToPC(oStudent, "A bell clangs loudly!  The Floating Eyes around the room turn to you, widening and focussing in what is clearly red-veined fury.  The sleeping giant rolls over and wakes.");
						         DelayCommand(1.0, AssignCommand(oMyGiant2, SpeakString("*Yawn*  Huh?  Who dere?  You not take pretty, little mouse! I supposed to polish it!", TALKVOLUME_TALK)));
						         DelayCommand(2.0, SendMessageToPC(oStudent, "The giant snatches up the mirror and thumps across the room with it under his arm."));
						         DelayCommand(3.0, AssignCommand(oMyGiant2, ActionForceMoveToObject(oMyMirror, TRUE, 0.0)));
					 			 DestroyObject(oMyMirror, 3.5);
								 SetLocalObject(GetArea(oMyMirror), "oMirror", OBJECT_INVALID);
				                 }
						     DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye1));
							 DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye2));
							 DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye3));
							 DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye4));
							 DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye5));
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
	  DestroyObject(oMyBearskin);
      SetLocalInt(oStudent, "KilledBoy", 1);
      SendMessageToPC(oStudent, "The boy's body vanishes!  The bearskin rug on the ground rises up, shakes off, yawns a mighty yawn...and is revealed as a real bear cub, previously under an illusion.");
      DelayCommand(2.0, SendMessageToPC(oStudent, "The bear cub gives the air a deep sniff, then its beady eyes fix on the spot where the boy fell and then on you.  It snuffles lumbers a step closer, then stops to shake its head violently, fur bristling.  It roars, shaking the room....and likewise vanishes."));
      DelayCommand(2.5, AssignCommand(oMyBear, PlaySound("as_an_dragonror1")));
      DestroyObject(oMyBear, 3.0);
      DestroyObject(OBJECT_SELF, 4.0);
      }
	  
	  if(GetTag(OBJECT_SELF) == "003_cr_slv_ill100bear") 
	     {object oMyBoy = GetLocalObject(OBJECT_SELF, "oMyBoy");
			 if (oMyBoy == OBJECT_INVALID)
				{oMyBoy = GetObjectByTag("003_cr_slv_ill100boy");
			 	 SetLocalObject(OBJECT_SELF, "oMyBoy", oMyBoy);
				 }
		  SetLocalInt(oStudent, "KilledBear", 1);
	      SendMessageToPC(oStudent, "The bear's body vanishes!  The boy wails in horror and vanishes as well, in mid-scream.");
	      DestroyObject(oMyBoy, 3.0);
	      DestroyObject(OBJECT_SELF, 4.0);
      }
   

    //Standard Necromancy
    if(((GetTag(OBJECT_SELF) == "slv_nec200rato")|| (GetTag(OBJECT_SELF) == "slv_nec200ratdeado")) && (GetTag(GetArea(OBJECT_SELF)) == "SilvyUniClassrooms"))
        {CreateObject(OBJECT_TYPE_CREATURE, "slv_nec200ratdead", GetLocation(GetWaypointByTag("slv_nec200gatedownWP")));
        }
        {}
}