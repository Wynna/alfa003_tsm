// Argent Legion Supply Quest to Rivermoot, pay and exp
#include "acr_db_persist_i"
#include "acr_xp_i"
void main()
{   
    object oSupply;
	object oPC = GetPCSpeaker(); 
    if(GetItemPossessedBy(oPC, "militarysuppliesrm") != OBJECT_INVALID)
    {
       int nRepeat = ACR_GetPersistentInt(GetPCSpeaker(), "rm_supply");
	   if(nRepeat == 0)
	   		{nRepeat = 1;}
		else
			{nRepeat = nRepeat + 1;}
	   
	   ACR_SetPersistentInt(GetPCSpeaker(), "rm_supply", nRepeat);
	   oSupply = GetItemPossessedBy(oPC, "militarysuppliesrm");
	   GiveGoldToCreature(oPC, 50);
	   ACR_AwardStaticQuestXP(oPC, "003_argntlgn_rmsupply", 50/nRepeat);
	   DestroyObject( oSupply);
	   ACR_SetPersistentInt(GetPCSpeaker(), "alsupply", 0);
    }	
}	
 