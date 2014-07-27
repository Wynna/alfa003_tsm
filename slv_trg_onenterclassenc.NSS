//Silvy Uni Enc Trigger NPC OnEnter.  
//Wynna April 2008


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "bbs_include"

void main()
{	
	ACR_TriggerOnEnter();
	object oStudent = GetEnteringObject();
    object oMod = GetModule();
	int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
 	 if((GetIsPC(oStudent)) && (nSchool == 0))
    		{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment, OBJECT_SELF);
			 SetLocalString(oStudent, "sSchool", "Enchantment");
			 }
			    
						 
	//Destroy the collision box keeping the appropriately advanced student from the next test
					if((FindSubString(GetTag(OBJECT_SELF), "2_trig") != -1) || (FindSubString(GetTag(OBJECT_SELF), "3_trig") != -1))
				    	{int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
						 string sSchool = SchoolToString(nSchool);
						 string sPrefix = GetStringLeft(sSchool, 3);
						 string sLevel = "200";
						 string sDigit = "2";
						 if(FindSubString(GetTag(OBJECT_SELF), "3_trig") != -1)
						 	{sLevel = "300";
							 sDigit = "3";
							 }
						object oMyCollBox2WP = GetLocalObject(OBJECT_SELF, "oMyCollBox2WP");
						 if (oMyCollBox2WP == OBJECT_INVALID)
							{oMyCollBox2WP = GetObjectByTag(sSchool + "2_trig_CollBox_WP");
							 SetLocalObject(OBJECT_SELF, "oMyCollBox2WP", oMyCollBox2WP);
							 }
						 object oMyCollBox3WP = GetLocalObject(OBJECT_SELF, "oMyCollBox3WP");
						 if (oMyCollBox3WP == OBJECT_INVALID)
							{oMyCollBox3WP = GetObjectByTag(sSchool + "3_trig_CollBox_WP");
							 SetLocalObject(OBJECT_SELF, "oMyCollBox3WP", oMyCollBox3WP);
							 }
						 object oMyTrigAll = GetLocalObject(OBJECT_SELF, sPrefix + "_All");
						 if(oMyTrigAll == OBJECT_INVALID)
							{oMyTrigAll = GetNearestObjectByTag("slv_in22.00", OBJECT_SELF, 1);
							 SetLocalObject(OBJECT_SELF, sPrefix + "_All", oMyTrigAll);
						    }
						 object oMyTrig2 = GetLocalObject(OBJECT_SELF, "oMyTrig2");
						 if (oMyTrig2 == OBJECT_INVALID)
							{oMyTrig2 = GetObjectByTag( sSchool + "2_trig");
							 SetLocalObject(OBJECT_SELF,  "oMyTrig2", oMyTrig2);
							 }
						 object oMyTrig3 = GetLocalObject(OBJECT_SELF, "oMyTrig3");
						 if (oMyTrig3 == OBJECT_INVALID)
							{oMyTrig3 = GetObjectByTag( sSchool + "3_trig");
							 SetLocalObject(OBJECT_SELF,  "oMyTrig3", oMyTrig3);
							 }
						 object oMyCollBox = GetLocalObject(OBJECT_SELF, "oMyCollBox");
						 if(oMyCollBox == OBJECT_INVALID)
							{oMyCollBox = GetLocalObject(oMyTrigAll, "oMyCollBox" + sDigit);
							 if(oMyCollBox == OBJECT_INVALID)
									{oMyCollBox = GetObjectByTag(GetTag(OBJECT_SELF) + "_CollBox" + sLevel);
									 SetLocalObject(OBJECT_SELF, "oMyCollBox", oMyCollBox);
									}
						    }
						 int nBoxLevel = StringToInt(GetStringRight(GetTag(oMyCollBox), 3));
						 if(GetSilvyUniversitySchoolLevel(oStudent, nSchool) >= nBoxLevel)
							{DestroyObject(oMyCollBox);
							 SetLocalObject(OBJECT_SELF, "oMyCollBox", OBJECT_INVALID);
							 if(sLevel == "200")
							 	{SetLocalObject(OBJECT_SELF, "oMyCollBox2", OBJECT_INVALID);
							 	 SetLocalObject(oMyTrig3, "oMyCollBox2", OBJECT_INVALID);
							 	}
							 if(sLevel == "300")
							 	{SetLocalObject(OBJECT_SELF, "oMyCollBox3", OBJECT_INVALID);
							 	 SetLocalObject(oMyTrig2, "oMyCollBox3", OBJECT_INVALID);
							 	}
							 }
						 else if((oMyCollBox == OBJECT_INVALID) && (sLevel == "200"))
						 	{oMyCollBox = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox2", GetLocation(oMyCollBox2WP), FALSE, GetTag(OBJECT_SELF) + "_CollBox200");
						 	 SetLocalObject(OBJECT_SELF, "oMyCollBox", oMyCollBox);
							 SetLocalObject(OBJECT_SELF, "oMyCollBox2", oMyCollBox);
							 SetLocalObject(oMyTrig3, "oMyCollBox2", oMyCollBox);
							 }
						else if((oMyCollBox == OBJECT_INVALID) && (sLevel == "300"))
						 	{oMyCollBox = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox2", GetLocation(oMyCollBox2WP), FALSE, GetTag(OBJECT_SELF) + "_CollBox300");
						 	 SetLocalObject(OBJECT_SELF, "oMyCollBox", oMyCollBox);
							 SetLocalObject(OBJECT_SELF, "oMyCollBox3", oMyCollBox);
							 SetLocalObject(oMyTrig2, "oMyCollBox3", oMyCollBox);
							 }	
					     else {SendMessageToPC(oStudent, "The wall of force will not let you pass to the next testing area.");
					         }
						}	
						  	
				//Enchantment
				
				    if((GetName(OBJECT_SELF) == "Enchantment1") && (GetIsPC(oStudent)) && (GetCampaignString("SLV_UNI", "Elementary Enchantment", oStudent) != "Elementary Enchantment"))
					   { effect eSleep = EffectSleep();
						 object oMyMirror = GetLocalObject(OBJECT_SELF, "oMyMirror");
						 if (oMyMirror == OBJECT_INVALID)
								{oMyMirror = GetObjectByTag("slv_enc100_plc_mirror");
								 SetLocalObject(OBJECT_SELF, "oMyMirror", oMyMirror);
								 }
						 object oMyTrigAll = GetLocalObject(OBJECT_SELF, "Enc_All");
						 if(oMyTrigAll == OBJECT_INVALID)
							{oMyTrigAll = GetNearestObjectByTag("slv_in22.00", OBJECT_SELF, 1);
							 SetLocalObject(OBJECT_SELF, "Enc_All", oMyTrigAll);
						    }
						 object oMyGiantWP = GetLocalObject(OBJECT_SELF, "oMyGiantWP");
						 if (oMyGiantWP == OBJECT_INVALID)
								{oMyGiantWP = GetWaypointByTag("Enc_All_Quests_Giant_WP");
								 SetLocalObject(OBJECT_SELF, "oMyGiantWP", oMyGiantWP);
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
								 DelayCommand(5.0, AssignCommand(oMyEye1, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
								 }	
						object oMyEye2 = GetLocalObject(OBJECT_SELF, "oMyEye2");
						 if (oMyEye2 == OBJECT_INVALID)
								{oMyEye2 = GetObjectByTag("003_cr_slv_enc100eyes", 1);
								 SetLocalObject(OBJECT_SELF, "oMyEye2", oMyEye2);
								 SetLocalObject(oMyGiant, "oMyEye2", oMyEye2);
								 SetLocalObject(oMyEye2, "oMyGiant", oMyGiant);
								 DelayCommand(10.0, AssignCommand(oMyEye1, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
								 }	
						object oMyEye3 = GetLocalObject(OBJECT_SELF, "oMyEye3");
						 if (oMyEye3 == OBJECT_INVALID)
								{oMyEye3 =GetObjectByTag("003_cr_slv_enc100eyes", 2);
								 SetLocalObject(OBJECT_SELF, "oMyEye3", oMyEye3);
								 SetLocalObject(oMyGiant, "oMyEye3", oMyEye3);
								 SetLocalObject(oMyEye3, "oMyGiant", oMyGiant);
								 DelayCommand(15.0, AssignCommand(oMyEye1, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
								 }	
						object oMyEye4 = GetLocalObject(OBJECT_SELF, "oMyEye4");
						 if (oMyEye4 == OBJECT_INVALID)
								{oMyEye4 = GetObjectByTag("003_cr_slv_enc100eyes", 3);
								 SetLocalObject(OBJECT_SELF, "oMyEye4", oMyEye4);
								 SetLocalObject(oMyGiant, "oMyEye4", oMyEye4);
								 SetLocalObject(oMyEye4, "oMyGiant", oMyGiant);
								 AssignCommand(oMyEye4, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
								}	
						object oMyEye5 = GetLocalObject(OBJECT_SELF, "oMyEye5");
						 if (oMyEye5 == OBJECT_INVALID)
								{oMyEye5 = GetObjectByTag("003_cr_slv_enc100eyes", 4);
								 SetLocalObject(OBJECT_SELF, "oMyEye5", oMyEye5);
								 SetLocalObject(oMyGiant, "oMyEye5", oMyEye5);
								 SetLocalObject(oMyEye5, "oMyGiant", oMyGiant);
								 AssignCommand(oMyEye5, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
								 }	
						
						     AssignCommand(oMyEye1, ClearAllActions(TRUE));
					         AssignCommand(oMyEye2, ClearAllActions(TRUE));
					         AssignCommand(oMyEye3, ClearAllActions(TRUE));
					         AssignCommand(oMyEye4, ClearAllActions(TRUE));
					         AssignCommand(oMyEye5, ClearAllActions(TRUE));
						     if(GetLocalInt(oStudent, "Slept") != 1)
							     {AssignCommand(oStudent, PlaySound("as_cv_bell2"));
						         AssignCommand(oStudent, PlaySound("as_cv_bell2"));
						         object oMyGiant2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_enc100giant", GetLocation(oMyGiant));
								 SetLocalObject(OBJECT_SELF, "oMyGiant2", oMyGiant2);
								 SetLocalObject(oMyTrigAll, "oMyGiant2", oMyGiant2);
								 DestroyObject(oMyGiant);
								 SetLocalObject(oMyTrigAll, "oMyGiant", OBJECT_INVALID);
								 SetLocalInt(oStudent, "AngryMessage", 1);
						         SendMessageToPC(oStudent, "A bell clangs loudly!  The Floating Eyes around the room turn to you, widening and focussing in what is clearly red-veined fury.  The sleeping giant rolls over and wakes.");
						         DelayCommand(1.0, AssignCommand(oMyGiant2, SpeakString("*Yawn*  Huh?  Who dere?  You not take pretty, little mouse! I supposed to polish it!", TALKVOLUME_TALK)));
						         DelayCommand(2.0, SendMessageToPC(oStudent, "The giant snatches up the mirror and thumps across the room with it under his arm."));
						         DelayCommand(3.0, AssignCommand(oMyGiant2, ActionForceMoveToObject(oMyMirror, TRUE, 0.0)));
					 			 DestroyObject(oMyMirror, 3.5);
								 SetLocalObject(GetArea(oMyMirror), "oMyMirror", OBJECT_INVALID);
				                 }
						     DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye1));
							 DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye2));
							 DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye3));
							 DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye4));
							 DelayCommand(IntToFloat(Random(3)), DestroyObject(oMyEye5));
							  }
		 
						//Enchantment2/ Tiny's Door
					if(GetName(OBJECT_SELF) == "Enchantment2") 
					    {object oMyGiant3 = GetLocalObject(OBJECT_SELF, "oMyGiant3");
						 if (oMyGiant3 == OBJECT_INVALID)
								{oMyGiant3 = GetObjectByTag("003_cr_slv_enc100giant");
								 SetLocalObject(OBJECT_SELF, "oMyGiant3", oMyGiant3);
								 }		 
						 object oMyGiantDoor = GetLocalObject(OBJECT_SELF, "oMyGiantDoor");
						 if (oMyGiantDoor == OBJECT_INVALID)
								{oMyGiantDoor = GetObjectByTag("slv_enc_giant_door");
								 SetLocalObject(OBJECT_SELF, "oMyGiantDoor", oMyGiantDoor);
								 }	 
						 object oMyGiantBed = GetLocalObject(OBJECT_SELF, "oMyGiantBed");
						 if (oMyGiantBed == OBJECT_INVALID)
								{oMyGiantBed = GetObjectByTag("slv_enc100_bed");
								 SetLocalObject(OBJECT_SELF, "oMyGiantBed", oMyGiantBed);
								 }	 
						 int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
						 string sSchool = SchoolToString(nSchool);
						 string sPrefix = GetStringLeft(sSchool, 3);
						 string sLevel = "200";
						 if(FindSubString(GetTag(OBJECT_SELF), "3_trig") != -1)
						 	{sLevel = "300";}
						 object oMyTrigAll = GetLocalObject(OBJECT_SELF, sPrefix + "_All");
						 if(oMyTrigAll == OBJECT_INVALID)
							{oMyTrigAll = GetNearestObjectByTag("slv_in22.00", OBJECT_SELF, 1);
							 SetLocalObject(OBJECT_SELF, sPrefix + "_All", oMyTrigAll);
						    }
						 object oMyTrig3 = GetLocalObject(OBJECT_SELF, "oMyTrig3");
						 if (oMyTrig3 == OBJECT_INVALID)
							{oMyTrig3 = GetObjectByTag( sSchool + "3_trig");
							 SetLocalObject(OBJECT_SELF,  "oMyTrig3", oMyTrig3);
							 }
						 object oMyCollBox2 = GetLocalObject(OBJECT_SELF, "oMyCollBox2");
						 if(oMyCollBox2 == OBJECT_INVALID)
							{oMyCollBox2 = GetObjectByTag(GetTag(OBJECT_SELF) + "_CollBox" + sLevel);
							 SetLocalObject(OBJECT_SELF, "oMyCollBox2", oMyCollBox2);
						    }
						 object oMyCollBox3 = GetLocalObject(OBJECT_SELF, "oMyCollBox3");
						 if(oMyCollBox3 == OBJECT_INVALID)
							{oMyCollBox3 = GetLocalObject(oMyTrigAll, "Enchantment3_CollBox");
							 SetLocalObject(OBJECT_SELF, "oMyCollBox3", oMyCollBox3);
						    }
					 
						if(oStudent == oMyGiant3)
							{SetLocked(oMyGiantDoor, FALSE);
							 DestroyObject(oMyCollBox2);
						     DestroyObject(oMyCollBox3);
						     SetLocalObject(OBJECT_SELF, "oMyCollBox2", OBJECT_INVALID);
						     SetLocalObject(OBJECT_SELF, "oMyCollBox3", OBJECT_INVALID);
						     SetLocalObject(oMyTrig3, "oMyCollBox2", OBJECT_INVALID);
						     SetLocalObject(oMyTrig3, "oMyCollBox3", OBJECT_INVALID);
						     SetLocalObject(oMyTrigAll, "oMyCollBox2", OBJECT_INVALID);
						     SetLocalObject(oMyTrigAll, "oMyCollBox3", OBJECT_INVALID);
						     AssignCommand(oStudent, ActionForceMoveToObject(oMyGiantBed, TRUE, 0.0));
				 			 DestroyObject(oStudent, 5.0);
							 
						  	 }
						 
						}
						
}