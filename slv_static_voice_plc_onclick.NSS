//OnUse for all Dean's Exam (deandragon) placeables 
//Wynna February 2009


#include "acr_placeable_i"
#include "acr_xp_i"
#include "acr_quest_i"






void main()
{
	ACR_PlaceableOnClick();

	object oUser = GetClickingObject();
	
   
	//deandragon_Z crystal ball
   if((GetTag(OBJECT_SELF) == "slv_maze_crystal") && (ACR_RetrieveQuestState("slv_deandragon_z", oUser) == 2))
      	{ActionSpeakString("Congratulations! *Dean Vihuel's voice* You have successfully marched to the end of the research stage of your campaign for knowledge.", TALKVOLUME_TALK);
		 DelayCommand(10.0, ActionSpeakString("As you are standing here, you have worked out the complete key phrase that you are to give to the gatekeeper. When you have provided it to her, she will summon her rocky steed to carry you further.", TALKVOLUME_TALK));
		 DelayCommand(20.0, ActionSpeakString("You may march on now in Oghma's vanguard to the fieldwork stage of your quest, or you may provision and seek your own way to the gatekeeper at a later time.", TALKVOLUME_TALK));
		 DelayCommand(30.0, ActionSpeakString("It is Occidian we seek, of course, and the Elestar Patterns. Both have waited long enough and may wait a little longer, despite an old man's growing excitement.", TALKVOLUME_TALK));
		 DelayCommand(40.0, ActionSpeakString("The end of decades of preparation is in sight. The final step has been assembling the right crew of scholars to assist in this triumph, and you have proven yourself, finding your way through the same maze of clues and false paths that I have followed for so long.", TALKVOLUME_TALK));
		 DelayCommand(50.0, ActionSpeakString("The moment I see you set out, I shall go ahead of you, and be there to greet you. Until then, know that I still work on final details. Avaunt and awake, troops, for tomorrow we charge the barricades of ignorance!", TALKVOLUME_TALK));
		 DelayCommand(50.0, ACR_AddPersistentJournalQuestEntry("slv_deandragon_z", 3,oUser,  FALSE, FALSE, FALSE, FALSE));
		}

}