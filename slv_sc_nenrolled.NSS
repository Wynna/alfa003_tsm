//
// Returns TRUE if student is NOT enrolled in the University.
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult;
    object oProfessor = OBJECT_SELF;
    int nSchool = GetSilvyUniversitySchool(oProfessor);

    iResult = ! IsStudentEnrolledInSilvyUniversity(GetPCSpeaker());
    SetCustomToken(SilvyUniversitySchoolToken, SchoolToString(nSchool));
    return iResult;
}