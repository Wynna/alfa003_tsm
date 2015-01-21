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
//  2007/01/20  Cipher  Inception
//  Feb 2009 -- Wynna All Dean's Exam (deandragon) quest trigger onexits
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_trigger_i"
#include "acr_quest_i"


void main()
{
    ACR_TriggerOnExit();

    // Custom code goes here.
	
//deandragon quests
 if((GetTag(OBJECT_SELF) == "fey_chocolate_activate")&& (ACR_RetrieveQuestState("slv_deandragon_b", GetExitingObject()) == 5))
 	{object oWP = GetLocalObject(OBJECT_SELF, "oWP");
	 if(oWP == OBJECT_INVALID)
		{oWP = GetNearestObjectByTag("ACR_SPAWN_WP", OBJECT_SELF);
		 SetLocalObject(OBJECT_SELF, "oWP", oWP);
		}
	 object oMyTree = GetLocalObject(OBJECT_SELF, "oMyTree");
	 if(oMyTree == OBJECT_INVALID)
	 	{oMyTree = GetObjectByTag("fey_chocolate_tree");
		 SetLocalObject(OBJECT_SELF, "oMyTree", oMyTree);
		} 
	 DestroyInventory(oMyTree);
	 SetUseableFlag(oMyTree, FALSE);
	 }
	
if((GetTag(OBJECT_SELF) == "slv_deandragon_e") && (ACR_RetrieveQuestState("slv_deandragon_e", GetExitingObject()) > 1)&& (ACR_RetrieveQuestState("slv_deandragon_e", GetExitingObject()) < 8))
 	{object oMyIncinder = GetLocalObject(OBJECT_SELF, "oMyIncinder");
	 DestroyObject(oMyIncinder, 30.0);
	SetLocalObject(OBJECT_SELF, "oMyIncinder", OBJECT_INVALID);
	 }

if((GetTag(OBJECT_SELF) == "slv_deandragon_e_ice_activate") && (ACR_RetrieveQuestState("slv_deandragon_e_air", GetEnteringObject()) == 1))
 	{object oMyIce = GetLocalObject(OBJECT_SELF, "oMyIce");
	 if(oMyIce == OBJECT_INVALID)
	 	{oMyIce = GetObjectByTag("slv_deandragon_e_ice");
		 SetLocalObject(OBJECT_SELF, "oMyIce", oMyIce);
		} 
	 DestroyInventory(oMyIce);
	 SetUseableFlag(oMyIce, FALSE);
	 }
	
if((GetTag(OBJECT_SELF) == "deandragon_firetrap_activate") && (ACR_RetrieveQuestState("slv_deandragon_e_fire", GetEnteringObject()) >= 1))
 	{object oMyTrap = GetLocalObject(OBJECT_SELF, "oMyTrap");
	 if(oMyTrap == OBJECT_INVALID)
	 	{oMyTrap = GetObjectByTag("slv_deandragon_e_firetrap");
		 SetLocalObject(OBJECT_SELF, "oMyTrap", oMyTrap);
		} 
	 DestroyInventory(oMyTrap);
	 SetUseableFlag(oMyTrap, FALSE);
	}
	
if((GetTag(OBJECT_SELF) == "deandragon_heatloop") && ((GetIsPC(GetExitingObject())) || (GetIsDMPossessed(GetExitingObject())))) 
	 	{if(GetLocalInt(GetExitingObject(), "HeatRep") == 1)
				{SetLocalInt(GetExitingObject(), "HeatRep", 0);
				 }
		}
if((GetTag(OBJECT_SELF) == "deandragon_coldloop") && ((GetIsPC(GetExitingObject())) || (GetIsDMPossessed(GetExitingObject())))) 
	 	{if(GetLocalInt(GetExitingObject(), "ColdRep") == 1)
				{SetLocalInt(GetExitingObject(), "ColdRep", 0);
				 }
		}
		
 // Deandragon_K toggle silence
	if((GetTag(OBJECT_SELF) == "deandragon_k_silence") && ((GetIsPC(GetExitingObject())) || (GetIsDMPossessed(GetExitingObject()))))
	 	 {object oPC = GetExitingObject();
		 effect eEffect = GetFirstEffect(oPC);
		  while(GetIsEffectValid(eEffect) != FALSE)
			{if(GetEffectCreator(eEffect) == OBJECT_SELF)
			 	{RemoveEffect(oPC, eEffect);
				}
			  eEffect = GetNextEffect(oPC);
			}
		}
	 
		//deandragon_z_swim stop
if(GetTag(OBJECT_SELF) == "deandragon_z_swim")
	{SetLocalInt(GetExitingObject(), "Swimming", 0);
	  }
		
}