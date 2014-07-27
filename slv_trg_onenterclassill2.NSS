//Silvy Uni Trigger OnEnter. All triggers.
//Wynna September 2007


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "bbs_include"

void main()
{	
	ACR_TriggerOnEnter();
	object oStudent;
	if(GetIsPC(GetEnteringObject()) == TRUE)
		{oStudent = GetEnteringObject();
		}
		
     object oMod = GetModule();
	 SetLocalString(oStudent, "sSchool", "Illusion");
	 int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
 	 SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion, OBJECT_SELF);
			 
			        
	
	//Destroy the collision box keeping the appropriately advanced student from the next test
					if((GetTag(OBJECT_SELF) == "Illusion2_trig") || (GetTag(OBJECT_SELF) == "Illusion3_trig"))
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
						  	
						  			
	

//Standard Illusion

				if((GetName(OBJECT_SELF) == "Illusion2") && (GetLocalInt(oStudent, "Change2") == 1))
						{DelayCommand(15.0, ExecuteScript("slv_trg_onenterclassill2", OBJECT_SELF));
						 if(GetLocalInt(oStudent, "Ill2_message") != 1)
							{SendMessageToPC(oStudent, "The room ahead is filled with a maze of moving, mirrored walls. Passages open, then close. Your reflection looks back at you from a thousand angles, always shifting.");
							 SetLocalInt(oStudent, "Ill2_message", 1);
							 }
					      object oMyTrigAll = GetLocalObject(OBJECT_SELF, "Ill_All");
						  if(oMyTrigAll == OBJECT_INVALID)
							{oMyTrigAll = GetNearestObjectByTag("slv_in22.00", OBJECT_SELF, 1);
							 SetLocalObject(OBJECT_SELF, "Ill_All", oMyTrigAll);
						    }
						  if(GetLocalString(oStudent, "Elementary Illusion") == "Elementary Illusion")
								{object oMyBoyLeave2WP = GetLocalObject(OBJECT_SELF, "oMyBoyLeave2WP");
								 if(oMyBoyLeave2WP == OBJECT_INVALID)
								 	{oMyBoyLeave2WP = GetWaypointByTag("Ill_All_Quests_BoyLeave2_WP");
									 SetLocalObject(OBJECT_SELF, "oMyBoyLeave2WP", oMyBoyLeave2WP);
									 }
								 object oMyBoy = GetLocalObject(oMyBoyLeave2WP, "oMyBoy");
								 if(oMyBoy == OBJECT_INVALID)
								 	{oMyBoy = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100boy", GetLocation(oMyBoyLeave2WP));
								 	 SetLocalObject(oMyBoyLeave2WP, "oMyBoy", oMyBoy);
									 }
								 SetLocalObject(oMyTrigAll, "oMyBoy", oMyBoy);
								 object oMyBear = GetLocalObject(oMyBoyLeave2WP, "oMyBear");
								 if(oMyBear == OBJECT_INVALID)
								 	{oMyBear = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100cub", GetLocation(oMyBoyLeave2WP));
								 	 SetLocalObject(oMyBoyLeave2WP, "oMyBear", oMyBear);
									 }
								 SetLocalObject(oMyTrigAll, "oMyBear", oMyBear);
								 }
						 object oMyForcewall01_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall01_trig");
						 if (oMyForcewall01_trig == OBJECT_INVALID)
								{oMyForcewall01_trig = GetObjectByTag("Ill2_Forcewall01_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall01_trig", oMyForcewall01_trig);
								 }
						 SetLocalObject(oMyForcewall01_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall02_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall02_trig");
						 if (oMyForcewall02_trig == OBJECT_INVALID)
								{oMyForcewall02_trig = GetObjectByTag("Ill2_Forcewall02_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall02_trig", oMyForcewall02_trig);
								 }
						 SetLocalObject(oMyForcewall02_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall03_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall03_trig");
						 if (oMyForcewall03_trig == OBJECT_INVALID)
								{oMyForcewall03_trig = GetObjectByTag("Ill2_Forcewall03_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall03_trig", oMyForcewall03_trig);
								 }
						 SetLocalObject(oMyForcewall03_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall04_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall04_trig");
						 if (oMyForcewall04_trig == OBJECT_INVALID)
								{oMyForcewall04_trig = GetObjectByTag("Ill2_Forcewall04_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall04_trig", oMyForcewall04_trig);
								 }
						 SetLocalObject(oMyForcewall04_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall05_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall05_trig");
						 if (oMyForcewall05_trig == OBJECT_INVALID)
								{oMyForcewall05_trig = GetObjectByTag("Ill2_Forcewall05_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall05_trig", oMyForcewall05_trig);
								 }
						 SetLocalObject(oMyForcewall05_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall06_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall06_trig");
						 if (oMyForcewall06_trig == OBJECT_INVALID)
								{oMyForcewall06_trig = GetObjectByTag("Ill2_Forcewall06_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall06_trig", oMyForcewall06_trig);
								 }
						 SetLocalObject(oMyForcewall06_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall07_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall07_trig");
						 if (oMyForcewall07_trig == OBJECT_INVALID)
								{oMyForcewall07_trig = GetObjectByTag("Ill2_Forcewall07_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall07_trig", oMyForcewall07_trig);
								 }
						 SetLocalObject(oMyForcewall07_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall08_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall08_trig");
						 if (oMyForcewall08_trig == OBJECT_INVALID)
								{oMyForcewall08_trig = GetObjectByTag("Ill2_Forcewall08_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall08_trig", oMyForcewall08_trig);
								 }
						 SetLocalObject(oMyForcewall08_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall09_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall09_trig");
						 if (oMyForcewall09_trig == OBJECT_INVALID)
								{oMyForcewall09_trig = GetObjectByTag("Ill2_Forcewall09_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall09_trig", oMyForcewall09_trig);
								 }
						 SetLocalObject(oMyForcewall09_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall10_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall10_trig");
						 if (oMyForcewall10_trig == OBJECT_INVALID)
								{oMyForcewall10_trig = GetObjectByTag("Ill2_Forcewall10_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall10_trig", oMyForcewall10_trig);
								 }
						 SetLocalObject(oMyForcewall10_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall11_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall11_trig");
						 if (oMyForcewall11_trig == OBJECT_INVALID)
								{oMyForcewall11_trig = GetObjectByTag("Ill2_Forcewall11_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall11_trig", oMyForcewall11_trig);
								 }
						 SetLocalObject(oMyForcewall11_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall12_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall12_trig");
						 if (oMyForcewall12_trig == OBJECT_INVALID)
								{oMyForcewall12_trig = GetObjectByTag("Ill2_Forcewall12_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall12_trig", oMyForcewall12_trig);
								 }
						 SetLocalObject(oMyForcewall12_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall13_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall13_trig");
						 if (oMyForcewall13_trig == OBJECT_INVALID)
								{oMyForcewall13_trig = GetObjectByTag("Ill2_Forcewall13_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall13_trig", oMyForcewall13_trig);
								 }
						 SetLocalObject(oMyForcewall13_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall14_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall14_trig");
						 if (oMyForcewall14_trig == OBJECT_INVALID)
								{oMyForcewall14_trig = GetObjectByTag("Ill2_Forcewall14_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall14_trig", oMyForcewall14_trig);
								 }
						 SetLocalObject(oMyForcewall14_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall15_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall15_trig");
						 if (oMyForcewall15_trig == OBJECT_INVALID)
								{oMyForcewall15_trig = GetObjectByTag("Ill2_Forcewall15_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall15_trig", oMyForcewall15_trig);
								 }
						 SetLocalObject(oMyForcewall15_trig, "oMyIllusion2Trig", OBJECT_SELF);
						 object oMyForcewall01_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall01_WP1");
						 if (oMyForcewall01_WP1 == OBJECT_INVALID)
								{oMyForcewall01_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall01_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall01_WP1", oMyForcewall01_WP1);
								 }
						 object oMyForcewall01 = GetLocalObject(OBJECT_SELF, "oMyForcewall01");
						 if (oMyForcewall01 == OBJECT_INVALID)
								{oMyForcewall01 = GetObjectByTag("Ill2_Forcewall01");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall01", oMyForcewall01);
								 }
						 object oMyForcewall02_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall02_WP1");
						 if (oMyForcewall02_WP1 == OBJECT_INVALID)
								{oMyForcewall02_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall02_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall02_WP1", oMyForcewall02_WP1);
								 }
						 object oMyForcewall02 = GetLocalObject(OBJECT_SELF, "oMyForcewall02");
						 if (oMyForcewall02 == OBJECT_INVALID)
								{oMyForcewall02 = GetObjectByTag("Ill2_Forcewall02");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall02", oMyForcewall02);
								  }
						 object oMyForcewall03_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall03_WP1");
						 if (oMyForcewall03_WP1 == OBJECT_INVALID)
								{oMyForcewall03_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall03_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall03_WP1", oMyForcewall03_WP1);
								 }
						 object oMyForcewall03 = GetLocalObject(OBJECT_SELF, "oMyForcewall03");
						 if (oMyForcewall03 == OBJECT_INVALID)
								{oMyForcewall03 = GetObjectByTag("Ill2_Forcewall03");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall03", oMyForcewall03);
								  }
						 object oMyForcewall04_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall04_WP1");
						 if (oMyForcewall04_WP1 == OBJECT_INVALID)
								{oMyForcewall04_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall04_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall04_WP1", oMyForcewall04_WP1);
								 }
						 object oMyForcewall04 = GetLocalObject(OBJECT_SELF, "oMyForcewall04");
						 if (oMyForcewall04 == OBJECT_INVALID)
								{oMyForcewall04 = GetObjectByTag("Ill2_Forcewall04");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall04", oMyForcewall04);
								 }
						 object oMyForcewall05_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall05_WP2");
						 if (oMyForcewall05_WP2 == OBJECT_INVALID)
								{oMyForcewall05_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall05_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall05_WP2", oMyForcewall05_WP2);
								 }
						 object oMyForcewall05 = GetLocalObject(OBJECT_SELF, "oMyForcewall05");
						 if (oMyForcewall05 == OBJECT_INVALID)
								{oMyForcewall05 = GetObjectByTag("Ill2_Forcewall05");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall05", oMyForcewall05);
								 }
						 object oMyForcewall06_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall06_WP2");
						 if (oMyForcewall06_WP2 == OBJECT_INVALID)
								{oMyForcewall06_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall06_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall06_WP2", oMyForcewall06_WP2);
								 }
						 object oMyForcewall06 = GetLocalObject(OBJECT_SELF, "oMyForcewall06");
						 if (oMyForcewall06 == OBJECT_INVALID)
								{oMyForcewall06 = GetObjectByTag("Ill2_Forcewall06");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall06", oMyForcewall06);
								 }
						 object oMyForcewall07_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall07_WP2");
						 if (oMyForcewall07_WP2 == OBJECT_INVALID)
								{oMyForcewall07_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall07_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall07_WP2", oMyForcewall07_WP2);
								 }
						 object oMyForcewall07 = GetLocalObject(OBJECT_SELF, "oMyForcewall07");
						 if (oMyForcewall07 == OBJECT_INVALID)
								{oMyForcewall07 = GetObjectByTag("Ill2_Forcewall07");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall07", oMyForcewall07);
								 }
						 object oMyForcewall08_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall08_WP1");
						 if (oMyForcewall08_WP1 == OBJECT_INVALID)
								{oMyForcewall08_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall08_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall08_WP1", oMyForcewall08_WP1);
								 }
						 object oMyForcewall08 = GetLocalObject(OBJECT_SELF, "oMyForcewall08");
						 if (oMyForcewall08 == OBJECT_INVALID)
								{oMyForcewall08 = GetObjectByTag("Ill2_Forcewall08");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall08", oMyForcewall08);
								 }
						 object oMyForcewall09_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall09_WP1");
						 if (oMyForcewall09_WP1 == OBJECT_INVALID)
								{oMyForcewall09_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall09_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall09_WP1", oMyForcewall09_WP1);
								 }
						 object oMyForcewall09 = GetLocalObject(OBJECT_SELF, "oMyForcewall09");
						 if (oMyForcewall09 == OBJECT_INVALID)
								{oMyForcewall09 = GetObjectByTag("Ill2_Forcewall09");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall09", oMyForcewall09);
								 }
						 object oMyForcewall10_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall10_WP2");
						 if (oMyForcewall10_WP2 == OBJECT_INVALID)
								{oMyForcewall10_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall10_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall10_WP2", oMyForcewall10_WP2);
								 }
						 object oMyForcewall10 = GetLocalObject(OBJECT_SELF, "oMyForcewall10");
						 if (oMyForcewall10 == OBJECT_INVALID)
								{oMyForcewall10 = GetObjectByTag("Ill2_Forcewall10");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall10", oMyForcewall10);
								 }
						 object oMyForcewall11_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall11_WP2");
						 if (oMyForcewall11_WP2 == OBJECT_INVALID)
								{oMyForcewall11_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall11_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall11_WP2", oMyForcewall11_WP2);
								 }
						 object oMyForcewall11 = GetLocalObject(OBJECT_SELF, "oMyForcewall11");
						 if (oMyForcewall11 == OBJECT_INVALID)
								{oMyForcewall11 = GetObjectByTag("Ill2_Forcewall11");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall11", oMyForcewall11);
								 }
						 object oMyForcewall12_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall12_WP1");
						 if (oMyForcewall12_WP1 == OBJECT_INVALID)
								{oMyForcewall12_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall12_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall12_WP1", oMyForcewall12_WP1);
								 }
						 object oMyForcewall12 = GetLocalObject(OBJECT_SELF, "oMyForcewall12");
						 if (oMyForcewall12 == OBJECT_INVALID)
								{oMyForcewall12 = GetObjectByTag("Ill2_Forcewall12");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall12", oMyForcewall12);
								  }
						 object oMyForcewall13_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall13_WP2");
						 if (oMyForcewall13_WP2 == OBJECT_INVALID)
								{oMyForcewall13_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall13_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall13_WP2", oMyForcewall13_WP2);
								 }
						 object oMyForcewall13 = GetLocalObject(OBJECT_SELF, "oMyForcewall13");
						 if (oMyForcewall13 == OBJECT_INVALID)
								{oMyForcewall13 = GetObjectByTag("Ill2_Forcewall13");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall13", oMyForcewall13);
								 }
						 object oMyForcewall14_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall14_WP1");
						 if (oMyForcewall14_WP1 == OBJECT_INVALID)
								{oMyForcewall14_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall14_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall14_WP1", oMyForcewall14_WP1);
								 }
						 object oMyForcewall14 = GetLocalObject(OBJECT_SELF, "oMyForcewall14");
						 if (oMyForcewall14 == OBJECT_INVALID)
								{oMyForcewall14 = GetObjectByTag("Ill2_Forcewall14");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall14", oMyForcewall14);
								 }
						object oMyForcewall15_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall15_WP2");
						 if (oMyForcewall15_WP2 == OBJECT_INVALID)
								{oMyForcewall15_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall15_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall15_WP2", oMyForcewall15_WP2);
								 }
						 object oMyForcewall15 = GetLocalObject(OBJECT_SELF, "oMyForcewall15");
						 if (oMyForcewall15 == OBJECT_INVALID)
								{oMyForcewall15 = GetObjectByTag("Ill2_Forcewall15");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall15", oMyForcewall15);
								  }
						object oMirrorBlackWP = GetLocalObject(OBJECT_SELF, "oMirrorBlackWP");
						 if(oMirrorBlackWP == OBJECT_INVALID)
						 	{oMirrorBlackWP = GetWaypointByTag("Ill_All_Quests_MirrorBlack_WP");
							 SetLocalObject(OBJECT_SELF, "oMirrorBlackWP", oMirrorBlackWP);
							 }
						 object oMyMirrorBlack = GetLocalObject(OBJECT_SELF, "oMyMirrorBlack");
						 if (oMyMirrorBlack == OBJECT_INVALID)
								{oMyMirrorBlack = GetObjectByTag("slv_ill200_mirrorblack");
								SetLocalObject(OBJECT_SELF, "oMyMirrorBlack", oMyMirrorBlack);
								 }
						 object oMirrorWhiteWP = GetLocalObject(OBJECT_SELF, "oMirrorWhiteWP");
						 if(oMirrorWhiteWP == OBJECT_INVALID)
						 	{oMirrorWhiteWP = GetWaypointByTag("Ill_All_Quests_MirrorWhite_WP");
							 SetLocalObject(OBJECT_SELF, "oMirrorWhiteWP", oMirrorWhiteWP);
							 }
						 object oMyMirrorWhite = GetLocalObject(OBJECT_SELF, "oMyMirrorWhite");
						 if (oMyMirrorWhite == OBJECT_INVALID)
								{oMyMirrorWhite = GetObjectByTag("slv_ill200_mirrorwhite");
								 SetLocalObject(OBJECT_SELF, "oMyMirrorWhite", oMyMirrorWhite);
								 }
						object oMirrorPrismWP = GetLocalObject(OBJECT_SELF, "oMirrorPrismWP");
						 if(oMirrorPrismWP == OBJECT_INVALID)
						 	{oMirrorPrismWP = GetWaypointByTag("Ill_All_Quests_MirrorPrism_WP");
							 SetLocalObject(OBJECT_SELF, "oMirrorPrismWP", oMirrorPrismWP);
							 }
						 object oMyMirrorPrism = GetLocalObject(OBJECT_SELF, "oMyMirrorPrism");
						 if (oMyMirrorPrism == OBJECT_INVALID)
								{oMyMirrorPrism = GetObjectByTag("slv_ill200_mirrorprism");
								 SetLocalObject(OBJECT_SELF, "oMyMirrorPrism", oMyMirrorPrism);
								 }					
						if(GetLocalInt(oMyForcewall01_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall01);
									 location lRandom01 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall01_WP1)), IntToFloat(Random(360)));
									 object oMyForcewall01New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom01, FALSE, "Ill2_Forcewall01");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall01", oMyForcewall01New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall01", oMyForcewall01New);
									  }
						if(GetLocalInt(oMyForcewall02_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall02);
									 location lRandom02 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall02_WP1)), IntToFloat(Random(360)));
									 object oMyForcewall02New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom02, FALSE, "Ill2_Forcewall02");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall02", oMyForcewall02New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall02", oMyForcewall02New);
									 }
					    if(GetLocalInt(oMyForcewall03_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall03);
									 location lRandom03 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall03_WP1)), IntToFloat(Random(360)));
									 object oMyForcewall03New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom03, FALSE, "Ill2_Forcewall03");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall03", oMyForcewall03New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall03", oMyForcewall03New);
									  }
						if(GetLocalInt(oMyForcewall04_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall04);
									 location lRandom04 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall04_WP1)), IntToFloat(Random(360)));
									 object oMyForcewall04New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom04, FALSE, "Ill2_Forcewall04");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall04", oMyForcewall04New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall04", oMyForcewall04New);
									   }
						if(GetLocalInt(oMyForcewall05_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall05);
									 location lRandom05 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall05_WP2)), IntToFloat(Random(360)));
									 object oMyForcewall05New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom05, FALSE, "Ill2_Forcewall05");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall05", oMyForcewall05New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall05", oMyForcewall05New);
									  }
						if(GetLocalInt(oMyForcewall06_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall06);
									 location lRandom06 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall06_WP2)), IntToFloat(Random(360)));
									 object oMyForcewall06New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom06, FALSE, "Ill2_Forcewall06");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall06", oMyForcewall06New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall06", oMyForcewall06New);
									 }
						if(GetLocalInt(oMyForcewall07_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall07);
									 location lRandom07 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall07_WP2)), IntToFloat(Random(360)));
									 object oMyForcewall07New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom07, FALSE, "Ill2_Forcewall07");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall07", oMyForcewall07New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall07", oMyForcewall07New);
									 }
						if(GetLocalInt(oMyForcewall08_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall08);
									 location lRandom08 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall08_WP1)), IntToFloat(Random(360)));
									 object oMyForcewall08New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom08, FALSE, "Ill2_Forcewall08");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall08", oMyForcewall08New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall08", oMyForcewall08New);
									 }
						if(GetLocalInt(oMyForcewall09_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall09);
									 location lRandom09 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall09_WP1)), IntToFloat(Random(360)));
									 object oMyForcewall09New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom09, FALSE, "Ill2_Forcewall09");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall09", oMyForcewall09New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall09", oMyForcewall09New);
									 }
						if(GetLocalInt(oMyForcewall10_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall10);
									 location lRandom10 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall10_WP2)), IntToFloat(Random(360)));
									 object oMyForcewall10New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom10, FALSE, "Ill2_Forcewall10");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall10", oMyForcewall10New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall10", oMyForcewall10New);
									 }
						if(GetLocalInt(oMyForcewall11_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall11);
									 location lRandom11 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall11_WP2)), IntToFloat(Random(360)));
									 object oMyForcewall11New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom11, FALSE, "Ill2_Forcewall11");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall11", oMyForcewall11New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall11", oMyForcewall11New);
									 }
						if(GetLocalInt(oMyForcewall12_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall12);
									 location lRandom12 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall12_WP1)), IntToFloat(Random(360)));
									 object oMyForcewall12New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom12, FALSE, "Ill2_Forcewall12");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall12", oMyForcewall12New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall12", oMyForcewall12New);
									 }
						if(GetLocalInt(oMyForcewall13_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall13);
									 location lRandom13 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall13_WP2)), IntToFloat(Random(360)));
									 object oMyForcewall13New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom13, FALSE, "Ill2_Forcewall13");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall13", oMyForcewall13New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall13", oMyForcewall13New);
									 }
						if(GetLocalInt(oMyForcewall14_trig, "Fixed" + GetName(oStudent)) != 1)
								 	{DestroyObject(oMyForcewall14);
									 location lRandom14 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall14_WP1)), IntToFloat(Random(360)));
									 object oMyForcewall14New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom14, FALSE, "Ill2_Forcewall14");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall14", oMyForcewall14New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall14", oMyForcewall14New);
									 }
						if(GetLocalInt(oMyForcewall15_trig, "Fixed" + GetName(oStudent)) != 1) 
								 	{DestroyObject(oMyForcewall15);
									 location lRandom15 = Location(GetArea(OBJECT_SELF), GetPositionFromLocation(GetLocation(oMyForcewall15_WP2)), IntToFloat(Random(360)));
									 object oMyForcewall15New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", lRandom15, FALSE, "Ill2_Forcewall15");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall15", oMyForcewall15New);
									 SetLocalObject(oMyTrigAll, "oMyForcewall15", oMyForcewall15New);
									 }
						
							}
					
						
					if(FindSubString(GetTag(OBJECT_SELF), "Ill2_Forcewall") != -1)  
						{object oMyIllAllTrig = GetLocalObject(OBJECT_SELF, "oMyIllAllTrig");
					 	 object oMyIll2Trig = GetLocalObject(OBJECT_SELF, "oMyIll2Trig");
						 if (oMyIll2Trig == OBJECT_INVALID)
								{oMyIll2Trig = GetObjectByTag("Illusion2_trig");
								SetLocalObject(OBJECT_SELF, "oMyIll2Trig", oMyIll2Trig);
								 }
						 object oMyWall = GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF));
						 if(oMyWall == OBJECT_INVALID)
						 	{oMyWall = GetObjectByTag(GetName(OBJECT_SELF));
							 SetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF), oMyWall);
							 }
						 string sDigit = GetStringRight(GetTag(oMyWall), 2);
						 string sType = GetStringRight(GetTag(OBJECT_SELF), 1);
						 object oMyWaypoint = GetLocalObject(OBJECT_SELF, "oMyForcewall" + sDigit + "_WP" + sType);
						 if(oMyWaypoint == OBJECT_INVALID)
						 	{oMyWaypoint = GetWaypointByTag("Ill_All_Quests_Forcewall" + sDigit + "_WP" + sType);
						 	 SetLocalObject(OBJECT_SELF, "oMyForcewall" + sDigit + "_WP" + sType, oMyWaypoint);
							}
						 if(GetLocalInt(oMyWall, "Tried") != 1)
							 {if(WillSave(oStudent, 15, SAVING_THROW_TYPE_NONE) == 1)
								{SendMessageToPC(oStudent, "As your reflection gazes back out at you from this mirrored wall, you realize quite clearly the way the wall /must/ be oriented to provide such a reflection. The wall stops shifting and fixes into place.");
								 DestroyObject(oMyWall);
								 SetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF), OBJECT_INVALID);
							     object oMyFixedWall = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyWaypoint), FALSE, "Ill2_Forcewall" + sDigit);
								 SetLocalInt(OBJECT_SELF, "Fixed" + GetName(oStudent), 1);
								 SetLocalInt(oMyFixedWall, "Fixed" + GetName(oStudent), 1);
								 SetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF), oMyFixedWall);
							     oMyWall = GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF));
								 SetLocalObject(oMyIll2Trig, "oMyForcewall" + sDigit, oMyFixedWall);
							 	 SetLocalObject(oMyIllAllTrig, "oMyForcewall" + sDigit, oMyFixedWall);
							 	}
							 else 
								{SendMessageToPC(oStudent, "Your reflection in this mirrored wall refuses to stand still, shifting and dancing with no semblance of reality.");
								 }
							 SetLocalInt(oMyWall, "Tried", 1);
							 DelayCommand(10.0, SetLocalInt(oMyWall, "Tried", 0));
							}
						  else if(GetLocalInt(oMyWall, "Tried") == 1)
							 {SendMessageToPC(oStudent, "There is no change in the mirrored wall yet to afford you another chance to study your reflection for clues to illusion.");
								}	 	 
						
						}

	

}