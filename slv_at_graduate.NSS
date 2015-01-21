// 
// This AT script advances the student in the Professor's School
// 
 
#include "silvy_univ_inc"
#include "silvy_univ_func"

void main()  
{
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    string sSchool;
	int nTime100;
	int nTime200;
	int nTime300;
	int nTime400;
	int nSchool;
	string sCurrentCourse;
    struct SilvyUniversityCourseInfo sInfo;
    int nCollege = 1;
  
	 	 
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
    
	    nSchool = GetSilvyUniversitySchool(oProfessor);
        sSchool = SchoolToString(nSchool);
		int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
        sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
        SetCampaignString("SLV_UNI", sCurrentCourse, sCurrentCourse, oStudent);
        SetCampaignString("SLV_UNI", "Senior " +sSchool + "Info", "Passed by " + GetName(OBJECT_SELF), oStudent);
        SetCampaignString("SLV_UNI", "Graduation " +sSchool + "Info", "Graduated by " + GetName(OBJECT_SELF), oStudent);
         DestroyObject(GetItemPossessedBy(oStudent, "slv_grad_credit"));
		object oDiploma = CreateItemOnObject("slv_grad_diploma", oStudent, 1);
		SetFirstName(oDiploma, GetName(oDiploma) + " - " + sSchool + " - " + GetName(oStudent));
		if(GetTag(OBJECT_SELF) == "003_cr_slv_registrar")
			{if(nCourseLevel == 100)
				{DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_credit_01"));
				}
			 if(nCourseLevel == 200)
				{DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_credit_02"));
				}
			 if(nCourseLevel == 300)
				{DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_credit_03"));
				}
			 if(nCourseLevel == 400)
				{DestroyObject(GetItemPossessedBy(oStudent, "slv_dean_credit_04"));
				}
			 
			}
		sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, oProfessor);
        GraduateSilvyUniversityStudent(oStudent, sInfo);
           




}