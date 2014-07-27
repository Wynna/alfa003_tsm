//
// Returns TRUE if the student's current course in this professor's school of
// magic is not offered by this particular professor.
//

#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult = 0;

    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;

    int nSchool = GetSilvyUniversitySchool(oProfessor);
    int nStudentLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);

    // Get the name of the course I'm currently registered for in this school
    string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(
        oStudent, nSchool);

    // Get the course offered by this professor at my level
    struct SilvyUniversityCourseInfo sInfo;
    sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, oProfessor);

    if (sCurrentCourse != sInfo.sCourseName)
    {
        // Taking a course but not the one this professor gives
        SetCustomToken(SilvyUniversitySchoolToken, SchoolToString(nSchool));
        iResult = 1;
    }

    return iResult;
}