//OnDeath for all Silvy Uni creatures 
//Wynna July 2015


#include "acr_creature_i"
#include "acr_quest_i"

void main()
{
	ACR_CreatureOnDeath();
    object oQuester = GetLastKiller();
    
	

  
   
    if(((GetTag(OBJECT_SELF) == "abr_cr_an_wild_dogwolf_mad")|| (GetTag(OBJECT_SELF) == "abr_cr_an_wild_deer_stag_hostile")) && (ACR_RetrieveQuestState("hawk_raid_01", oQuester) ==1))
        {SendMessageToPC(oQuester, "You have killed a creature maddened by poisonous lichens. There might be more.");
		 ACR_AddPersistentJournalQuestEntry("hawk_raid_01", 2, oQuester);
        }
		
	 if((GetTag(OBJECT_SELF) == "003_cr_uthgardt_skypony_quest")&& ((ACR_RetrieveQuestState("hawk_raid_02", oQuester) ==1) || (ACR_RetrieveQuestState("hawk_raid_02", oQuester) ==2)))
        {int nQuestState = ACR_RetrieveQuestState("hawk_raid_02", oQuester);
		 ACR_AddPersistentJournalQuestEntry("hawk_raid_02", nQuestState+1, oQuester);
        }
		
	if(GetTag(OBJECT_SELF) == "abr_cr_hu_orcfighter_quest")
		{if(ACR_RetrieveQuestState("hawk_raid_03", oQuester) ==1)
        	{ACR_AddPersistentJournalQuestEntry("hawk_raid_03", 2, oQuester);}
		 ExecuteScript("hawk_cr_execute", oQuester);
        }
        
	
}