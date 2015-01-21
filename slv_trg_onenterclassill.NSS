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
	object oStudent = GetEnteringObject();
    object oMod = GetModule();
	
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
						  	
						  			
	
//Elementary Illusion

		if(GetName(OBJECT_SELF) == "Illusion1") 
			{if((GetIsPC(oStudent)) && (GetLocalInt(oStudent, "Change1") == 1))
					    {object oMyChair1 = GetLocalObject(OBJECT_SELF, "oMyChair1");
						 if (oMyChair1 == OBJECT_INVALID)
								{oMyChair1 = GetObjectByTag("slv_ill100_chair1");
								SetLocalObject(OBJECT_SELF, "oMyChair1", oMyChair1);
								 }
						 object oMyChair2 = GetLocalObject(OBJECT_SELF, "oMyChair2");
						 if (oMyChair2 == OBJECT_INVALID)
								{oMyChair2 = GetObjectByTag("slv_ill100_chair2");
								SetLocalObject(OBJECT_SELF, "oMyChair2", oMyChair2);
								 }
						 object oMyLowChair1 = GetLocalObject(OBJECT_SELF, "oMyLowChair1");
						 if (oMyLowChair1 == OBJECT_INVALID)
								{oMyLowChair1 = GetObjectByTag("slv_ill100_low_chair1");
								SetLocalObject(OBJECT_SELF, "oMyLowChair1", oMyLowChair1);
								 }
						 object oMyLowChair2 = GetLocalObject(OBJECT_SELF, "oMyLowChair2");
						 if (oMyLowChair2 == OBJECT_INVALID)
								{oMyLowChair2 = GetObjectByTag("slv_ill100_low_chair2");
								SetLocalObject(OBJECT_SELF, "oMyLowChair2", oMyLowChair2);
								 }
						 object oMyRug = GetLocalObject(OBJECT_SELF, "oMyRug");
						 if (oMyRug == OBJECT_INVALID)
								{oMyRug = GetObjectByTag("slv_ill100_rug");
								SetLocalObject(OBJECT_SELF, "oMyRug", oMyRug);
								 }
						 string sLow = "slv_low_chair";
						 string sMid = "slv_chair";
						 string sRug = "plc_mc_rug";
						 int nRandom = Random(5) + 2;
						 string sRandom = IntToString(nRandom);
						 int nRandomRug = Random(10) + 10;
						 string sRandomRug = IntToString(nRandomRug);
						 if(nRandomRug == 11)
							{sRandom = "19";}
						 if(Random(2) == 1)
							{object oMyChair1New = CreateObject(OBJECT_TYPE_PLACEABLE, sMid + IntToString(nRandom), GetLocation (oMyChair1));
							SetUseableFlag(oMyChair1New, FALSE);
							DestroyObject(oMyChair1);
							oMyChair1 = oMyChair1New;
							SetLocalObject(OBJECT_SELF, "oMyChair1", oMyChair1New);
							}
							
						 if(Random(2) == 1)
							{object oMyChair2New = CreateObject(OBJECT_TYPE_PLACEABLE, sMid + IntToString(nRandom), GetLocation (oMyChair2));
							SetUseableFlag(oMyChair2New, FALSE);
							DestroyObject(oMyChair2);
							oMyChair2 = oMyChair2New;
							SetLocalObject(OBJECT_SELF, "oMyChair2", oMyChair2New);
							}
							
						 if(Random(2) == 1)
							{object oMyLowChair1New = CreateObject(OBJECT_TYPE_PLACEABLE, sLow + IntToString(nRandom), GetLocation (oMyLowChair1));
							SetUseableFlag(oMyLowChair1New, FALSE);
							DestroyObject(oMyLowChair1);
							oMyLowChair1 = oMyLowChair1New;
							SetLocalObject(OBJECT_SELF, "oMyLowChair1", oMyLowChair1New);
							}
							
						 if(Random(2) == 1)
							{object oMyLowChair2New = CreateObject(OBJECT_TYPE_PLACEABLE, sLow + sRandom, GetLocation (oMyLowChair2));
							SetUseableFlag(oMyLowChair2New, FALSE);
							DestroyObject(oMyLowChair2);
							oMyLowChair2 = oMyLowChair2New;
							SetLocalObject(OBJECT_SELF,"oMyLowChair2", oMyLowChair2New);
							}
							
						if(Random(2) == 1)
							{object oMyRugNew = CreateObject(OBJECT_TYPE_PLACEABLE, sRug + sRandomRug, GetLocation (oMyRug));
							DestroyObject(oMyRug);
							oMyRug = oMyRugNew;
							SetLocalObject(OBJECT_SELF,"oMyRug", oMyRugNew);
							}
						 if(GetLocalInt(oStudent, "Change1") == 1)
						 	{DelayCommand(10.0, ExecuteScript("slv_trg_onenterclassill", OBJECT_SELF));
							}
						 }
					}
				else if((GetTag(oStudent) == "003_cr_slv_ill100boy") || (GetTag(oStudent) == "003_cr_slv_ill100cub"))
					{    SetLocalString(OBJECT_SELF, "Illusion", "Illusion");
					     object oMyTrigAll = GetLocalObject(OBJECT_SELF, "Ill_All");
						 if(oMyTrigAll == OBJECT_INVALID)
							{oMyTrigAll = GetNearestObjectByTag("slv_in22.00", OBJECT_SELF, 1);
							 SetLocalObject(OBJECT_SELF, "Ill_All", oMyTrigAll);
						    }
						 object oMyTrig2 = GetLocalObject(OBJECT_SELF, "oMyTrig2");
						 if(oMyTrig2 == OBJECT_INVALID)
							{oMyTrig2 = GetObjectByTag("Illusion2_trig");
							 SetLocalObject(OBJECT_SELF, "oMyTrig2", oMyTrig2);
						    }
						 object oMyTrig3 = GetLocalObject(OBJECT_SELF, "oMyTrig3");
						 if(oMyTrig3 == OBJECT_INVALID)
							{oMyTrig3 = GetObjectByTag("Illusion3_trig");
							 SetLocalObject(OBJECT_SELF, "oMyTrig3", oMyTrig3);
						    }
						 object oMyCollBox2 = GetLocalObject(oMyTrigAll, "oMyCollBox2");
						 if(oMyCollBox2 == OBJECT_INVALID)
							{oMyCollBox2 = GetObjectByTag("Illusion2_CollBox200");
							 SetLocalObject(oMyTrigAll, "oMyCollBox2", oMyCollBox2);
						    }
						 object oMyBoy = GetLocalObject(oMyTrigAll, "oMyBoy");
						 if (oMyBoy == OBJECT_INVALID)
							{oMyBoy = GetObjectByTag("003_cr_slv_ill100boy");
						 	 SetLocalObject(oMyTrigAll, "oMyBoy", oMyBoy);
							 }
						  object oMyBear = GetLocalObject(oMyTrigAll, "oMyBear");
						 if (oMyBear == OBJECT_INVALID)
							{oMyBear = GetObjectByTag("003_cr_slv_ill100cub");
						 	 SetLocalObject(oMyTrigAll, "oMyBear", oMyBear);
							 }
						 object oMyForcewall03 = GetLocalObject(oMyTrigAll, "oMyForcewall03");
						 if (oMyForcewall03 == OBJECT_INVALID)
								{oMyForcewall03 = GetObjectByTag("Ill2_Forcewall03");
								 SetLocalObject(oMyTrigAll, "oMyForcewall03", oMyForcewall03);
								  }
						  DestroyObject(oMyCollBox2);
						  SetLocalObject(OBJECT_SELF, "oMyCollBox2", OBJECT_INVALID);
						  SetLocalObject(oMyTrigAll, "oMyCollBox2", OBJECT_INVALID);
						  SetLocalObject(oMyTrig2, "oMyCollBox2", OBJECT_INVALID);
						  SetLocalObject(oMyTrig3, "oMyCollBox2", OBJECT_INVALID);
						  AssignCommand(oMyBoy, ActionForceMoveToObject(oMyForcewall03, TRUE, 0.0));
		 				  AssignCommand(oMyBear, ActionForceMoveToObject(oMyForcewall03, TRUE, 0.0));
		 				  DestroyObject(oMyBear, 10.0);
						  SetLocalObject(oMyTrigAll, "oMyBear", OBJECT_INVALID);
						  DestroyObject(oMyBoy, 10.0);
						  SetLocalObject(oMyTrigAll, "oMyBoy", OBJECT_INVALID);
						  	
						}	 
//Standard Illusion

				if((GetName(OBJECT_SELF) == "Illusion2") && (GetLocalInt(oStudent, "Change2") == 1))
						{if(GetLocalInt(oStudent, "Ill2_message") != 1)
							{SendMessageToPC(oStudent, "The room ahead is filled with a maze of shifting, mirrored walls. Passages open, then close. Your reflection looks back at you from a thousand angles, always shifting.");
							 SetLocalInt(oStudent, "Ill2_message", 1);
							 }
					      object oMyIllAllTrig = GetLocalObject(OBJECT_SELF, "oMyIllAllTrig");
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
								 SetLocalObject(oMyIllAllTrig, "oMyBoy", oMyBoy);
								// object oMyBear = GetLocalObject(oMyBoyLeave2WP, "oMyBear");
								// if(oMyBear == OBJECT_INVALID)
								// 	{oMyBear = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100cub", GetLocation(oMyBoyLeave2WP));
								 //	 SetLocalObject(oMyBoyLeave2WP, "oMyBear", oMyBear);
								//	 }
								// SetLocalObject(oMyIllAllTrig, "oMyBear", oMyBear);
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
								{oMyForcewall01_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall05_WP2");
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
								SetLocalObject(OBJECT_SELF, "oMyForcewall010_WP2", oMyForcewall10_WP2);
								 }
						 object oMyForcewall10 = GetLocalObject(OBJECT_SELF, "oMyForcewall10");
						 if (oMyForcewall10 == OBJECT_INVALID)
								{oMyForcewall10 = GetObjectByTag("Ill2_Forcewall10");
								 SetLocalObject(OBJECT_SELF, "oMyForcewall010", oMyForcewall10);
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
						 object oMirrorBlack = GetLocalObject(OBJECT_SELF, "oMirrorBlack");
						 if (oMirrorBlack == OBJECT_INVALID)
								{oMirrorBlack = GetObjectByTag("slv_ill200_mirrorblack");
								SetLocalObject(OBJECT_SELF, "oMirrorBlack", oMirrorBlack);
								 }
						 object oMirrorWhiteWP = GetLocalObject(OBJECT_SELF, "oMirrorWhiteWP");
						 if(oMirrorWhiteWP == OBJECT_INVALID)
						 	{oMirrorWhiteWP = GetWaypointByTag("Ill_All_Quests_MirrorWhite_WP");
							 SetLocalObject(OBJECT_SELF, "oMirrorWhiteWP", oMirrorWhiteWP);
							 }
						 object oMirrorWhite = GetLocalObject(OBJECT_SELF, "oMirrorWhite");
						 if (oMirrorWhite == OBJECT_INVALID)
								{oMirrorWhite = GetObjectByTag("slv_ill200_mirrorwhite");
								 SetLocalObject(OBJECT_SELF, "oMirrorWhite", oMirrorWhite);
								 }
						 object oMirrorPrismWP = GetLocalObject(OBJECT_SELF, "oMirrorPrismWP");
						 if(oMirrorPrismWP == OBJECT_INVALID)
						 	{oMirrorPrismWP = GetWaypointByTag("Ill_All_Quests_MirrorPrism_WP");
							 SetLocalObject(OBJECT_SELF, "oMirrorPrismWP", oMirrorPrismWP);
							 }
						 object oMirrorPrism = GetLocalObject(OBJECT_SELF, "oMirrorPrism");
						 if (oMirrorPrism == OBJECT_INVALID)
								{oMirrorPrism = GetObjectByTag("slv_ill200_mirrorprism");
								 SetLocalObject(OBJECT_SELF, "oMirrorPrism", oMirrorPrism);
								 }					
						if((GetLocalInt(oMyForcewall01_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall01, IntToFloat(Random(10)));
									 object oMyForcewall01New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall01_WP1), FALSE, "Ill2_Forcewall01");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall01", oMyForcewall01New);
									 }
						if((GetLocalInt(oMyForcewall02_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall02, IntToFloat(Random(10)));
									 object oMyForcewall02New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall02_WP1), FALSE, "Ill2_Forcewall02");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall02", oMyForcewall02New);
									 }
					    if((GetLocalInt(oMyForcewall03_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall03, IntToFloat(Random(10)));
									 object oMyForcewall03New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall03_WP1), FALSE, "Ill2_Forcewall03");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall03", oMyForcewall03New);
									 }
						if((GetLocalInt(oMyForcewall04_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall04, IntToFloat(Random(10)));
									 object oMyForcewall04New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall04_WP1), FALSE, "Ill2_Forcewall04");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall04", oMyForcewall04New);
									 }
						if((GetLocalInt(oMyForcewall05_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall05, IntToFloat(Random(10)));
									 object oMyForcewall05New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall05_WP2), FALSE, "Ill2_Forcewall05");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall05", oMyForcewall05New);
									 }
						if((GetLocalInt(oMyForcewall06_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall06, IntToFloat(Random(10)));
									 object oMyForcewall06New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall06_WP2), FALSE, "Ill2_Forcewall06");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall06", oMyForcewall06New);
									 }
						if((GetLocalInt(oMyForcewall07_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall07, IntToFloat(Random(10)));
									 object oMyForcewall07New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall07_WP2), FALSE, "Ill2_Forcewall07");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall07", oMyForcewall07New);
									 }
						if((GetLocalInt(oMyForcewall08_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall08, IntToFloat(Random(10)));
									 object oMyForcewall08New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall08_WP1), FALSE, "Ill2_Forcewall08");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall08", oMyForcewall08New);
									 }
						if((GetLocalInt(oMyForcewall09_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall09, IntToFloat(Random(10)));
									 object oMyForcewall09New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall09_WP1), FALSE, "Ill2_Forcewall09");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall09", oMyForcewall09New);
									 }
						if((GetLocalInt(oMyForcewall10_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall10, IntToFloat(Random(10)));
									 object oMyForcewall10New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall10_WP2), FALSE, "Ill2_Forcewall10");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall10", oMyForcewall10New);
									 }
						if((GetLocalInt(oMyForcewall11_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall11, IntToFloat(Random(10)));
									 object oMyForcewall11New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall11_WP2), FALSE, "Ill2_Forcewall11");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall11", oMyForcewall11New);
									 }
						if((GetLocalInt(oMyForcewall12_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall12, IntToFloat(Random(10)));
									 object oMyForcewall12New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall12_WP1), FALSE, "Ill2_Forcewall12");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall12", oMyForcewall12New);
									 }
						if((GetLocalInt(oMyForcewall13_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall13, IntToFloat(Random(10)));
									 object oMyForcewall13New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall13_WP2), FALSE, "Ill2_Forcewall13");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall13", oMyForcewall13New);
									 }
						if((GetLocalInt(oMyForcewall14_trig, "Fixed" + GetName(oStudent)) != 1)&& (Random(2) > 0))
								 	{DestroyObject(oMyForcewall14, IntToFloat(Random(10)));
									 object oMyForcewall14New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall14_WP1), FALSE, "Ill2_Forcewall14");
									 SetLocalObject(OBJECT_SELF, "oMyForcewall14", oMyForcewall14New);
									 }
						if((GetLocalInt(oMyForcewall15_trig, "Fixed" + GetName(oStudent)) != 1) && (Random(2) > 0))
								 	{DestroyObject(oMyForcewall15, IntToFloat(Random(10)));
									 object oMyForcewall15New = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + IntToString(Random(2)+1), GetLocation(oMyForcewall15_WP2), FALSE, "Ill2_Forcewall15");
								 	 SetLocalObject(OBJECT_SELF, "oMyForcewall15", oMyForcewall15New);
									 }
						if(GetLocalInt(oStudent, "Change2") == 1)
								 	{DelayCommand(15.0, ExecuteScript("slv_trg_onenterclassill", OBJECT_SELF));
									}
							}
					
						
				if((FindSubString(GetTag(OBJECT_SELF), "Ill2_Forcewall") != -1) && (GetLocalInt(OBJECT_SELF, "Fixed" + GetName(oStudent)) != 1))
					{if((GetTag(OBJECT_SELF) == "Ill2_Forcewall13_trig2") && (GetLocalInt(OBJECT_SELF, "Localized") != 1))
						{object oMirrorPrism = GetLocalObject(OBJECT_SELF, "oMirrorPrism");
						 if(oMirrorPrism == OBJECT_INVALID)
						 	{oMirrorPrism = GetObjectByTag("slv_ill200_mirrorprism");
							 SetLocalObject(OBJECT_SELF, "oMirrorPrism", oMirrorPrism);
							 }
						 SetUseableFlag(oMirrorPrism, TRUE);
						 SetLocalInt(OBJECT_SELF, "Localized", 1);
						}
					 if((GetTag(OBJECT_SELF) == "Ill2_Forcewall09_trig1")&& (GetLocalInt(OBJECT_SELF, "Localized") != 1))
						{object oMirrorBlack = GetLocalObject(OBJECT_SELF, "oMirrorBlack");
						 if(oMirrorBlack == OBJECT_INVALID)
						 	{oMirrorBlack = GetObjectByTag("slv_ill200_mirrorblack");
							 SetLocalObject(OBJECT_SELF, "oMirrorBlack", oMirrorBlack);
							 }
						 SetUseableFlag(oMirrorBlack, TRUE);
					 	 SetLocalInt(OBJECT_SELF, "Localized", 1);
						}
					 if((GetTag(OBJECT_SELF) == "Ill2_Forcewall14_trig2")&& (GetLocalInt(OBJECT_SELF, "Localized") != 1))
						{object oMirrorWhite = GetLocalObject(OBJECT_SELF, "oMirrorWhite");
						 if(oMirrorWhite == OBJECT_INVALID)
						 	{oMirrorWhite = GetObjectByTag("slv_ill200_mirrorwhite");
							 SetLocalObject(OBJECT_SELF, "oMirrorWhite", oMirrorWhite);
							 }
						 SetUseableFlag(oMirrorWhite, TRUE);
					 	 SetLocalInt(OBJECT_SELF, "Localized", 1);
						}
					 object oMyIllAllTrig = GetLocalObject(OBJECT_SELF, "oMyIllAllTrig");
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
					 object oMyWaypoint = GetLocalObject(OBJECT_SELF, "Ill_All_Quests_Forcewall" + sDigit + "WP" + sType);
					 if(GetLocalInt(oMyWall, "Tried") != 1)
						 {if(WillSave(oStudent, 15, SAVING_THROW_TYPE_NONE) == 1)
							{SendMessageToPC(oStudent, "As your reflection gazes back out at you from this mirrored wall, you realize quite clearly the way the wall /must/ be oriented to provide such a reflection. The wall stops shifting and fixes into place.");
							 DestroyObject(oMyWall);
							 object oMyFixedWall = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox" + sType, GetLocation(oMyWaypoint), FALSE, "Ill2_Forcewall" + sDigit);
							 SetLocalInt(OBJECT_SELF, "Fixed" + GetName(oStudent), 1);
							 SetLocalInt(oMyFixedWall, "Fixed" + GetName(oStudent), 1);
							 SetLocalObject(oMyIll2Trig, "oMyForcewall" + sDigit, oMyFixedWall);
						 	 SetLocalObject(oMyIllAllTrig, "oMyForcewall" + sDigit, oMyFixedWall);
						 	}
						 else if(WillSave(oStudent, 15, SAVING_THROW_TYPE_NONE) != 1)
							{SendMessageToPC(oStudent, "Your reflection in this mirrored wall refuses to stand still, shifting and dancing with no semblance of reality.");
							 }
						 SetLocalInt(oMyWall, "Tried", 1);
						}
					  else if(GetLocalInt(oMyWall, "Tried") == 1)
						 {SendMessageToPC(oStudent, "There is no change in the mirrored wall yet to afford you another chance to study your reflection for clues to illusion.");
							}	 	 
						
					}


}