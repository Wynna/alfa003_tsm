//
// This AT script unadvances the student in the Professor's School as necessary,
// including removing XP granted on previously successful completion.
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
		   sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, oProfessor);
           UnadvanceSilvyUniversityStudent(oStudent, sInfo);
           sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
           SetCampaignString("SLV_UNI", sCurrentCourse, "", oStudent);
           SetCampaignString("SLV_UNI", sCurrentCourse + "Info", "Record erased by " + GetName(OBJECT_SELF), oStudent);
           if(GetTag(OBJECT_SELF) == "003_cr_slv_registrar")  
				{ExecuteScript("slv_at_unregistr", oProfessor);
	        	 }




}