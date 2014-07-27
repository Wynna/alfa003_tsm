// Griffon Supply Quest to Sundabar, pay and exp
//  edited 08/07/2010 by AL to make more persistent and reliable

#include "acr_db_persist_i"
#include "acr_xp_i"
void main()
{   
	object oPC = GetPCSpeaker(); 

	// Get rid of the quest item.
	object oItem = GetFirstItemInInventory(oPC);
	string sItem = "silvypass_sundabar_cargo";
	int bItemFound = FALSE;
    while (GetIsObjectValid(oItem) == TRUE)
    {
        if (GetTag(oItem) == sItem) {
			DestroyObject(oItem,0.0f,TRUE);
			bItemFound = TRUE;
			break;
        }
        oItem = GetNextItemInInventory(oPC);
    }		
	if (bItemFound) {		
	    int nRepeat = ACR_GetPersistentInt(GetPCSpeaker(), "sundabar_supply");
		if (nRepeat == 0) 
	   			{nRepeat = 1;}
			else
				{nRepeat = nRepeat + 1;}	   
		GiveGoldToCreature(oPC, 50);
		ACR_SetPersistentInt(oPC, "sundabar_supply", nRepeat);
		ACR_DeletePersistentVariable(oPC, "griffon_cargo");
		ACR_AwardStaticQuestXP(oPC, "003_griffon_sundabar", 50/nRepeat);
	} else {
		SendMessageToPC(oPC, "Quest item could not be found and removed.");
	}
}
 