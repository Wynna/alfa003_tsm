//
// Returns TRUE if the student has the special credit dispensation to skip the next course
// offered by this professor
// 
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_quest_i"


int StartingConditional()
{
    int iResult = 0;

    object oStudent = GetPCSpeaker();
     
	if((ACR_RetrieveQuestState("003_religion_helm", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_berronar", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_ilmater", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_kelemvor", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_lathander", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_redknight", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_selune", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_tempus", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_torm", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_tyr", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_everdusk", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_mielikki", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_sivanus", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_mystra", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_auril", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_yondalla", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_gond", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_sune", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_chauntea", oStudent) > 1)
	|| (ACR_RetrieveQuestState("003_religion_oghma", oStudent) > 1))
		    {iResult = 1;}
		
    return iResult;
}