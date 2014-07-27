//::///////////////////////////////////////////////
//:: SetListeningPatterns
//:: NW_C2_DEFAULT4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    by the generic script after dialogue or a
    shout is initiated.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 24, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
#include "dmfi_inc_langexe" 
#include "acr_quest_i"
#include "acr_creature_i"


void main()
{
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();
    object oIntruder;

    if (nMatch == -1 && GetCommandable(OBJECT_SELF))
    {
        ClearAllActions();
        BeginConversation();
    }
    else
    if(nMatch == 777 && GetIsObjectValid(oShouter) && (GetIsPC(oShouter) || (GetIsDMPossessed(oShouter))))
  //     && GetIsFriend(oShouter)
    {
      if (oShouter == GetLocalObject(OBJECT_SELF, "Customer")) {
        string sSaid = GetMatchedSubstring(0);
        SetLocalString(OBJECT_SELF, "Stack", sSaid);
     	if(GetLocalObject(OBJECT_SELF, "oDragon") != OBJECT_INVALID)
			{if(GetLocalInt(oShouter, "oSpeaks") != 1)
				{ActionSpeakString("A voice issues from the mouth of the silver dragon staff in " + GetFirstName(oShouter) + "'s hand.", TALKVOLUME_TALK);
				 SetLocalInt(oShouter, "oSpeaks", 1);
				}
			 DelayCommand(1.0, ActionSpeakString("<Draconic>" + sSaid + "</Draconic>", TALKVOLUME_TALK));
			} 
		}
    }
	

}