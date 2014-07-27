//
// Returns TRUE if the student has the fee to register for the next course
// offered by this professor
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult = 0;

    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    struct SilvyUniversityCourseInfo sInfo;

    sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, oProfessor);

    // Does the student have the fee?
    int nStudentGold = GetGold(oStudent);
    if ((nStudentGold >= sInfo.nFee) || (GetIsDMPossessed(oStudent)))
    {
        SetSilvyUniversityCourseTokens(sInfo);
        iResult = 1;
    }

    return iResult;
}