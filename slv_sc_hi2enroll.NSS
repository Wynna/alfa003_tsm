//
// Returns TRUE if the PC is too high (> lvl 2) to enroll in the University
//

#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult = 0;

    object oStudent = GetPCSpeaker();
    int nMageLevel = GetSilvyUniversityMageLevel(oStudent);

    if (nMageLevel > 2)
    {
        iResult = 1;
    }

    SetCustomToken(SilvyUniversityTuitionToken,
        IntToString(SilvyUniversityTuition));

    return iResult;
}