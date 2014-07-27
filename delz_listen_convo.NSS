#include "acr_spawn_i"
#include "acr_db_persist_i"
#include "acr_xp_i"

void main()
{   object oUser = GetLocalObject(OBJECT_SELF, "oUser");
    if(GetTag(OBJECT_SELF) == "003_cr_delzoun_listen")
	   {int nMatch = GetListenPatternNumber();
	    effect eGlimmer = EffectVisualEffect(VFX_DUR_SOOTHING_LIGHT, FALSE);
		object oDoor = GetLocalObject(OBJECT_SELF, "oDoor");
	    
		if(((nMatch == 4000) && (FindSubString(GetTag(oDoor), "kuldar") != -1))
			|| ((nMatch == 4001) && (FindSubString(GetTag(oDoor), "barak") != -1))
			|| ((nMatch == 4002) && (FindSubString(GetTag(oDoor), "ilith") != -1))
			|| ((nMatch == 4003) && (FindSubString(GetTag(oDoor), "runedar") != -1))
			|| ((nMatch == 4004) && (FindSubString(GetTag(oDoor), "glander") != -1)))
		
			{SetLocked(oDoor, FALSE);
			 AssignCommand(oDoor, ActionSpeakString("The ear melts away and the door unlocks!", TALKVOLUME_TALK));
			 
			}
			
		else	
			{DelayCommand(30.0, AssignCommand(oDoor, ActionSpeakString("The ear melts back into the door. It is no longer listening.", TALKVOLUME_TALK)));
			 }
			
		 
		 DestroyObject(OBJECT_SELF, 31.0);
			
		}
	




}