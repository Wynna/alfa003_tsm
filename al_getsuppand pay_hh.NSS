// Argent Legion Supply Quest to High Hold, pay and exp
#include "acr_db_persist_i"
#include "acr_xp_i"
void main()
{   
    object oSupply; 
	object oPC = GetPCSpeaker();
    if(GetItemPossessedBy(oPC, "militarysupplieshh") != OBJECT_INVALID)
    {
       int nRepeat = ACR_GetPersistentInt(GetPCSpeaker(), "hh_supply");
	   if(nRepeat == 0)
	   		{nRepeat = 1;}
		else
			{nRepeat = nRepeat + 1;}
	   
	   ACR_SetPersistentInt(GetPCSpeaker(), "hh_supply", nRepeat);
	   oSupply = GetItemPossessedBy(oPC, "militarysupplieshh");
	   GiveGoldToCreature(oPC, 30);
	   ACR_AwardStaticQuestXP(oPC, "003_argntlgn_hhsupply", 30/nRepeat);
	   DestroyObject( oSupply);
	   ACR_SetPersistentInt(GetPCSpeaker(), "alsupply", 0);
	   
    }	
}	
 