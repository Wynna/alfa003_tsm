#include "silvy_univ_inc"
#include "acr_spawn_i"
#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "acr_quest_i"

void main()
{
             
//OnActivate Script  
	object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    object oTarget = GetItemActivatedTarget();
	object oWP8 = GetWaypointByTag("slv_deandragon_g_8");
	object oWP7 = GetWaypointByTag("slv_deandragon_g_7");
	object oWP6 = GetWaypointByTag("slv_deandragon_g_6");
	object oWP5 = GetWaypointByTag("slv_deandragon_g_5");
	object oWP4 = GetWaypointByTag("slv_deandragon_g_4");
	object oWP3 = GetWaypointByTag("slv_deandragon_g_3");
	object oWP2 = GetWaypointByTag("slv_deandragon_g_2");
	object oWP1 = GetWaypointByTag("slv_deandragon_g_1");
	
	if((GetTag(oTarget) == "003_cr_slv_deandragon_golem") && (GetDistanceBetween(oUser, oTarget) <= 5.0))
	   {if(ACR_RetrieveQuestState("slv_deandragon_g", oUser) == 2)
				{ACR_AddPersistentJournalQuestEntry("slv_deandragon_g", 3, oUser, 0, 0, 0, 0);
				}
		AssignCommand(oTarget, ActionSpeakString("Actuator detected. Minimum usage distance compliance. Command valid. Return to creator.", TALKVOLUME_TALK));
		AssignCommand(oTarget, ActionForceMoveToObject(oWP8, TRUE, 1.0));
		DelayCommand(5.0, AssignCommand(oTarget, ActionSpeakString("Return to creator.", TALKVOLUME_TALK)));
		DelayCommand(5.0, AssignCommand(oTarget, ClearAllActions(TRUE)));
		DelayCommand(5.5, AssignCommand(oTarget, ActionJumpToObject(oWP7, FALSE)));
		DelayCommand(10.5, AssignCommand(oTarget, ClearAllActions(TRUE)));
		DelayCommand(11.0, AssignCommand(oTarget, ActionJumpToObject(oWP6, FALSE)));
		DelayCommand(15.0, AssignCommand(oTarget, ActionSpeakString("Return to creator.", TALKVOLUME_TALK)));
		DelayCommand(16.0, AssignCommand(oTarget, ClearAllActions(TRUE)));
		DelayCommand(16.5, AssignCommand(oTarget, ActionJumpToObject(oWP5, FALSE)));
		DelayCommand(21.5, AssignCommand(oTarget, ClearAllActions(TRUE)));
		DelayCommand(22.0, AssignCommand(oTarget, ActionForceMoveToObject(oWP4, TRUE, 1.0)));
		DelayCommand(25.0, AssignCommand(oTarget, ActionSpeakString("Return to creator.", TALKVOLUME_TALK)));
		DelayCommand(27.0, AssignCommand(oTarget, ClearAllActions(TRUE)));
		DelayCommand(27.5, AssignCommand(oTarget, ActionForceMoveToObject(oWP3, TRUE, 1.0)));
		DelayCommand(32.5, AssignCommand(oTarget, ClearAllActions(TRUE)));
		DelayCommand(33.0, AssignCommand(oTarget, ActionForceMoveToObject(oWP2, TRUE, 1.0)));
		DelayCommand(35.0, AssignCommand(oTarget, ActionSpeakString("Return to creator.", TALKVOLUME_TALK)));
		DelayCommand(38.0, AssignCommand(oTarget, ClearAllActions(TRUE)));
		DelayCommand(38.5, AssignCommand(oTarget, ActionForceMoveToObject(oWP1, TRUE, 1.0)));
		DelayCommand(43.5, AssignCommand(oTarget, ClearAllActions(TRUE)));
		DelayCommand(45.0, AssignCommand(oTarget, ActionSpeakString("Return to creator.", TALKVOLUME_TALK)));
		DestroyObject(oTarget, 45.5);
		}
	else if((GetTag(oTarget) == "003_cr_slv_deandragon_golem") && (GetDistanceBetween(oUser, oTarget) > 5.0))
	   {AssignCommand(oTarget, ActionSpeakString("Actuator detected. Minimum usage distance exceeded. Command invalid.", TALKVOLUME_TALK));
		}
}