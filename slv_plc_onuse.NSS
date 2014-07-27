//OnUse for all Silvy Uni placeables 
//Wynna September 2007


#include "acr_placeable_i"
#include "acr_xp_i"
#include "acr_quest_i"
#include "acr_i"


// float GetNormalizedDirection(float fDirection):
// * This script returns a direction normalized to the range 0.0 - 360.0
// * Copyright (c) 2002 Floodgate Entertainment
// * Created By: Naomi Novik
// * Created On: 11/08/2002
float _GetNormalizedDirection(float fDirection)
{
    float fNewDir = fDirection;
    while (fNewDir >= 360.0) {
        fNewDir -= 360.0;
    }
    while (fNewDir <= 0.0) {
        fNewDir += 360.0;
    }

    return fNewDir;
}

void main()
{
	ACR_PlaceableOnUsed();
     object oStudent = GetLastUsedBy();
	 
	 
if((GetIsDMPossessed(oStudent)) || (GetIsPC(oStudent)))
{if(GetTag(OBJECT_SELF) == "slv_firestarter")
	{object oMyWP = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, 1);
	 object oMyDoorTrig=GetLocalObject(oMyWP, "oMyTrig");
	 object oMyWood=GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Wood");
	 
	 object oMyFire = GetLocalObject(oMyDoorTrig, "MyFire");
	 if(GetIsObjectValid(oMyFire))
		{DestroyObject(oMyFire);
		 object oMyFireLight = GetLocalObject(OBJECT_SELF, "MyLight");
		 object oFireSound = GetLocalObject(OBJECT_SELF, "FireSound");
		 if(oFireSound == OBJECT_INVALID)
		 	{oFireSound = GetNearestObjectByTag("Campfire");
			}
			{}
	 	 SoundObjectStop(oFireSound);
		}
	 
	 else
		{object oMyFire = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_litfire0", GetLocation(oMyWood), FALSE);
		 object oFireSound = GetLocalObject(OBJECT_SELF, "FireSound");
		 if(oFireSound == OBJECT_INVALID)
		 	{oFireSound = GetNearestObjectByTag("Campfire");
			}
			{}
		 SetLocalObject(oMyDoorTrig, "MyFire", oMyFire);
		 SoundObjectPlay(oFireSound);
		 DelayCommand(1800.0, DestroyObject(oMyFire));
		 DelayCommand(1801.0, SoundObjectStop(oFireSound));
	 }	
	}	
	

if(GetTag(OBJECT_SELF) == "slv_CurtainPull")
   {object oMyDoorTrig=GetNearestObjectByTag("slv_dorm", oStudent, 1);
	object oCurtainClosed = GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Closed");
	object oCurtainOpen = GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Open");
	effect eDawn=EffectVisualEffect(VFX_DUR_LIGHT_ORANGE_20, FALSE);
	effect eDay=EffectVisualEffect(VFX_DUR_LIGHT_YELLOW_20, FALSE);
	effect eDusk=EffectVisualEffect(VFX_DUR_LIGHT_RED_20, FALSE);
	string sView;
	string sDirection;
	
	if((GetFacing(OBJECT_SELF) >= 337.5) || (GetFacing(OBJECT_SELF) < 22.5))
		{sDirection = "north";
		 sView = "";
		 }
	if((GetFacing(OBJECT_SELF) >= 292.5) && (GetFacing(OBJECT_SELF) < 337.5))
		{sDirection = "southeast"; 
		 sView = " past Arkhen's Invocatorium and over graceful avenues to the Mulgate.";
		 }
	if((GetFacing(OBJECT_SELF) >= 247.5) && (GetFacing(OBJECT_SELF) < 292.5))
		{sDirection = "west"; 
		 sView = "";
		 }
	if((GetFacing(OBJECT_SELF) >= 202.5) && (GetFacing(OBJECT_SELF) < 247.5))
		{sDirection = "northeast"; 
		 sView = " with the Moonbridge sparkling over the river.";
		 }
	if((GetFacing(OBJECT_SELF) >= 157.5) && (GetFacing(OBJECT_SELF) < 202.5))
		{sDirection = "south"; 
		 sView = "";
		 }
	if((GetFacing(OBJECT_SELF) >= 112.5) && (GetFacing(OBJECT_SELF) < 157.5))
		{sDirection = "northwest"; 
		 sView = " over the city and river.";
		 }
	if((GetFacing(OBJECT_SELF) >= 67.5) && (GetFacing(OBJECT_SELF) < 112.5))
		{sDirection = "east"; 
		 sView = "";
		 }
	if((GetFacing(OBJECT_SELF) >= 22.5) && (GetFacing(OBJECT_SELF) < 67.5))
		{sDirection = "southwest"; 
		 sView = ", a cityscape with the Blacklar Gate visible in the distance.";
		 }	
	
	if(GetLocalInt(OBJECT_SELF, "Auto") !=1)
  
		{if(GetIsObjectValid(oCurtainClosed))
			{object oCurtainOpen = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_curtainopen0", GetLocation(oCurtainClosed), FALSE, GetName(oMyDoorTrig) + "_Curtain_Open");
			 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Open", oCurtainOpen);
			 DestroyObject(oCurtainClosed);
			 if(GetIsDawn())
			 	{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDawn, oCurtainOpen, 418.0);
				}
			 if(GetIsDay())
			 	{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDay, oCurtainOpen, 418.0);
				}
			 if(GetIsDusk())
			 	{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDusk, oCurtainOpen, 418.0);
				}	
			  FloatingTextStringOnCreature("The time is approximately hour " + IntToString(GetTimeHour()) + ".", oStudent, TRUE, 5.0);
			  FloatingTextStringOnCreature("The view is " + sDirection + sView, oStudent, TRUE, 5.0);
			  DelayCommand(418.0, SetLocalInt(OBJECT_SELF, "Auto", 1));
			  DelayCommand(420.0, ExecuteScript("slv_plc_onuse", OBJECT_SELF));
			 }
		
		else if(GetIsObjectValid(oCurtainOpen))
			 {object oCurtainClosed = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_curtainclosed0", GetLocation(oCurtainOpen), FALSE, GetName(oMyDoorTrig) + "_Curtain_Closed");
			  SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Closed", oCurtainClosed);
			  DestroyObject(oCurtainOpen);
			  }	
	  }	
	 else if((GetLocalInt(OBJECT_SELF, "Auto") == 1) && (GetDistanceBetween(OBJECT_SELF, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1)) <= 15.0))
	   { if(GetIsDawn())
		 	{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDawn, oCurtainOpen, 418.0);
			}
		 if(GetIsDay())
		 	{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDay, oCurtainOpen, 418.0);
			}
		 if(GetIsDusk())
		 	{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDusk, oCurtainOpen, 418.0);
			}	
         SetLocalInt(OBJECT_SELF, "Auto", 0);
		 DelayCommand(418.0, SetLocalInt(OBJECT_SELF, "Auto", 1));
		 DelayCommand(420.0, ExecuteScript("slv_plc_onuse", OBJECT_SELF));
	   }
	  else if((GetLocalInt(OBJECT_SELF, "Auto") == 1) && (GetDistanceBetween(OBJECT_SELF, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1)) > 15.0))
	   { object oCurtainClosed = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_curtainclosed0", GetLocation(oCurtainOpen), FALSE, GetName(oMyDoorTrig) + "_Curtain_Closed");
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Closed", oCurtainClosed);
		 SetLocalInt(OBJECT_SELF, "Auto", 0);
		 } 
  }
  
  //Usable maps
   if(GetTag(OBJECT_SELF) == "slv_map")
   	{ExploreAreaForPlayer(GetArea(oStudent), oStudent, TRUE);
	}
	
//Time-telling sundials. 
	if(GetTag(OBJECT_SELF) == "slv_sundial")
	   	{object oItem = GetItemActivated();
	    object oUser = GetItemActivator();
	    object oStudent = oUser;
		int iHour = GetTimeHour();
		int iMinute = GetTimeMinute();
		string sHour = IntToString(iHour);
		string sMinute = IntToString(iMinute);
		
	    SpeakString("A voice says: 'The time is hour " + sHour + ", minute: " + sMinute + "'", TALKVOLUME_TALK);          
       }
	   
	   
	 //Here begin the individual quests by school
	 
		   
	//Standard Conjuration
    if((GetTag(OBJECT_SELF) == "slv_con200_lever") && (GetLocalInt(oStudent, "Greased") == 1))
	   	{SendMessageToPC(oStudent, "The Grease does it. The lever slips into place under its own weight.");
			 SendMessageToPC(oStudent, "An area of floor camouflaged to look like holly leaves rolls away, revealing a tiny toy drum on the floor.");
			 object oToy = CreateObject(OBJECT_TYPE_ITEM, "slv_con200_toy", GetLocation(OBJECT_SELF));
			 SetCampaignString("SLV_UNI", "Standard Conjuration", "Standard Conjuration", oStudent);
			 if(ACR_RetrieveQuestState("slv_con200", oStudent) == 1)
				{ACR_AddPersistentJournalQuestEntry("slv_con200", 2, oStudent, 0, 0, 0, 0);
				}
			SetUseableFlag(OBJECT_SELF, FALSE);
			 
		}
	else if(GetTag(OBJECT_SELF) == "slv_con200_lever")
	   	{SendMessageToPC(oStudent, "The lever is too rusty to budge!");
		} 
		 
	//Standard Divination
	if((GetTag(OBJECT_SELF) == "slv_div200_trapdoor") && (GetLocalInt(oStudent, "DivFlint") != 1))
                {object oClarvue = GetObjectByTag("003_cr_slv_profdiv");
				PlayAnimation(ANIMATION_PLACEABLE_OPEN);
                CreateObject(OBJECT_TYPE_ITEM, "slv_div200_rock", GetLocation(OBJECT_SELF), FALSE);
                CreateObject(OBJECT_TYPE_ITEM, "slv_div200_rock", GetLocation(OBJECT_SELF), FALSE);
                SendMessageToPC(oStudent, "You find a large chunk of stone that looks like flint. It's scratched with a rune.");
                if(GetIsSkillSuccessful(oStudent, SKILL_SPELLCRAFT, 10, TRUE))
					{SendMessageToPC(oStudent, "You are able to translate the rune as a common symbol for 'Explosive'.");
                	}
				SetLocalInt(oStudent, "DivFlint", 1);
                SetLocalInt(oClarvue, "DivFlint", 1);
                SetUseableFlag(OBJECT_SELF, FALSE);
				}
				
	//Elementary Enchantment
   if(GetTag(OBJECT_SELF) == "slv_enc100_plc_mirror")
	   	{SpeakString("Mirror, mirror on the wall, who's the fairest one of all? So they ask and so I tell.... You are (with the proper spell) .", TALKVOLUME_TALK);
		 SetCampaignString("SLV_UNI", "Elementary Enchantment", "Elementary Enchantment", oStudent);
		 if(ACR_RetrieveQuestState("slv_enc100", oStudent) == 1)
				{ACR_AddPersistentJournalQuestEntry("slv_enc100", 2, oStudent, 0, 0, 0, 0);
				}
			} 

	//Standard Evocation			
	if(GetTag(OBJECT_SELF) == "slv_evo200_curtainpull")
   {object oMyCurtainCl = GetLocalObject(OBJECT_SELF, "oMyCurtainCl");
   	if(oMyCurtainCl == OBJECT_INVALID)
		{oMyCurtainCl = GetObjectByTag("slv_evo200_curtaincl");
		 SetLocalObject(OBJECT_SELF, "oMyCurtainCl", oMyCurtainCl);
		 }
	object oCurtainsOpen = GetLocalObject(OBJECT_SELF, "oCurtainsOpen");
	if(oCurtainsOpen == OBJECT_INVALID)
		{oCurtainsOpen = GetObjectByTag("slv_evo200_curtainsopen");
		 SetLocalObject(OBJECT_SELF, "oCurtainsOpen", oCurtainsOpen);
		 }
	object oMyCurtainClWP = GetLocalObject(OBJECT_SELF, "oMyCurtainClWP");
	if (oMyCurtainClWP == OBJECT_INVALID)
		{oMyCurtainClWP = GetWaypointByTag("Evo_All_Quests_CurtainCl_WP");
		 SetLocalObject(OBJECT_SELF, "oMyCurtainClWP", oMyCurtainClWP);
		}
	object oMyCurtainOpWP = GetLocalObject(OBJECT_SELF, "oMyCurtainOpWP");
	if (oMyCurtainOpWP == OBJECT_INVALID)
		{oMyCurtainOpWP = GetWaypointByTag("Evo_All_Quests_CurtainOp_WP");
		 SetLocalObject(OBJECT_SELF, "oMyCurtainOpWP", oMyCurtainOpWP);
		}
						  
		
	
	if(GetLocalInt(OBJECT_SELF, "Auto") !=1)
  
		{if(GetIsObjectValid(oMyCurtainCl))
			{object oCurtainsOpen = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_curtainopen0", GetLocation(oMyCurtainOpWP), FALSE, "slv_evo200_curtainsopen");
			 SetLocalObject(OBJECT_SELF, "oCurtainsOpen", oCurtainsOpen);
			 DestroyObject(oMyCurtainCl);
			 DelayCommand(2.5, SendMessageToPC(oStudent, "The open curtain reveals windows inset into the wall made of a thousand small bubbles of smoked glass. A broken bubble near the bottom drips an oily yellow liquid.  The edges of a square of heavy parchment are visible mounted behind the bubbles of glass."));
        	 DelayCommand(418.0, SetLocalInt(OBJECT_SELF, "Auto", 1));
			  DelayCommand(420.0, ExecuteScript("slv_plc_onuse", OBJECT_SELF));
			 }
		
		else if(GetIsObjectValid(oCurtainsOpen))
			 {object oMyCurtainCl = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_curtainclosed0", GetLocation(oMyCurtainClWP), FALSE, "slv_evo200_curtainscl");
			  SetLocalObject(OBJECT_SELF, "oMyCurtainCl", oMyCurtainCl);
			  DestroyObject(oCurtainsOpen);
			  }	
	  }	
	 else if((GetLocalInt(OBJECT_SELF, "Auto") == 1) && (GetDistanceBetween(OBJECT_SELF, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1)) <= 15.0))
	   { SetLocalInt(OBJECT_SELF, "Auto", 0);
		 DelayCommand(418.0, SetLocalInt(OBJECT_SELF, "Auto", 1));
		 DelayCommand(420.0, ExecuteScript("slv_plc_onuse", OBJECT_SELF));
	   }
	  else if((GetLocalInt(OBJECT_SELF, "Auto") == 1) && (GetDistanceBetween(OBJECT_SELF, GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1)) > 15.0))
	   { object oMyCurtainCl = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_curtainclosed0", GetLocation(oCurtainsOpen), FALSE, "slv_evo200_curtainscl");
		 SetLocalObject(OBJECT_SELF, "oMyCurtainCl", oMyCurtainCl);
		 SetLocalInt(OBJECT_SELF, "Auto", 0);
		 } 
  }

  //Elementary Illusion
  if((FindSubString(GetTag(OBJECT_SELF), "slv_ill100_sitbox") != -1) || (FindSubString(GetTag(OBJECT_SELF), "slv_ill100_low_sitbox") != -1)) 
         
	   	{object oMyTrigAll = GetNearestObjectByTag("slv_in22.00", OBJECT_SELF, 1);
				{SetLocalObject(OBJECT_SELF, "Ill_All", oMyTrigAll);
				}
		 object oMyBoyWP = GetLocalObject(oMyTrigAll, "oMyBoyWP");
		 if (oMyBoyWP == OBJECT_INVALID)
			{oMyBoyWP = GetWaypointByTag("Ill_All_Quests_Boy_WP");
			SetLocalObject(oMyTrigAll, "oMyBoyWP", oMyBoyWP);
			}
		object oMyBoy = GetLocalObject(oMyTrigAll, "oMyBoy");
		 if (oMyBoy == OBJECT_INVALID)
			{oMyBoy = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100boy", GetLocation(oMyBoyWP));
		 	 SetLocalObject(oMyTrigAll, "oMyBoy", oMyBoy);
			 }
		 object oMyPixie = GetLocalObject(oMyTrigAll, "oMyPixie");
		 if (oMyPixie == OBJECT_INVALID)
			{oMyPixie = GetObjectByTag("003_cr_slv_ill100pixie");
		 	 SetLocalObject(oMyTrigAll, "oMyPixie", oMyPixie);
			 }
		 object oMyImp = GetLocalObject(oMyTrigAll, "oMyImp");
	     if (oMyImp == OBJECT_INVALID)
			{oMyImp = GetObjectByTag("003_cr_slv_ill100imp");
		 	 SetLocalObject(oMyTrigAll, "oMyImp", oMyImp);
			 }
		 string sPronoun;
	     string sPossessive;
	     if(GetGender(oStudent) == GENDER_MALE)
	       {(sPronoun == "He") && (sPossessive == "his");}
	       else 
		   {(sPronoun == "She") && (sPossessive == "her");}
		    
			object oMyCollBox2WP = GetLocalObject(oMyTrigAll, "oMyCollBox2WP");
			 if (oMyCollBox2WP == OBJECT_INVALID)
				{oMyCollBox2WP = GetObjectByTag("Illusion2_trig_CollBox_WP");
				 SetLocalObject(oMyTrigAll, "oMyCollBox2WP", oMyCollBox2WP);
				}
			object oMyCollBox3WP = GetLocalObject(oMyTrigAll, "oMyCollBox3WP");
			if (oMyCollBox3WP == OBJECT_INVALID)
				{oMyCollBox3WP = GetObjectByTag("Illusion3_trig_CollBox_WP");
				 SetLocalObject(oMyTrigAll, "oMyCollBox3WP", oMyCollBox3WP);
				}
			object oMyTrig2 = GetLocalObject(oMyTrigAll, "oMyTrig2");
				if (oMyTrig2 == OBJECT_INVALID)
					{oMyTrig2 = GetObjectByTag( "Illusion2_trig");
					 SetLocalObject(oMyTrigAll,  "oMyTrig2", oMyTrig2);
					}
				object oMyTrig3 = GetLocalObject(oMyTrigAll, "oMyTrig3");
				if (oMyTrig3 == OBJECT_INVALID)
				{oMyTrig3 = GetObjectByTag( "Illusion3_trig");
				SetLocalObject(oMyTrigAll,  "oMyTrig3", oMyTrig3);
				}
			    object oMyCollBox2 = GetLocalObject(oMyTrigAll, "oMyCollBox2");
				if(oMyCollBox2 == OBJECT_INVALID)
					{oMyCollBox2 = GetObjectByTag("Illusion2_trig_CollBox200");
					 SetLocalObject(oMyTrigAll, "oMyCollBox2", oMyCollBox2);
					}
					 
		   
			object oChair = OBJECT_SELF;
			object oSitter = GetLastUsedBy();
		    object oLastSitter = GetLocalObject(oChair, "lastsitted");
		    string sChair = GetTag(oChair);
		    string sAutofit = GetLocalString(oChair, "autofit");
			int iHeading  = GetLocalInt(oChair, "degree");
			int iPC_size  = GetLocalInt(oChair, "size");
		    //Assign the heading degrees
			location lChair_o = GetLocation(oChair);
		    location lChair = Location(GetArea(oChair), GetPositionFromLocation(lChair_o), _GetNormalizedDirection(GetFacingFromLocation(lChair_o) + iHeading));
			
		    //Check if seat is free
		    if(GetDistanceBetween(oLastSitter, oChair) == 0.0f && GetArea(oLastSitter) == GetArea(oChair))
		    {
		        SetLocalInt(oChair, "taken", 1);
		        SpeakOneLinerConversation("", OBJECT_INVALID, TALKVOLUME_WHISPER);
		    }
		    else //if seat is free...
		    {
		        SetLocalInt(oChair, "taken", 0);
		
		    	//Check for Character Race with original Creature Size
		    	switch (iPC_size)
		    	{
		    	case 0:
				    //Check for Character Race with original Creature Size
				    if(	((GetRacialType(oSitter) == RACIAL_TYPE_ELF) && (GetCreatureSize(oSitter) == CREATURE_SIZE_MEDIUM)) ||
		    			((GetRacialType(oSitter) == RACIAL_TYPE_HALFELF) && (GetCreatureSize(oSitter) == CREATURE_SIZE_MEDIUM)) ||
					    ((GetRacialType(oSitter) == RACIAL_TYPE_HALFORC) && (GetCreatureSize(oSitter) == CREATURE_SIZE_MEDIUM)) ||
					    ((GetRacialType(oSitter) == RACIAL_TYPE_HUMAN) && (GetCreatureSize(oSitter) == CREATURE_SIZE_MEDIUM)) ||
					    ((GetSubRace(oSitter) == RACIAL_SUBTYPE_AASIMAR) && (GetCreatureSize(oSitter) == CREATURE_SIZE_MEDIUM)) ||
					    ((GetSubRace(oSitter) == RACIAL_SUBTYPE_TIEFLING) && (GetCreatureSize(oSitter) == CREATURE_SIZE_MEDIUM)))
				    {
		    			if(GetIsObjectValid(oChair) && GetIsObjectValid(oSitter))
					    {
		    				AssignCommand(oSitter, ActionMoveToLocation(lChair));
						    DelayCommand(1.5, AssignCommand(oSitter, SetFacing( _GetNormalizedDirection(GetFacing(oChair)+180.00+GetLocalFloat(oChair,"rotate")) )));
							DelayCommand(2.5, AssignCommand(oSitter, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR, 1.0, 1.0)));
		                    SetLocalObject(oChair, "lastsitted", oSitter);
					    }
				    }
				    else
		            {
		                if(sAutofit != "")
		                {
		                    AssignCommand(oChair, SetIsDestroyable(TRUE, FALSE));
		                    AssignCommand(oSitter, DestroyObject(oChair));
		                    oChair = CreateObject(OBJECT_TYPE_PLACEABLE, "pat_low_" + sAutofit, lChair_o, FALSE, sChair);
		                    if(!(GetIsObjectValid(oChair)))
		                        oChair = CreateObject(OBJECT_TYPE_PLACEABLE, "pat_low_stool01", lChair_o, FALSE, sChair);
						    SetLocalString(oChair, "autofit", sAutofit);
			                SetLocalInt(oChair, "degree", iHeading);
			                SetLocalInt(oChair, "size", 1);
		                    SetLocalObject(oChair, "lastsitted", oSitter);
		                }
		                else
				        SpeakOneLinerConversation("", OBJECT_INVALID, TALKVOLUME_WHISPER);
		            }
				    break;
		
		    	case 1:
				    //Check for Character Race with original Creature Size
				    if(	((GetRacialType(oSitter) == RACIAL_TYPE_DWARF) && (GetCreatureSize(oSitter) == CREATURE_SIZE_MEDIUM)) ||
					    ((GetRacialType(oSitter) == RACIAL_TYPE_GNOME) && (GetCreatureSize(oSitter) == CREATURE_SIZE_SMALL)) ||
		    			((GetRacialType(oSitter) == RACIAL_TYPE_HALFLING) && (GetCreatureSize(oSitter) == CREATURE_SIZE_SMALL)))
				    {
		    			if(GetIsObjectValid(oChair) && GetIsObjectValid(oSitter))
					    {
		    				AssignCommand(oSitter, ActionMoveToLocation(lChair));
						    DelayCommand(1.5, AssignCommand(oSitter, SetFacing( _GetNormalizedDirection(GetFacing(oChair)+180.0+GetLocalFloat(oChair,"rotate")) )));
							DelayCommand(2.5, AssignCommand(oSitter, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CHAIR, 1.0, 1.0)));
		                    SetLocalObject(oChair, "lastsitted", oSitter);
					    }
				    }
				    else
		            {
		                if(sAutofit != "")
		                {
		                    AssignCommand(oChair, SetIsDestroyable(TRUE, FALSE));
		                    AssignCommand(oSitter, DestroyObject(oChair));
		                    oChair = CreateObject(OBJECT_TYPE_PLACEABLE, "pat_mid_" + sAutofit, lChair_o, FALSE, sChair);
		                    if(!(GetIsObjectValid(oChair)))
		                        oChair = CreateObject(OBJECT_TYPE_PLACEABLE, "pat_mid_stool01", lChair_o, FALSE, sChair);
						   	SetLocalString(oChair, "autofit", sAutofit);
			                SetLocalInt(oChair, "degree", iHeading);
			                SetLocalInt(oChair, "size", 0);
		                    SetLocalObject(oChair, "lastsitted", oSitter);
		                }
		                else
				        SpeakOneLinerConversation("", OBJECT_INVALID, TALKVOLUME_WHISPER);
		            }
				    break;
		
			    default:
		    		//Character with no original Race and/or Creature size
			        SpeakOneLinerConversation("", OBJECT_INVALID, TALKVOLUME_WHISPER);
				    break;
			    }
			}

	if(GetLocalString(oStudent, "Elementary Illusion") != "Elementary Illusion")			
	    {if((GetTag(OBJECT_SELF) == "slv_ill100_sitbox1") || (GetTag(OBJECT_SELF)== "slv_ill100_low_sitbox1")) 
	   	  {int iBoth = GetLocalInt(oStudent, "Both");
		   SetLocalInt(oStudent, "Both", iBoth + 1);
		  if(GetLocalInt(oStudent, "IllChair1") == 2)
	        {SendMessageToPC(oStudent, "Not enough time has passed to calm your nerves enough to try to discern illusion and truth again.");
	         }
		   if(GetLocalInt(oStudent, "IllChair1") == 3)
	        {SendMessageToPC(oStudent, "You remain convinced that the pixie is real.");
	         }
		   if(GetLocalInt(oStudent, "IllChair1") <= 1)
	        {if(WillSave(oStudent, 15, SAVING_THROW_TYPE_NONE) == 1)
	            {SetLocalInt(oStudent, "IllChair1", 3);
	             SetCampaignString("SLV_UNI", GetTag(oMyPixie), GetTag(oMyPixie), oStudent);
	             SendMessageToPC(oStudent, "The very fabric of reality seems to warp towards chaos and the pixie's tricksome nature.  It and the tricks it plays on your perceptions are quite real, you're certain of it, and it seems perfectly happy to be there.");
	             AssignCommand(oMyBoy, SpeakString("*Giggles*", TALKVOLUME_TALK));
	             }
	         else 
	            {SetLocalInt(oStudent, "IllChair1", 2);
	             SendMessageToPC(oStudent, "The shadows jumping in the room, and the thought of what might happen if imp or pixie got loose is too much distraction.  You are uncertain whether the pixie is real or not.");
	             AssignCommand(oMyBoy, SpeakString("Twinkle twinkle, little fey, how I wonder what you say.  Stuck inside this little room; bet you're really angry too....", TALKVOLUME_TALK));
	             DelayCommand(60.0, SetLocalInt(oStudent, "IllChair1", 1));
				 }
         	}
        }

    	if((GetTag(OBJECT_SELF) == "slv_ill100_sitbox2") || (GetTag(OBJECT_SELF) == "slv_ill100_low_sitbox2")) 
	   	 {int iBoth = GetLocalInt(oStudent, "Both");
		   SetLocalInt(oStudent, "Both", iBoth + 1);
		  if(GetLocalInt(oStudent, "IllChair2") == 2)
	        {SendMessageToPC(oStudent, "Not enough time has passed to calm your nerves enough to try to discern illusion and truth again.");
	         }
		   if(GetLocalInt(oStudent, "IllChair2") == 3)
	        {SendMessageToPC(oStudent, "You remain convinced that the imp is not real.");
	         }
		   if(GetLocalInt(oStudent, "IllChair2") <= 1)
	        {if(WillSave(oStudent, 15, SAVING_THROW_TYPE_NONE) == 1)
		        {object oMyImpWP = GetLocalObject(oMyTrigAll, "oMyImpWP");
				 if (oMyImpWP == OBJECT_INVALID)
						{oMyImpWP = GetWaypointByTag("Ill_All_Quests_Imp_WP");
						 SetLocalObject(oMyTrigAll, "oMyImpWP", oMyImpWP);
						 }
				 object oMyButterflies = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100butterflies", GetLocation(oMyImpWP));
				 SetLocalInt(oStudent, "IllChair2", 3);
		         SetCampaignString("SLV_UNI", GetTag(oMyImp), GetTag(oMyImp), oStudent);
		         SendMessageToPC(oStudent, "There is no sense of great evil enveloping you, no sense of anything at all.  The shadows beneath the fluttering wings of the imp are not right, either.  You feel a growing disbelief that such a being could be kept restrained in such a fashion. With your disbelief, the imp vanishes, to be replaced by small, fluttering insects.");
		         AssignCommand(oMyBoy, SpeakString("*Claps hands*  Butterflies!", TALKVOLUME_TALK));
		         DestroyObject(oMyImp);
				 SetLocalObject(oMyTrigAll, "oMyImp", OBJECT_INVALID);
				 }
		       else 
		         {SetLocalInt(oStudent, "IllChair2", 2);
		          SendMessageToPC(oStudent, "Discomfort and a sense of being watched by something--or things--in the room, make you you unable to concentrate.  You are unsure if the imp is real or not.");
		          AssignCommand(oMyBoy, SpeakString("This one's blind, I think, Snout.  *Giggles*", TALKVOLUME_TALK));
		          DelayCommand(60.0, SetLocalInt(oStudent, "IllChair2", 1));
				 }
       		}
        }
	if((GetCampaignString("SLV_UNI", GetTag(oMyPixie), oStudent) == GetTag(oMyPixie)) && (GetCampaignString("SLV_UNI", GetTag(oMyImp), oStudent) == GetTag(oMyImp)))
        	{object oMyBearWP = GetLocalObject(oMyTrigAll, "oMyBearWP");
			 if (oMyBearWP == OBJECT_INVALID)
					{oMyBearWP = GetWaypointByTag("Ill_All_Quests_Bear_WP");
					 SetLocalObject(oMyTrigAll, "oMyBearWP", oMyBearWP);
					 }
		 	 object oMyBear = GetLocalObject(oMyTrigAll, "oMyBear");
		 	 if (oMyBear == OBJECT_INVALID)
				 {oMyBear = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100cub", GetLocation(oMyBearWP));
			 	  SetLocalObject(oMyTrigAll, "oMyBear", oMyBear);
				 }
		 	 DelayCommand(1.0, AssignCommand(oMyBoy, SpeakString("You did it!  This one's smarter than most of them, Snout, but we'll get'm next time!  You can't catch me! *claps hands*  Hey, Presto! *Darts off through a mirrored wall as if it wasn't there.", TALKVOLUME_TALK)));
         	 SetCampaignString("SLV_UNI", "Elementary Illusion", "Elementary Illusion", oStudent);
         	 if(ACR_RetrieveQuestState("slv_ill100", oStudent) == 1)
				{DelayCommand(5.0, ACR_AddPersistentJournalQuestEntry("slv_ill100", 2, oStudent, 0, 0, 0, 0));
				 DestroyObject(oMyBear, 5.5);
		         DestroyObject(oMyBoy, 5.5);
		         DelayCommand(5.55, SetLocalObject(oMyTrigAll, "oMyBear", OBJECT_INVALID));
				 DelayCommand(5.55, SetLocalObject(oMyTrigAll, "oMyBoy", OBJECT_INVALID));
			  	}
			}
		 
    if((GetLocalInt(oStudent, "Both") == 2) && (GetLocalInt(oStudent, "IllChair2") >=1) && (GetLocalInt(oStudent, "IllChair1") >=1))
        {SetLocalInt(oStudent, "Both", 0);
		 object oMyBearWP = GetLocalObject(oMyTrigAll, "oMyBearWP");
		 if (oMyBearWP == OBJECT_INVALID)
			{oMyBearWP = GetWaypointByTag("Ill_All_Quests_Bear_WP");
			 SetLocalObject(oMyTrigAll, "oMyBearWP", oMyBearWP);
			 }
		 object oMyBearskinWP = GetLocalObject(oMyTrigAll, "oMyBearskinWP");
		 if (oMyBearskinWP == OBJECT_INVALID)
			{oMyBearskinWP = GetWaypointByTag("Ill_All_Quests_Bearskin_WP");
			 SetLocalObject(oMyTrigAll, "oMyBearskinWP", oMyBearskinWP);
			 }
		 object oMyBearskin = GetLocalObject(oMyTrigAll, "oMyBearskin");
		 if (oMyBearskin == OBJECT_INVALID)
			{oMyBearskin = GetObjectByTag("slv_ill100_bearskin");
			SetLocalObject(oMyTrigAll, "oMyBearskin", oMyBearskin);
			 }
	     object oMyBear = GetLocalObject(oMyTrigAll, "oMyBear");
		 if (oMyBear == OBJECT_INVALID)
			{oMyBear = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100cub", GetLocation(oMyBearWP));
		 	 SetLocalObject(oMyTrigAll, "oMyBear", oMyBear);
			 }
		 object oMyCollBox2 = GetLocalObject(oMyTrigAll, "oMyCollBox2");
		 if(oMyCollBox2 == OBJECT_INVALID)
				{oMyCollBox2 = GetObjectByTag("Illusion2_trig_CollBox200");
				}
		 SetLocalObject(oMyTrigAll, "oMyCollBox2", oMyCollBox2);
		 if((GetCampaignString("SLV_UNI", GetTag(oMyPixie), oStudent) == GetTag(oMyPixie)) && (GetCampaignString("SLV_UNI", GetTag(oMyImp), oStudent) == GetTag(oMyImp)))
        	{DelayCommand(1.0, AssignCommand(oMyBoy, SpeakString("You did it!  This one's smarter than most of them, Snout, but we'll get'm next time!  You can't catch me! *claps hands*  Hey, Presto! *Darts off through a mirrored wall as if it wasn't there.", TALKVOLUME_TALK)));
         	 SetCampaignString("SLV_UNI", "Elementary Illusion", "Elementary Illusion", oStudent);
         	 if(ACR_RetrieveQuestState("slv_ill100", oStudent) == 1)
				{DelayCommand(5.0, ACR_AddPersistentJournalQuestEntry("slv_ill100", 2, oStudent, 0, 0, 0, 0));
			  	 DestroyObject(oMyBear, 5.5);
		         DestroyObject(oMyBoy, 5.5);
		         DelayCommand(5.55, SetLocalObject(oMyTrigAll, "oMyBear", OBJECT_INVALID));
				 DelayCommand(5.55, SetLocalObject(oMyTrigAll, "oMyBoy", OBJECT_INVALID));
				 }
			}
		 else
			 {DelayCommand(1.0, AssignCommand(oMyBoy, SpeakString("Stupid old people! You'll never get it!  You can't catch me! *claps hands*  Hey, Presto! *Darts off through a mirrored wall as if it wasn't there.", TALKVOLUME_TALK)));
	          DestroyObject(oMyBear, 5.5);
	          DestroyObject(oMyBoy, 5.5);
	          DelayCommand(5.55, SetLocalObject(oMyTrigAll, "oMyBear", OBJECT_INVALID));
			  DelayCommand(5.55, SetLocalObject(oMyTrigAll, "oMyBoy", OBJECT_INVALID));
			  }
		 DestroyObject(oMyBearskin, 1.5);
         SetLocalObject(oMyTrigAll, "oMyBearskin", OBJECT_INVALID);
		 DelayCommand(2.0, SendMessageToPC(oStudent, "The bearskin rug on the ground rises up, shakes off, yawns a mighty yawn...and is revealed as a real bear cub, previously under an illusion."));
	     DelayCommand(4.5, AssignCommand(oMyBoy, ActionForceMoveToObject(oMyBear, TRUE, 0.0)));
		 	 }
	   }  
  	}
	
	        //Standard Illusion

    if(((GetTag(OBJECT_SELF) == "slv_ill200_mirrorwhite") || (GetTag(OBJECT_SELF) == "slv_ill200_mirrorblack")) && (WillSave(oStudent, 15, SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF)))
        {SendMessageToPC(oStudent, "Your hand passes through the area where your eyes saw your reflection in a mirror and the mirror vanishes!");
         DestroyObject(OBJECT_SELF, 1.0);
         }
        else if(GetTag(OBJECT_SELF) == "slv_ill200_mirrorprism")
        {SendMessageToPC(oStudent, "The mirror rocks on its feet at your touch.  Your image looks out at you.");
         }
	 
		 
   //Standard Necromancy

    if(FindSubString(GetTag(OBJECT_SELF), "Nec_All_Quests_Lever") != -1)
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
		int nState = GetLocalInt(OBJECT_SELF, "State");
		 object oMyGate = GetLocalObject(OBJECT_SELF, "oMyGate");
		 if(oMyGate == OBJECT_INVALID)
		 	{oMyGate = GetObjectByTag(GetTag(OBJECT_SELF) + "_Gate");
			 SetLocalObject(OBJECT_SELF, "oMyGate", oMyGate);
			 }
		 object oMyGateWP;
		 object oMyGateNew;
		 if(nState == 1)
		 	{oMyGateWP = GetWaypointByTag(GetTag(OBJECT_SELF) + "D_WP");
			 oMyGateNew = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_nec200_gate", GetLocation(oMyGateWP), FALSE, GetTag(OBJECT_SELF) + "_Gate");
		 	 SetLocalInt(OBJECT_SELF, "State", 0);
			 }
		 else if(nState == 0)
		 	{oMyGateWP = GetWaypointByTag(GetTag(OBJECT_SELF) + "U_WP");
			 oMyGateNew = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_mc_jail02", GetLocation(oMyGateWP), FALSE, GetTag(OBJECT_SELF) + "_Gate");
		  	 SetLocalInt(OBJECT_SELF, "State", 1);
			}
		 DestroyObject(oMyGate);
		 SetLocalObject(OBJECT_SELF, "oMyGate", OBJECT_INVALID);
		 SetLocalObject(OBJECT_SELF, "oMyGate", oMyGateNew);
		 AssignCommand(oMyGateNew, PlaySound("distantchainrattle01"));
		  if(GetTag(OBJECT_SELF) == "Nec_All_Quests_Lever2")
       		{ChangeToStandardFaction(oMyZombie, STANDARD_FACTION_HOSTILE);
		 	}
		 }

		 	//Elementary Transmutation
   if(GetTag(OBJECT_SELF) == "slv_tra100_bucket")
	   	{object oBucketItem = CreateItemOnObject("slv_tra100_empty", oStudent, 1);
		 DestroyObject(OBJECT_SELF);
		}
		 	//Standard Transmutation

	 if(FindSubString(GetTag(OBJECT_SELF), "slv_tra200_ingot_iron") != -1)
	   	{object oTraAll = GetLocalObject(OBJECT_SELF, "Tra_All");
		 SetLocalObject(oTraAll, GetTag(OBJECT_SELF), OBJECT_INVALID);
		 object oIngotItem = CreateItemOnObject("slv_tra200_iron", oStudent, 1);
		 SetLocalObject(oIngotItem, "oTra_All", oTraAll);
		 SetLocalString(oIngotItem, "PLCTag", GetTag(OBJECT_SELF));
		 DestroyObject(OBJECT_SELF);
		}
	
	 if(GetTag(OBJECT_SELF) == "slv_tra200_ingot_alloy")
	   	{object oTraAll = GetLocalObject(OBJECT_SELF, "Tra_All");
		 SetLocalObject(oTraAll, GetTag(OBJECT_SELF), OBJECT_INVALID);
		 object oIngotItem = CreateItemOnObject("slv_tra200_alloy", oStudent, 1);
		 SetLocalObject(oIngotItem, "oTra_All", oTraAll);
		 SetLocalString(oIngotItem, "PLCTag", GetTag(OBJECT_SELF));
		 DestroyObject(OBJECT_SELF);
		}

	 if(GetTag(OBJECT_SELF) == "slv_tra200_ingot_steel")
	   	{object oTraAll = GetLocalObject(OBJECT_SELF, "Tra_All");
		 SetLocalObject(oTraAll, GetTag(OBJECT_SELF), OBJECT_INVALID);
		 object oIngotItem = CreateItemOnObject("slv_tra200_steel", oStudent, 1);
		 SetLocalObject(oIngotItem, "oTra_All", oTraAll);
		 SetLocalString(oIngotItem, "PLCTag", GetTag(OBJECT_SELF));
		 DestroyObject(OBJECT_SELF);
		}
			
	
						  
						   	
			
	  if(FindSubString(GetTag(OBJECT_SELF), "slv_tra200_stool") != -1)
	   	{if(GetLocalInt(oStudent, "IngotMsg") != 1) 
		    {SendMessageToPC(oStudent, "By standing on these stools, you might be able to reach the ingots above, it seems, though it may be difficult.");
		 	 SetLocalInt(oStudent, "IngotMsg", 1);
			}
		 int nRace = GetRacialType(oStudent);
		 string sMessage;
		 object oMyIngot = GetLocalObject(OBJECT_SELF, "oIngot");
		 if((GetTag(OBJECT_SELF) == "slv_tra200_stool_human") || (GetTag(OBJECT_SELF) == "slv_tra200_stool_elf"))
			{if(GetHasSpellEffect(SPELL_ENLARGE_PERSON, oStudent))
				{if((nRace == RACIAL_TYPE_GNOME) || (nRace == RACIAL_TYPE_HALFLING))
					{sMessage = "With the help of your enlarge person spell and a lucky jump, you are able to snatch the ingots from the shelf one by one!";
		 			}
				 if(nRace == RACIAL_TYPE_DWARF)
				    {sMessage = "With the help of your enlarge person spell, you are barely able to reach the ingots on the shelf by standing on your tip toes!";
		 			}
				 if((nRace == RACIAL_TYPE_ELF) || (nRace == RACIAL_TYPE_HALFELF) || (nRace == RACIAL_TYPE_HALFORC) || (nRace == RACIAL_TYPE_HUMAN))
					{sMessage = "With the help of your enlarge person spell, you are able to reach the ingots on the shelf!";
		 			}
				 SetUseableFlag(oMyIngot, TRUE);
		 		 SendMessageToPC(oStudent, sMessage);
				}
				else
				 	{SendMessageToPC(oStudent, "Even with the stool, you are unable to reach the shelf to lift down the heavy ingots."); 
					} 
			  }	 
				 
			 if(GetTag(OBJECT_SELF) == "slv_tra200_stool_dwarf")
				{if(GetHasSpellEffect(SPELL_ENLARGE_PERSON, oStudent))
					{if((nRace == RACIAL_TYPE_GNOME) || (nRace == RACIAL_TYPE_HALFLING))
						{sMessage = "With the help of your enlarge person spell, you are barely able to reach the ingots on the shelf by standing on your tip toes!";
			 			}
					 if(nRace == RACIAL_TYPE_DWARF)
					    {sMessage = "With the help of your enlarge person spell, you are able to reach the ingots on the shelf easily.";
			 			}
					 if((nRace == RACIAL_TYPE_ELF) || (nRace == RACIAL_TYPE_HALFELF) || (nRace == RACIAL_TYPE_HALFORC) || (nRace == RACIAL_TYPE_HUMAN))
						{sMessage = "With the help of your enlarge person spell, you are eye level with the ingots and they are gathered without effort.";
			 			}
					 SetUseableFlag(oMyIngot, TRUE);
				 	 SendMessageToPC(oStudent, sMessage);
					}
				  else
				 	{SendMessageToPC(oStudent, "Even with the stool, you are unable to reach the shelf to lift down the heavy ingots."); 
					} 
				}
	
			if((GetTag(OBJECT_SELF) == "slv_tra200_stool_gnome") || (GetTag(OBJECT_SELF) == "slv_tra200_stool_halfling"))
				{if(GetHasSpellEffect(SPELL_ENLARGE_PERSON, oStudent))
					{if((nRace == RACIAL_TYPE_GNOME) || (nRace == RACIAL_TYPE_HALFLING))
						{sMessage = "With the help of your enlarge person spell, you are able to reach the ingots on the shelf easily.";
			 			}
					 if(nRace == RACIAL_TYPE_DWARF)
					    {sMessage = "With the help of your enlarge person spell, you are eye level with the ingots and they are gathered without effort.";
			 			}
					 if((nRace == RACIAL_TYPE_ELF) || (nRace == RACIAL_TYPE_HALFELF) || (nRace == RACIAL_TYPE_HALFORC) || (nRace == RACIAL_TYPE_HUMAN))
						{sMessage = "With the help of your enlarge person spell, you could have stepped onto the shelf. You must bend to pick up the ingots!";
			 			}
					 SetUseableFlag(oMyIngot, TRUE);
				 	 SendMessageToPC(oStudent, sMessage);
					 }
				   if(!GetHasSpellEffect(SPELL_ENLARGE_PERSON, oStudent))
					   	{if((nRace == RACIAL_TYPE_ELF) || (nRace == RACIAL_TYPE_HALFELF) || (nRace == RACIAL_TYPE_HALFORC) || (nRace == RACIAL_TYPE_HUMAN))
							{sMessage = "You have no need for any enhancements to reach these ingots.";
				 			SetUseableFlag(oMyIngot, TRUE);
						 	SendMessageToPC(oStudent, sMessage);
							}
						 else
						 	{SendMessageToPC(oStudent, "Even with the stool, you are unable to reach the shelf to lift down the heavy ingots."); 
							} 	
						}	 
				 }
				 
			}
		 
	 //All Advanced Level courses work the same way, with a quill to write down test answers and a secretary desk to check them
	 
	 if(GetTag(OBJECT_SELF) == "slv_300_quill")
	 	{object oQuill = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_300_quill", GetLocation(OBJECT_SELF));
		 SetLocalObject(OBJECT_SELF, "oMyQuill", oQuill);
		 DestroyObject(GetLocalObject(OBJECT_SELF, "oMyQuill"), 600.0);
		 AssignCommand(oQuill, ActionStartConversation(oStudent, "slv_300_scribe", TRUE));
         }  
	
     //Book Order Quill
	 	
	 if(GetTag(OBJECT_SELF) == "slv_bookorder_quill")
	 	{object oQuill = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_300_quill", GetLocation(OBJECT_SELF), FALSE, "003_cr_slv_bookorder_quill");
		 SetLocalObject(OBJECT_SELF, "oMyQuill", oQuill);
		 DestroyObject(GetLocalObject(OBJECT_SELF, "oMyQuill"), 600.0);
		 AssignCommand(oQuill, ActionStartConversation(oStudent, "slv_bookorder_scribe", TRUE));
         }  
	
	   //Scribing Station Quill
	 	
	 if(GetTag(OBJECT_SELF) == "slv_station_quill")
	 	{object oQuill = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_300_quill", GetLocation(OBJECT_SELF), FALSE, "003_cr_slv_scribing_quill");
		 SetLocalObject(OBJECT_SELF, "oMyQuill", oQuill);
		 DestroyObject(GetLocalObject(OBJECT_SELF, "oMyQuill"), 600.0);
		 AssignCommand(oQuill, ActionStartConversation(oStudent, "slv_station_scribe", TRUE));
         }  
			
		 
		   //Broom
	 	
	 if(GetTag(OBJECT_SELF) == "slv_broom")
	 	{object oDirt = GetFirstObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 while(oDirt != OBJECT_INVALID)
		 	{if((FindSubString(GetName(oDirt), "Dirt") != -1) || (FindSubString(GetName(oDirt), "Leaf") != -1) || (FindSubString(GetName(oDirt), "Twig") != -1)|| (FindSubString(GetName(oDirt), "Litter") != -1))
				{DestroyObject(oDirt);
				 SendMessageToPC(oStudent, "The area is a little cleaner.");
				 return;
				 }
			 else
			 oDirt = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 
			}
		 SendMessageToPC(oStudent, "The area is clean and you put up the broom.");
		 GiveGoldToCreature(oStudent, 2);
		  SendMessageToPC(oStudent, "You collect 2gp for your work.");
			}  
		
			   //Bucket
	 	
	 if(GetTag(OBJECT_SELF) == "slv_bucket")
	 	{object oStain = GetFirstObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 while(oStain != OBJECT_INVALID)
		 	{if((FindSubString(GetName(oStain), "Dirt") != -1) || (FindSubString(GetName(oStain), "Blood") != -1)|| (FindSubString(GetName(oStain), "Pot") != -1)|| (FindSubString(GetName(oStain), "Plate") != -1)|| (FindSubString(GetName(oStain), "Bottle") != -1)|| (FindSubString(GetName(oStain), "Cup") != -1)|| (FindSubString(GetName(oStain), "Cleaver") != -1)|| (FindSubString(GetName(oStain), "Pitcher") != -1))
				{DestroyObject(oStain);
				 SendMessageToPC(oStudent, "You do a little scrubbing.");
				 return;
				 }
			 else
			 oStain = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 
			}
		 DestroyObject(OBJECT_SELF);
		 SendMessageToPC(oStudent, "The work is done and you empty the bucket down the nearest grate and hang up the rag to dry.");
		 GiveGoldToCreature(oStudent, 2);
		 SendMessageToPC(oStudent, "You collect 2gp for your work.");
			}
			 
			
		//Shovel
	 	
	 if(GetTag(OBJECT_SELF) == "slv_shovel")
	 	{object oRubble = GetFirstObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 while(oRubble != OBJECT_INVALID)
		 	{if((FindSubString(GetName(oRubble), "Rubble") != -1) || (FindSubString(GetName(oRubble), "Rocks") != -1)) 
				{DestroyObject(oRubble);
				 SendMessageToPC(oStudent, "The area is a littler clearer.");
				 ACR_AwardStaticQuestXP(oStudent, "Small Chore: Shoveling", 2);
				 return;
				 }
			 else
			 oRubble = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 
			}
		 SendMessageToPC(oStudent, "The area is clear and you put up the shovel.");
		 DestroyObject(OBJECT_SELF, 2.0);
		}  
		
		//Book cart
	 	
	 if(GetTag(OBJECT_SELF) == "slv_bookcart")
	 	{object oBook = GetFirstObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 while(oBook != OBJECT_INVALID)
		 	{if((((FindSubString(GetName(oBook), "Book") != -1) || (FindSubString(GetName(oBook), "Paper") != -1))) && (oBook != OBJECT_SELF))
				{if((GetIsSkillSuccessful(oStudent, SKILL_KNOWLEDGE_HISTORY, 10)) || (GetIsSkillSuccessful(oStudent, SKILL_KNOWLEDGE_LOCAL, 10)) || (GetIsSkillSuccessful(oStudent, SKILL_KNOWLEDGE_GEOGRAPHY, 10))|| (GetIsSkillSuccessful(oStudent, SKILL_KNOWLEDGE_NOBILITY, 10))|| (GetIsSkillSuccessful(oStudent, SKILL_KNOWLEDGE_RELIGION, 10))|| (GetIsSkillSuccessful(oStudent, SKILL_KNOWLEDGE_THE_PLANES, 10)))
					 {DestroyObject(oBook);
					 SendMessageToPC(oStudent, "The area is a littler clearer.");
					 ACR_AwardStaticQuestXP(oStudent, "Small Chore: Organizing Bookshelves", 2);
					 return;
					 }
				  else 
				  	{SendMessageToPC(oStudent, "You suspect you may have misshelved that last manuscript but cannot locate it now to be sure.");
					 DestroyObject(oBook);
					 return;
					 }
				}
			 else
			 oBook = GetNextObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 
			}
		 SendMessageToPC(oStudent, "The books are straightened up and you put away the cart.");
		 DestroyObject(OBJECT_SELF, 2.0);
	    }  
		
		
			//Quill trimmer
	 	
	 if(GetTag(OBJECT_SELF) == "slv_quill_nibtrimmer")
	 	{object oQuill = GetItemPossessedBy(oStudent, "slv_quill_feather");
		 string sFail;
		 if(Random(2) == 0)
		 	{sFail = "The shaft of the feather splits too far. You have ruined this quill.";}
			else if(Random(2) == 1)
				{sFail = "The nib is trimmed at the wrong angle. You have ruined this quill.";}
				
		 while(oQuill != OBJECT_INVALID)
		 	{if(GetIsSkillSuccessful(oStudent, SKILL_CRAFT_WEAPON, 10))
					 {DestroyObject(oQuill);
					 SendMessageToPC(oStudent, "The quill's nib is trimmed and slit perfectly. You have made a fine quill pen. Lastima tosses you a coin.");
					 ACR_AwardStaticQuestXP(oStudent, "Small Chore: Make Quill Pens", 1);
					 GiveGoldToCreature(oStudent, 1);
					 return;
					 }
				  else 
				  	{SendMessageToPC(oStudent, sFail);
					 DestroyObject(oQuill);
					 return;
					 }
				
			
			}
		 SendMessageToPC(oStudent, "You have no more feathers to trim into quills and put up the nib trimmer.");
		 DestroyObject(OBJECT_SELF, 2.0);
	    }  
		
			//Vellum Rack
	 	
if(GetTag(OBJECT_SELF) == "slv_vellum_rack")
	 	{object oHide = GetFirstObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 while(oHide != OBJECT_INVALID)
		 	{if(FindSubString(GetName(oHide), "Hide") != -1)
				{if(GetIsSkillSuccessful(oStudent, SKILL_CRAFT_ARMOR, 12))
					 {DestroyObject(oHide);
					 SendMessageToPC(oStudent, "You have scraped this hide of fur and membranes, to a soft and supple texture perfect for vellum. Lastima tosses you a coin.");
					 ACR_AwardStaticQuestXP(oStudent, "Small Chore: Paper Making", 2);
					 GiveGoldToCreature(oStudent, 1);
					 return;
					 }
					 else 
				  	{SendMessageToPC(oStudent, "The hide rips and is ruined!");
					 DestroyObject(oHide);
					 return;
					 }
				}
			 else if(FindSubString(GetName(oHide), "Pulp") != -1)
				{if(GetIsSkillSuccessful(oStudent, SKILL_SLEIGHT_OF_HAND, 12))
					 {DestroyObject(oHide);
					 SendMessageToPC(oStudent, "The delicate fibers of this paper pulp hang together well. You drape it carefully on the rack where it will no doubt dry into the finest of papers. Lastima tosses you a coin.");
					 ACR_AwardStaticQuestXP(oStudent, "Small Chore: Paper Making", 2);
					 GiveGoldToCreature(oStudent, 1);
					 return;
					 }
					 else 
				  	{SendMessageToPC(oStudent, "The pulp shreds and is ruined!");
					 DestroyObject(oHide);
					 return;
					 }
				 
				}
			 else
			 oHide = GetNextObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 
			}
		 SendMessageToPC(oStudent, "You have worked your way through the stack of materials for vellum, parchment and paper. The rack of materials must now dry.");
		 DestroyObject(OBJECT_SELF);
	    }  
		
		
		//Coal Wagon
	 	
	 if(GetTag(OBJECT_SELF) == "slv_refectory_barrow")
	 	{object oCoal = GetFirstObjectInShape(SHAPE_SPHERE, 15.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 effect eBurn = EffectDamage(1, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL);
		 while(oCoal != OBJECT_INVALID)
		 	{if((((FindSubString(GetName(oCoal), "Dirt") != -1) || (FindSubString(GetName(oCoal), "Litter") != -1))) && (oCoal != OBJECT_SELF))
				{if(GetIsSkillSuccessful(oStudent, SKILL_SURVIVAL, 7))
					 {DestroyObject(oCoal);
					 SendMessageToPC(oStudent, "You shovel coal and ash.");
					 return;
					 }
				  else 
				  	{SendMessageToPC(oStudent, "Sparks and ash billow, contaminating nearby food and settling back into the oven.");
					 if(ReflexSave(oStudent, 10, SAVING_THROW_TYPE_NONE, OBJECT_SELF))
					 	{SendMessageToPC(oStudent, "You avoid being burned by flying sparks.");
					 	}
						else
						{SendMessageToPC(oStudent, "Sparks burn your face and arms!");
					 	 ApplyEffectToObject(DURATION_TYPE_INSTANT, eBurn, oStudent);
						 }
					 CreateObject(OBJECT_TYPE_PLACEABLE, "slv_dirtclod", GetLocation(oCoal)); 
					 return;
					 }
				}
			 else
			 oCoal = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 
			}
		 SendMessageToPC(oStudent, "The oven is clean.");
		 object oBelad = GetObjectByTag("003_cr_slv_belad");
		 SetLocalInt(oBelad, "Oven_Clean", 1);
		 }  
			
	//Ink Pot
	 	
	 if(GetTag(OBJECT_SELF) == "slv_scribery_inkpot")
	 	{effect eSmoke = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
		 string sColor;
		 if(Random(10) == 9)
		 	{sColor = "red";
			}
		 else if(Random(10) == 8)
		 	{sColor = "orange";
			}
		 else if(Random(10) == 7)
		 	{sColor = "yellow";
			}
		 else if(Random(10) == 6)
		 	{sColor = "green";
			}
		 else if(Random(10) == 5)
		 	{sColor = "blue";
			}
		 else if(Random(10) == 4)
		 	{sColor = "violet";
			}
		 else if(Random(10) == 3)
		 	{sColor = "black";
			}
		 else if(Random(10) == 2)
		 	{sColor = "gold";
			}
		 else if(Random(10) == 1)
		 	{sColor = "brown";
			}
		 else if(Random(10) == 0)
		 	{sColor = "silver";
			}
		 string sAdjective;
		 if(Random(10) == 9)
		 	{sAdjective = "bright";
			}
		 else if(Random(10) == 8)
		 	{sAdjective = "light";
			}
		 else if(Random(10) == 7)
		 	{sAdjective = "dull";
			}
		 else if(Random(10) == 6)
		 	{sAdjective = "shimmering";
			}
		 else if(Random(10) == 5)
		 	{sAdjective = "flat";
			}
		 else if(Random(10) == 4)
		 	{sAdjective = "dark";
			}
		 else if(Random(10) == 3)
		 	{sAdjective = "pale";
			}
		 else if(Random(10) == 2)
		 	{sAdjective = "metallic";
			}
		 else if(Random(10) == 1)
		 	{sAdjective = "glossy";
			}
		 else if(Random(10) == 0)
		 	{sAdjective = "oily";
			}	
		 object oComponent = GetFirstObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 while(oComponent != OBJECT_INVALID)
		 	{if(((FindSubString(GetName(oComponent), "Powder") != -1) || (FindSubString(GetName(oComponent), "Flower") != -1)|| (FindSubString(GetName(oComponent), "Plant") != -1)|| (FindSubString(GetName(oComponent), "Bottle") != -1)|| (FindSubString(GetName(oComponent), "Ink") != -1)) && (oComponent != OBJECT_SELF))
				{DestroyObject(oComponent);
				 SendMessageToPC(oStudent, GetName(oComponent) + " goes into the mix.");
		 		 return;
				 }
			 else
			 oComponent = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 
			}
		 SendMessageToPC(oStudent, "The ink will require some time to cool, but all the materials have been combined for " + sAdjective + " " + sColor + " ink.");
		 DestroyObject(OBJECT_SELF, 2.0);
		 if(GetIsSkillSuccessful(oStudent, SKILL_CRAFT_ALCHEMY, 10))
			 {SendMessageToPC(oStudent, "You have completed your task successfully.");
			  if(GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_ladycol_grd_lvl")
			  	{GiveGoldToCreature(oStudent, 2);
			  	 SendMessageToPC(oStudent, "You collect 2gp from the Master Scribe.");
				}
			 ACR_AwardStaticQuestXP(oStudent, "Small Chore: Making Ink", 5);
			 }
			else
			{SendMessageToPC(oStudent, "The ink boils over and spills over the pot and workbench. The batch is ruined! The Master Scribe dismisses you impatiently.");
			 }
		}  
			
			//Axe
	 	
	 if(GetTag(OBJECT_SELF) == "slv_axe")
	 	{object oWood = GetFirstObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 while(oWood != OBJECT_INVALID)
		 	{if((FindSubString(GetName(oWood), "Fallen Log") != -1) || (FindSubString(GetName(oWood), "Stump") != -1)|| (FindSubString(GetName(oWood), "Tree") != -1))
				{if(GetAbilityScore(oStudent, ABILITY_STRENGTH, FALSE) >= 13)
					{CreateItemOnObject("slv_wood_chopped", oWood, Random(5));
				     return;
				     }
				 else
				 {SendMessageToPC(oStudent, "You are not strong enough to swing the axe effectively.");
				 }
				
			   }
			 else
			 oWood = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
		 
				}
			}  		 
	}								
}