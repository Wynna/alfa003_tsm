#include "silvy_univ_inc"
#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "acr_quest_i"

void main()
{
    object oStudent = GetEnteringObject();
	object oMyDoor = GetLocalObject(OBJECT_SELF, "oMyDoor");
	string sSchool;
    if(oMyDoor == OBJECT_INVALID)
		{oMyDoor = GetObjectByTag(GetName(OBJECT_SELF), 0);
		 SetLocalObject(OBJECT_SELF, "oMyDoor", oMyDoor);
		 }
	if(FindSubString(GetTag(oMyDoor), "Abj") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration, oMyDoor);
   		 sSchool = "Abjuration";
		 }
	if(FindSubString(GetTag(oMyDoor), "Con") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration, oMyDoor);
   		 sSchool = "Conjuration";
		 }
	if(FindSubString(GetTag(oMyDoor), "Div") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolDivination, oMyDoor);
   		 sSchool = "Divination";
		 }
	if(FindSubString(GetTag(oMyDoor), "Enc") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment, oMyDoor);
   		 sSchool = "Enchantment";
		 }
	if(FindSubString(GetTag(oMyDoor), "Evo") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation, oMyDoor);
   		 sSchool = "Evocation";
		 }
	if(FindSubString(GetTag(oMyDoor), "Ill") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion, oMyDoor);
   		 sSchool = "Illusion";
		 }
	if(FindSubString(GetTag(oMyDoor), "Nec") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy, oMyDoor);
   		 sSchool = "Necromancy";
		 }
	if(FindSubString(GetTag(oMyDoor), "Tra") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation, oMyDoor);
   		 sSchool = "Transmutation";
		 }
	
	 
		 
	int nSchool = GetSilvyUniversitySchool(oMyDoor);
    string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
    string sDoor = GetStringRight(GetTag(oMyDoor),1);
    int nDoor = StringToInt(sDoor) * 100;
    int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
    effect eKnock = EffectVisualEffect(VFX_DUR_SOOTHING_LIGHT, FALSE);
     effect eStop = EffectVisualEffect(VFX_DUR_LIGHT_RED_10);
   
 
     //Basic instruction for failsafe open/don't open to right students
        if(((GetIsPC(oStudent) == FALSE) && (((nLevel >= nDoor)&& (sCurrentCourse != "")) || (nSchool == SilvyUniversitySchoolUndefined)) && (GetLocalString(oMyDoor, "Unlocked") == "")) || (GetIsDMPossessed(oStudent) == TRUE))

           {ActionUnlockObject(oMyDoor);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            ActionOpenDoor(oMyDoor);
			DelayCommand(10.0, ActionCloseDoor(oMyDoor));
			DelayCommand(12.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(12.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
				
		if((GetIsPC(oStudent) == TRUE) && (nLevel >= nDoor)&& (sCurrentCourse != "") && (GetLocalString(oMyDoor, "Unlocked") == ""))

           {SetLocked(oMyDoor, FALSE);
		    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            DelayCommand(30.0, ActionCloseDoor(oMyDoor));
			DelayCommand(32.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(32.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
	
		if((GetTag(oStudent) == "003_cr_slv_procenc2") && (FindSubString(GetTag(oMyDoor), "Enc") != -1))
			{ActionUnlockObject(oMyDoor);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            ActionOpenDoor(oMyDoor);
			DelayCommand(10.0, ActionCloseDoor(oMyDoor));
			DelayCommand(12.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(12.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
				
		if(((ACR_RetrieveQuestState("slv_deandragon_t", oStudent) == 1) && (FindSubString(GetTag(oMyDoor), "Tra") != -1) && (GetLocalObject(OBJECT_SELF, "oTQuest") != oStudent)))
			{SetLocalObject(OBJECT_SELF, "oTQuest", oStudent);
			DelayCommand(1800.0, SetLocalObject(OBJECT_SELF, "oTQuest", OBJECT_INVALID));
			ActionUnlockObject(oMyDoor);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMyDoor, 2.0);
            SetLocalString(oMyDoor, "Unlocked", "Normally");
            ActionOpenDoor(oMyDoor);
			object oMirrorWP = GetLocalObject(OBJECT_SELF, "oMirrorWP");
		    if(oMirrorWP == OBJECT_INVALID)
			 	{oMirrorWP = GetWaypointByTag("slv_deandragon_t_mirror");
				 SetLocalObject(OBJECT_SELF, "oMirrorWP", oMirrorWP);
				}
		    object oEnter = GetLocalObject(OBJECT_SELF, "oEnter");
		    if(oEnter == OBJECT_INVALID)
			 	{oEnter = GetWaypointByTag("slv_deandragon_t_exit");
				 SetLocalObject(OBJECT_SELF, "oEnter", oEnter);
				}
		    object oProfTra = GetObjectByTag("003_cr_slv_proftra");
			if(oProfTra == OBJECT_INVALID)
				{oProfTra = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_proftra", GetLocation(oEnter));
				}
			else
				{AssignCommand(oProfTra, ActionJumpToLocation(GetLocation(oEnter)));
				}
			object oProfEvo = GetObjectByTag("003_cr_slv_profevo");
			if(oProfEvo == OBJECT_INVALID)
				{oProfEvo = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profevo", GetLocation(oEnter));
				}
			else
				{AssignCommand(oProfEvo, ActionJumpToLocation(GetLocation(oEnter)));
				}
			
			object oMirror = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_h_artifice_mirror", GetLocation(oMirrorWP));
			SetUseableFlag(oMirror, TRUE);
			AssignCommand(oMyDoor, ActionSpeakString(GetName(oStudent) + " has arrived, masters. *Auroneous and Arcadavera turn from their discussion before a mirror carved of ivory or bone.", TALKVOLUME_TALK));
			SetLocalObject(oProfEvo, "GoTo", oEnter);
			SetLocalObject(oProfTra, "GoTo", oEnter);
			SetLocalInt(oProfEvo, "Walk_Off",1);
			SetLocalInt(oProfTra, "Walk_Off",1);
			DelayCommand(2.0, AssignCommand(oProfEvo, ClearAllActions(TRUE)));
			DelayCommand(2.0, AssignCommand(oProfTra, ClearAllActions(TRUE)));
			DelayCommand(6.0, AssignCommand(oProfEvo, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(6.0, AssignCommand(oProfTra, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(10.0, AssignCommand(oProfEvo, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(10.0, AssignCommand(oProfTra, ActionJumpToLocation(GetLocation(oEnter))));
		DelayCommand(5.0, AssignCommand(oProfTra, ActionSpeakString("Ah, excellent. Do come in, " + GetName(oStudent) + ". Arky and I were just discussing temporal matters. You'll have to wait a moment --", TALKVOLUME_TALK)));
			DelayCommand(12.0, AssignCommand(oProfEvo, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(12.0, AssignCommand(oProfTra, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(15.0, AssignCommand(oProfEvo, ActionSpeakString("A moment!  *Roars with laughter, pushing Auroneous's shoulder appreciatively.* A moment as ephemeral as forever and as long as the sine wave of a t-field, eh? Eh? Gadzooks! THAT'S IT! *Turns to the mirror and puts his face against it, eyes open, gazing into the reflection unblinkingly while muttering to himself.", TALKVOLUME_TALK)));
			DelayCommand(28.0, AssignCommand(oProfEvo, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(28.0, AssignCommand(oProfTra, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(30.0, AssignCommand(oProfTra, ActionSpeakString("*Not bothered by the other professor's odd behaviour, Auroneous raises his voice.*", TALKVOLUME_TALK)));
			DelayCommand(35.0, AssignCommand(oProfTra, ActionSpeakString("--while we perfect a minor detail about the past.", TALKVOLUME_TALK)));
			DelayCommand(43.0, AssignCommand(oProfEvo, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(43.0, AssignCommand(oProfTra, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(45.0, AssignCommand(oProfEvo, ActionSpeakString("Yes, YES!  *Arcadavera beckons you over excitedly.* It must be the hand of one who knows nothing, just as the first lot of proctors! Else the equation is tainted. You, come here, " + GetName(oStudent) + ". Hurry!", TALKVOLUME_TALK)));
			DelayCommand(50.0, AssignCommand(oProfTra, ActionSpeakString("*Interested lift of his brow as he observes Arcadavera's excitement.*  You'd best do as he asks. He's a genius, of course. I think you'll find what you see...instructive. We sent in the current proctors to recover this mirror for their own Dean's Exam field quest, of course.", TALKVOLUME_TALK)));
			DelayCommand(58.0, AssignCommand(oProfEvo, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(58.0, AssignCommand(oProfTra, ActionJumpToLocation(GetLocation(oEnter))));
			DelayCommand(60.0, AssignCommand(oProfEvo, ActionSpeakString("You, Scholar! Use this mirror. Gaze into it! USE it!", TALKVOLUME_TALK)));
			DelayCommand(1800.0, ActionCloseDoor(oMyDoor));
			DelayCommand(1802.0, SetLocked(oMyDoor, TRUE));
			DelayCommand(1802.5, SetLocalString(oMyDoor, "Unlocked", ""));
            	}
}