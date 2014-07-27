////////////////////////////////////////////////////////////////////////////////
//
//     Filename : slv_uni_walk
//      Version : 1.1
//         Date : 2008-2-4
//       Author : Wynna
//
//  Description
//  This handles NPC walk patterns in SLV Uni 

////////////////////////////////////////////////////////////////////////////////

#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "silvy_univ_inc"
#include "acr_time_i"
#include "acr_spawn_i"


void main()
{ float fTime2 = IntToFloat(Random(600) + 300);
  object oHome = GetLocalObject(OBJECT_SELF, "Home");
		
			
	object oWynna = GetLocalObject(OBJECT_SELF, "Wynna");
	object oArea = GetArea(OBJECT_SELF);
	int nWynna = GetLocalInt(oArea, "Wynna");
	if((oWynna == OBJECT_INVALID) && (nWynna == 1))
		{oWynna = GetFirstPC(TRUE);
			 while(oWynna != OBJECT_INVALID)
				{if(GetPCPlayerName(oWynna) == "Wynna-Player")
				 	{SetLocalObject(OBJECT_SELF, "Wynna", oWynna);
				 	 break;
					 }
				 oWynna = GetNextPC(TRUE);
				}
		
		  oWynna = GetLocalObject(OBJECT_SELF, "Wynna");
		    }		
	
	
	int nAreaPC = GetLocalInt(oArea, "oPC");
	object oAreaPC = GetLocalObject(OBJECT_SELF, "oAreaPC");
	if((GetArea(oAreaPC) != GetArea(OBJECT_SELF)) || (GetLocalInt(oArea, "oPC") != 1))
		{oAreaPC = GetFirstPC(TRUE);
		 while(oAreaPC != OBJECT_INVALID)
			{if(GetArea(oAreaPC) == (GetArea(OBJECT_SELF)))
			 	{SetLocalObject(OBJECT_SELF, "oAreaPC", oAreaPC);
				 SetLocalInt(GetArea(OBJECT_SELF), "oPC", 1);
				 DelayCommand(1800.0, SetLocalInt(oArea, "oPC", 0));
		 		  break;
				 }
			 oAreaPC = GetNextPC(TRUE);
			}
	     }		
	
		
	if((GetIsDMPossessed(OBJECT_SELF)) || (GetLocalInt(OBJECT_SELF, "Walk_Off") == 1))
			{if(GetIsDMPossessed(OBJECT_SELF))
			 	{SendMessageToPC(oWynna, GetName(OBJECT_SELF) + " is DM possessed. Walk patterns have been disabled.");
			 	 SendMessageToPC(OBJECT_SELF, GetName(OBJECT_SELF) + " is DM possessed. Walk patterns have been disabled.");
			 	 }
			 ClearAllActions(TRUE);
			 return;
			 }

	if(GetLocalString(OBJECT_SELF, "Conversation") == "Yes")
			{SendMessageToPC(oWynna, GetName(OBJECT_SELF) + " is in conversation with " + GetLocalString(OBJECT_SELF, "PC_Speaker") + ". Walk patterns have been disabled.");
			 ClearAllActions(TRUE);
			 return;
			 }
	
			 
		if((GetLocalInt(oArea, "oPC") == 1) || (GetArea(oWynna) == (GetArea(OBJECT_SELF))))
			{DelayCommand(fTime2, ExecuteScript("slv_uni_walk", OBJECT_SELF));
	   		}
		else 
			{SendMessageToPC(oWynna, GetName(OBJECT_SELF) + "will self-destruct in 60 seconds.");
			 DestroyObject(OBJECT_SELF, 60.0);
			 return;
			}
		
		if(GetLocalInt(OBJECT_SELF, "Familiar") != 1)
			{DelayCommand(IntToFloat(Random(7200) + 1200), SummonFamiliar(OBJECT_SELF));
			 SetLocalInt(OBJECT_SELF, "Familiar", 1);
			 }		

		ClearAllActions(FALSE);
  		object oSit = GetLocalObject(OBJECT_SELF, "oSit");
		DestroyObject(oSit);
		SetLocalObject(OBJECT_SELF, "oSit", OBJECT_INVALID);
		
		object oGoTo = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, Random(100) + 5);
		object oCurrent = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, 1);
		object oClass = GetLocalObject(OBJECT_SELF, "Class");
		object oLibraryUp = GetLocalObject(OBJECT_SELF, "LibraryUp");
		object oLibraryUpped  = GetLocalObject(OBJECT_SELF, "LibraryUpped");
		object oGoTo2;
		object oStairs;
		object oClassLevel;
		object oDown = GetLocalObject(OBJECT_SELF, "Down");
		object oDowned = GetLocalObject(OBJECT_SELF, "Downed");
		object oMastersUp = GetLocalObject(OBJECT_SELF, "MastersUp");
		object oMastersDown = GetLocalObject(OBJECT_SELF, "MastersDown");
		object oMastersDowned = GetLocalObject(OBJECT_SELF, "MastersDowned");
		object oLobby;
		int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
		int nTime100 = GetLocalInt(OBJECT_SELF, "Time100");
		int nTime200 = GetLocalInt(OBJECT_SELF, "Time200");
		int nTime300 = GetLocalInt(OBJECT_SELF, "Time300");
		int nTime400 = GetLocalInt(OBJECT_SELF, "Time400");
		int nTimeRandom = GetLocalInt(OBJECT_SELF, "TimeRandom");
		int nHour = GetTimeHour(); 
		int nMinute = GetTimeMinute();
		int nHome = GetLocalInt(OBJECT_SELF, "Home");
		float fTime = 60.0;
		
	struct SilvyUniversityCourseInfo sInfo;
    
	if(IsInConversation(OBJECT_SELF) == FALSE)					  
			{if((FindSubString(GetName(oGoTo), "Proc") != -1) ||(FindSubString(GetName(oGoTo), "Library_Stairs_Chair") != -1) ||(FindSubString(GetName(oGoTo), "Secret") != -1) ||(FindSubString(GetName(oGoTo), "Dean") != -1)||(FindSubString(GetName(oGoTo), "flame") != -1) 
		   		|| (FindSubString(GetName(oGoTo), "Library_All_Librarian") != -1) ||(FindSubString(GetName(oGoTo), "Random") != -1)||(FindSubString(GetName(oGoTo), "Quest") != -1)||(FindSubString(GetName(oGoTo), "CollBox") != -1)
				|| (FindSubString(GetName(oGoTo), "Center") != -1) || (FindSubString(GetName(oGoTo), "center") != -1)||(FindSubString(GetName(oGoTo), "Entry_North_AT") != -1) ||(FindSubString(GetName(oGoTo), "LadyHall") != -1)||(FindSubString(GetName(oGoTo), "Dorm_1") != -1)
				|| (FindSubString(GetName(oGoTo), "Dorm_3") != -1) || (FindSubString(GetName(oGoTo), "MH") != -1) || (FindSubString(GetName(oGoTo), "MT") != -1) 
				|| ((FindSubString(GetName(oGoTo), "Dorm_2") != -1) && (GetStringLeft(GetName(OBJECT_SELF), 3) != GetStringLeft(GetName(oGoTo), 3))))
				 			 { oGoTo = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, Random(50) + 5);
							   if((FindSubString(GetName(oGoTo), "Proc") != -1) ||(FindSubString(GetName(oGoTo), "Library_Stairs_Chair") != -1) ||(FindSubString(GetName(oGoTo), "Secret") != -1) ||(FindSubString(GetName(oGoTo), "Dean") != -1) ||(FindSubString(GetName(oGoTo), "flame") != -1) 
						   		|| (FindSubString(GetName(oGoTo), "Library_All_Librarian") != -1) ||(FindSubString(GetName(oGoTo), "Random") != -1) ||(FindSubString(GetName(oGoTo), "Quest") != -1)||(FindSubString(GetName(oGoTo), "CollBox") != -1)
								|| (FindSubString(GetName(oGoTo), "Center") != -1) ||(FindSubString(GetName(oGoTo), "Entry_North_AT") != -1) ||(FindSubString(GetName(oGoTo), "LadyHall") != -1)||(FindSubString(GetName(oGoTo), "Dorm_1") != -1)
								|| (FindSubString(GetName(oGoTo), "Dorm_3") != -1) || (FindSubString(GetName(oGoTo), "MH") != -1) || (FindSubString(GetName(oGoTo), "MT") != -1) 
								|| ((FindSubString(GetName(oGoTo), "Dorm_2") != -1) && (GetStringLeft(GetName(OBJECT_SELF), 3) != GetStringLeft(GetName(oGoTo), 3))))
						 			   {oGoTo = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, Random(50) + 5);
									    if((FindSubString(GetName(oGoTo), "Proc") != -1) ||(FindSubString(GetName(oGoTo), "Library_Stairs_Chair") != -1) ||(FindSubString(GetName(oGoTo), "Secret") != -1) ||(FindSubString(GetName(oGoTo), "Dean") != -1) ||(FindSubString(GetName(oGoTo), "flame") != -1) 
									   		|| (FindSubString(GetName(oGoTo), "Library_All_Librarian") != -1) ||(FindSubString(GetName(oGoTo), "Random") != -1) ||(FindSubString(GetName(oGoTo), "Quest") != -1)||(FindSubString(GetName(oGoTo), "CollBox") != -1)
											|| (FindSubString(GetName(oGoTo), "Center") != -1) ||(FindSubString(GetName(oGoTo), "Entry_North_AT") != -1) ||(FindSubString(GetName(oGoTo), "LadyHall") != -1)||(FindSubString(GetName(oGoTo), "Dorm_1") != -1)
											|| (FindSubString(GetName(oGoTo), "Dorm_3") != -1) || (FindSubString(GetName(oGoTo), "MH") != -1) || (FindSubString(GetName(oGoTo), "MT") != -1) 
											|| ((FindSubString(GetName(oGoTo), "Dorm_2") != -1) && (GetStringLeft(GetName(OBJECT_SELF), 3) != GetStringLeft(GetName(oGoTo), 3))))
									 			   {oGoTo = oClass;
												   PlayAnimation(ANIMATION_FIREFORGET_READ, 1.0);
												   DelayCommand(fTime2/3,  PlayAnimation(ANIMATION_FIREFORGET_READ, 1.0));
												   DelayCommand(fTime2/2,  PlayAnimation(ANIMATION_FIREFORGET_READ, 1.0));
												   DelayCommand(fTime2 - 10.0,  PlayAnimation(ANIMATION_FIREFORGET_READ, 1.0));
							     				   }
										}
							}			
				 
			if((FindSubString(GetName(oGoTo), "Chair") != -1) || (FindSubString(GetName(oGoTo), "Bench") != -1) || (FindSubString(GetName(oGoTo), "Stool") != -1)|| (FindSubString(GetName(oGoTo), "Sofa") != -1)|| (FindSubString(GetName(oGoTo), "Cushion") != -1))
				{if((((GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_MEDIUM) && (FindSubString(GetName(oGoTo), "Low") != -1)) || ((GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_SMALL) && (FindSubString(GetName(oGoTo), "Low") == -1)))	
				 	 || (GetName(oGoTo) == "ComE_Set1_Chair1_WP") || (GetName(oGoTo) == "ComE_Set1_Chair2_WP") || (GetName(oGoTo) == "ComE_Set1_Low_Chair3_WP")	)
					 				   {oGoTo = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, Random(50) + 5);
							   			if((FindSubString(GetName(oGoTo), "Chair") != -1) || (FindSubString(GetName(oGoTo), "Bench") != -1) || (FindSubString(GetName(oGoTo), "Stool") != -1)|| (FindSubString(GetName(oGoTo), "Sofa") != -1)|| (FindSubString(GetName(oGoTo), "Cushion") != -1))
										{if((((GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_MEDIUM) && (FindSubString(GetName(oGoTo), "Low") != -1)) || ((GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_SMALL) && (FindSubString(GetName(oGoTo), "Low") == -1)))	
										 	 || (GetName(oGoTo) == "ComE_Set1_Chair1_WP") || (GetName(oGoTo) == "ComE_Set1_Chair2_WP") || (GetName(oGoTo) == "ComE_Set1_Low_Chair3_WP")	)
							 				   {oGoTo = oClass;
									   			PlayAnimation(ANIMATION_FIREFORGET_READ, 1.0);
												DelayCommand(fTime2/3,  PlayAnimation(ANIMATION_FIREFORGET_READ, 1.0));
											    DelayCommand(fTime2/2,  PlayAnimation(ANIMATION_FIREFORGET_READ, 1.0));
											    DelayCommand(fTime2 - 10.0,  PlayAnimation(ANIMATION_FIREFORGET_READ, 1.0));
											 	}
										 	
											}
									}
					}	
						
	

	if(nHour == nHome)
				{ClearAllActions(FALSE);
				 oGoTo = oHome;
				 SetLocalString(GetModule(), GetTag(OBJECT_SELF), "");
				}			 				 		
	
		
	if (FindSubString(GetTag(OBJECT_SELF), "stud") != -1) 
	{	if((nHour == nTime100) || (oGoTo == oClass))
					{if(oClass != OBJECT_INVALID)
						 	{oGoTo = oClass;
							}
						else
							{oGoTo = GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, Random(5));
					 		}
					 if(GetTag(oArea) == "6d_int_silvy_ladycol_grd_lvl")
					 	{oStairs = GetWaypointByTag("GL1_Up_AT");
						 oClassLevel = GetWaypointByTag("GL1_Up_AT_WP");;
						}
					 if(GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl")
					 	{oStairs = GetWaypointByTag("GL3_Down_AT");
						 oClassLevel = GetWaypointByTag("GL3_Down_AT_WP");
						 }
					 if(GetObjectType(oGoTo) == OBJECT_TYPE_WAYPOINT) 
						  {DelayCommand(5.0, ActionMoveToObject(oStairs, FALSE, 0.0));
						  DelayCommand(35.0, ActionJumpToObject(oClassLevel, TRUE));
						  DelayCommand(45.0, ActionMoveToObject(oClass, FALSE, 0.0));
						  DelayCommand(60.0, ActionJumpToObject(oClass, TRUE));
					 	 }
					}
				 else if((GetTag(oArea) == "6d_int_silvy_ladycol_class_lvl")&& ((nHour == nTime100) || (nHour == nTime200)))
					{oGoTo = oClass;
					 DelayCommand(5.0, ActionMoveToObject(oClass, FALSE, 0.0));
					 DelayCommand(35.0, ActionJumpToObject(oClass, TRUE));
					 }	
		  }	
		  
    if (FindSubString(GetTag(OBJECT_SELF), "proc") != -1) 
		 {	if(((((nHour == nTime300) || (nHour == nTime400)))) || (oGoTo == oClass))
					{if(oClass != OBJECT_INVALID)
						 	{oGoTo = oClass;
							}
						else
							{oGoTo = GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, Random(5));
					 		}
					 if(GetTag(oArea) == "6d_int_silvy_ladycol_grd_lvl")
					 	{oStairs = GetWaypointByTag("GL1_Up_AT");
						 oClassLevel = GetWaypointByTag("GL1_Up_AT_WP");;
						}
					 if(GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl")
					 	{oStairs = GetWaypointByTag("GL3_Down_AT");
						 oClassLevel = GetWaypointByTag("GL3_Down_AT_WP");
						 }
					 if(GetObjectType(oGoTo) == OBJECT_TYPE_WAYPOINT) 
						  {DelayCommand(5.0, ActionMoveToObject(oStairs, FALSE, 0.0));
						  DelayCommand(35.0, ActionJumpToObject(oClassLevel, TRUE));
						  DelayCommand(45.0, ActionMoveToObject(oClass, FALSE, 0.0));
						  DelayCommand(60.0, ActionJumpToObject(oClass, TRUE));
					 	 }
					}
				 else if((GetTag(oArea) == "6d_int_silvy_ladycol_class_lvl")&& ((nHour == nTime100) || (nHour == nTime200)|| (nHour == nTime300) || (nHour == nTime400)))
					{oGoTo = oClass;
					 DelayCommand(5.0, ActionMoveToObject(oClass, FALSE, 0.0));
					 DelayCommand(35.0, ActionJumpToObject(oClass, TRUE));
					 }	
		  }	
		 
	if ((FindSubString(GetTag(OBJECT_SELF), "prof") != -1) || (FindSubString(GetTag(OBJECT_SELF), "belad") != -1)  
		||(FindSubString(GetTag(OBJECT_SELF), "librarian") != -1) ||(FindSubString(GetTag(OBJECT_SELF), "registrar") != -1)) 
		 {	if(((((nHour == nTime100) || (nHour == nTime200)|| (nHour == nTime300) || (nHour == nTime400)))) || (oGoTo == oClass))
					{if(oClass != OBJECT_INVALID)
						 	{oGoTo = oClass;
							}
						else
							{oGoTo = GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, Random(5));
					 		}
					 if(GetTag(oArea) == "6d_int_silvy_ladycol_grd_lvl")
					 	{oStairs = GetWaypointByTag("GL1_Up_AT");
						 oClassLevel = GetWaypointByTag("GL1_Up_AT_WP");;
						}
					 if(GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl")
					 	{oStairs = GetWaypointByTag("GL3_Down_AT");
						 oClassLevel = GetWaypointByTag("GL3_Down_AT_WP");
						 }
					 if(GetObjectType(oGoTo) == OBJECT_TYPE_WAYPOINT) 
						  {DelayCommand(5.0, ActionMoveToObject(oStairs, FALSE, 0.0));
						  DelayCommand(35.0, ActionJumpToObject(oClassLevel, TRUE));
						  DelayCommand(45.0, ActionMoveToObject(oClass, FALSE, 0.0));
						  DelayCommand(60.0, ActionJumpToObject(oClass, TRUE));
					 	 }
					}
				 else if((GetTag(oArea) == "6d_int_silvy_ladycol_class_lvl")&& ((nHour == nTime100) || (nHour == nTime200)|| (nHour == nTime300) || (nHour == nTime400)))
					{oGoTo = oClass;
					 DelayCommand(5.0, ActionMoveToObject(oClass, FALSE, 0.0));
					 DelayCommand(35.0, ActionJumpToObject(oClass, TRUE));
					 }	
		  }	
		
	if ((FindSubString(GetTag(OBJECT_SELF), "Spellguard") != -1)||(FindSubString(GetTag(OBJECT_SELF), "dean") != -1)||(FindSubString(GetTag(OBJECT_SELF), "arken") != -1) ||(FindSubString(GetTag(OBJECT_SELF), "miresk") != -1))
		  {if((nHour >= nTimeRandom) && (nHour <= nTimeRandom + 3))
			{if(GetTag(oArea) == "6d_int_silvy_ladycol_grd_lvl")
					 	{oStairs = GetWaypointByTag("GL1_Up_AT");
						 oClassLevel = GetWaypointByTag("GL1_Up_AT_WP");;
						 DelayCommand(5.0, ActionMoveToObject(oStairs, FALSE, 0.0));
					     DelayCommand(35.0, ActionJumpToObject(oClassLevel, TRUE));
					     }
					if(GetTag(oArea) == "6d_int_silvy_ladycol_class_lvl")
					 	{oStairs = GetWaypointByTag("GL1_Down_AT");
						 oClassLevel = GetWaypointByTag("GL1_Down_AT_WP");;
						 DelayCommand(5.0, ActionMoveToObject(oStairs, FALSE, 0.0));
					     DelayCommand(35.0, ActionJumpToObject(oClassLevel, TRUE));
					     }
					 if(GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl")
					 	{oStairs = GetWaypointByTag("GL3_Down_AT");
						 oClassLevel = GetWaypointByTag("GL3_Down_AT_WP");
						 DelayCommand(5.0, ActionMoveToObject(oStairs, FALSE, 0.0));
					     DelayCommand(35.0, ActionJumpToObject(oClassLevel, TRUE));
					     }
					  
					  oGoTo = GetNearestObject(OBJECT_TYPE_WAYPOINT, oClassLevel, Random(100));
					  DelayCommand(55.0, ActionMoveToObject(oGoTo, FALSE, 0.0));
					  
			  } 
			  if(nHour >= 21)		
					  {if(GetTag(oArea) == "6d_int_silvy_ladycol_grd_lvl")
					 	{oStairs = GetWaypointByTag("GL1_Up_AT");
						 oClassLevel = GetWaypointByTag("GL1_Up_AT_WP");;
						 DelayCommand(5.0, ActionMoveToObject(oStairs, FALSE, 0.0));
					     DelayCommand(35.0, ActionJumpToObject(oClassLevel, TRUE));
					     }
					if(GetTag(oArea) == "6d_int_silvy_ladycol_class_lvl")
					 	{oStairs = GetWaypointByTag("GL3_Up_AT");
						 oClassLevel = GetWaypointByTag("GL3_Up_AT_WP");;
						 DelayCommand(5.0, ActionMoveToObject(oStairs, FALSE, 0.0));
					     DelayCommand(35.0, ActionJumpToObject(oClassLevel, TRUE));
					     }
					  
					   object oGoToSameArea = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, Random(10));
					   DelayCommand(45.0, ActionMoveToObject(oGoToSameArea, FALSE, 0.0));
					   }
				 }	
		  
		
	if(FindSubString(GetName(oGoTo), "_AT") != -1)
				{object oWentTo = GetWaypointByTag(GetTag(oGoTo) + "_WP");
				 if(GetIsDMPossessed(OBJECT_SELF) != TRUE)
				 	{DelayCommand(35.0, ActionJumpToObject(oWentTo, TRUE));
					 }
				 else if(GetIsDMPossessed(OBJECT_SELF) == TRUE)
						 	{ClearAllActions(TRUE);
							 DelayCommand(fTime2, ExecuteScript("slv_uni_walk", OBJECT_SELF));
							 return;
					 		 }
				 }		  
		 
	
	if((oGoTo == oHome)&& (GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_grd_lvl"))
			{if(GetLocalString(OBJECT_SELF, GetTag(GetArea(OBJECT_SELF))) != "6d_int_silvy_ladycol_grd_lvl")
					 {DelayCommand(5.0, ActionMoveToObject(oLibraryUp, FALSE, 0.0));
					 }
				else
				{ActionMoveToObject(oHome, FALSE, 0.0);}
				 if(GetIsDMPossessed(OBJECT_SELF) != TRUE)
						 	{DelayCommand(35.0, ActionJumpToObject(oHome, TRUE));
							}
					 else if(GetIsDMPossessed(OBJECT_SELF) == TRUE)
						 	{ClearAllActions(TRUE);
							 DelayCommand(fTime2, ExecuteScript("slv_uni_walk", OBJECT_SELF));
							 return;
							 }
					 }		
	if((oGoTo == oHome)&& (GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_class_lvl"))
			{SetLocalInt(OBJECT_SELF, "Home", 1);
			 if(GetLocalString(OBJECT_SELF, "6d_int_silvy_ladycol_grd_lvl") == "6d_int_silvy_ladycol_grd_lvl")
				 {DelayCommand(5.0, ActionMoveToObject(oDown, FALSE, 0.0));
				 }
			 if(GetLocalString(OBJECT_SELF, "6d_int_silvy_ladycol_class_lvl") == "6d_int_silvy_ladycol_class_lvl")
						 {DelayCommand(5.0, ActionMoveToObject(oHome, FALSE, 0.0));
						  }
			 if(GetLocalString(OBJECT_SELF, "6d_int_silvy_ladycol_master_lvl") == "6d_int_silvy_ladycol_master_lvl")
					 { DelayCommand(5.0, ActionMoveToObject(GetWaypointByTag("GL3_Up_AT"), FALSE, 0.0));
						  }
					 		 		 
					 if(GetIsDMPossessed(OBJECT_SELF) != TRUE)
						 	{DelayCommand(45.0, ActionJumpToObject(oHome, TRUE));
							 }
					 else if(GetIsDMPossessed(OBJECT_SELF) == TRUE)
						 	{ClearAllActions(TRUE);
							 DelayCommand(fTime2, ExecuteScript("slv_uni_walk", OBJECT_SELF));
							 return;
							 }
			}	
	if((oGoTo == oHome)&& (GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_master_lvl"))
			{if(GetLocalString(OBJECT_SELF, GetTag(GetArea(OBJECT_SELF))) != "6d_int_silvy_ladycol_master_lvl")
					 {DelayCommand(5.0, ActionMoveToObject(GetWaypointByTag("GL3_Down_AT"), FALSE, 0.0));
					 }
				else
				{ActionMoveToObject(oHome, FALSE, 0.0);
				 }
				 if(GetIsDMPossessed(OBJECT_SELF) != TRUE)
						 	{DelayCommand(45.0, ActionJumpToObject(oHome, TRUE));
							}
					 else if(GetIsDMPossessed(OBJECT_SELF) == TRUE)
						 	{ClearAllActions(TRUE);
							 DelayCommand(fTime2, ExecuteScript("slv_uni_walk", OBJECT_SELF));
							 return;
							}
					 }				 
	}	
			 		
if(oGoTo == OBJECT_INVALID)
	{oGoTo = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, Random(10));
	}
	
if(oGoTo != oClass)
	{DelayCommand(5.0, ActionMoveToObject(oGoTo, FALSE, 0.0));	
	}

if((FindSubString(GetName(oGoTo), "Chair") != -1) || (FindSubString(GetName(oGoTo), "Bench") != -1) || (FindSubString(GetName(oGoTo), "Stool") != -1)|| (FindSubString(GetName(oGoTo), "Sofa") != -1)|| (FindSubString(GetName(oGoTo), "Cushion") != -1))
		{string sSit = "slv_mid_sitbox";
		if(GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_SMALL)
			{sSit = "slv_low_sitbox";}
		object oSit = CreateObject(OBJECT_TYPE_PLACEABLE, sSit, GetLocation(oGoTo));
		SetLocalObject(OBJECT_SELF, "oSit", oSit);
		DelayCommand(fTime, DoPlaceableObjectAction(oSit, PLACEABLE_ACTION_USE));
		}		
		

if(FindSubString(GetName(oGoTo), "Middle") != -1) 
		{if(GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_MEDIUM)
			{DelayCommand(fTime, DoPlaceableObjectAction(oGoTo, PLACEABLE_ACTION_USE));
			}		
		}	
		
if(FindSubString(GetName(oGoTo), "Low Box") != -1) 
		{if(GetCreatureSize(OBJECT_SELF) == CREATURE_SIZE_SMALL)
			{DelayCommand(fTime, DoPlaceableObjectAction(oGoTo, PLACEABLE_ACTION_USE));
			}		
		}	
		
			 	
	SendMessageToPC(oWynna, GetName(OBJECT_SELF) + " is in "+ GetName(GetArea(OBJECT_SELF)) + "; oGoTo = " + GetName(oGoTo) + ". My next move is in "+ FloatToString(fTime2));
			


   } 
	