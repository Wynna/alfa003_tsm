// This returns TRUE if the student has taken all the classes but the final
//
#include "silvy_univ_func"
#include "silvy_univ_inc"
int StartingConditional()
{
    int iResult = FALSE;

    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    struct SilvyUniversityCourseInfo sInfo;

    int iInfo = GetSilvyUniversitySchool(oProfessor);
    int iLevel = GetSilvyUniversitySchoolLevel(oStudent, iInfo);

    if (iLevel == 400)
    {
        iResult = TRUE;

    }


    return iResult;
}