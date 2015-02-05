
//Wynna September 2009

 
#include "acr_items_i"
#include "acr_db_persist_i"
#include "acr_quest_i"

void main()
{	
	object oItem = GetItemActivated();
 	object oStudent = GetItemActivator();
	string sItem = GetName(oItem);
	effect eSleep = EffectSleep();
	effect eParalyse = EffectParalyze(30, SAVING_THROW_WILL, FALSE);
	effect eSymbol = EffectVisualEffect(VFX_DUR_SPELL_SYMBOL_OF_SLEEP, FALSE);
	location lStudentStart = GetLocation(oStudent);
	SetLocalLocation(oStudent, "Alastrarra_Gem_Start", lStudentStart);
	
	object oSlept = GetFirstObjectInShape(SHAPE_SPHERE, 60.0, GetLocation(oStudent), FALSE, OBJECT_TYPE_CREATURE);
	while(oSlept != OBJECT_INVALID)
		{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSymbol, oSlept, 5.0);
		 if(GetHitDice(oSlept) < 10)
			{if(WillSave(oSlept, 40, SAVING_THROW_TYPE_SPELL, OBJECT_SELF) == 0)
				{ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oSlept, IntToFloat(d6(3) * 10));
				}
			}
		oSlept = GetNextObjectInShape(SHAPE_SPHERE, 60.0, GetLocation(oStudent), FALSE, OBJECT_TYPE_CREATURE);
		}	
		
				 	
	if(ACR_RetrieveQuestState("slv_deandragon_x", oStudent) == 2)
		{ACR_AddPersistentJournalQuestEntry("slv_deandragon_x", 3, oStudent, FALSE, FALSE, FALSE, FALSE);
		 }
	object oDeandragonXDream = GetLocalObject(oStudent, "oDeandragonXDream");
		 if(oDeandragonXDream == OBJECT_INVALID)
		 	{oDeandragonXDream = GetWaypointByTag("slv_deandragon_x_dream");
			 SetLocalObject(oStudent, "oDeandragonXDream", oDeandragonXDream);
			 }
		 object oDreamer = GetFirstObjectInShape(SHAPE_SPHERE, 60.0, GetLocation(oStudent), FALSE, OBJECT_TYPE_CREATURE);
		 while(oDreamer != OBJECT_INVALID)
			{if(GetIsPC(oDreamer))
				{FadeToBlack(oDreamer, FADE_SPEED_MEDIUM, 10.0);
			 	 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oDreamer, 300.0);
				 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyse, oDreamer, 300.0);
				 DelayCommand(4.0, AssignCommand(oDreamer, ActionJumpToObject(oDeandragonXDream)));
				 DelayCommand(10.0, FadeFromBlack(oDreamer, FADE_SPEED_MEDIUM));
				 DelayCommand(135.0, AssignCommand(oDreamer, ActionJumpToLocation(lStudentStart)));
		 		 }
			
			oDreamer = GetNextObjectInShape(SHAPE_SPHERE, 60.0, GetLocation(oStudent), FALSE, OBJECT_TYPE_CREATURE);
		    }
		
				
						 
}			  