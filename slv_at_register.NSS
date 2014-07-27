//
// Registers a student for the course offered by this professor at the
// student's level in this magic school and then execs that quest
//
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_db_persist_i"

void main()
{
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    int nSchool;
    string sCurrentCourse;
    struct SilvyUniversityCourseInfo sInfo;
    int nCollege = 1;
    string sSchool;
	string sTime100;
	string sTime200;
	string sTime300;
	string sTime400; 
	
	  	 
	if(GetTag(OBJECT_SELF) == "003_cr_slv_registrar")
		{sSchool = GetLocalString(OBJECT_SELF, "sSchool");
		 if(sSchool == "Abjuration")
		 	{SetSilvyUniversitySchool(SilvyUniversitySchoolAbjuration);
   		     }
	     if(sSchool == "Conjuration")
		 	{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration);
   		     }
	     if(sSchool == "Divination")
		 	{SetSilvyUniversitySchool(SilvyUniversitySchoolDivination);
   		     }
	     if(sSchool == "Enchantment")
		 	{SetSilvyUniversitySchool(SilvyUniversitySchoolEnchantment);
   		     }
	     if(sSchool == "Evocation")
		 	{SetSilvyUniversitySchool(SilvyUniversitySchoolEvocation);
   		     }
	     if(sSchool == "Illusion")
		 	{SetSilvyUniversitySchool(SilvyUniversitySchoolIllusion);
   		     }
	     if(sSchool == "Necromancy")
		 	{SetSilvyUniversitySchool(SilvyUniversitySchoolNecromancy);
   		     }
	     if(sSchool == "Transmutation")
		 	{SetSilvyUniversitySchool(SilvyUniversitySchoolTransmutation);
   		     }
		}
    
	
        sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, oProfessor);
        RegisterSilvyUniversityStudent(oStudent, sInfo);
        nSchool = GetSilvyUniversitySchool(oProfessor);
        sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
        sSchool = SchoolToString(nSchool);
		int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
        SetCampaignString("SLV_UNI", sCurrentCourse + "Info", "Registered by " + GetName(OBJECT_SELF), oStudent);
        sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, oProfessor);
        if(GetTag(OBJECT_SELF) != "003_cr_slv_registrar")
			{if(GetLocalInt(oStudent, "Startdlg2") != 1)
			 	{ActionStartConversation(oStudent, sInfo.sQuestDialog);
				}
			else {SetLocalInt(oStudent, "Startdlg2", 0);
				}
			}
		


    // Take the registration fee
    if(GetLocalInt(oStudent, "HallPass") != 1)
        {TakeGoldFromCreature(sInfo.nFee, oStudent, TRUE);
         }
       {}

	if((GetTag(OBJECT_SELF) == "003_cr_slv_registrar")  && (GetLocalInt(OBJECT_SELF, "Uni_Enroll") == 0))
			{ExecuteScript("slv_at_advance", OBJECT_SELF);
			}
	else if (GetTag(OBJECT_SELF) == "003_cr_slv_registrar") 
		{SetLocalInt(OBJECT_SELF, "Uni_Enroll", 0);
		 {if(nCourseLevel == 100)
				{DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_enroll_01"));
				}
			 if(nCourseLevel == 200)
				{DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_enroll_02"));
				}
			 if(nCourseLevel == 300)
				{DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_enroll_03"));
				}
			 if(nCourseLevel == 400)
				{DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_enroll_04"));
				}
			 
			}
		}

}