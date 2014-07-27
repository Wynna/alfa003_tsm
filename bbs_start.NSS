#include "bbs_include"
#include "acr_db_persist_i"

void main()
{		object oPC = GetLastUsedBy();
	    bbs_initiate(OBJECT_SELF);
	    SetLocalInt(GetLocalObject(GetModule(), "BBS_" + GetTag(OBJECT_SELF)), "PageIndex", 0);
	
	    bbs_change_page(-1000);
	    ActionStartConversation(oPC, "", TRUE);
    


}