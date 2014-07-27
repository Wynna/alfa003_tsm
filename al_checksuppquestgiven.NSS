// Argent Legion Supply Quest to Rivermoot
#include "acr_db_persist_i"
int StartingConditional()
{   
 if(GetItemPossessedBy(GetPCSpeaker(), "militarysupplieshh") != OBJECT_INVALID)
    return TRUE;
 if(GetItemPossessedBy(GetPCSpeaker(), "militarysuppliesqv") != OBJECT_INVALID)
    return TRUE;
 if(GetItemPossessedBy(GetPCSpeaker(), "militarysuppliesrm") != OBJECT_INVALID)
    return TRUE;	
 if(ACR_GetPersistentInt(GetPCSpeaker(), "alsupply") == 1)
    return TRUE;	
 return FALSE;	   
}