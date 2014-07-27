#include "acr_db_persist_i"
#include "silvy_univ_func"
#include "silvy_univ_inc"
#include "acr_creature_i"
 
void main()
{    ACR_CreatureOnConversation();

    object oPC = GetLastSpeaker();
    object oStudent = GetLocalObject(OBJECT_SELF, "Student");
    string sSir;
    string sHero;
    string sDay;
    string sFullName = GetName(oStudent);
    string sFirstName;
    string sLastName;
    string sMiddleName;
    string sMiddleName2;
    string sDoFor;
    string sRecognizeKeyword;
    string sNoKeyword;
    string sNoKeyword2;
    string sMyQuest;
    string sGoOn;
    string sAlreadyPassed;
    string sAssignTask;
    string sCourse;
    string sHavingTrouble;
    string sCongratulations;
    string sLesson;
    string sGiveKeyword;
    string sQuest;
    int iQuest;
    string sOtherProf;
    string sGoodbye;
	string sNameGiven;
    int nMatch = GetListenPatternNumber();
    int nSpace = FindSubString(sFullName, " ");
    if (nSpace > -1)
            {
            sFirstName = GetStringLeft(sFullName, nSpace);
            sLastName = GetStringRight(sFullName, GetStringLength(sFullName) - nSpace);
            if(GetStringLeft(sLastName, 1) == " ")
                {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                }
                {}
                int nSpace2 = FindSubString(sLastName, " ");
                if(nSpace2 > -1)
                        {sMiddleName = GetStringLeft(sLastName, nSpace2);
                         sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - nSpace2);
                         if(GetStringLeft(sLastName, 1) == " ")
                            {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                            }
                            {}
                            int nSpace3 = FindSubString(sLastName, " ");
                            if(nSpace3 > -1)
                                {sMiddleName2 = GetStringLeft(sLastName, nSpace3);
                                 sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - nSpace3);
                                if(GetStringRight(sMiddleName2, 1) == ",")
                                   {sMiddleName2 = GetStringLeft(sMiddleName2, GetStringLength(sMiddleName2) - 1);
                                   }
                                   {}
                                if(GetStringLeft(sLastName, 1) == " ")
                                   {sLastName = GetStringRight(sLastName, GetStringLength(sLastName) - 1);
                                    }
                                    {}
                                }
                                {}
                          }
                         {}
             }
            else
            {sFirstName = GetName(oPC);
             sLastName = GetName(oPC);
             sFullName = GetName(oPC);
             sMiddleName = GetName(oPC);
             sMiddleName2 = GetName(oPC);
             }

    SetListenPattern(OBJECT_SELF, sFullName, 4999);
    SetListenPattern(OBJECT_SELF, sFirstName, 5000);
    SetListenPattern(OBJECT_SELF, sMiddleName, 5001);
    SetListenPattern(OBJECT_SELF, sMiddleName2, 5002);
    SetListenPattern(OBJECT_SELF, sLastName, 5003);

    if(GetGender(oPC) == GENDER_MALE)
        {sSir = "Sir";
         sHero = "hero";
         }
        else
        {sSir = "Madame";
         sHero = "heroine";
         }


    if(GetIsDay())
       {sDay = "day";}
       else
       {sDay = "evening";}





 
 ExecuteScript("nw_c2_default4", OBJECT_SELF);

	
}