#include "acr_db_persist_i"
int StartingConditional()
{

object oPC = GetPCSpeaker();

return ACR_GetPersistentInt(oPC, "rm_kadalion");

}