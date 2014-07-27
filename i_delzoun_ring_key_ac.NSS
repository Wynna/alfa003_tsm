// 11/19/2011 AcadiusLost edit to allow multiples of each runedoor to function.

#include "acr_spawn_i"
#include "acr_db_persist_i"
#include "dmfi_inc_langexe" 
void main()
{
             
//OnActivate Script for delzoun key ring 
	object oUser = GetItemActivator();
	object oTarget = GetItemActivatedTarget();
	SetLocalObject(OBJECT_SELF, "oUser", oUser);
	object oDoor;
	string sLang = LNG_DWARF;
	string sSuccess;
	int iFacet = GetLocalInt(OBJECT_SELF, "iFacet");
	
	/*  Commented out; runedoors are no longer single instances per module.
	    We now check for matching runedoor by tag comparison.
	object oDoor1 = GetLocalObject(OBJECT_SELF, "oDoor1");
	if(oDoor1 == OBJECT_INVALID)
		{oDoor1 = GetObjectByTag("vii_delzodoor_kuldar");
		 SetLocalObject(OBJECT_SELF, "oDoor1", oDoor1);
		}
	object oDoor2 = GetLocalObject(OBJECT_SELF, "oDoor2");
	if(oDoor2 == OBJECT_INVALID)
		{oDoor2 = GetObjectByTag("vii_delzodoor_barak");
		 SetLocalObject(OBJECT_SELF, "oDoor2", oDoor2);
		}
	object oDoor3 = GetLocalObject(OBJECT_SELF, "oDoor3");
	if(oDoor3 == OBJECT_INVALID)
		{oDoor3 = GetObjectByTag("vii_delzodoor_ilith");
		 SetLocalObject(OBJECT_SELF, "oDoor3", oDoor3);
		}
	object oDoor4 = GetLocalObject(OBJECT_SELF, "oDoor4");
	if(oDoor4 == OBJECT_INVALID)
		{oDoor4 = GetObjectByTag("vii_delzodoor_runedar");
		 SetLocalObject(OBJECT_SELF, "oDoor4", oDoor4);
		}
	object oDoor5 = GetLocalObject(OBJECT_SELF, "oDoor5");
	if(oDoor5 == OBJECT_INVALID)
		{oDoor5 = GetObjectByTag("vii_delzodoor_glander");
		 SetLocalObject(OBJECT_SELF, "oDoor5", oDoor5);
		}
	*/
	
	object oOldListen = GetLocalObject(OBJECT_SELF, "oListen");
	DestroyObject(oOldListen);
	iFacet ++;
	string sFacet;
	string sTargetTag = GetTag(oTarget);
	if (GetObjectType(oTarget) == OBJECT_TYPE_DOOR) {
		if (sTargetTag == "vii_delzodoor_kuldar") {
			oDoor = oTarget;
			iFacet = 1;
			SendMessageToPC(oUser, "You turn the ring to the facet matching this runedoor...");
		} else if (sTargetTag == "vii_delzodoor_barak") {
			oDoor = oTarget;
			iFacet = 2;
			SendMessageToPC(oUser, "You turn the ring to the facet matching this runedoor...");
		} else if (sTargetTag == "vii_delzodoor_ilith") {
			oDoor = oTarget;
			iFacet = 3;
			SendMessageToPC(oUser, "You turn the ring to the facet matching this runedoor...");
		} else if (sTargetTag == "vii_delzodoor_runedar") {
			oDoor = oTarget;
			iFacet = 4;	
			SendMessageToPC(oUser, "You turn the ring to the facet matching this runedoor...");
		} else if (sTargetTag == "vii_delzodoor_glander") {
			oDoor = oTarget;
			iFacet = 5;
			SendMessageToPC(oUser, "You turn the ring to the facet matching this runedoor...");
		} else {
			// the target door is not a runedoor.
			SendMessageToPC(oUser, "The ring does not appear to respond to this door.");
		}
	} else {
		// the ring is being used without being targeted on a door.  Give feedback for tinkering with the ring
		SendMessageToPC(oUser, "Examining the ring, you turn the facet one notch.");
	}
	// Universal feedback from using the ring
		
	if((iFacet >= 6) || (iFacet == 1))
		{iFacet = 1;
		 //oDoor = oDoor1;
		 sFacet = "two crossed axes, a flaming sword and a hammer inside a facial mask.";
		 sSuccess = "Kuldar";
		 }
	if(iFacet == 2) 
		{ //oDoor = oDoor2;
		sFacet = "staggered stones like a wall with an outlined shield acting as a frame around it.";
		sSuccess = "Barak";
		}
	if(iFacet == 3)
		{ //oDoor = oDoor3;
		sFacet = "two fisted hands touching knuckle against knuckle inside an outlined circle.";
		sSuccess = "Ilith";
		}
	if(iFacet == 4) 
		{ //oDoor = oDoor4;
		sFacet = "a flaming hearth and an open chest on a bearskin. Two interlocked circles act as a frame.";
		sSuccess = "Runedar";
		}
	if(iFacet == 5) 
		{ //oDoor = oDoor5;
		sFacet = "one uncut and three facetted gems inside a octagon frame.";
		sSuccess = "Glander";
		}	 
	SendMessageToPC(oUser, "The facet shows a dwarven rune: " + sFacet);
	SetLocalInt(OBJECT_SELF, "iFacet", iFacet);
			 	 
	if (DMFI_IsLanguageKnown(oUser, sLang) == TRUE)
		{SendMessageToPC(oUser, "The rune signifies the Dwarven word: " + sSuccess);}
 		
	if(oDoor == oTarget)
			{object oFacetListen = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_delzoun_listen", GetLocation(oUser));
			 SetLocalObject(OBJECT_SELF, "oListen", oFacetListen);
			 SetLocalObject(oFacetListen, "oDoor", oDoor);
			 SetLocalObject(oFacetListen, "oUser", oUser);
			 DelayCommand(1.0, AssignCommand(oFacetListen, ActionForceFollowObject(oUser, 0.5)));
			 DelayCommand(2.0, AssignCommand(oDoor, ActionSpeakString("A stone ear melts out of the door. It is listening!", TALKVOLUME_TALK)));
			 DestroyObject(oFacetListen, 30.0);
			}
			

	  
}