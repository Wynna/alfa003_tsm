//OnUse for all Dean's Exam (deandragon) placeables 
//Wynna February 2009


#include "acr_placeable_i"
#include "acr_xp_i"
#include "acr_quest_i"






void main()
{
	ACR_PlaceableOnUsed();

	object oUser = GetLastUsedBy();
	

	// Teleport for deandragon_e Elementals tests
	 if(FindSubString(GetTag(OBJECT_SELF), "slv_el_") != -1)
		{string sQuestTag = GetLocalString(OBJECT_SELF, "sQuestTag");
		 string sGoTo = GetLocalString(OBJECT_SELF, "sGoTo");
		 object oGoTo = GetLocalObject(OBJECT_SELF, "oGoTo");
		 location lGoTo = GetLocalLocation(OBJECT_SELF, "lGoTo");
		 if(oGoTo == OBJECT_INVALID)
			 {oGoTo = GetWaypointByTag(sGoTo);
			  SetLocalObject(OBJECT_SELF, "oGoTo", oGoTo);
			  lGoTo = GetLocation(oGoTo);
			  SetLocalLocation(OBJECT_SELF, "lGoTo", lGoTo);
			 }
		 CreateItemOnObject("003_it_slv_teleport", oUser, 1);
		 AssignCommand(oUser, ActionJumpToLocation(lGoTo));

		 if(GetTag(OBJECT_SELF) == "slv_el_earth")
		 	{if(ACR_RetrieveQuestState(sQuestTag, oUser) == 1)
				 	{ACR_AddPersistentJournalQuestEntry(sQuestTag, 2, oUser, FALSE, FALSE, FALSE, FALSE);
					 DelayCommand(15.0, SendMessageToPC(oUser, "You have been transported to what appears to be a sealed cavern beneath the earth. Dirt trickles from the ceiling at any loud noise and the rattle of falling rocks may be heard in the darkness. There appears to be no way out...except to dig."));
					 }
			}			 
		if(GetTag(OBJECT_SELF) == "slv_el_water")
		 	{if(ACR_RetrieveQuestState(sQuestTag, oUser) == 1)
				 	{ACR_AddPersistentJournalQuestEntry(sQuestTag, 2, oUser, FALSE, FALSE, FALSE, FALSE);
					 DelayCommand(15.0, SendMessageToPC(oUser, "You have teleported to the test of water to find yourself in a cavernous pit filled with water. Stalagtites and stalagtites of blue rock project from the surface of the water. Some of those outcroppings glitter with blue gems! But how do you get to them?"));
					 }
			}			 
		 if(GetTag(OBJECT_SELF) == "slv_el_air")
		 	{object oGoTo2 = GetLocalObject(OBJECT_SELF, "oGoTo2");
			 if(oGoTo2 == OBJECT_INVALID)
				 	{oGoTo2 = GetWaypointByTag("slv_el_air_wp2");
					 SetLocalObject(OBJECT_SELF, "oGoTo2", oGoTo2);
					}
			 object oGoTo3 = GetLocalObject(OBJECT_SELF, "oGoTo3");
			 if(oGoTo3 == OBJECT_INVALID)
				 	{oGoTo3 = GetWaypointByTag("slv_el_air_wp3");
					 SetLocalObject(OBJECT_SELF, "oGoTo3", oGoTo3);
					}
			 object oGoTo4 = GetLocalObject(OBJECT_SELF, "oGoTo4");
			 if(oGoTo4 == OBJECT_INVALID)
				 	{oGoTo4 = GetWaypointByTag("slv_el_air_wp4");
					 SetLocalObject(OBJECT_SELF, "oGoTo4", oGoTo4);
					}
			 location lGoTo2 = GetLocation(oGoTo2);
			 location lGoTo3 = GetLocation(oGoTo3);
			 location lGoTo4 = GetLocation(oGoTo4);
			 if(ACR_RetrieveQuestState(sQuestTag, oUser) == 1)
				 	{ACR_AddPersistentJournalQuestEntry(sQuestTag, 2, oUser, FALSE, FALSE, FALSE, FALSE);
					 }
				
			if(GetLocalInt(oUser, "ColdRep") == 0)
					{SetLocalInt(oUser, "ColdRep", 1);
					 DelayCommand(15.0, SendMessageToPC(oUser, "The wrenching sense of teleportation is followed almost immediately by the reorientation of arrival. But something is wrong. You are falling. You are falling UP. By the time you recognize that your arrival had been in mid-air over a frozen landscape, you are already a significant distance higher...and it is bitterly cold."));
					 DelayCommand(20.0, AssignCommand(oUser, ActionJumpToLocation(lGoTo2)));
			 	     DelayCommand(30.5, SendMessageToPC(oUser, "You continue to fall upward helplessly, clearly in the grip of some arcane trap. It feels as if gravity has reversed!"));
					 DelayCommand(35.0, AssignCommand(oUser, ActionJumpToLocation(lGoTo3)));
			 	     DelayCommand(40.5, SendMessageToPC(oUser, "You continue to fall upward helplessly, away from the snow and ice that glitter as if strewn with diamonds."));
					 DelayCommand(45.0, AssignCommand(oUser, ActionJumpToLocation(lGoTo4)));
			 	     DelayCommand(50.5, SendMessageToPC(oUser, "You stop suddenly, as if you had hit an incorporeal barrier. Oscillating gently, you hang suspended 50 meters in the air! You can only hope that gravity doesn't right itself, because a fall back DOWN from this height would maim or kill you before the cold has a chance to."));
					 DelayCommand(61.0, ExecuteScript("slv_static_voice_cr_pc", oUser));
					}
			}
		if(GetTag(OBJECT_SELF) == "slv_el_fire")
		 	{if(ACR_RetrieveQuestState(sQuestTag, oUser) == 1)
				 	{DelayCommand(15.0, SendMessageToPC(oUser, "The first thing you notice is the heat. It isn't merely HOT. The temperature is a living, swollen, suffocating creature that wraps you in its folds at the same time it crawls inside and turns your bones molten. Sweat springs out, all over your skin, but it will do little to cool you. Without protection, you will fry."));
			 		 }
			  if(GetLocalInt(oUser, "HeatRep") == 0)
					 {SetLocalInt(oUser, "HeatRep", 1);
					 DelayCommand(61.0, ExecuteScript("slv_static_voice_cr_pc", oUser));
					}
			}
		}
		

				
}