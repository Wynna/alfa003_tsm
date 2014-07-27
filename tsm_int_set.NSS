


#include "acr_db_persist_i"

void main(string sVariable, int nValue)
{
    object oPC = GetPCSpeaker();

	ACR_SetPersistentInt(oPC, sVariable, nValue, 0);
	
 
}