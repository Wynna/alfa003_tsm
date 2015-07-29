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
	
object oQuester=GetLocalObject(OBJECT_SELF, "oQuester");
	
object oOrc1 = GetLocalObject(oQuester, "Orc1");
	object oOrc2 = GetLocalObject(oQuester, "Orc2");
	object oOrc3 = GetLocalObject(oQuester, "Orc3");
	object oOrc4 = GetLocalObject(oQuester, "Orc4");
	object oOrc5 = GetLocalObject(oQuester, "Orc5");
	object oOrc6 = GetLocalObject(oQuester, "Orc6");
	object oOrc7 = GetLocalObject(oQuester, "Orc7");
	object oOrc8 = GetLocalObject(oQuester, "Orc8");
	object oOrc9 = GetLocalObject(oQuester, "Orc9");
	object oOrc10 = GetLocalObject(oQuester, "Orc10");
	object oOrc11 = GetLocalObject(oQuester, "Orc11");
	object oOrc12 = GetLocalObject(oQuester, "Orc12");
	object oOrc13 = GetLocalObject(oQuester, "Orc13");
	object oOrc14 = GetLocalObject(oQuester, "Orc14");
	object oOrc15 = GetLocalObject(oQuester, "Orc15");
	object oKnight1 = GetLocalObject(oQuester, "Knight1");
	object oKnight2 = GetLocalObject(oQuester, "Knight2");
	object oKnight3 = GetLocalObject(oQuester, "Knight3");
	object oKnight4 = GetLocalObject(oQuester, "Knight4");
	object oKnight5 = GetLocalObject(oQuester, "Knight5");
	object oKnight6 = GetLocalObject(oQuester, "Knight6");
	object oKnightLeave = GetNearestObjectByTag("TM_Silvy_Pass_West_WP", OBJECT_SELF, 3);
	if((GetIsDead(oOrc1, FALSE)) && (GetIsDead(oOrc2, FALSE)) && (GetIsDead(oOrc3, FALSE)) && (GetIsDead(oOrc4, FALSE)) && (GetIsDead(oOrc5, FALSE)) && (GetIsDead(oOrc6, FALSE)) && (GetIsDead(oOrc7, FALSE)) && (GetIsDead(oOrc8, FALSE)) && (GetIsDead(oOrc9, FALSE)) && (GetIsDead(oOrc10, FALSE)) && (GetIsDead(oOrc11, FALSE)) && (GetIsDead(oOrc12, FALSE)) && (GetIsDead(oOrc13, FALSE)) && (GetIsDead(oOrc14, FALSE)) && (GetIsDead(oOrc15, FALSE))) 
			 {DelayCommand(2.0, FloatingTextStringOnCreature("*The knights tend their injured and set out for the Hawk's Nest, victorious.", oQuester));
		        AssignCommand(oKnight1, ClearAllActions(TRUE));
				AssignCommand(oKnight2, ClearAllActions(TRUE));
				AssignCommand(oKnight3, ClearAllActions(TRUE));
				AssignCommand(oKnight4, ClearAllActions(TRUE));
				AssignCommand(oKnight5, ClearAllActions(TRUE));
				AssignCommand(oKnight6, ClearAllActions(TRUE));
				if(ACR_RetrieveQuestState("hawk_raid_03", oQuester) == 1)
					{DelayCommand(3.0, AssignCommand(oKnight1, ActionSpeakString("You should have fought harder.", TALKVOLUME_TALK)));
					DelayCommand(4.0, AssignCommand(oKnight2, ActionSpeakString("Perhaps in the next battle, you'll render more aid.", TALKVOLUME_TALK)));
					DelayCommand(5.0, AssignCommand(oKnight3, ActionSpeakString("You'll never make a knight by hanging back.", TALKVOLUME_TALK)));
					DelayCommand(6.0, AssignCommand(oKnight4, ActionSpeakString("Return to the Hawk's Nest. Sergeant Filion will send you out again to do better, at the first opportunity.", TALKVOLUME_TALK)));
					DelayCommand(6.0, AssignCommand(oKnight5, ActionSpeakString("By Helm, you'll have to do better to be counted a warrior.", TALKVOLUME_TALK)));
					}
				if(ACR_RetrieveQuestState("hawk_raid_03", oQuester) == 2)
					{DelayCommand(3.0, AssignCommand(oKnight1, ActionSpeakString("Well done, recruit.", TALKVOLUME_TALK)));
					DelayCommand(3.0, AssignCommand(oKnight2, ActionSpeakString("Your aid was timely.", TALKVOLUME_TALK)));
					DelayCommand(4.0, AssignCommand(oKnight3, ActionSpeakString("These creatures will never waylay travellers again.", TALKVOLUME_TALK)));
					DelayCommand(5.0, AssignCommand(oKnight4, ActionSpeakString("Return to the Hawk's Nest. Sergeant Filion will hear only good from me about your fighting skills.", TALKVOLUME_TALK)));
					DelayCommand(6.0, AssignCommand(oKnight5, ActionSpeakString("By Helm, you'll always be welcome to fight beside me.", TALKVOLUME_TALK)));
					}
				DestroyObject(oKnight1, 20.0);
				DestroyObject(oKnight2, 20.0);
				DestroyObject(oKnight3, 20.0);
				DestroyObject(oKnight4, 20.0);
				DestroyObject(oKnight5, 20.0);
				DestroyObject(oKnight6, 20.0);
				}	
			
				
		
}