//
// Unregisters a student for the course offered by this professor at the
// student's level in this magic school and then sets the student's level to the
// previous course
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

void main()
{
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    int nSchool;
    string sCurrentCourse;
    struct SilvyUniversityCourseInfo sInfo;
    string sSchool;
	string sTime100;
	string sTime200;
	string sTime300;
	string sTime400; 
	int nCollege = 1;
 
		if(GetTag(OBJECT_SELF) == "003_cr_slv_registrar")
			{string sSchool = GetLocalString(OBJECT_SELF, "sSchool");
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
        sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
        int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
        SetCampaignString("SLV_UNI", sCurrentCourse + "Info", "Unregistered by " + GetName(OBJECT_SELF), oStudent);
        sInfo = GetSilvyUniversityPreviousSchoolCourse(oStudent, oProfessor);
        RegisterSilvyUniversityStudent(oStudent, sInfo);
       	 

			



}