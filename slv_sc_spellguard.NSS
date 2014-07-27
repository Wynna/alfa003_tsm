//
// Returns True if a student is currently enrolled in the university
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    if(ACR_GetPersistentInt(GetPCSpeaker(), "SLV_Spellguard") == 1)
		{return TRUE;}
		else
		{return FALSE;}
}