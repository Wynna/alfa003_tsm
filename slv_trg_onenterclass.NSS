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
	effect eKnockdown = EffectKnockdown();
	effect eParalyze = EffectParalyze();
	string sAlignment;
	if(GetAlignmentGoodEvil(oStudent) == ALIGNMENT_GOOD)
		{sAlignment = "Good";}
		 else if(GetAlignmentGoodEvil(oStudent) == ALIGNMENT_EVIL)
			{sAlignment = "Evil";}
			else
			{sAlignment = "Neutral to the struggle of good and evil";}
	

 if((GetIsPC(oStudent) != TRUE) && (GetIsDMPossessed(oStudent) != TRUE))
		{return;}
		
	
//The following are the individual onenter events for the classroom triggers.

 if(FindSubString(GetName(OBJECT_SELF), "_All") != -1) 
 	{SetLocalInt(oStudent, "InClass", 1);
	 SetLocalObject(oStudent, "LastTrig", OBJECT_SELF);
	}
	
 int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
 if((GetIsPC(oStudent) && ((FindSubString(GetName(OBJECT_SELF), "Abj") != -1) || (FindSubString(GetName(OBJECT_SELF), "Con") != -1) ||(FindSubString(GetName(OBJECT_SELF), "Div") != -1) ||(FindSubString(GetName(OBJECT_SELF), "Enc") != -1) 
 	|| (FindSubString(GetName(OBJECT_SELF), "Evo") != -1) ||(FindSubString(GetName(OBJECT_SELF), "Ill") != -1) ||(FindSubString(GetName(OBJECT_SELF), "Nec") != -1) ||(FindSubString(GetName(OBJECT_SELF), "Tra") != -1))))
		   {if(nSchool == 0)
    		   {if(FindSubString(GetName(OBJECT_SELF), "Abj") != -1)
					{SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration, OBJECT_SELF);
			   		 SetLocalString(oStudent, "sSchool", "Abjuration");
			        }
				if(FindSubString(GetName(OBJECT_SELF), "Con") != -1)
					{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration, OBJECT_SELF);
			   		 SetLocalString(oStudent, "sSchool", "Conjuration");
			        }
				if(FindSubString(GetName(OBJECT_SELF), "Div") != -1)
					{SetSilvyUniversitySchool(SilvyUniversitySchoolDivination, OBJECT_SELF);
			   		 SetLocalString(oStudent, "sSchool", "Divination");
			        }
				if(FindSubString(GetName(OBJECT_SELF), "Enc") != -1)
					{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment, OBJECT_SELF);
			   		 SetLocalString(oStudent, "sSchool", "Enchantment");
			        }
				if(FindSubString(GetName(OBJECT_SELF), "Evo") != -1)
					{SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation, OBJECT_SELF);
			   		 SetLocalString(oStudent, "sSchool", "Evocation");
			        }
				if(FindSubString(GetName(OBJECT_SELF), "Ill") != -1)
					{SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion, OBJECT_SELF);
			   		 SetLocalString(oStudent, "sSchool", "Illusion");
			        }
				if(FindSubString(GetName(OBJECT_SELF), "Nec") != -1)
					{SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy, OBJECT_SELF);
			   		 SetLocalString(oStudent, "sSchool", "Necromancy");
			        }
				if(FindSubString(GetName(OBJECT_SELF), "Tra") != -1)
					{SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation, OBJECT_SELF);
			   		 SetLocalString(oStudent, "sSchool", "Transmutation");
			        }

			  			
				    
				if(FindSubString(GetTag(OBJECT_SELF), "slv_door_") != -1)
				   {object oMyDoor = GetLocalObject(OBJECT_SELF, "oMyDoor");
				    if(oMyDoor == OBJECT_INVALID)
						{oMyDoor = GetObjectByTag(GetName(OBJECT_SELF), 0);
						 SetLocalObject(OBJECT_SELF, "oMyDoor", oMyDoor);
						 }
					if(FindSubString(GetTag(oMyDoor), "Abj") != -1)
						{SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration, oMyDoor);
				   		 }
					if(FindSubString(GetTag(oMyDoor), "Con") != -1)
						{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration, oMyDoor);
				   		 }
					if(FindSubString(GetTag(oMyDoor), "Div") != -1)
						{SetSilvyUniversitySchool(SilvyUniversitySchoolDivination, oMyDoor);
				   		 }
					if(FindSubString(GetTag(oMyDoor), "Enc") != -1)
						{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment, oMyDoor);
				   		 }
					if(FindSubString(GetTag(oMyDoor), "Evo") != -1)
						{SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation, oMyDoor);
				   		 }
					if(FindSubString(GetTag(oMyDoor), "Ill") != -1)
						{SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion, oMyDoor);
				   		 }
					if(FindSubString(GetTag(oMyDoor), "Nec") != -1)
						{SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy, oMyDoor);
				   		 }
					if(FindSubString(GetTag(oMyDoor), "Tra") != -1)
						{SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation, oMyDoor);
				   		 }
					}	
				} 
			}		 
					
						    
				     //Basic instruction for failsafe open/don't open to right students
				  if(FindSubString(GetName(OBJECT_SELF), "slv_door_") != -1)      
					   {nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
						string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
						string sSchool = SchoolToString(nSchool);
					 	int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
						object oMyDoor = GetLocalObject(OBJECT_SELF, "oMyDoor");
						string sDoor = GetStringRight(GetTag(oMyDoor),1);
						int nDoor = StringToInt(sDoor) * 100;
						if((GetIsPC(oStudent) == FALSE) && (nLevel >= nDoor)&& (sCurrentCourse != "") && (GetLocalString(oMyDoor, "Unlocked") == ""))
							
				           {effect eKnock = EffectVisualEffect(VFX_DUR_SOOTHING_LIGHT, FALSE);
						    effect eStop = EffectVisualEffect(VFX_DUR_LIGHT_RED_10);
		 					ActionUnlockObject(oMyDoor);
				            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
				            SetLocalString(oMyDoor, "Unlocked", "Normally");
				            ActionOpenDoor(oMyDoor);
							DelayCommand(30.0, ActionCloseDoor(oMyDoor));
							DelayCommand(32.0, SetLocked(oMyDoor, TRUE));
							DelayCommand(32.5, SetLocalString(oMyDoor, "Unlocked", ""));
				           }
					}
		//Destroy Roofs for ease of viewing			
		if((FindSubString(GetName(OBJECT_SELF), "All") != -1) && (GetIsPC(oStudent)))
			{int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
			 string sSchool = SchoolToString(nSchool);
			 object oMyRoof1 = GetLocalObject(OBJECT_SELF, "oMyRoof1");
			 if(oMyRoof1 == OBJECT_INVALID)
			 	{oMyRoof1 = GetObjectByTag(sSchool + "_Roof1");
				 }
			 object oMyRoof2 = GetLocalObject(OBJECT_SELF, "oMyRoof2");
			 if(oMyRoof2 == OBJECT_INVALID)
			 	{oMyRoof2 = GetObjectByTag(sSchool + "_Roof2");
				 }
			 object oMyRoof3 = GetLocalObject(OBJECT_SELF, "oMyRoof3");
			 if(oMyRoof3 == OBJECT_INVALID)
			 	{oMyRoof3 = GetObjectByTag(sSchool + "_Roof3");
				 }
			 DestroyObject(oMyRoof1);
			 SetLocalObject(OBJECT_SELF, "oMyRoof1", OBJECT_INVALID);
			 DestroyObject(oMyRoof2);
			 SetLocalObject(OBJECT_SELF, "oMyRoof2", OBJECT_INVALID);
			 DestroyObject(oMyRoof3);
			 SetLocalObject(OBJECT_SELF, "oMyRoof3", OBJECT_INVALID);
			 
				}
					//Create the collision boxes to keep the lower level students from the next tests
				
					if((FindSubString(GetName(OBJECT_SELF),"_All") != -1) && (GetIsPC(oStudent)))
						{int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
						 string sSchool = SchoolToString(nSchool);
						 string sPrefix = GetStringRight(sSchool, 3);
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
						 object oMyTrig1 = GetLocalObject(OBJECT_SELF, sSchool + "1_trig");
						 if (oMyTrig1 == OBJECT_INVALID)
							{oMyTrig1 = GetObjectByTag( sSchool + "1_trig");
							 SetLocalObject(OBJECT_SELF,  sSchool + "1_trig", oMyTrig1);
							 SetLocalObject(oMyTrig1,  "oMyTrigAll", OBJECT_SELF);
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
						 object oMyCollBox2 = GetLocalObject(OBJECT_SELF, "oMyCollBox2");
						 if (oMyCollBox2 == OBJECT_INVALID)
							{oMyCollBox2 = GetObjectByTag(sSchool + "2_trig_CollBox200");
							 if((oMyCollBox2 == OBJECT_INVALID) && (FindSubString(sSchool, "Abj") == -1))
							 	{oMyCollBox2 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox2", GetLocation(oMyCollBox2WP), FALSE, GetTag(oMyTrig2) + "_CollBox200");
						 		}
							 SetLocalObject(OBJECT_SELF, "oMyCollBox2", oMyCollBox2);
							}
						 
						object oMyCollBox3 = GetLocalObject(OBJECT_SELF, "oMyCollBox3");
						 if (oMyCollBox3 == OBJECT_INVALID)
							{oMyCollBox3 = GetObjectByTag(sSchool + "3_trig_CollBox300");
							 if(oMyCollBox3 == OBJECT_INVALID)
							 	{oMyCollBox3 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox2", GetLocation(oMyCollBox3WP), FALSE, GetTag(oMyTrig3) + "_CollBox300");
						 		}
							 SetLocalObject(OBJECT_SELF, "oMyCollBox3", oMyCollBox3);
							}
						 SetLocalObject(oMyTrig1, sPrefix + "_All", OBJECT_SELF);
						 SetLocalObject(oMyTrig1, "oMyCollBox2", oMyCollBox2);
						 SetLocalObject(oMyTrig1, "oMyCollBox3", oMyCollBox3);
						 SetLocalObject(oMyTrig1, "oMyTrig2", oMyTrig2);
						 SetLocalObject(oMyTrig1, "oMyTrig3", oMyTrig3);
						 SetLocalObject(oMyTrig2, sPrefix + "_All", OBJECT_SELF);
						 SetLocalObject(oMyTrig2, "oMyCollBox", oMyCollBox2);
						 SetLocalObject(oMyTrig2, "oMyCollBox2", oMyCollBox2);
						 SetLocalObject(oMyTrig2, "oMyCollBox3", oMyCollBox3);
						 SetLocalObject(oMyTrig2, "oMyTrig1", oMyTrig1);
						 SetLocalObject(oMyTrig2, "oMyTrig3", oMyTrig3);
						 SetLocalObject(oMyTrig3, sPrefix + "_All", OBJECT_SELF);
						 SetLocalObject(oMyTrig3, "oMyTrig2", oMyTrig2);
						 SetLocalObject(oMyTrig3, "oMyTrig1", oMyTrig1);
						 SetLocalObject(oMyTrig3, "oMyCollBox", oMyCollBox3);
						 SetLocalObject(oMyTrig3, "oMyCollBox2", oMyCollBox2);
						 SetLocalObject(oMyTrig3, "oMyCollBox3", oMyCollBox3);
						 }
						
				//Destroy the collision box keeping the appropriately advanced student from the next test
					if((FindSubString(GetTag(OBJECT_SELF), "2_trig") != -1) || (FindSubString(GetTag(OBJECT_SELF), "3_trig") != -1) && ((GetIsPC(oStudent)) || (GetIsDMPossessed(oStudent))))
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
							 	 SetLocalObject(oMyTrigAll, "oMyCollBox2", OBJECT_INVALID);
							   }
							 if(sLevel == "300")
							 	{SetLocalObject(OBJECT_SELF, "oMyCollBox3", OBJECT_INVALID);
							 	 SetLocalObject(oMyTrig2, "oMyCollBox3", OBJECT_INVALID);
							 	 SetLocalObject(oMyTrigAll, "oMyCollBox3", OBJECT_INVALID);
							   }
							 }
						 else if((oMyCollBox == OBJECT_INVALID) && (GetSilvyUniversitySchoolLevel(oStudent, nSchool) < nBoxLevel) && (sLevel == "200") && (FindSubString(sSchool, "Abj") == -1))
						 	{oMyCollBox = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox2", GetLocation(oMyCollBox2WP), FALSE, GetTag(OBJECT_SELF) + "_CollBox200");
						 	 SetLocalObject(OBJECT_SELF, "oMyCollBox", oMyCollBox);
							 SetLocalObject(OBJECT_SELF, "oMyCollBox2", oMyCollBox);
							 SetLocalObject(oMyTrig3, "oMyCollBox2", oMyCollBox);
							 SetLocalObject(oMyTrigAll, "oMyCollBox2", oMyCollBox);
							   }
						else if((oMyCollBox == OBJECT_INVALID) && (GetSilvyUniversitySchoolLevel(oStudent, nSchool) < nBoxLevel) && (sLevel == "300"))
						 	{oMyCollBox = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox2", GetLocation(oMyCollBox3WP), FALSE, GetTag(OBJECT_SELF) + "_CollBox300");
						 	 SetLocalObject(OBJECT_SELF, "oMyCollBox", oMyCollBox);
							 SetLocalObject(OBJECT_SELF, "oMyCollBox3", oMyCollBox);
							 SetLocalObject(oMyTrig2, "oMyCollBox3", oMyCollBox);
							 SetLocalObject(oMyTrigAll, "oMyCollBox3", oMyCollBox);
							 }	
					     
						}
			
			
		//Enables usable Advanced Level testing quill, chair and desk on approach	
		 
	if((GetTag(OBJECT_SELF) == "slv_300_trig") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  	{object oQuill = GetLocalObject(OBJECT_SELF, "oQuill");
		 if(oQuill == OBJECT_INVALID)
				{oQuill = GetNearestObjectByTag("slv_300_quill", OBJECT_SELF, 1);
				 SetLocalObject(OBJECT_SELF, "oQuill", oQuill);
				 }
		  SetUseableFlag(oQuill, TRUE);
		 object oDesk = GetLocalObject(OBJECT_SELF, "oDesk");
		 if(oDesk == OBJECT_INVALID)
				{oDesk = GetNearestObjectByTag("slv_300_desk", OBJECT_SELF, 1);
				 SetLocalObject(OBJECT_SELF, "oDesk", oDesk);
				 }
		  SetUseableFlag(oDesk, TRUE);
		 if(GetSilvyUniversitySchool(oDesk) == 0)
		 			{if(FindSubString(GetName(oDesk), "Abj") != -1)
							{SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration, oDesk);
					   		 }
						if(FindSubString(GetName(oDesk), "Con") != -1)
							{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration, oDesk);
					   		 }
						if(FindSubString(GetName(oDesk), "Div") != -1)
							{SetSilvyUniversitySchool(SilvyUniversitySchoolDivination, oDesk);
					   		 }
						if(FindSubString(GetName(oDesk), "Enc") != -1)
							{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment, oDesk);
					   		 }
						if(FindSubString(GetName(oDesk), "Evo") != -1)
							{SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation, oDesk);
					   		 }
						if(FindSubString(GetName(oDesk), "Ill") != -1)
							{SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion, oDesk);
					   		 }
						if(FindSubString(GetName(oDesk), "Nec") != -1)
							{SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy, oDesk);
					   		 }
						if(FindSubString(GetName(oDesk), "Tra") != -1)
							{SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation, oDesk);
					   		 }
						}
		object oChair = GetLocalObject(OBJECT_SELF, "oChair");
		 if(oChair == OBJECT_INVALID)
				{oChair = GetNearestObjectByTag("slv_300_chair", OBJECT_SELF, 1);
				 SetLocalObject(OBJECT_SELF, "oChair", oChair);
				 }
		  SetUseableFlag(oChair, TRUE);
		 }	
		 
					
					//Abjuration Set Useables (Do all room prep for all courses in at once, to give hint to students of upcoming challenges
				    if(GetName(OBJECT_SELF) == "Abj_All")
				      {SetLocalString(oStudent, "sSchool", "Abjuration");
			           object oMyChest = GetLocalObject(OBJECT_SELF, "oMyChest");
					   if (oMyChest == OBJECT_INVALID)
							{oMyChest = GetObjectByTag("slv_abj100_chest");
							 SetLocalObject(OBJECT_SELF, "oMyChest", oMyChest);
							 }
						SetUseableFlag(oMyChest, TRUE);
						object oMyHBWP = GetLocalObject(OBJECT_SELF, "oMyHBWP");
						if(oMyHBWP == OBJECT_INVALID)
							{oMyHBWP = GetWaypointByTag("Abj_All_Quests_HB_WP");
							SetLocalObject(OBJECT_SELF, "oMyHBWP", oMyHBWP);
							}
						object oMyHBPLC = GetLocalObject(OBJECT_SELF, "oMyHBPLC");
					    if (oMyHBPLC == OBJECT_INVALID)
							{oMyHBPLC = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_abj100_hb_plc", GetLocation(oMyHBWP));
							 SetLocalObject(OBJECT_SELF, "oMyHBPLC", oMyHBPLC);
							 }
						object oMySwordWP = GetLocalObject(OBJECT_SELF, "oMySwordWP");
						if(oMySwordWP == OBJECT_INVALID)
							{oMySwordWP = GetWaypointByTag("Abj_All_Quests_Sword_WP");
							 SetLocalObject(OBJECT_SELF, "oMySwordWP", oMySwordWP);
							 }
						object oMyShieldWP = GetLocalObject(OBJECT_SELF, "oMyShieldWP");
						if(oMyShieldWP == OBJECT_INVALID)
							{oMyShieldWP = GetWaypointByTag("Abj_All_Quests_Shield_WP");
							SetLocalObject(OBJECT_SELF, "oMyShieldWP", oMyShieldWP);
							 }
						object oMySkullWP = GetLocalObject(OBJECT_SELF, "oMySkullWP");
						if(oMySkullWP == OBJECT_INVALID)
							{oMySkullWP = GetWaypointByTag("Abj_All_Quests_Skull_WP");
							SetLocalObject(OBJECT_SELF, "oMySkullWP", oMySkullWP);
							}
						object oMySword = GetLocalObject(OBJECT_SELF, "oMySword");
					    if (oMySword == OBJECT_INVALID)
							{oMySword = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_abj200_plc_sword", GetLocation(oMySwordWP));
							 SetLocalObject(OBJECT_SELF, "oMySword", oMySword);
							 SetLocalString(oMySword, "ACR_PSO_NAME", GetName(oMySword));
							 SetLocalObject(oMySword, "oMyTrigAll", OBJECT_SELF);
							 }
						object oMyShield = GetLocalObject(OBJECT_SELF, "oMyShield");
					    if (oMyShield == OBJECT_INVALID)
							{oMyShield = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_abj200_plc_shield", GetLocation(oMyShieldWP));
							 SetLocalObject(OBJECT_SELF, "oMyShield", oMyShield);
							 SetLocalString(oMyShield, "ACR_PSO_NAME", GetName(oMyShield));
							SetLocalObject(oMyShield, "oMyTrigAll", OBJECT_SELF);
							 }
						object oMySkull = GetLocalObject(OBJECT_SELF, "oMySkull");
					    if (oMySkull == OBJECT_INVALID)
							{oMySkull = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_abj200_plc_skull", GetLocation(oMySkullWP));
							 SetLocalObject(OBJECT_SELF, "oMySkull", oMySkull);
							 SetLocalString(oMySkull, "ACR_PSO_NAME", GetName(oMySkull));
							SetLocalObject(oMySkull, "oMyTrigAll", OBJECT_SELF);
							 }
											
						if(Random(4) < 1)
				        {if(WillSave(oStudent, 10, SAVING_THROW_TYPE_NONE, GetAreaOfEffectCreator()))
				           {if(Random(2) < 1)
				                {FloatingTextStringOnCreature("You feel something tugging at your willpower, but you prove the stronger and it fades away.", oStudent, FALSE);
								}
				             else
				                {FloatingTextStringOnCreature("Your skin goosefleshes and your muscles tense, as if resisting the touch of an invisible hand. ", oStudent, FALSE);
								}
							}	
				          else
				            {if(Random(2) < 1)
				                {FloatingTextStringOnCreature("A sudden wash of fear overcomes you, driving you to your knees.", oStudent, FALSE);
				                 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oStudent, 2.0);
								 }
				              else
				                {FloatingTextStringOnCreature("A sensation of otherness in your mind, an intrusion, stops you in your tracks...until the feeling passes. ", oStudent, FALSE);
				                 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oStudent, 2.0);
								 }
				                }
				             }
						}
							 
			//Elementary Abjuration Quest Completion					 
					   if(GetTag(OBJECT_SELF) == "Abjuration1_trig")
				        {SetLocalObject(OBJECT_SELF, "oInside", oStudent);
						 nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
						 string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
						 object oMyChest = GetLocalObject(OBJECT_SELF, "oMyChest");
					   	 if (GetHasSpellEffect(SPELL_ENDURE_ELEMENTS, oStudent))
				            {if (oMyChest == OBJECT_INVALID)
								{oMyChest = GetObjectByTag("slv_abj100_chest");
								 SetLocalObject(OBJECT_SELF, "oMyChest", oMyChest);
								 }
							 SetLocked(oMyChest, FALSE);
				             SendMessageToPC(oStudent, "You feel the comforting warmth of your Endure Elements spell protecting you from the cold. The iced shut lock on the chest visibly thaws.");
				             DelayCommand(300.0, SetLocked(oMyChest, TRUE));
				             if((sCurrentCourse == "Elementary Abjuration") && (GetLocalString(oStudent, sCurrentCourse) != sCurrentCourse))
					             {SetLocalString(oStudent, sCurrentCourse, "Elementary Abjuration, chest");
					              }
				             }
				        else
				            {object oMyIceLeaveWP = GetLocalObject(OBJECT_SELF, "oMyIceLeaveWP");
							 if(oMyIceLeaveWP == OBJECT_INVALID)
								{oMyIceLeaveWP = GetNearestObjectByTag("Abj_All_Quests_IceGo_WP", OBJECT_SELF, 1);
							     SetLocalObject(OBJECT_SELF, "oMyIceLeaveWP", oMyIceLeaveWP);
								 }
							 SendMessageToPC(oStudent, "The cold pouring off the blocks of ice drives you away.");
				             AssignCommand(oStudent, ActionForceMoveToObject(oMyIceLeaveWP, TRUE, 0.0, 10.0));
				             if((sCurrentCourse == "Elementary Abjuration") && (GetLocalString(oStudent, sCurrentCourse) != sCurrentCourse))
					             {SetLocalString(oStudent, sCurrentCourse, "Elementary Abjuration, chest");
					              }
				            }
				        }
						
				//Standard Abjuration:
				  
						if(GetTag(OBJECT_SELF) == "Abjuration2_trig")
							{object oMyProtEvilCollBoxWP = GetLocalObject(OBJECT_SELF, "Abjuration2_trig_CollBox_WP");
						 	 if (oMyProtEvilCollBoxWP == OBJECT_INVALID)
								{oMyProtEvilCollBoxWP = GetObjectByTag("Abjuration2_trig_CollBox_WP");
								 SetLocalObject(OBJECT_SELF, "oMyProtEvilCollBoxWP", oMyProtEvilCollBoxWP);
								 }
						 	 object oMyProtEvilCollBox = GetLocalObject(OBJECT_SELF, "oMyProtEvilCollBox");
						 	 if(GetHasSpellEffect(SPELL_PROTECTION_FROM_EVIL, oStudent) == TRUE)
								{if(oMyProtEvilCollBox == OBJECT_INVALID)
									{ SendMessageToPC(oStudent, "The power of your Protection from Evil spell seems to cloak you in arcane defenses against the potential evil lingering where the wall of force has been.");
					            	}
								 else if(oMyProtEvilCollBox != OBJECT_INVALID)
									{DestroyObject(oMyProtEvilCollBox);
									 SetLocalObject(OBJECT_SELF, "oMyProtEvilCollBox", OBJECT_INVALID);
									 SendMessageToPC(oStudent, "The power of your Protection from Evil spell seems to cloak you in arcane defenses against the evil radiating from the wall of force.");
					            	}
								 }
							 else if(GetHasSpellEffect(SPELL_PROTECTION_FROM_EVIL, oStudent) == FALSE)
								{if (oMyProtEvilCollBox == OBJECT_INVALID)
									{oMyProtEvilCollBox = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox2", GetLocation(oMyProtEvilCollBoxWP));
							 		 SetLocalObject(OBJECT_SELF, "oMyProtEvilCollBox", oMyProtEvilCollBox);
									 }
								 SendMessageToPC(oStudent, "The wall of force radiates a disturbingly palpable sensation of evil! It seems to assail your mind, refusing to allow you passage.");
					            }
							}

				 //Conjuration Set Useables (Do all room prep for all courses in at once, to give hint to students of upcoming challenges
				    if(GetName(OBJECT_SELF) == "Con_All")
				      {SetLocalString(oStudent, "sSchool", "Conjuration");
			           object oMyPlate = GetLocalObject(OBJECT_SELF, "oMyPlate");
					   if (oMyPlate == OBJECT_INVALID)
							{oMyPlate = GetObjectByTag("slv_con100_pplate");
							 SetLocalObject(OBJECT_SELF, "oMyPlate", oMyPlate);
							 }
					   object Conjuration1_trig = GetLocalObject(OBJECT_SELF, "Conjuration1_trig");
					   if (Conjuration1_trig == OBJECT_INVALID)
							{Conjuration1_trig = GetObjectByTag("Conjuration1_trig");
							 SetLocalObject(OBJECT_SELF, "Conjuration1_trig", Conjuration1_trig);
							 }
						SetLocalObject(Conjuration1_trig, "oMyConAll", OBJECT_SELF);
							 
						object oMyGateWP = GetLocalObject(OBJECT_SELF, "oMyGateWP");
					    if(oMyGateWP == OBJECT_INVALID)
							{oMyGateWP = GetWaypointByTag("Con_All_Quests_Gate_WP");
							SetLocalObject(OBJECT_SELF, "oMyGateWP", oMyGateWP);
							}
					    object oMyGate = GetLocalObject(OBJECT_SELF, "oMyGate");
					    if (oMyGate == OBJECT_INVALID)
							{oMyGate = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_con100_gate", GetLocation(oMyGateWP));
							 SetLocalObject(OBJECT_SELF, "oMyGate", oMyGate);
							 }
						object oMyWolfWP = GetLocalObject(OBJECT_SELF, "oMyWolfWP");
					    if(oMyWolfWP == OBJECT_INVALID)
							{oMyWolfWP = GetWaypointByTag("Con_All_Quests_CelWolf_WP");
							SetLocalObject(OBJECT_SELF, "oMyWolfWP", oMyWolfWP);
							}
					    if((GetCampaignString("SLV_UNI", "Standard Conjuration", oStudent) == "Standard Conjuration") && (GetCampaignString("SLV_UNI", "Advanced Conjuration", oStudent) != "Advanced Conjuration"))
							{object oMyWolf = GetLocalObject(OBJECT_SELF, "oMyWolf");
					    	 if (oMyWolf == OBJECT_INVALID)
								{oMyWolf = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_celestwolf", GetLocation(oMyWolfWP));
							 	 SetLocalObject(OBJECT_SELF, "oMyWolf", oMyWolf);
							 	}
							}
						object oMyCollGate1WP = GetLocalObject(OBJECT_SELF, "oMyCollGate1WP");
					    if(oMyCollGate1WP == OBJECT_INVALID)
							{oMyCollGate1WP = GetWaypointByTag("Con_All_Quests_CollBox1_WP");
							SetLocalObject(OBJECT_SELF, "oMyCollGate1WP", oMyCollGate1WP);
							}
					    object oMyCollGate1 = GetLocalObject(Conjuration1_trig, "oMyCollGate1");
					    if (oMyCollGate1 == OBJECT_INVALID)
							{oMyCollGate1 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_dean_collision", GetLocation(oMyCollGate1WP), FALSE, "slv_con100_collbox1");
							 SetLocalObject(Conjuration1_trig, "oMyCollGate1", oMyCollGate1);
							 }
						object oMyCollGate2WP = GetLocalObject(OBJECT_SELF, "oMyCollGate2WP");
					    if(oMyCollGate2WP == OBJECT_INVALID)
							{oMyCollGate2WP = GetWaypointByTag("Con_All_Quests_CollBox2_WP");
							SetLocalObject(OBJECT_SELF, "oMyCollGate2WP", oMyCollGate2WP);
							}
					    object oMyCollGate2 = GetLocalObject(Conjuration1_trig, "oMyCollGate2");
					    if (oMyCollGate2 == OBJECT_INVALID)
							{oMyCollGate2 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_dean_collision", GetLocation(oMyCollGate2), FALSE, "slv_con100_collbox2");
							 SetLocalObject(Conjuration1_trig, "oMyCollGate2", oMyCollGate2);
							 }
					}	 				  
			
							     				     		
			  //StandardConjuration
			    if(GetTag(OBJECT_SELF) == "Conjuration2_trig") 
			        { object oMyLever = GetLocalObject(OBJECT_SELF, "oMyLever");
					    if (oMyLever == OBJECT_INVALID)
							{oMyLever = GetObjectByTag("slv_con200_lever");
							 SetLocalObject(OBJECT_SELF, "oMyLever", oMyLever);
							 }
					 	SetUseableFlag(oMyLever, TRUE);
					
			   		}
			    if((GetTag(OBJECT_SELF) == "ConjurationTrees_trig") && (GetHasSpellEffect(SPELL_MAGE_ARMOR, oStudent)))
			        {SendMessageToPC(oStudent, "The thorns and spines seem to deflect, miss or simply fail to pierce your flesh.");
			         }
			     else if (GetTag(OBJECT_SELF) == "ConjurationTrees_trig")
			         {effect eThorns = EffectDamage(1, DAMAGE_TYPE_PIERCING, DAMAGE_POWER_NORMAL);
    				  SendMessageToPC(oStudent, "Thorns and spines threaten to pierce your flesh with every movement.");
			               if(Random(10) < 5)
			                  {ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eThorns, oStudent);
			                   SendMessageToPC(oStudent, "A thorn is driven deep into your flesh.");
			                  }
			         }
        	//Divination
				
				    if(GetName(OBJECT_SELF) == "Div_All") 
					    {SetLocalString(oStudent, "sSchool", "Divination");
			             object oMyDoorwayWP = GetLocalObject(OBJECT_SELF, "oMyDoorwayWP");
						 if (oMyDoorwayWP == OBJECT_INVALID)
								{oMyDoorwayWP = GetWaypointByTag("Div_All_Quests_Doorway_WP");
								 SetLocalObject(OBJECT_SELF, "oMyDoorwayWP", oMyDoorwayWP);
								 }
						 object oMyDoorway = GetLocalObject(OBJECT_SELF, "oMyDoorway");
						 if (oMyDoorway == OBJECT_INVALID)
								{oMyDoorway = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_div200_doorway", GetLocation(oMyDoorwayWP));
								 SetLocalObject(OBJECT_SELF, "oMyDoorway", oMyDoorway);
								 }		 
						 object oMyTargetWP = GetLocalObject(OBJECT_SELF, "oMyTargetWP");
						 if (oMyTargetWP == OBJECT_INVALID)
								{oMyTargetWP = GetWaypointByTag("Div_All_Quests_Target_WP");
								 SetLocalObject(OBJECT_SELF, "oMyTargetWP", oMyTargetWP);
								 }
						 object oMyTarget = GetLocalObject(OBJECT_SELF, "oMyTarget");
						 if (oMyTarget == OBJECT_INVALID)
								{oMyTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_div200_target", GetLocation(oMyTargetWP));
								 SetLocalObject(OBJECT_SELF, "oMyTarget", oMyTarget);
								 SetLocalObject(oMyTarget, "oMyTrigAll", OBJECT_SELF);
								 }
						object oMyCollGate2WP = GetLocalObject(OBJECT_SELF, "oMyCollGate2WP");
					    if(oMyCollGate2WP == OBJECT_INVALID)
							{oMyCollGate2WP = GetWaypointByTag("Div_All_Quests_CollBox2_WP");
							SetLocalObject(OBJECT_SELF, "oMyCollGate2WP", oMyCollGate2WP);
							}
					    object oMyCollGate2 = GetLocalObject(OBJECT_SELF, "oMyCollGate2");
					    if (oMyCollGate2 == OBJECT_INVALID)
							{oMyCollGate2 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_dean_collision", GetLocation(oMyCollGate2), FALSE, "slv_div200_collbox2");
							 SetLocalObject(OBJECT_SELF, "oMyCollGate2", oMyCollGate2);
							 }
					}
					
				//Elementary Divination
					if(GetName(OBJECT_SELF) == "Divination1") 
					    {object oMySigil = GetLocalObject(OBJECT_SELF, "oMySigil");
						 if (oMySigil == OBJECT_INVALID)
							{oMySigil = GetObjectByTag("slv_div100_sigil");
							 SetLocalObject(OBJECT_SELF, "oMySigil", oMySigil);
							}
						  SetUseableFlag(oMySigil, TRUE);
						  }
						
						  
						 
				//Enchantment
				
				    if(GetName(OBJECT_SELF) == "Enc_All") 
					    {SetLocalString(oStudent, "sSchool", "Enchantment");
			             object oMyGiantWP = GetLocalObject(OBJECT_SELF, "oMyGiantWP");
						 effect eSleep = EffectSleep();
						 if (oMyGiantWP == OBJECT_INVALID)
								{oMyGiantWP = GetWaypointByTag("Enc_All_Quests_Giant_WP");
								 SetLocalObject(OBJECT_SELF, "oMyGiantWP", oMyGiantWP);
								 }
						 object oMyGiant = GetLocalObject(OBJECT_SELF, "oMyGiant");
						 if ((oMyGiant == OBJECT_INVALID) && (GetCampaignString("SLV_UNI", "Elementary Enchantment", oStudent) != "Elementary Enchantment"))
								{oMyGiant = GetObjectByTag("003_cr_slv_enc100giant");
								 SetLocalObject(OBJECT_SELF, "oMyGiant", oMyGiant);
								 AssignCommand(oMyGiant, ActionJumpToLocation(GetLocation(oMyGiantWP)));
								 if (GetLocalObject(OBJECT_SELF, "oMyGiant") == OBJECT_INVALID) 
									{object oMyGiant = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_enc100giant", GetLocation(oMyGiantWP));
								 	 SetLocalObject(OBJECT_SELF, "oMyGiant", oMyGiant);
									 }
								 if(GetLocalInt(oStudent, "GiantMessage") != 1)
									 {SendMessageToPC(oStudent, "Inside the room, a giant holding a dusting cloth drops to the ground as if felled. He begins to snore like a mine cart rattling down a mountainside.");
								 		SetLocalInt(oStudent, "GiantMessage", 1);
									 }
							     }
						 
						 DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oMyGiant, 60.0));
						 DelayCommand(5.0, AssignCommand(oMyGiant, ActionSpeakString("*Snores", TALKVOLUME_TALK)));
						 		 		 
						 object oMyEye1WP = GetLocalObject(OBJECT_SELF, "oMyEye1WP");
						 if (oMyEye1WP == OBJECT_INVALID)
								{oMyEye1WP = GetWaypointByTag("Enc_All_Quests_Eye1_WP");
								 SetLocalObject(OBJECT_SELF, "oMyEye1WP", oMyEye1WP);
								 }
						 object oMyEye2WP = GetLocalObject(OBJECT_SELF, "oMyEye2WP");
						 if (oMyEye2WP == OBJECT_INVALID)
								{oMyEye2WP = GetWaypointByTag("Enc_All_Quests_Eye2_WP");
								 SetLocalObject(OBJECT_SELF, "oMyEye2WP", oMyEye2WP);
								 }
						 object oMyEye3WP = GetLocalObject(OBJECT_SELF, "oMyEye3WP");
						 if (oMyEye3WP == OBJECT_INVALID)
								{oMyEye3WP = GetWaypointByTag("Enc_All_Quests_Eye3_WP");
								 SetLocalObject(OBJECT_SELF, "oMyEye3WP", oMyEye3WP);
								 }
						 object oMyEye4WP = GetLocalObject(OBJECT_SELF, "oMyEye4WP");
						 if (oMyEye4WP == OBJECT_INVALID)
								{oMyEye4WP = GetWaypointByTag("Enc_All_Quests_Eye4_WP");
								 SetLocalObject(OBJECT_SELF, "oMyEye4WP", oMyEye4WP);
								 }
						 object oMyEye5WP = GetLocalObject(OBJECT_SELF, "oMyEye5WP");
						 if (oMyEye5WP == OBJECT_INVALID)
								{oMyEye5WP = GetWaypointByTag("Enc_All_Quests_Eye5_WP");
								 SetLocalObject(OBJECT_SELF, "oMyEye5WP", oMyEye5WP);
								 }
						 object oMyEye1 = GetLocalObject(OBJECT_SELF, "oMyEye1");
						 if (oMyEye1 == OBJECT_INVALID) 
								{oMyEye1 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_enc100eyes", GetLocation(oMyEye1WP));
								 SetLocalObject(OBJECT_SELF, "oMyEye1", oMyEye1);
								 SetLocalObject(oMyGiant, "oMyEye1", oMyEye1);
								 SetLocalObject(oMyEye1, "oGiant", oMyGiant);
								 DelayCommand(5.0, AssignCommand(oMyEye1, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
								 }	
						object oMyEye2 = GetLocalObject(OBJECT_SELF, "oMyEye2");
						 if (oMyEye2 == OBJECT_INVALID)
								{oMyEye2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_enc100eyes", GetLocation(oMyEye2WP));
								 SetLocalObject(OBJECT_SELF, "oMyEye2", oMyEye2);
								 SetLocalObject(oMyGiant, "oMyEye2", oMyEye2);
								 SetLocalObject(oMyEye2, "oGiant", oMyGiant);
								 DelayCommand(10.0, AssignCommand(oMyEye1, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
								 }	
						object oMyEye3 = GetLocalObject(OBJECT_SELF, "oMyEye3");
						 if (oMyEye3 == OBJECT_INVALID)
								{oMyEye3 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_enc100eyes", GetLocation(oMyEye3WP));
								 SetLocalObject(OBJECT_SELF, "oMyEye3", oMyEye3);
								 SetLocalObject(oMyGiant, "oMyEye3", oMyEye3);
								 SetLocalObject(oMyEye3, "oGiant", oMyGiant);
								 DelayCommand(15.0, AssignCommand(oMyEye1, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
								 }	
						object oMyEye4 = GetLocalObject(OBJECT_SELF, "oMyEye4");
						 if (oMyEye4 == OBJECT_INVALID)
								{oMyEye4 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_enc100eyes", GetLocation(oMyEye4WP));
								 SetLocalObject(OBJECT_SELF, "oMyEye4", oMyEye4);
								 SetLocalObject(oMyGiant, "oMyEye4", oMyEye4);
								 SetLocalObject(oMyEye4, "oGiant", oMyGiant);
								 AssignCommand(oMyEye4, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
								}	
						object oMyEye5 = GetLocalObject(OBJECT_SELF, "oMyEye5");
						 if (oMyEye5 == OBJECT_INVALID)
								{oMyEye5 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_enc100eyes", GetLocation(oMyEye5WP));
								 SetLocalObject(OBJECT_SELF, "oMyEye5", oMyEye5);
								 SetLocalObject(oMyGiant, "oMyEye5", oMyEye5);
								 SetLocalObject(oMyEye5, "oGiant", oMyGiant);
								 AssignCommand(oMyEye5, ActionCastSpellAtObject(SPELL_SLEEP, oMyGiant, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
								 }	
						object oMyMirrorWP = GetLocalObject(OBJECT_SELF, "oMyMirrorWP");
						 if (oMyMirrorWP == OBJECT_INVALID)
								{oMyMirrorWP = GetWaypointByTag("Enc_All_Quests_Mirror_WP");
								 SetLocalObject(OBJECT_SELF, "oMyMirrorWP", oMyMirrorWP);
								 }
						 object oMyMirror = GetLocalObject(OBJECT_SELF, "oMyMirror");
						 if (oMyMirror == OBJECT_INVALID)
								{oMyMirror = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_enc100_plc_mirror", GetLocation(oMyMirrorWP));
								 SetLocalObject(OBJECT_SELF, "oMyMirror", oMyMirror);
								 }
						if((GetCampaignString("SLV_UNI", "Elementary Enchantment", oStudent) == "Elementary Enchantment") && (GetCampaignString("SLV_UNI", "Standard Enchantment", oStudent) != "Standard Enchantment"))
							{object oMyProctor2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_procenc2", GetLocation(oMyMirrorWP));
							 SetLocalObject(OBJECT_SELF, "oMyProctor2", oMyProctor2);
							 DelayCommand(5.0, AssignCommand(oMyProctor2, ActionAttack(oMyMirror, FALSE)));
							}		 
					}					 
					
		 
	//Evocation
				
	
				    if(GetName(OBJECT_SELF) == "Evo_All") 
					    {SetLocalString(oStudent, "sSchool", "Evocation");
			             int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
						 string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
						 string sSchool = SchoolToString(nSchool);
				 		 int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
						 object oMyCrystalBallWP = GetLocalObject(OBJECT_SELF, "oMyCrystalBallWP");
						 if (oMyCrystalBallWP == OBJECT_INVALID)
								{oMyCrystalBallWP = GetWaypointByTag("Evo_All_Quests_CrystalBall_WP");
								 SetLocalObject(OBJECT_SELF, "oMyCrystalBallWP", oMyCrystalBallWP);
								 }
						 object oMyCrystalBall = GetLocalObject(OBJECT_SELF, "oMyCrystalBall");
						 if (oMyCrystalBall == OBJECT_INVALID)
								{oMyCrystalBall = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_evo100_crystalball", GetLocation(oMyCrystalBallWP));
								 SetLocalObject(OBJECT_SELF, "oMyCrystalBall", oMyCrystalBall);
								 }		 
						 object oMyCurtainClWP = GetLocalObject(OBJECT_SELF, "oMyCurtainClWP");
						 if (oMyCurtainClWP == OBJECT_INVALID)
								{oMyCurtainClWP = GetWaypointByTag("Evo_All_Quests_CurtainCl_WP");
								 SetLocalObject(OBJECT_SELF, "oMyCurtainClWP", oMyCurtainClWP);
								 }
						 object oMyCurtainCl = GetLocalObject(OBJECT_SELF, "oMyCurtainCl");
						 if (oMyCurtainCl == OBJECT_INVALID)
								{oMyCurtainCl = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_curtainclosed0", GetLocation(oMyCurtainClWP), FALSE, "slv_evo200_curtaincl");
								SetLocalObject(OBJECT_SELF, "oMyCurtainCl", oMyCurtainCl);
								 }						
					     object oMyCurtainPull = GetLocalObject(OBJECT_SELF, "oMyCurtainPull");
						 if (oMyCurtainPull == OBJECT_INVALID)
								{oMyCurtainPull = GetObjectByTag("slv_evo200_curtainpull");
								SetLocalObject(OBJECT_SELF, "oMyCurtainPull", oMyCurtainPull);
								 SetLocalObject(oMyCurtainPull, "oMyCurtainCl", oMyCurtainCl);
								 SetLocalObject(oMyCurtainPull, "oMyTrigAll", OBJECT_SELF);
								 
								 }
						 SetUseableFlag(oMyCurtainPull, TRUE);						
					     object oMyEmulsion = GetLocalObject(oMyCurtainPull, "oMyEmulsion");
						 if (oMyEmulsion == OBJECT_INVALID)
								{oMyEmulsion = GetObjectByTag("slv_evo200_emulsion");
								SetLocalObject(oMyCurtainPull, "oMyEmulsion", oMyEmulsion);
								 }		
						 DestroyObject(oMyEmulsion);	
						 object oWindowWP = GetLocalObject(OBJECT_SELF, "oWindowWP");
					     if(oWindowWP == OBJECT_INVALID)
						   {oWindowWP = GetWaypointByTag("Evo_All_Quests_Window_WP");
							SetLocalObject(OBJECT_SELF, "oWindowWP", oWindowWP);
							}
					    object oMyWindow = GetLocalObject(OBJECT_SELF, "oMyWindow");
						 if (oMyWindow == OBJECT_INVALID)
								{oMyWindow = GetObjectByTag("slv_evo200_window");
								SetLocalObject(OBJECT_SELF, "oMyWindow", oMyWindow);
								 }
						 object oMyBellows = GetLocalObject(OBJECT_SELF, "oMyBellows");
						 if (oMyBellows == OBJECT_INVALID)
								{oMyBellows = GetObjectByTag("slv_evo200_bellows");
								SetLocalObject(OBJECT_SELF, "oMyBellows", oMyBellows);
								 }
						 SetUseableFlag(oMyBellows, TRUE);						
					     
						 if(nLevel == 200)
						 	{object oMyIncinderWP = GetLocalObject(OBJECT_SELF, "oMyIncinderWP");
							 if (oMyIncinderWP == OBJECT_INVALID)
									{oMyIncinderWP = GetWaypointByTag("Evo_All_Quests_Incinder_WP");
									 SetLocalObject(OBJECT_SELF, "oMyIncinderWP", oMyIncinderWP);
									 }
							 object oMyIncinder = GetLocalObject(OBJECT_SELF, "oMyIncinder");
							 if (oMyIncinder == OBJECT_INVALID)
									{oMyIncinder = GetObjectByTag("003_cr_slv_incinder");
									 SetLocalObject(OBJECT_SELF, "oMyIncinder", oMyIncinder);
									 AssignCommand(oMyIncinder, ActionJumpToLocation(GetLocation(oMyIncinderWP)));
									  if (GetLocalObject(OBJECT_SELF, "oMyIncinder") == OBJECT_INVALID)
										{oMyIncinder = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_incinder", GetLocation(oMyIncinderWP));
									 	 SetLocalObject(OBJECT_SELF, "oMyIncinder", oMyIncinder);
									    }
									}		 
						 		}
									
						}
							 
					if(GetTag(OBJECT_SELF) == "slv_evo200_poison_trig")
							{SendMessageToPC(oStudent, "The symbol on the floor is cleverly interwoven with a symbol of Talona inset with tears of metal.  They are polished to a high sheen and slightly elevated to aim their top surfaces at the mirrors beside you. The tears, the mirrors and the wall behind the curtain all gleam with the soft sheen of pure silver in the red light of this area of the room.");
        					}
			//Illusion
					if(GetName(OBJECT_SELF) == "Ill_All") 
					    {SetLocalString(oStudent, "sSchool", "Illusion");
			             SetLocalInt(oStudent, "Change1", 1);
						 SetLocalInt(oStudent, "Change2", 1);
						 object oMyPixieWP = GetLocalObject(OBJECT_SELF, "oMyPixieWP");
						 if (oMyPixieWP == OBJECT_INVALID)
								{oMyPixieWP = GetWaypointByTag("Ill_All_Quests_Pixie_WP");
								SetLocalObject(OBJECT_SELF, "oMyPixieWP", oMyPixieWP);
								 }
						 object oMyPixie = GetLocalObject(OBJECT_SELF, "oMyPixie");
						 if (oMyPixie == OBJECT_INVALID)
								{oMyPixie = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100pixie", GetLocation(oMyPixieWP));
								SetLocalObject(OBJECT_SELF, "oMyPixie", oMyPixie);
								 }
						 object oMyImpWP = GetLocalObject(OBJECT_SELF, "oMyImpWP");
						 if (oMyImpWP == OBJECT_INVALID)
								{oMyImpWP = GetWaypointByTag("Ill_All_Quests_Imp_WP");
								SetLocalObject(OBJECT_SELF, "oMyImpWP", oMyImpWP);
								 }
						 object oMyImp = GetLocalObject(OBJECT_SELF, "oMyImp");
						 if ((oMyImp == OBJECT_INVALID) && (GetCampaignString("SLV_UNI", "Imp", oStudent) != "Yes"))
								{oMyImp = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100imp", GetLocation(oMyImpWP));
								SetLocalObject(OBJECT_SELF, "oMyImp", oMyImp);
								 }
						 
						 object oMySitbox1 = GetLocalObject(OBJECT_SELF, "oMySitbox1");
						 if (oMySitbox1 == OBJECT_INVALID)
								{oMySitbox1 = GetObjectByTag("slv_ill100_sitbox1");
								SetLocalObject(OBJECT_SELF, "oMySitbox1", oMySitbox1);
								 }
						 SetUseableFlag(oMySitbox1, TRUE);						
						 object oMySitbox2 = GetLocalObject(OBJECT_SELF, "oMySitbox2");
						 if (oMySitbox2 == OBJECT_INVALID)
								{oMySitbox2 = GetObjectByTag("slv_ill100_sitbox2");
								SetLocalObject(OBJECT_SELF, "oMySitbox2", oMySitbox2);
								 }
						 SetUseableFlag(oMySitbox2, TRUE);
					 	 object oMyLowSitbox1 = GetLocalObject(OBJECT_SELF, "oMyLowSitbox1");
						 if (oMyLowSitbox1 == OBJECT_INVALID)
								{oMyLowSitbox1 = GetObjectByTag("slv_ill100_low_sitbox1");
								SetLocalObject(OBJECT_SELF, "oMyLowSitbox1", oMyLowSitbox1);
								 }
						 SetUseableFlag(oMyLowSitbox1, TRUE);
					 	 object oMyLowSitbox2 = GetLocalObject(OBJECT_SELF, "oMyLowSitbox2");
						 if (oMyLowSitbox2 == OBJECT_INVALID)
								{oMyLowSitbox2 = GetObjectByTag("slv_ill100_low_sitbox2");
								SetLocalObject(OBJECT_SELF, "oMyLowSitbox2", oMyLowSitbox2);
								 }
						 SetUseableFlag(oMyLowSitbox2, TRUE);
						 object oMyBearWP = GetLocalObject(OBJECT_SELF, "oMyBearWP");
						 if (oMyBearWP == OBJECT_INVALID)
								{oMyBearWP = GetWaypointByTag("Ill_All_Quests_Bear_WP");
								SetLocalObject(OBJECT_SELF, "oMyBearWP", oMyBearWP);
								 }
						 object oMyBearskinWP = GetLocalObject(OBJECT_SELF, "oMyBearskinWP");
						 if (oMyBearskinWP == OBJECT_INVALID)
								{oMyBearskinWP = GetWaypointByTag("Ill_All_Quests_Bearskin_WP");
								SetLocalObject(OBJECT_SELF, "oMyBearskinWP", oMyBearskinWP);
								 }
						 object oMyBearskin = GetLocalObject(OBJECT_SELF, "oMyBearskin");
						 if (oMyBearskin == OBJECT_INVALID)
								{oMyBearskin = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_ill100_bearskin", GetLocation(oMyBearskinWP));
								SetLocalObject(OBJECT_SELF, "oMyBearskin", oMyBearskin);
								 }
						 
						object oMyIll2Trig = GetLocalObject(OBJECT_SELF, "oMyIll2Trig");
						 if (oMyIll2Trig == OBJECT_INVALID)
								{oMyIll2Trig = GetObjectByTag("Illusion2_trig");
								 SetLocalObject(OBJECT_SELF, "oMyIll2Trig", oMyIll2Trig);
								 SetLocalObject(oMyIll2Trig, "oMyIllAllTrig", OBJECT_SELF);
						 		}
						 SetLocalObject(oMyIll2Trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall01_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall01_trig");
						 if (oMyForcewall01_trig == OBJECT_INVALID)
								{oMyForcewall01_trig = GetObjectByTag("Ill2_Forcewall01_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall01_trig", oMyForcewall01_trig);
								 }
						 SetLocalObject(oMyForcewall01_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall02_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall02_trig");
						 if (oMyForcewall02_trig == OBJECT_INVALID)
								{oMyForcewall02_trig = GetObjectByTag("Ill2_Forcewall02_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall02_trig", oMyForcewall02_trig);
								 }
						 SetLocalObject(oMyForcewall02_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall03_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall03_trig");
						 if (oMyForcewall03_trig == OBJECT_INVALID)
								{oMyForcewall03_trig = GetObjectByTag("Ill2_Forcewall03_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall03_trig", oMyForcewall03_trig);
								 }
						 SetLocalObject(oMyForcewall03_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall04_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall04_trig");
						 if (oMyForcewall04_trig == OBJECT_INVALID)
								{oMyForcewall04_trig = GetObjectByTag("Ill2_Forcewall04_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall04_trig", oMyForcewall04_trig);
								 }
						 SetLocalObject(oMyForcewall04_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall05_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall05_trig");
						 if (oMyForcewall05_trig == OBJECT_INVALID)
								{oMyForcewall05_trig = GetObjectByTag("Ill2_Forcewall05_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall05_trig", oMyForcewall05_trig);
								 }
						 SetLocalObject(oMyForcewall05_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall06_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall06_trig");
						 if (oMyForcewall06_trig == OBJECT_INVALID)
								{oMyForcewall06_trig = GetObjectByTag("Ill2_Forcewall06_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall06_trig", oMyForcewall06_trig);
								 }
						 SetLocalObject(oMyForcewall06_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall07_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall07_trig");
						 if (oMyForcewall07_trig == OBJECT_INVALID)
								{oMyForcewall07_trig = GetObjectByTag("Ill2_Forcewall07_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall07_trig", oMyForcewall07_trig);
								 }
						 SetLocalObject(oMyForcewall07_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall08_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall08_trig");
						 if (oMyForcewall08_trig == OBJECT_INVALID)
								{oMyForcewall08_trig = GetObjectByTag("Ill2_Forcewall08_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall08_trig", oMyForcewall08_trig);
								 }
						 SetLocalObject(oMyForcewall08_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall09_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall09_trig");
						 if (oMyForcewall09_trig == OBJECT_INVALID)
								{oMyForcewall09_trig = GetObjectByTag("Ill2_Forcewall09_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall09_trig", oMyForcewall09_trig);
								 }
						 SetLocalObject(oMyForcewall09_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall10_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall10_trig");
						 if (oMyForcewall10_trig == OBJECT_INVALID)
								{oMyForcewall10_trig = GetObjectByTag("Ill2_Forcewall10_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall10_trig", oMyForcewall10_trig);
								 }
						 SetLocalObject(oMyForcewall10_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall11_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall11_trig");
						 if (oMyForcewall11_trig == OBJECT_INVALID)
								{oMyForcewall11_trig = GetObjectByTag("Ill2_Forcewall11_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall11_trig", oMyForcewall11_trig);
								 }
						 SetLocalObject(oMyForcewall11_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall12_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall12_trig");
						 if (oMyForcewall12_trig == OBJECT_INVALID)
								{oMyForcewall12_trig = GetObjectByTag("Ill2_Forcewall12_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall12_trig", oMyForcewall12_trig);
								 }
						 SetLocalObject(oMyForcewall12_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall13_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall13_trig");
						 if (oMyForcewall13_trig == OBJECT_INVALID)
								{oMyForcewall13_trig = GetObjectByTag("Ill2_Forcewall13_trig2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall13_trig", oMyForcewall13_trig);
								 }
						 SetLocalObject(oMyForcewall13_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall14_trig = GetLocalObject(OBJECT_SELF, "oMyForcewall14_trig");
						 if (oMyForcewall14_trig == OBJECT_INVALID)
								{oMyForcewall14_trig = GetObjectByTag("Ill2_Forcewall14_trig1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall14_trig", oMyForcewall14_trig);
								 }
						 SetLocalObject(oMyForcewall14_trig, "oMyIllAllTrig", OBJECT_SELF);
						 object oMyForcewall01_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall01_WP1");
						 if (oMyForcewall01_WP1 == OBJECT_INVALID)
								{oMyForcewall01_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall01_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall01_WP1", oMyForcewall01_WP1);
								 }
						 object oMyForcewall01 = GetLocalObject(OBJECT_SELF, "oMyForcewall01");
						 if (oMyForcewall01 == OBJECT_INVALID)
								{oMyForcewall01 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall01_WP1), FALSE, "Ill2_Forcewall01");
								SetLocalObject(OBJECT_SELF, "oMyForcewall01", oMyForcewall01);
								 }
						 object oMyForcewall02_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall02_WP1");
						 if (oMyForcewall02_WP1 == OBJECT_INVALID)
								{oMyForcewall02_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall02_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall02_WP1", oMyForcewall02_WP1);
								 }
						 object oMyForcewall02 = GetLocalObject(OBJECT_SELF, "oMyForcewall02");
						 if (oMyForcewall02 == OBJECT_INVALID)
								{oMyForcewall02 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall02_WP1), FALSE, "Ill2_Forcewall02");
								SetLocalObject(OBJECT_SELF, "oMyForcewall02", oMyForcewall02);
								 }
						 object oMyForcewall03_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall03_WP1");
						 if (oMyForcewall03_WP1 == OBJECT_INVALID)
								{oMyForcewall03_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall03_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall03_WP1", oMyForcewall03_WP1);
								 }
						 object oMyForcewall03 = GetLocalObject(OBJECT_SELF, "oMyForcewall03");
						 if (oMyForcewall03 == OBJECT_INVALID)
								{oMyForcewall03 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall03_WP1), FALSE, "Ill2_Forcewall03");
								SetLocalObject(OBJECT_SELF, "oMyForcewall03", oMyForcewall03);
								 }
						 object oMyForcewall04_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall04_WP1");
						 if (oMyForcewall04_WP1 == OBJECT_INVALID)
								{oMyForcewall04_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall04_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall04_WP1", oMyForcewall04_WP1);
								 }
						 object oMyForcewall04 = GetLocalObject(OBJECT_SELF, "oMyForcewall04");
						 if (oMyForcewall04 == OBJECT_INVALID)
								{oMyForcewall04 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall04_WP1), FALSE, "Ill2_Forcewall04");
								SetLocalObject(OBJECT_SELF, "oMyForcewall04", oMyForcewall04);
								 }
						 object oMyForcewall05_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall05_WP2");
						 if (oMyForcewall05_WP2 == OBJECT_INVALID)
								{oMyForcewall05_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall05_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall05_WP2", oMyForcewall05_WP2);
								 }
						 object oMyForcewall05 = GetLocalObject(OBJECT_SELF, "oMyForcewall05");
						 if (oMyForcewall05 == OBJECT_INVALID)
								{oMyForcewall05 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall05_WP2), FALSE, "Ill2_Forcewall05");
								SetLocalObject(OBJECT_SELF, "oMyForcewall05", oMyForcewall05);
								 }
						 object oMyForcewall06_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall06_WP2");
						 if (oMyForcewall06_WP2 == OBJECT_INVALID)
								{oMyForcewall06_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall06_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall06_WP2", oMyForcewall06_WP2);
								 }
						 object oMyForcewall06 = GetLocalObject(OBJECT_SELF, "oMyForcewall06");
						 if (oMyForcewall06 == OBJECT_INVALID)
								{oMyForcewall06 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall06_WP2), FALSE, "Ill2_Forcewall06");
								SetLocalObject(OBJECT_SELF, "oMyForcewall06", oMyForcewall06);
								  }
						 object oMyForcewall07_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall07_WP2");
						 if (oMyForcewall07_WP2 == OBJECT_INVALID)
								{oMyForcewall07_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall07_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall07_WP2", oMyForcewall07_WP2);
								 }
						 object oMyForcewall07 = GetLocalObject(OBJECT_SELF, "oMyForcewall07");
						 if (oMyForcewall07 == OBJECT_INVALID)
								{oMyForcewall07 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall07_WP2), FALSE, "Ill2_Forcewall07");
								SetLocalObject(OBJECT_SELF, "oMyForcewall07", oMyForcewall07);
								 }
						 object oMyForcewall08_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall08_WP1");
						 if (oMyForcewall08_WP1 == OBJECT_INVALID)
								{oMyForcewall08_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall08_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall08_WP1", oMyForcewall08_WP1);
								 }
						 object oMyForcewall08 = GetLocalObject(OBJECT_SELF, "oMyForcewall08");
						 if (oMyForcewall08 == OBJECT_INVALID)
								{oMyForcewall08 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall08_WP1), FALSE, "Ill2_Forcewall08");
								SetLocalObject(OBJECT_SELF, "oMyForcewall08", oMyForcewall08);
								}
						 object oMyForcewall09_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall09_WP1");
						 if (oMyForcewall09_WP1 == OBJECT_INVALID)
								{oMyForcewall09_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall09_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall09_WP1", oMyForcewall09_WP1);
								 }
						 object oMyForcewall09 = GetLocalObject(OBJECT_SELF, "oMyForcewall09");
						 if (oMyForcewall09 == OBJECT_INVALID)
								{oMyForcewall09 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall09_WP1), FALSE, "Ill2_Forcewall09");
								SetLocalObject(OBJECT_SELF, "oMyForcewall09", oMyForcewall09);
								  }
						 object oMyForcewall10_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall10_WP2");
						 if (oMyForcewall10_WP2 == OBJECT_INVALID)
								{oMyForcewall10_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall10_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall10_WP2", oMyForcewall10_WP2);
								 }
						 object oMyForcewall10 = GetLocalObject(OBJECT_SELF, "oMyForcewall10");
						 if (oMyForcewall10 == OBJECT_INVALID)
								{oMyForcewall10 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall10_WP2), FALSE, "Ill2_Forcewall10");
								SetLocalObject(OBJECT_SELF, "oMyForcewall10", oMyForcewall10);
								 }
						 object oMyForcewall11_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall11_WP2");
						 if (oMyForcewall11_WP2 == OBJECT_INVALID)
								{oMyForcewall11_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall11_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall11_WP2", oMyForcewall11_WP2);
								 }
						 object oMyForcewall11 = GetLocalObject(OBJECT_SELF, "oMyForcewall11");
						 if (oMyForcewall11 == OBJECT_INVALID)
								{oMyForcewall11 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall11_WP2), FALSE, "Ill2_Forcewall11");
								SetLocalObject(OBJECT_SELF, "oMyForcewall11", oMyForcewall11);
								 }
						 object oMyForcewall12_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall12_WP1");
						 if (oMyForcewall12_WP1 == OBJECT_INVALID)
								{oMyForcewall12_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall12_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall12_WP1", oMyForcewall12_WP1);
								 }
						 object oMyForcewall12 = GetLocalObject(OBJECT_SELF, "oMyForcewall12");
						 if (oMyForcewall12 == OBJECT_INVALID)
								{oMyForcewall12 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall12_WP1), FALSE, "Ill2_Forcewall12");
								SetLocalObject(OBJECT_SELF, "oMyForcewall12", oMyForcewall12);
								 }
						 object oMyForcewall13_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall13_WP2");
						 if (oMyForcewall13_WP2 == OBJECT_INVALID)
								{oMyForcewall13_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall13_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall13_WP2", oMyForcewall13_WP2);
								 }
						 object oMyForcewall13 = GetLocalObject(OBJECT_SELF, "oMyForcewall13");
						 if (oMyForcewall13 == OBJECT_INVALID)
								{oMyForcewall13 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall13_WP2), FALSE, "Ill2_Forcewall13");
								SetLocalObject(OBJECT_SELF, "oMyForcewall13", oMyForcewall13);
								  }
						 object oMyForcewall14_WP1 = GetLocalObject(OBJECT_SELF, "oMyForcewall14_WP1");
						 if (oMyForcewall14_WP1 == OBJECT_INVALID)
								{oMyForcewall14_WP1 = GetWaypointByTag("Ill_All_Quests_Forcewall14_WP1");
								SetLocalObject(OBJECT_SELF, "oMyForcewall14_WP1", oMyForcewall14_WP1);
								 }
						 object oMyForcewall14 = GetLocalObject(OBJECT_SELF, "oMyForcewall14");
						 if (oMyForcewall14 == OBJECT_INVALID)
								{oMyForcewall14 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall14_WP1), FALSE, "Ill2_Forcewall14");
								SetLocalObject(OBJECT_SELF, "oMyForcewall14", oMyForcewall14);
								 }
						object oMyForcewall15_WP2 = GetLocalObject(OBJECT_SELF, "oMyForcewall15_WP2");
						 if (oMyForcewall15_WP2 == OBJECT_INVALID)
								{oMyForcewall15_WP2 = GetWaypointByTag("Ill_All_Quests_Forcewall15_WP2");
								SetLocalObject(OBJECT_SELF, "oMyForcewall15_WP2", oMyForcewall15_WP2);
								 }
						 object oMyForcewall15 = GetLocalObject(OBJECT_SELF, "oMyForcewall15");
						 if (oMyForcewall15 == OBJECT_INVALID)
								{oMyForcewall15 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_collbox1", GetLocation(oMyForcewall15_WP2), FALSE, "Ill2_Forcewall15");
								SetLocalObject(OBJECT_SELF, "oMyForcewall15", oMyForcewall15);
								  }
						object oMirrorBlackWP = GetLocalObject(OBJECT_SELF, "oMirrorBlackWP");
						 if(oMirrorBlackWP == OBJECT_INVALID)
						 	{oMirrorBlackWP = GetWaypointByTag("Ill_All_Quests_MirrorBlack_WP");
							 SetLocalObject(OBJECT_SELF, "oMirrorBlackWP", oMirrorBlackWP);
							 }
						 object oMyMirrorBlack = GetLocalObject(OBJECT_SELF, "oMyMirrorBlack");
						 if (oMyMirrorBlack == OBJECT_INVALID)
								{oMyMirrorBlack = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_ill200_mirrorblack", GetLocation(oMirrorBlackWP));
								SetLocalObject(OBJECT_SELF, "oMyMirrorBlack", oMyMirrorBlack);
								 }
						 object oMirrorWhiteWP = GetLocalObject(OBJECT_SELF, "oMirrorWhiteWP");
						 if(oMirrorWhiteWP == OBJECT_INVALID)
						 	{oMirrorWhiteWP = GetWaypointByTag("Ill_All_Quests_MirrorWhite_WP");
							 SetLocalObject(OBJECT_SELF, "oMirrorWhiteWP", oMirrorWhiteWP);
							 }
						 object oMyMirrorWhite = GetLocalObject(OBJECT_SELF, "oMyMirrorWhite");
						 if (oMyMirrorWhite == OBJECT_INVALID)
								{oMyMirrorWhite = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_ill200_mirrorwhite", GetLocation(oMirrorWhiteWP));
								SetLocalObject(OBJECT_SELF, "oMyMirrorWhite", oMyMirrorWhite);
								 }
						 object oMirrorPrismWP = GetLocalObject(OBJECT_SELF, "oMirrorPrismWP");
						 if(oMirrorPrismWP == OBJECT_INVALID)
						 	{oMirrorPrismWP = GetWaypointByTag("Ill_All_Quests_MirrorPrism_WP");
							 SetLocalObject(OBJECT_SELF, "oMirrorPrismWP", oMirrorPrismWP);
							 }
						 object oMyMirrorPrism = GetLocalObject(OBJECT_SELF, "oMyMirrorPrism");
						 if (oMyMirrorPrism == OBJECT_INVALID)
								{oMyMirrorPrism = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_ill200_mirrorprism", GetLocation(oMirrorPrismWP));
								SetLocalObject(OBJECT_SELF, "oMyMirrorPrism", oMyMirrorPrism);
								 }
						 				 
						 }
	
		//Necromancy
		if(GetName(OBJECT_SELF) == "Nec_All") 
					    {SetLocalString(oStudent, "sSchool", "Necromancy");
			             object oMyCorpseWP = GetLocalObject(OBJECT_SELF, "oMyCorpseWP");
						 if (oMyCorpseWP == OBJECT_INVALID)
								{oMyCorpseWP = GetWaypointByTag("Nec_All_Quests_Body_WP");
								SetLocalObject(OBJECT_SELF, "oMyCorpseWP", oMyCorpseWP);
								 }
						 object oMyCorpse = GetLocalObject(OBJECT_SELF, "oMyCorpse");
						 if ((oMyCorpse == OBJECT_INVALID) && (GetCampaignString("SLV_UNI", "Elementary Necromancy", oStudent) != "Elementary Necromancy"))
								{oMyCorpse = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec100_corpse", GetLocation(oMyCorpseWP));
								SetLocalObject(OBJECT_SELF, "oMyCorpse", oMyCorpse);
								SetLocalObject(oMyCorpse, "oTrigAll", OBJECT_SELF);
								}
						 object oMyCrank = GetLocalObject(OBJECT_SELF, "oMyCrank");
						 if (oMyCrank == OBJECT_INVALID)
								{oMyCrank = GetObjectByTag("slv_nec100_crank");
								SetLocalObject(OBJECT_SELF, "oMyCrank", oMyCrank);
								 }
						 SetUseableFlag(oMyCrank, TRUE);		 
						 object oMyCabinet = GetLocalObject(OBJECT_SELF, "oMyCabinet");
						 if (oMyCabinet == OBJECT_INVALID)
								{oMyCabinet = GetObjectByTag("slv_nec100_cabinet");
								SetLocalObject(OBJECT_SELF, "oMyCabinet", oMyCabinet);
								 }
						 SetUseableFlag(oMyCabinet, TRUE);		 
						 object oMyFluid = GetLocalObject(OBJECT_SELF, "oMyFluid");
						 if (oMyFluid == OBJECT_INVALID)
								{oMyFluid = CreateItemOnObject("slv_nec100_fluid", oMyCabinet, 1);
								SetLocalObject(OBJECT_SELF, "oMyFluid", oMyFluid);
								 }
						 object oMyKey = GetLocalObject(OBJECT_SELF, "oMyKey");
						 if (oMyKey == OBJECT_INVALID)
								{oMyKey = CreateItemOnObject("slv_nec100_key", oMyCabinet, 1);
								SetLocalObject(OBJECT_SELF, "oMyKey", oMyKey);
								 }
						 object oMyLever1DWP = GetLocalObject(OBJECT_SELF, "oMyLever1DWP");
						 if (oMyLever1DWP == OBJECT_INVALID)
								{oMyLever1DWP = GetWaypointByTag("Nec_All_Quests_Lever1D_WP");
								SetLocalObject(OBJECT_SELF, "oMyLever1DWP", oMyLever1DWP);
								 }
						 object oMyLever1UWP = GetLocalObject(OBJECT_SELF, "oMyLever1UWP");
						 if (oMyLever1UWP == OBJECT_INVALID)
								{oMyLever1UWP = GetWaypointByTag("Nec_All_Quests_Lever1U_WP");
								SetLocalObject(OBJECT_SELF, "oMyLever1UWP", oMyLever1UWP);
								 }
						 object oMyLever2UWP = GetLocalObject(OBJECT_SELF, "oMyLever2UWP");
						 if (oMyLever2UWP == OBJECT_INVALID)
								{oMyLever2UWP = GetWaypointByTag("Nec_All_Quests_Lever2U_WP");
								SetLocalObject(OBJECT_SELF, "oMyLever2UWP", oMyLever2UWP);
								 }
						 object oMyLever2DWP = GetLocalObject(OBJECT_SELF, "oMyLever2DWP");
						 if (oMyLever2DWP == OBJECT_INVALID)
								{oMyLever2DWP = GetWaypointByTag("Nec_All_Quests_Lever2D_WP");
								SetLocalObject(OBJECT_SELF, "oMyLever2DWP", oMyLever2DWP);
								 }
						 object oMyLever3UWP = GetLocalObject(OBJECT_SELF, "oMyLever3UWP");
						 if (oMyLever3UWP == OBJECT_INVALID)
								{oMyLever3UWP = GetWaypointByTag("Nec_All_Quests_Lever3U_WP");
								SetLocalObject(OBJECT_SELF, "oMyLever3UWP", oMyLever3UWP);
								 }
						 object oMyLever3DWP = GetLocalObject(OBJECT_SELF, "oMyLever3DWP");
						 if (oMyLever3DWP == OBJECT_INVALID)
								{oMyLever3DWP = GetWaypointByTag("Nec_All_Quests_Lever3D_WP");
								SetLocalObject(OBJECT_SELF, "oMyLever3DWP", oMyLever3DWP);
								 }
						 object oMyCorpse2WP = GetLocalObject(OBJECT_SELF, "oMyCorpse2WP");
						 if (oMyCorpse2WP == OBJECT_INVALID)
								{oMyCorpse2WP = GetWaypointByTag("Nec_All_Quests_Corpse2_WP");
								SetLocalObject(OBJECT_SELF, "oMyCorpse2WP", oMyCorpse2WP);
								 }
						 object oMyZombieWP = GetLocalObject(OBJECT_SELF, "oMyZombieWP");
						 if (oMyZombieWP == OBJECT_INVALID)
								{oMyZombieWP = GetWaypointByTag("Nec_All_Quests_Zombie_WP");
								SetLocalObject(OBJECT_SELF, "oMyZombieWP", oMyZombieWP);
								 }
						 object oMyZombie = GetLocalObject(OBJECT_SELF, "oMyZombie");
						 if (oMyZombie == OBJECT_INVALID)
								{oMyZombie = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_nec200zombie", GetLocation(oMyZombieWP));
								SetLocalObject(OBJECT_SELF, "oMyZombie", oMyZombie);
								}
						 object oMyRatWP = GetLocalObject(OBJECT_SELF, "oMyRatWP");
						 if (oMyRatWP == OBJECT_INVALID)
								{oMyRatWP = GetWaypointByTag("Nec_All_Quests_Rat_WP");
								SetLocalObject(OBJECT_SELF, "oMyRatWP", oMyRatWP);
								 }
						 object oMyRat = GetLocalObject(OBJECT_SELF, "oMyRat");
						 if (oMyRat == OBJECT_INVALID)
								{oMyRat = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_nec200rat", GetLocation(oMyRatWP));
								SetLocalObject(OBJECT_SELF, "oMyRat", oMyRat);
								 }
						 object oMyLever1 = GetLocalObject(OBJECT_SELF, "oMyLever1");
						 if (oMyLever1 == OBJECT_INVALID)
								{oMyLever1 = GetObjectByTag("Nec_All_Quests_Lever1");
								SetLocalObject(OBJECT_SELF, "oMyLever1", oMyLever1);
								 }
						 object oMyLever2a = GetLocalObject(OBJECT_SELF, "oMyLever2a");
						 if (oMyLever2a == OBJECT_INVALID)
								{oMyLever2a = GetNearestObjectByTag("Nec_All_Quests_Lever2", OBJECT_SELF, 1);
								SetLocalObject(OBJECT_SELF, "oMyLever2a", oMyLever2a);
								 }
						 object oMyLever2b = GetLocalObject(OBJECT_SELF, "oMyLever2b");
						 if (oMyLever2b == OBJECT_INVALID)
								{oMyLever2b = GetNearestObjectByTag("Nec_All_Quests_Lever2", OBJECT_SELF, 2);
								SetLocalObject(OBJECT_SELF, "oMyLever2b", oMyLever2b);
								 }
						 object oMyLever3 = GetLocalObject(OBJECT_SELF, "oMyLever3");
						 if (oMyLever3 == OBJECT_INVALID)
								{oMyLever3 = GetObjectByTag("Nec_All_Quests_Lever3");
								 SetLocalObject(OBJECT_SELF, "oMyLever3", oMyLever3);
								 } 
						 object oMySkullWP = GetLocalObject(OBJECT_SELF, "oMySkullWP");
						 if (oMySkullWP == OBJECT_INVALID)
								{oMySkullWP = GetWaypointByTag("Nec_All_Quests_Skull_WP");
								 SetLocalObject(OBJECT_SELF, "oMySkullWP", oMySkullWP);
								 } 
						 object oMySkull = GetLocalObject(OBJECT_SELF, "oMySkull");
						 if (oMySkull == OBJECT_INVALID)
								{oMySkull = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_plcskull", GetLocation(oMySkullWP));
								 SetLocalObject(OBJECT_SELF, "oMySkull", oMySkull);
								 } 
						 if(GetCampaignString("SLV_UNI", "Elementary Necromancy", oStudent) == "Elementary Necromancy")		 
								 
							{SetUseableFlag(oMyLever1, TRUE);
							 SetUseableFlag(oMyLever2a, TRUE);
							 SetUseableFlag(oMyLever2b, TRUE);
							 SetUseableFlag(oMyLever3, TRUE);
							
							 object oMyGate1 = GetLocalObject(OBJECT_SELF, "oMyGate1");
						 	  if (oMyGate1 == OBJECT_INVALID)
								{oMyGate1 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_gate", GetLocation(oMyLever1DWP), FALSE, "Nec_All_Quests_Lever1_Gate");
								 SetLocalObject(OBJECT_SELF, "oMyGate1", oMyGate1);
								 SetLocalObject(oMyLever1, "oMyGate", oMyGate1);
								 SetLocalInt(oMyLever1, "State", 0);
								 }
							  object oMyGate2 = GetLocalObject(OBJECT_SELF, "oMyGate2");
						 	  if (oMyGate2 == OBJECT_INVALID)
								{oMyGate2 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_gate", GetLocation(oMyLever2DWP), FALSE, "Nec_All_Quests_Lever2_Gate");
								 SetLocalObject(OBJECT_SELF, "oMyGate2", oMyGate2);
								 SetLocalObject(oMyLever2a, "oMyGate", oMyGate2);
								 SetLocalObject(oMyLever2b, "oMyGate", oMyGate2);
								 SetLocalInt(oMyLever2a, "State", 0);
								 SetLocalInt(oMyLever2b, "State", 0);
								 }
							  object oMyGate3 = GetLocalObject(OBJECT_SELF, "oMyGate3");
						 	  if(GetCampaignString("SLV_UNI", "Standard Necromancy", oStudent) != "Standard Necromancy")		 
							  	{if (oMyGate3 == OBJECT_INVALID)
									{oMyGate3 = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_mc_jail02", GetLocation(oMyLever3UWP), FALSE, "Nec_All_Quests_Lever3_Gate");
									 SetLocalObject(OBJECT_SELF, "oMyGate3", oMyGate3);
									 SetLocalInt(oMyLever3, "State", 1);
									 SetLocalObject(oMyLever3, "oMyGate", oMyGate3);
									 }
								 else if(GetCampaignString("SLV_UNI", "Standard Necromancy", oStudent) == "Standard Necromancy")		 
						          {if (oMyGate3 == OBJECT_INVALID)
									{oMyGate3 = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_mc_jail02", GetLocation(oMyLever3DWP), FALSE, "Nec_All_Quests_Lever3_Gate");
									 SetLocalObject(OBJECT_SELF, "oMyGate3", oMyGate3);
									 SetLocalInt(oMyLever3, "State", 1);
									 SetLocalObject(oMyLever3, "oMyGate", oMyGate3);
									 }
								 }
								}
						 	  object oMyCorpse2 = GetLocalObject(OBJECT_SELF, "oMyCorpse2");
						 	  if (oMyCorpse2 == OBJECT_INVALID)
								{oMyCorpse2 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_corpse", GetLocation(oMyCorpse2WP));
								 SetLocalObject(OBJECT_SELF, "oMyCorpse2", oMyCorpse2);
								 }
						
						 		}
						 else if(GetCampaignString("SLV_UNI", "Elementary Necromancy", oStudent) != "Elementary Necromancy")
						 {	 object oMyGate1 = GetLocalObject(OBJECT_SELF, "oMyGate1");
						 	  if (oMyGate1 == OBJECT_INVALID)
								{oMyGate1 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_gate", GetLocation(oMyLever1DWP), FALSE, "Nec_All_Quests_Lever1_Gate");
								 SetLocalObject(OBJECT_SELF, "oMyGate1", oMyGate1);
								 SetLocalObject(oMyLever1, "oMyGate", oMyGate1);
								 }
							  object oMyGate2 = GetLocalObject(OBJECT_SELF, "oMyGate2");
						 	  if (oMyGate2 == OBJECT_INVALID)
								{oMyGate2 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_gate", GetLocation(oMyLever2DWP), FALSE, "Nec_All_Quests_Lever2_Gate");
								 SetLocalObject(OBJECT_SELF, "oMyGate2", oMyGate2);
								 SetLocalObject(oMyLever2a, "oMyGate", oMyGate2);
								 SetLocalObject(oMyLever2b, "oMyGate", oMyGate2);
								 }
							  object oMyGate3 = GetLocalObject(OBJECT_SELF, "oMyGate3");
						 	  if (oMyGate3 == OBJECT_INVALID)
								{oMyGate3 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_gate", GetLocation(oMyLever3DWP), FALSE, "Nec_All_Quests_Lever3_Gate");
								 SetLocalObject(OBJECT_SELF, "oMyGate3", oMyGate3);
								 SetLocalObject(oMyLever3, "oMyGate", oMyGate3);
								 }	 
						 	}	
					}	

			//Standard Necromancy
			if((GetName(OBJECT_SELF) == "Necromancy2") && (GetCampaignString("SLV_UNI", "Elementary Necromancy", oStudent) == "Elementary Necromancy"))
				 {object oMyCorpse2 = GetLocalObject(OBJECT_SELF, "oMyCorpse2");
				 if (oMyCorpse2 == OBJECT_INVALID)
					{oMyCorpse2 = GetObjectByTag("slv_nec200_corpse");
					 SetLocalObject(OBJECT_SELF, "oMyCorpse2", oMyCorpse2);
					 }
				   object oMyZombie = GetLocalObject(OBJECT_SELF, "oMyZombie");
				   if (oMyZombie == OBJECT_INVALID)
					{oMyZombie = GetObjectByTag("003_cr_slv_nec200zombie");
					SetLocalObject(OBJECT_SELF, "oMyZombie", oMyZombie);
					}
				  if((GetLocalInt(oStudent, "Nec200Message") != 1) && (GetCampaignString("SLV_UNI", "Standard Necromancy", oStudent) != "Standard Necromancy"))
					{SendMessageToPC(oStudent, "As you approach, a gory sight becomes clear. Could it be that the last student didn't pass Standard Necromancy...nor even make it out alive?");
					 DelayCommand(4.0, SendMessageToPC(oStudent, "A zombie feeds on a corpse it is mindlessly attempting to drag through the fence, apparently heedless of the fact that the gate to the zombie cage stands open."));
					 DelayCommand(8.0, SendMessageToPC(oStudent, "The lever mechanism partly supports the corpse but if the zombie dropped the body, it seems that the body would fall and jar the lever that the dead man's arm is still wrapped around, and set the gate to 'closed'."));
					 SetLocalInt(oStudent, "Nec200Message", 1);
					}
					
				}	
									
		//Transmutation
		if(GetName(OBJECT_SELF) == "Tra_All") 
					    {SetLocalString(oStudent, "sSchool", "Transmutation");
			             object oMyBucketWP = GetLocalObject(OBJECT_SELF, "oMyBucketWP");
						 if (oMyBucketWP == OBJECT_INVALID)
								{oMyBucketWP = GetWaypointByTag("Tra_All_Quests_Bucket_WP");
								SetLocalObject(OBJECT_SELF, "oMyBucketWP", oMyBucketWP);
								 }
						 object oMyBucket = GetLocalObject(OBJECT_SELF, "oMyBucket");
						 if (oMyBucket == OBJECT_INVALID)
								{oMyBucket = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra100_bucket", GetLocation(oMyBucketWP));
								SetLocalObject(OBJECT_SELF, "oMyBucket", oMyBucket);
								 }
						 object oMySmokeWP = GetLocalObject(OBJECT_SELF, "oMySmokeWP");
						 if (oMySmokeWP == OBJECT_INVALID)
								{oMySmokeWP = GetWaypointByTag("Tra_All_Quests_Smoke_WP");
								SetLocalObject(OBJECT_SELF, "oMySmokeWP", oMySmokeWP);
								 }
						 object oMySmoke = GetLocalObject(OBJECT_SELF, "oMySmoke");
						 if (oMySmoke == OBJECT_INVALID)
								{oMySmoke = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "slv_tra100_smoke", GetLocation(oMySmokeWP));
								SetLocalObject(OBJECT_SELF, "oMySmoke", oMySmoke);
								 }
						 object oMyFire1WP = GetLocalObject(OBJECT_SELF, "oMyFire1WP");
						 if (oMyFire1WP == OBJECT_INVALID)
								{oMyFire1WP = GetWaypointByTag("Tra_All_Quests_Fire1_WP");
								SetLocalObject(OBJECT_SELF, "oMyFire1WP", oMyFire1WP);
								 }
						 object oMyFire1 = GetLocalObject(OBJECT_SELF, "oMyFire1");
						 if (oMyFire1 == OBJECT_INVALID)
								{oMyFire1 = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "slv_tra100_fire1", GetLocation(oMyFire1WP));
								SetLocalObject(OBJECT_SELF, "oMyFire1", oMyFire1);
								 }
						 object oMyFire2WP = GetLocalObject(OBJECT_SELF, "oMyFire2WP");
						 if (oMyFire2WP == OBJECT_INVALID)
								{oMyFire2WP = GetWaypointByTag("Tra_All_Quests_Fire2_WP");
								SetLocalObject(OBJECT_SELF, "oMyFire2WP", oMyFire2WP);
								 }
						 object oMyFire2 = GetLocalObject(OBJECT_SELF, "oMyFire2");
						 if (oMyFire2 == OBJECT_INVALID)
								{oMyFire2 = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "slv_tra100_fire2", GetLocation(oMyFire2WP));
								SetLocalObject(OBJECT_SELF, "oMyFire2", oMyFire2);
								 }
						 object oMyWaterWP = GetLocalObject(OBJECT_SELF, "oMyWaterWP");
						 if (oMyWaterWP == OBJECT_INVALID)
								{oMyWaterWP = GetWaypointByTag("Tra_All_Quests_Water_WP");
								SetLocalObject(OBJECT_SELF, "oMyWaterWP", oMyWaterWP);
								 }
						 object oMyFountain = GetLocalObject(OBJECT_SELF, "oMyFountain");
				 		 if (oMyFountain == OBJECT_INVALID)
					 			{oMyFountain = GetObjectByTag("slv_tra100_fountain");
					  			 SetLocalObject(OBJECT_SELF, "oMyFountain", oMyFountain);
					 			}
				 		 SetUseableFlag(oMyFountain, TRUE);	
				 		 object oMyBrazier = GetLocalObject(OBJECT_SELF, "oMyBrazier");
				 		 if (oMyBrazier == OBJECT_INVALID)
					 			{oMyBrazier = GetObjectByTag("slv_tra100_brazier");
					  			 SetLocalObject(OBJECT_SELF, "oMyBrazier", oMyBrazier);
					 			}
				 		 SetUseableFlag(oMyBrazier, TRUE);	
				 		 object oMyFlame3WP = GetLocalObject(OBJECT_SELF, "oMyFlame3WP");
						 if (oMyFlame3WP == OBJECT_INVALID)
							 {oMyFlame3WP = GetWaypointByTag("Tra_All_Quests_Flame3_WP");
							  SetLocalObject(OBJECT_SELF, "oMyFlame3WP", oMyFlame3WP);
							 }
						  
						  object oMySteam2WP = GetLocalObject(OBJECT_SELF, "oMySteam2WP");
						  if (oMySteam2WP == OBJECT_INVALID)
							 {oMySteam2WP = GetWaypointByTag("Tra_All_Quests_Steam2_WP");
							  SetLocalObject(OBJECT_SELF, "oMySteam2WP", oMySteam2WP);
							 }
						object oMyHumanStool = GetLocalObject(OBJECT_SELF, "oMyHumanStool");
						  if (oMyHumanStool == OBJECT_INVALID)
							 {oMyHumanStool = GetObjectByTag("slv_tra200_stool_human");
							  SetLocalObject(OBJECT_SELF, "oMyHumanStool", oMyHumanStool);
							  }
						  object oMyElfStool = GetLocalObject(OBJECT_SELF, "oMyElfStool");
						  if (oMyElfStool == OBJECT_INVALID)
							 {oMyElfStool = GetObjectByTag("slv_tra200_stool_elf");
							  SetLocalObject(OBJECT_SELF, "oMyElfStool", oMyElfStool);
							 }
						  object oMyDwarfStool = GetLocalObject(OBJECT_SELF, "oMyDwarfStool");
						  if (oMyDwarfStool == OBJECT_INVALID)
							 {oMyDwarfStool = GetObjectByTag("slv_tra200_stool_dwarf");
							  SetLocalObject(OBJECT_SELF, "oMyDwarfStool", oMyDwarfStool);
							 }
						  object oMyGnomeStool = GetLocalObject(OBJECT_SELF, "oMyGnomeStool");
						  if (oMyGnomeStool == OBJECT_INVALID)
							 {oMyGnomeStool = GetObjectByTag("slv_tra200_stool_gnome");
							  SetLocalObject(OBJECT_SELF, "oMyGnomeStool", oMyGnomeStool);
							 }
						  object oMyHalflingStool = GetLocalObject(OBJECT_SELF, "oMyHalflingStool");
						  if (oMyHalflingStool == OBJECT_INVALID)
							 {oMyHalflingStool = GetObjectByTag("slv_tra200_stool_halfling");
							  SetLocalObject(OBJECT_SELF, "oMyHalflingStool", oMyHalflingStool);
							 }
						  object oMyHumanWP = GetLocalObject(OBJECT_SELF, "oMyHumanWP");
						  if (oMyHumanWP == OBJECT_INVALID)
							 {oMyHumanWP = GetWaypointByTag("Tra_All_Quests_Human_WP");
							  SetLocalObject(OBJECT_SELF, "oMyHumanWP", oMyHumanWP);
						     }
						  object oAlloy1 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra200_ingot_alloy", GetLocation(oMyHumanWP));
						  SetLocalObject(OBJECT_SELF, "oAlloy1", oAlloy1);
						  SetLocalObject(oAlloy1, "Tra_All", OBJECT_SELF);
						  SetLocalObject(oMyHumanStool, "oIngot", oAlloy1);
						  object oMyElfWP = GetLocalObject(OBJECT_SELF, "oMyElfWP");
						  if (oMyElfWP == OBJECT_INVALID)
							 {oMyElfWP = GetWaypointByTag("Tra_All_Quests_Elf_WP");
							  SetLocalObject(OBJECT_SELF, "oMyElfWP", oMyElfWP);
							  }
						  object oIron1 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra200_ingot_iron", GetLocation(oMyElfWP), FALSE, "slv_tra200_ingot_iron1");
						  SetLocalObject(OBJECT_SELF, GetTag(oIron1), oIron1);
						  SetLocalObject(oIron1, "Tra_All", OBJECT_SELF);
						  SetLocalObject(oMyElfStool, "oIngot", oIron1);
						  object oMyDwarfWP = GetLocalObject(OBJECT_SELF, "oMyDwarfWP");
						  if (oMyDwarfWP == OBJECT_INVALID)
							 {oMyDwarfWP = GetWaypointByTag("Tra_All_Quests_Dwarf_WP");
							  SetLocalObject(OBJECT_SELF, "oMyDwarfWP", oMyDwarfWP);
							 }
						  object oIron2 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra200_ingot_iron", GetLocation(oMyDwarfWP), FALSE, "slv_tra200_ingot_iron2");
						  SetLocalObject(OBJECT_SELF, GetTag(oIron2), oIron2);
						  SetLocalObject(oIron2, "Tra_All", OBJECT_SELF);
						  SetLocalObject(oMyDwarfStool, "oIngot", oIron2);
						  object oMyGnomeWP = GetLocalObject(OBJECT_SELF, "oMyGnomeWP");
						  if (oMyGnomeWP == OBJECT_INVALID)
							 {oMyGnomeWP = GetWaypointByTag("Tra_All_Quests_Gnome_WP");
							  SetLocalObject(OBJECT_SELF, "oMyGnomeWP", oMyGnomeWP);
							  }
						  object oIron3 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra200_ingot_iron", GetLocation(oMyGnomeWP), FALSE, "slv_tra200_ingot_iron3");
						  SetLocalObject(OBJECT_SELF, GetTag(oIron3), oIron3);
						  SetLocalObject(oIron3, "Tra_All", OBJECT_SELF);
						  SetLocalObject(oMyGnomeStool, "oIngot", oIron3);
						  object oMyHalflingWP = GetLocalObject(OBJECT_SELF, "oMyHalflingWP");
						  if (oMyHalflingWP == OBJECT_INVALID)
							 {oMyHalflingWP = GetWaypointByTag("Tra_All_Quests_Halfling_WP");
							  SetLocalObject(OBJECT_SELF, "oMyHalflingWP", oMyHalflingWP);
							 }
						  object oIron4 = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_tra200_ingot_iron", GetLocation(oMyHalflingWP), FALSE, "slv_tra200_ingot_iron4");
						  SetLocalObject(OBJECT_SELF, GetTag(oIron4), oIron4);
						  SetLocalObject(oIron4, "Tra_All", OBJECT_SELF);
						  SetLocalObject(oMyHalflingStool, "oIngot", oIron4);
						} 
				
				if(GetName(OBJECT_SELF) == "Transmutation2") 
					    { object oMyHumanStool = GetLocalObject(OBJECT_SELF, "oMyHumanStool");
						  if (oMyHumanStool == OBJECT_INVALID)
							 {oMyHumanStool = GetObjectByTag("slv_tra200_stool_human");
							  SetLocalObject(OBJECT_SELF, "oMyHumanStool", oMyHumanStool);
							  }
						  SetUseableFlag(oMyHumanStool, TRUE);
						  object oMyElfStool = GetLocalObject(OBJECT_SELF, "oMyElfStool");
						  if (oMyElfStool == OBJECT_INVALID)
							 {oMyElfStool = GetObjectByTag("slv_tra200_stool_elf");
							  SetLocalObject(OBJECT_SELF, "oMyElfStool", oMyElfStool);
							 }
						  SetUseableFlag(oMyElfStool, TRUE);
						  object oMyDwarfStool = GetLocalObject(OBJECT_SELF, "oMyDwarfStool");
						  if (oMyDwarfStool == OBJECT_INVALID)
							 {oMyDwarfStool = GetObjectByTag("slv_tra200_stool_dwarf");
							  SetLocalObject(OBJECT_SELF, "oMyDwarfStool", oMyDwarfStool);
							 }
						  SetUseableFlag(oMyDwarfStool, TRUE);
						  object oMyGnomeStool = GetLocalObject(OBJECT_SELF, "oMyGnomeStool");
						  if (oMyGnomeStool == OBJECT_INVALID)
							 {oMyGnomeStool = GetObjectByTag("slv_tra200_stool_gnome");
							  SetLocalObject(OBJECT_SELF, "oMyGnomeStool", oMyGnomeStool);
							 }
						  SetUseableFlag(oMyGnomeStool, TRUE);
						  object oMyHalflingStool = GetLocalObject(OBJECT_SELF, "oMyHalflingStool");
						  if (oMyHalflingStool == OBJECT_INVALID)
							 {oMyHalflingStool = GetObjectByTag("slv_tra200_stool_halfling");
							  SetLocalObject(OBJECT_SELF, "oMyHalflingStool", oMyHalflingStool);
							 }
						  SetUseableFlag(oMyHalflingStool, TRUE);
						  object oMyForge = GetLocalObject(OBJECT_SELF, "oMyForge");
						  if (oMyForge == OBJECT_INVALID)
							 {oMyForge = GetObjectByTag("slv_tra200_forge");
							  SetLocalObject(OBJECT_SELF, "oMyForge", oMyForge);
							 }
						  SetUseableFlag(oMyForge, TRUE);
						  
					  } 
				 
}