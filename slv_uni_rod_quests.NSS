#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_quest_i"



void main()
{
    object oDM = GetItemActivator();
	if(oDM == OBJECT_INVALID)
		{oDM = OBJECT_SELF;
		}
    
    object oStudent = GetItemActivatedTarget();
	string sQuestInc = GetLocalString(oDM, "quest_inc");
	string sQuestDec = GetLocalString(oDM, "quest_dec");
	
	
	
	

//Change Quest States
	
if(sQuestInc != "")
		 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM)))
			{int nQuestState= ACR_RetrieveQuestState(sQuestInc,  oStudent);
			 SendMessageToPC(oDM, sQuestInc + " = " + IntToString(ACR_RetrieveQuestState(sQuestInc, oStudent)) + " for " + GetName(oStudent));
			 ACR_AddPersistentJournalQuestEntry(sQuestInc, nQuestState +1, oStudent, 0, 0, 0, 0);
			 SendMessageToPC(oDM, sQuestInc + " changed to " + IntToString(ACR_RetrieveQuestState(sQuestInc, oStudent)) + " for " + GetName(oStudent));
			 SetLocalString(oStudent, sQuestInc, "");
			}
		}
			
	else if(sQuestDec != "")
		 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM)))
			{int nQuestState= ACR_RetrieveQuestState(sQuestDec,  oStudent);
			 int nNewState = nQuestState-1;
			 SendMessageToPC(oDM, sQuestDec + " = " + IntToString(ACR_RetrieveQuestState(sQuestDec, oStudent)) + " for " + GetName(oStudent));
			 ACR_RemovePersistentJournalQuestEntry(sQuestDec, oStudent, 0, 0);
			 DelayCommand(1.0, ACR_AddPersistentJournalQuestEntry(sQuestDec, nNewState, oStudent, 0, 0, 0, 0));
			 DelayCommand(2.0, SendMessageToPC(oDM, sQuestDec + " changed to " + IntToString(ACR_RetrieveQuestState(sQuestDec, oStudent)) + " for " + GetName(oStudent)));
			 DelayCommand(3.0, SetLocalString(oStudent, sQuestDec, ""));
			}
		}
	

}