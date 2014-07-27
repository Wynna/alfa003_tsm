//
// Erases all variables for all courses in all schools and sets the student back to just an enrolled
// freshman.
//
#include "silvy_univ_inc"
#include "silvy_univ_func"



void main()
{
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    object oRodScribe = GetLocalObject(OBJECT_SELF, "oRodScribe");
    int nSchool;
    string sCurrentCourse;
    struct SilvyUniversityCourseInfo sInfo;
    int nCollege = 1;
    if((GetIsObjectValid(GetLocalObject(OBJECT_SELF, "oRodScribe"))) && ((GetIsDM(OBJECT_SELF)) || (GetIsDMPossessed(OBJECT_SELF)) ))
    {oStudent = GetLocalObject(OBJECT_SELF, "oStudent");
     while(nCollege < 9)
        {if(nCollege == 1)
            {ExecuteScript("slv_uabj_spwn", oRodScribe);
             }
             {}
          if(nCollege == 2)
            {ExecuteScript("slv_ucon_spwn", oRodScribe);
             }
             {}
          if(nCollege == 3)
            {ExecuteScript("slv_udiv_spwn", oRodScribe);
             }
             {}
          if(nCollege == 4)
            {ExecuteScript("slv_uench_spwn", oRodScribe);
             }
             {}
          if(nCollege == 5)
            {ExecuteScript("slv_uevoc_spwn", oRodScribe);
             }
             {}
          if(nCollege == 6)
            {ExecuteScript("slv_uill_spwn", oRodScribe);
             }
             {}
          if(nCollege == 7)
            {ExecuteScript("slv_unec_spwn", oRodScribe);
             }
             {}
          if(nCollege == 8)
            {ExecuteScript("slv_utrn_spwn", oRodScribe);
             }
             {}

          ExecuteScript("slv_setlocpers4", OBJECT_SELF);
          ExecuteScript("slv_unisetundone", OBJECT_SELF);
          nSchool = GetSilvyUniversitySchool(oRodScribe);
          int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
          sCurrentCourse = GetLocalString(oRodScribe, "slv" + IntToString(nCourseLevel) + "Name");
          ACR_SetPersistentString(oStudent, sCurrentCourse, "Nuked by Rod Group");
          sInfo = GetSilvyUniversityPreviousSchoolCourse(oStudent, oRodScribe);
          RegisterSilvyUniversityStudent(oStudent, sInfo);
          SendMessageToPC(oProfessor, "End Loop #" + IntToString(nCollege) + ".  HallPass = " + IntToString(GetLocalInt(oStudent, "HallPass")) + ". nSchool = " +IntToString(nSchool) + ".  nCourseLevel = " +IntToString(nCourseLevel) + ".  sCurrentCourse = " + sCurrentCourse);
          nCollege ++;

        }
      }
      else
        {
        }




}