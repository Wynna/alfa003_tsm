//
// Returns TRUE if the student has the University Tuition
//
#include "silvy_univ_inc"

int StartingConditional()
{
    int iResult = FALSE;
    int nPlayerGold;
    object oStudent = GetPCSpeaker();

    nPlayerGold = GetGold(oStudent);
    if (nPlayerGold >= SilvyUniversityTuition)
    {
        iResult = TRUE;
    }
    return iResult;
}