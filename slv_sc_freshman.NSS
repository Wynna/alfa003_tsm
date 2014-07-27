//
// Returns TRUE if the student is NOT currently taking a course in this school
// and hasn't reached graduate level in this school.
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{

    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    int nSchool = GetSilvyUniversitySchool(oProfessor);
    string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(
        oStudent, nSchool);


        // Look up course level for the *next* level up from the student's
        // current level.  Student is level 100 when registered for or completed
        // a level 100 course.
        int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
        if (((nCourseLevel >= 100) && (sCurrentCourse == ""))|| (nCourseLevel >=200))
        {
            return TRUE;
        }
        else

        {return FALSE;
        }





}