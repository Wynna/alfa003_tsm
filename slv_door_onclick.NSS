#include "silvy_univ_inc"
#include "acr_db_persist_i"
#include "silvy_univ_func"

void main()
{
    object oStudent = GetClickingObject();
    if(FindSubString(GetTag(OBJECT_SELF), "Abj") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration);
   		 }
	if(FindSubString(GetTag(OBJECT_SELF), "Con") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration);
   		 }
	if(FindSubString(GetTag(OBJECT_SELF), "Div") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolDivination);
   		 }
	if(FindSubString(GetTag(OBJECT_SELF), "Enc") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment);
   		 }
	if(FindSubString(GetTag(OBJECT_SELF), "Evo") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation);
   		 }
	if(FindSubString(GetTag(OBJECT_SELF), "Ill") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion);
   		 }
	if(FindSubString(GetTag(OBJECT_SELF), "Nec") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy);
   		 }
	if(FindSubString(GetTag(OBJECT_SELF), "Tra") != -1)
		{SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation);
   		 }
		 
		 
	int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
    string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
    string sDoor = GetStringRight(GetTag(OBJECT_SELF),1);
    int nDoor = StringToInt(sDoor) * 100;
    int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
    effect eKnock = EffectVisualEffect(VFX_IMP_KNOCK, FALSE);
    effect eStop = EffectVisualEffect(VFX_DUR_LIGHT_RED_10);
    string sFacing = FloatToString(GetFacing(oStudent));
    string sFacingDoor = FloatToString(GetFacing(OBJECT_SELF));
    string sFacingTOBJECT_SELF = "Exiting";

   if((GetFacing(OBJECT_SELF) == 0.000000000)  && ((GetFacing(oStudent) >= 270.0) || (GetFacing(oStudent) <= 90.0)))
        {sFacingDoor = "Entering";}

   if((GetFacing(OBJECT_SELF) == 90.000000000)  && (GetFacing(oStudent) <= 180.0))
         {sFacingDoor = "Entering";}

   if((GetFacing(OBJECT_SELF) == 180.000000000)  && (GetFacing(oStudent) >= 90.0) && (GetFacing(oStudent) <= 270.0))
         {sFacingDoor = "Entering";}

   if((GetFacing(OBJECT_SELF) == 270.000000000)  && (GetFacing(oStudent) >= 180.0))
         {sFacingDoor = "Entering";}


     //Basic instruction for failsafe open/don't open to right students
        if((nLevel >= nDoor)&& (sCurrentCourse != ""))

           {ActionUnlockObject(OBJECT_SELF);
            SendMessageToPC(oStudent, "The door glows blue and your fingers tingle as if the imprint of your hand is mapped against the knob.  A lock tumbles.");
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, OBJECT_SELF, 2.0);
            SetLocalString(OBJECT_SELF, "Unlocked", "Normally");
            ActionOpenDoor(OBJECT_SELF);
			DelayCommand(30.0, ActionCloseDoor(OBJECT_SELF));
			DelayCommand(32.0, SetLocked(OBJECT_SELF, TRUE));
			DelayCommand(32.5, SetLocalString(OBJECT_SELF, "Unlocked", ""));
            }

        else
           {FloatingTextStringOnCreature("The door glows red and the knob gives your hand a slight but unpleasant jolt.", oStudent, FALSE);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStop, OBJECT_SELF, 2.0);
            }


     //individual effects/messages on failing to open each door

        //Elementary Abjuration:
        if((GetTag(OBJECT_SELF) == "slv_door_Abjuration1") && (GetDistanceBetween(oStudent, GetWaypointByTag("slv_Mistressabj")) < 8.0))
            {FloatingTextStringOnCreature("The latch feels cold to the touch.", oStudent, FALSE);}

         //Standard Abjuration:
        if((GetTag(OBJECT_SELF) == "slv_door_Abjuration2") && (GetDistanceBetween(oStudent, GetWaypointByTag("slv_abj100ice")) < 6.5))
            {FloatingTextStringOnCreature("Your skin goosefleshes at the sense of something disturbing radiating through the door.", oStudent, FALSE);
            if(GetIsSkillSuccessful(oStudent, SKILL_LISTEN, 20))
                {DelayCommand(2.0, FloatingTextStringOnCreature("You hear a faint humming from under the crack in the door.", oStudent, FALSE));
                }
            }

           //Standard Enchantment
           if((GetTag(OBJECT_SELF) == "slv_door_Enchantment2") && (GetDistanceBetween(OBJECT_SELF, GetObjectByTag("slv_ench200heraso", 0)) < 10.0))
           {ActionUnlockObject(OBJECT_SELF);
            FloatingTextStringOnCreature("The door glows blue and your fingers tingle as if the imprint of your hand is mapped against the knob.  A lock tumbles.", oStudent, FALSE);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, OBJECT_SELF, 2.0);
            SetLocalString(OBJECT_SELF, "Unlocked", "Normally");
            }


          //Elementary Illusion:
        if((GetTag(OBJECT_SELF) == "slv_door_Illusion1") && (GetDistanceBetween(oStudent, GetWaypointByTag("slv_masterill")) < 2.6) && (GetLocalInt(oStudent, "Giggle") == 0))
            {SendMessageToPC(oStudent, "You hear a faint scuffle through the crack beneath the door.");
             SetLocalInt(oStudent, "Giggle", 1);
             if(GetIsSkillSuccessful(oStudent, SKILL_LISTEN, 18))
                {DelayCommand(2.0, SendMessageToPC(oStudent, "In the room, somebody...giggles."));
                }
            }
         //Next door here

}