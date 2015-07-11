////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_trg_onenter.nss
//    $Revision:: 236        $ current version of the file
//        $Date:: 2007-01-21#$ date the file was created or modified
//       Author : Cipher
//
//    Var Prefix:
//  Dependencies:
//
//  Description
//  This script calls the ACR's OnEnter code for triggers, and any
//  custom code a server may need. It is not updated in ACR updates.
//
//  Revision History
//  2015/07/7  Wynna
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_trigger_i"
#include "acr_quest_i"
#include "acr_spawn_i"



////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Global Variables ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void main()
{
    ACR_TriggerOnEnter();

    // Custom code goes here.
	
object oQuester=GetEnteringObject();

if((GetTag(OBJECT_SELF) == "hawk_raid_01") && (ACR_RetrieveQuestState("hawk_raid_01", oQuester) == 1) && (GetIsPC(oQuester)) && (GetLocalInt(OBJECT_SELF, "Triggered") !=1))
 	{SetLocalInt(OBJECT_SELF, "Triggered", 1);
	 SendMessageToPC(oQuester, "You hear the howl of a hunting wolf.");
	 object oWolfSpawn = GetWaypointByTag("hawk_raid_01_wp");
	 object oDeerSpawn = GetWaypointByTag("hawk_raid_01_deer_wp");
	 object oDeer2Spawn = GetWaypointByTag("hawk_raid_01_deer2_wp");
	 object oWolf = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_dogwolf_mad", GetLocation(oWolfSpawn));
	 object oWolfFood = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_deer_stag", GetLocation(oWolfSpawn));
	 object oDeer = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_deer_stag_hostile", GetLocation(oDeerSpawn));
	 object oDeer2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_deer_stag_hostile", GetLocation(oDeer2Spawn));
	}
	
	
if((GetTag(OBJECT_SELF) == "hawk_raid_02") && (ACR_RetrieveQuestState("hawk_raid_02", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalInt(OBJECT_SELF, "Triggered") !=1))
 	{SetLocalInt(OBJECT_SELF, "Triggered", 1);
	SendMessageToPC(oQuester, "Shadows move amid the rockfall. A rock clatters.");
	object oSkyPonySpawn = GetWaypointByTag("hawk_raid_02_wp");
	object oSkyPony = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_uthgardt_skypony_quest", GetLocation(oSkyPonySpawn));
	object oSkyPony2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_uthgardt_skypony_quest", GetLocation(oSkyPonySpawn));
	}
	
if((GetTag(OBJECT_SELF) == "hawk_raid_03") && (ACR_RetrieveQuestState("hawk_raid_03", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalInt(OBJECT_SELF, "Triggered") !=1))
 	{SetLocalInt(OBJECT_SELF, "Triggered", 1);
	SendMessageToPC(oQuester, "Battle is already joined!");
	object oOrcSpawn = GetNearestObjectByTag("ACR_SPAWN_WP", OBJECT_SELF, 3);
	object oKnightSpawn = GetNearestObjectByTag("ACR_SPAWN_WP", OBJECT_SELF, 1);
	CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
	
	CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_atarms", GetLocation(oKnightSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_atarms", GetLocation(oKnightSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_atarms", GetLocation(oKnightSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_atarms", GetLocation(oKnightSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_xbow", GetLocation(oKnightSpawn));
	CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_xbow", GetLocation(oKnightSpawn));
	}

	
if((GetTag(OBJECT_SELF) == "hawk_scout_01") && (ACR_RetrieveQuestState("hawk_scout_01", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalInt(OBJECT_SELF, "Triggered") !=1))
 	{SetLocalInt(OBJECT_SELF, "Triggered", 1);
	 DelayCommand(1800.0, SetLocalInt(OBJECT_SELF, "Triggered", 0));
	if((GetIsSkillSuccessful(oQuester, SKILL_HIDE, 15, TRUE)) && (GetIsSkillSuccessful(oQuester, SKILL_MOVE_SILENTLY, 15, TRUE)))
		{SendMessageToPC(oQuester, "A hooded figure in robes bearing Auril's symbol is throwing raw meat down to ledge below. You hear a high, thin howl echoeing in the canyons, a howl that somehow freezes your heart and drives the cold of the surroundings deep into your flesh. A winter wolf is coming to feed! It is doubtful you would remain hidden should that predator arrive to find you still here.");
		object oAcolyteSpawn=GetWaypointByTag("hawk_scout_01_wp");
		object oAcolyte = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_auril_acolyte", GetLocation(oAcolyteSpawn));
		DelayCommand(3.0, ACR_AddPersistentJournalQuestEntry("hawk_scout_01", 2, oQuester));
	    }
	else
		{SendMessageToPC(oQuester, "A skin of ice on the snow crunches underfoot!");
		 SendMessageToPC(oQuester, "A shadow on the snowy path ahead shows a figure who had been standing out of sight suddenly turning and darting uphill. You hear an iron gate rattle, and its clang on hard stone as it closes.");
		 SendMessageToPC(oQuester, "You have been spotted, and must try again later if you want to complete Sergeant Filion's task.");
		}
	}

if((GetTag(OBJECT_SELF) == "hawk_scout_02") && (ACR_RetrieveQuestState("hawk_scout_02", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalInt(OBJECT_SELF, "Triggered") !=1))
 	{SetLocalInt(OBJECT_SELF, "Triggered", 1);
	SendMessageToPC(oQuester, "You have found the entrance to the Halls of Artifice. The crystals beside and on top of the cave are about the same height as the cave entrance, which is as high as Sergeant Filion said they should be.");
	ACR_AddPersistentJournalQuestEntry("hawk_scout_02", 2, oQuester);
     }
	 
if((GetTag(OBJECT_SELF) == "hawk_scout_03") && (ACR_RetrieveQuestState("hawk_scout_03", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalInt(OBJECT_SELF, "Triggered") !=1))
 	{SetLocalInt(OBJECT_SELF, "Triggered", 1);
	SendMessageToPC(oQuester, "You have found your way into the crypt beneath Coal Dark Keep. Return to Sergeant Filion with a headcount of any ogres you have spotted.");
	ACR_AddPersistentJournalQuestEntry("hawk_scout_03", 2, oQuester);
     }

	
}