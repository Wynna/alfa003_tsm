
//Wynna September 2009

 
#include "acr_items_i"
#include "acr_db_persist_i"
#include "acr_quest_i"

void main()
{	
	object oItem = GetItemActivated();
 	object oStudent = GetItemActivator();
	string sItem = GetName(oItem);
	location lStudentStart = GetLocation(oStudent);
	SetLocalLocation(oStudent, "Alastrarra_Gem_Start", lStudentStart);
	
	ACR_AddPersistentJournalQuestEntry("slv_deandragon_x", 2, oStudent, FALSE, FALSE, FALSE, FALSE);
		 
	
	SendMessageToPC(oStudent, "The gem disappears out of your possession.");
	DestroyObject(oItem, 2.0);
			 			 			 	
	object oDeandragonXTeleport = GetLocalObject(oStudent, "oDeandragonXTeleport");
	if(oDeandragonXTeleport == OBJECT_INVALID)
		 {oDeandragonXTeleport = GetWaypointByTag("slv_deandragon_j_jorun_wp");
		 SetLocalObject(oStudent, "oDeandragonXTeleport", oDeandragonXTeleport);
			}
	object oLavaTubeEnter = GetWaypointByTag("slv_deandragon_x_lavatube_wp");
	
		
	if(ACR_RetrieveQuestState("slv_deandragon_x", oStudent) == 2)
		{ACR_AddPersistentJournalQuestEntry("slv_deandragon_x", 3, oStudent, FALSE, FALSE, FALSE, FALSE);
		 }
		 object oProcCon = GetObjectByTag("003_cr_slv_proccon", 0);				
		 object oProcTra = GetObjectByTag("003_cr_slv_proctra", 0);	
		 DestroyObject(oProcCon);
		 DestroyObject(oProcTra);
					
		 object oProcConNew=CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_proccon", GetLocation(oLavaTubeEnter), FALSE, "003_cr_slv_proccon_NoWalk");			 			 			 	
		 object oProcTraNew=CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_proctra", GetLocation(oLavaTubeEnter), FALSE, "003_cr_slv_proctra_NoWalk");	
		 object oTeleporter = GetFirstObjectInShape(SHAPE_SPHERE, 60.0, GetLocation(oStudent), FALSE, OBJECT_TYPE_CREATURE);
		 while(oTeleporter != OBJECT_INVALID)
			{if(GetIsPC(oTeleporter))
				{SendMessageToPC(oTeleporter, "The portal springs to life. You have triggered a teleporation circle spell.");
				 DelayCommand(5.0, FadeToBlack(oTeleporter, FADE_SPEED_MEDIUM, 10.0));
			 	 DelayCommand(7.0, AssignCommand(oTeleporter, ActionJumpToObject(oDeandragonXTeleport)));
				 }
			
			oTeleporter = GetNextObjectInShape(SHAPE_SPHERE, 60.0, GetLocation(oStudent), FALSE, OBJECT_TYPE_CREATURE);
		    }
		
		DelayCommand(20.0, AssignCommand(oProcTraNew, ActionMoveToObject(oStudent, FALSE, 2.0)));
		DelayCommand(25.0, AssignCommand(oProcTraNew, ActionStartConversation(oStudent, "", TRUE, TRUE, TRUE, TRUE)));
						 
}			  