// Argent Legion Supply Quest to Quaervar
#include "acr_db_persist_i"
int StartingConditional()
{   
 if(GetItemPossessedBy(GetPCSpeaker(), "militarysuppliesqv") == OBJECT_INVALID)
    return FALSE;
 if(ACR_GetPersistentInt(GetPCSpeaker(), "alsupply") != 1)
    return FALSE;	
 return TRUE;	   
}