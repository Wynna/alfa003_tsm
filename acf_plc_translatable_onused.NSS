////////////

///////////
#include "dmfi_inc_langexe" 
void main()
{
string sLang = GetLocalString(OBJECT_SELF, "SJC_PLC_LANG");
string sSuccess = GetLocalString(OBJECT_SELF, "SJC_TRANSLATED_TEXT");
string sFail = GetLocalString(OBJECT_SELF, "SJC_FAILED_TEXT");
object oPC = GetLastUsedBy();
if(oPC == OBJECT_INVALID)
	{oPC = GetClickingObject();
	}

if (DMFI_IsLanguageKnown(oPC, sLang) == TRUE)
{SendMessageToPC(oPC, sSuccess);}
else
{SendMessageToPC(oPC, sFail);}
}
	