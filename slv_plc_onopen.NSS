//OnOpen for all Silvy Uni placeables outside the classrooms
//Wynna December 2007


#include "acr_placeable_i"
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_quest_i"

void main()
{
	ACR_PlaceableOnOpen();
    object oStudent = GetLastOpenedBy();
	
             			
if(GetTag(OBJECT_SELF) == "vala_cabinet")
	{object oStatic = GetObjectByTag("vala_cabinet_static");
	 object oCollBox = GetObjectByTag("vala_CollBox");
     DestroyObject(oCollBox);
	 DestroyObject(oStatic);
	 DelayCommand(10.0, ActionCloseDoor(OBJECT_SELF));
	 }

	 
   //Quest completion for Elementary Abjuration:
    if(GetTag(OBJECT_SELF) == "slv_abj100_chest")
    {      if(GetCampaignString("SLV_UNI", "Elementary Abjuration", oStudent) == "Elementary Abjuration")
            {  FloatingTextStringOnCreature("The inscription has melted away.", oStudent, FALSE);
            }
            else
            {  FloatingTextStringOnCreature("On the lid you spot a delicate inscription carved there in the ice.", oStudent, FALSE);
               DelayCommand(3.0, FloatingTextStringOnCreature("Abjuration is the Art of Protection, of self and others.  It is the path of greatest resistance to the actions, effects, or presence of adversaries.", oStudent, FALSE));
               SetCampaignString("SLV_UNI", "Elementary Abjuration", "Elementary Abjuration", oStudent);
            if(ACR_RetrieveQuestState("slv_abj100", oStudent) == 1)
				{ACR_AddPersistentJournalQuestEntry("slv_abj100", 2, oStudent, 0, 0, 0, 0);
				}
			}
	}	
	
	
	//All Advanced courses use Advanced Coursework Secretary Desk
	
	if(GetTag(OBJECT_SELF) == "slv_300_desk") 
		{object oDesk = OBJECT_SELF;
		 string sPrefix;
		 SpeakString("Tests go in the drawer.", TALKVOLUME_TALK);
		 if (GetLocalInt(oDesk, "300DeskOpen") != 1)
		  { if(FindSubString(GetName(oDesk), "Abj") != -1)
				{SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration, oDesk);
		   		 sPrefix = "abj";
				 }
			if(FindSubString(GetName(oDesk), "Con") != -1)
				{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration, oDesk);
		   		  sPrefix = "con";
				 }
			if(FindSubString(GetName(oDesk), "Div") != -1)
				{SetSilvyUniversitySchool(SilvyUniversitySchoolDivination, oDesk);
		   		 sPrefix = "div";
				 }
			if(FindSubString(GetName(oDesk), "Enc") != -1)
				{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment, oDesk);
		   		 sPrefix = "enc";
				 }
			if(FindSubString(GetName(oDesk), "Evo") != -1)
				{SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation, oDesk);
		   		 sPrefix = "evo";
				 }
			if(FindSubString(GetName(oDesk), "Ill") != -1)
				{SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion, oDesk);
		   		 sPrefix = "ill";
				 }
			if(FindSubString(GetName(oDesk), "Nec") != -1)
				{SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy, oDesk);
		   		 sPrefix = "nec";
				 }
			if(FindSubString(GetName(oDesk), "Tra") != -1)
				{SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation, oDesk);
		   		  sPrefix = "tra";
				 }
			SetLocalString(OBJECT_SELF, "sPrefix", sPrefix);
			SetLocalInt(oDesk, "300DeskOpen", 1);
		    }
			int nSchool = GetSilvyUniversitySchool(oDesk);
		    string sSchool = SchoolToString(nSchool);
			sPrefix = GetLocalString(OBJECT_SELF, "sPrefix");
			if(ACR_RetrieveQuestState("slv_" + sPrefix + "300", oStudent) == 1)
				{ACR_AddPersistentJournalQuestEntry("slv_" + sPrefix + "300", 2, oStudent, 0, 0, 0, 0);}
			DelayCommand(1.0, SpeakString("Same drill as always. If you've got a test to grade, put it in my drawer and close it. If not, go find the question givers! Fair warning: I'll consume anything put in this drawer.", TALKVOLUME_TALK));
			if(GetCampaignString("SLV_UNI", "SecDesk", oStudent) != "Yes")
				{DelayCommand(4.0, SpeakString("If you don't know what I'm talking about, which of our brains is made of wood? You need to find three people connected to the " +sSchool + " School -- who are NOT the teacher -- with questions for you to answer.", TALKVOLUME_TALK));
				 DelayCommand(8.0, SpeakString("Then come back here, write each answer on its own piece of University Letterhead, noting school and question number in the title, then submit it to me IMMEDIATELY for grading. Delaying submission risks invalidating the test because questions can and do change. Also, be warned that the grading process destroys the test.", TALKVOLUME_TALK));
				 DelayCommand(12.0, SpeakString("Oh and don't be so surprised. Yes, I can talk! I can grade papers, too. Haven't you ever heard of a secretary desk?", TALKVOLUME_TALK));
				 SetCampaignString("SLV_UNI", "SecDesk", "Yes", oStudent);
				 }
				
		}	
	 	
}	