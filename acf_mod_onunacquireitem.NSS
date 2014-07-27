////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ALFA Configuration File
//     Filename : acf_mod_onunacquireitem.nss
//    $Revision:: 197        $ current version of the file
//        $Date:: 2006-12-23#$ date the file was created or modified
//       Author : Ronan
//
//  Local Variable Prefix = None
//
//  Description
//  This script calls the module's OnUnAcquireItem event, and any custom code added
//  by this server. It is usually used to set up server-specific options.
//  This file should NOT be overwriten in ACR updates so as to preserve any of
//  the server's customized code they may have added.
//
//  Revision History
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "acr_mod_events_i"
#include "acr_quest_i"

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

void main() {
    ACR_ModuleOnUnAcquireItem();

    // Custom code goes below this line.
	
	// temporary interim fix for ACR Quests, Item-based
	/*   **** no longer needed, in 1.74 ACR hak ****
	object oItem = GetModuleItemLost();
	object oPC = GetModuleItemLostBy();
	
	string sQuest = GetLocalString(oItem, "ACR_QST_NAME");

    // exit if there is no quest regarding this item
    if (sQuest == "") { return; }

    // ignore non player characters
    if (GetIsPC(oPC))
    {
        int nUpper = GetLocalInt(oItem, ACR_QST_UPPER_STATE);
        int nState = ACR_RetrieveQuestState(sQuest, oPC);
		int bPartyQuest = GetLocalInt(oItem, ACR_QST_PARTY);
		
		SendMessageToPC(oPC, "ItemQuestUnAcquire: nState = "+IntToString(nState)+", Upper = "+IntToString(nUpper));
        // determine if conditions for the quest have been met
        // lower boundary prevents a PC who hasn't taken the quest from earning quest XP
        if (nState > 0 && nState <= nUpper)
        {
			// as the quest item has been lost, decrement QuestState
            nState = nState -1;
			// if cached, roll back the cached QuestState as well, so it doesn't throw off the next function
			if (GetLocalInt(oPC, "ACR_"+sQuest+"_CACHE")) {		    
				SetLocalInt(oPC, "ACR_"+sQuest+"_STATE", nState);
			}
            // update the quest state (roll back to prior state)
            ACR_AddPersistentJournalQuestEntry(sQuest, nState, oPC, bPartyQuest, FALSE, TRUE);
        }

        // clear any residual object reference on the PC 
        DeleteLocalObject(oPC, sQuest);
    }
	*/
}