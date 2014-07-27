// Give supplies for the supply run quest for High Hold
#include "acr_db_persist_i"

void main()
{
   CreateItemOnObject("militarysupplieshh", GetPCSpeaker(), 1);
   ACR_SetPersistentInt(GetPCSpeaker(), "alsupply", 1);
}