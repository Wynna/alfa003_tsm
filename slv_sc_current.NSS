//
// Returns true if the student is currently taking a course in this
// school.  Sets the course name custom token to the name of the course
// the student is registered for.
// 

#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult = 0;
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    int nSchool;
    string sCurrentCourse;

    nSchool = GetSilvyUniversitySchool(oProfessor);
    sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent,
        nSchool);
	 

    if (sCurrentCourse != "")
    {
        iResult = 1;
        SetCustomToken(SilvyUniversityCourseNameToken, sCurrentCourse);
    }

    return iResult;
}