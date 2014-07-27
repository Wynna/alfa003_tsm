//
// Returns TRUE if the student is NOT currently taking a course in this school
// and hasn't reached graduate level in this school.
//
#include "silvy_univ_inc" 
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult = 0;

    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    int nSchool = GetSilvyUniversitySchool(oProfessor);
    string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(
        oStudent, nSchool);

    if (sCurrentCourse == "")
    {
        // Not currently taking a course in this school.

        // Look up course level for the *next* level up from the student's
        // current level.  Student is level 100 when registered for or completed
        // a level 100 course.
        int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool) + 100;
        if (nCourseLevel >= SilvyUniversityGraduateLvl)
        {
            iResult = 0;
        }

        else
        {
            struct SilvyUniversityCourseInfo sInfo;
            sInfo = GetSilvyUniversityCourse(nCourseLevel, oProfessor);

            SetSilvyUniversityCourseTokens(sInfo);
            iResult = 1;
        }

    }

    return iResult;
}