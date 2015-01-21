//
// Returns TRUE if the student has already graduated from this school
//
#include "silvy_univ_func"
#include "silvy_univ_inc"

int StartingConditional()
{
    int iResult = 0;

    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    string sMostRecentRegistered;
    struct SilvyUniversityCourseInfo sInfo;
    sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, oProfessor);
    sMostRecentRegistered = GetSilvyUniversityCurrentSchoolRegistration(
        oStudent, sInfo.nSchool);

    if (sInfo.nCourseLevel >= SilvyUniversityGraduateLvl)
    {
        iResult = 1;
    }

    SetCustomToken(SilvyUniversitySchoolToken, SchoolToString(sInfo.nSchool));
    return iResult;
}