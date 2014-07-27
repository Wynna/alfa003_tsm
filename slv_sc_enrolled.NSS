//
// Returns True if a student is currently enrolled in the university
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult;

    iResult = IsStudentEnrolledInSilvyUniversity(GetPCSpeaker());
    SetCustomToken(SilvyUniversityTuitionToken,
        IntToString(SilvyUniversityTuition));

    return iResult;
}