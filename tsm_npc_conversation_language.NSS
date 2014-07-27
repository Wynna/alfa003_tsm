////////////

///////////
#include "acr_quest_i"
#include "acr_creature_i"
#include "acr_language_i"
#include "dmfi_inc_langexe" 

int StartingConditional()
{

ACR_CreatureOnConversation();

string sLang = GetLocalString(OBJECT_SELF, "003_NPC_LANG");
object oPC = GetPCSpeaker();



if (DMFI_IsLanguageKnown(oPC, sLang) == TRUE)
{return TRUE;}
else
{return FALSE;}
}
	