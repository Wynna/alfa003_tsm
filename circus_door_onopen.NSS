//OnOpen for circus menagerie cages
//Wynna May 2015


#include "acr_door_i"
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_spawn_i"
#include "acr_db_persist_i"

void main()
{
	ACR_DoorOnOpen();
    object oPC = GetLastOpenedBy();
	object oJumpTo = GetNearestObjectByTag("circus_jumpdown", OBJECT_SELF, 0);
	string sAnimal = GetLocalString(OBJECT_SELF, "caged_creature");
    object oFreedAnimal = GetNearestObjectByTag(sAnimal, OBJECT_SELF, 0);
	if((GetIsDead(oFreedAnimal) == FALSE) && (GetLocalInt(OBJECT_SELF, "Exited") != 1))
		{if(GetTag(OBJECT_SELF)=="003_circus_menagerie_door") 
			{object oGuard = GetNearestObjectByTag("003_cr_circus_guard", oPC, 0);
			 AssignCommand(oGuard, ActionSpeakString("Help! The animals are loose!", TALKVOLUME_TALK));
			 AssignCommand(oGuard, ActionMoveAwayFromObject(oPC, TRUE, 40.0));
			 object oCarni = GetNearestObjectByTag("003_cr_circus_carni", oPC, 0);
			 AssignCommand(oCarni, ActionMoveAwayFromObject(oPC, TRUE, 40.0));
			 object oCarni2 = GetNearestObjectByTag("003_cr_circus_carni", oPC, 1);
			 AssignCommand(oCarni2, ActionMoveAwayFromObject(oPC, TRUE, 40.0));
			 AssignCommand(oFreedAnimal, ActionJumpToLocation(GetLocation(oJumpTo)));
			 SetLocalInt(OBJECT_SELF, "Exited", 1);
			 ChangeToStandardFaction(oFreedAnimal, STANDARD_FACTION_COMMONER);
			 SetLocalInt(oFreedAnimal, "Freed", 1);
			 DelayCommand(1.0, ChangeToStandardFaction(oFreedAnimal, STANDARD_FACTION_COMMONER));
			 DelayCommand(1.5, AssignCommand(oFreedAnimal, ActionSpeakString("*Shakes its head, seemingly confused and uncertain at its freedom. That could change at any moment.", TALKVOLUME_TALK)));
			 DelayCommand(2.0, ChangeToStandardFaction(oFreedAnimal, STANDARD_FACTION_COMMONER));
			 int nRandom = Random(3);
			 float nTime = IntToFloat(Random(10) + 10);
			 int nNewFaction=STANDARD_FACTION_COMMONER;
			 if(nRandom == 2)
			 	{nNewFaction=STANDARD_FACTION_HOSTILE;
				 DelayCommand(nTime, ChangeToStandardFaction(oFreedAnimal, nNewFaction));
				}
			 else
			 	{DelayCommand(nTime, AssignCommand(oFreedAnimal, ActionMoveAwayFromObject(oPC, TRUE, 40.0)));
				}
		 	}
		 }	

	
}	