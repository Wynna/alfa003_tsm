//
// Returns TRUE if the student is too low a level for the next course they
// could take in this school
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult = 0;
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;

    // Find the student's current mage level
    int nMageLevel = GetSilvyUniversityMageLevel(oStudent);

    // find the level of the next course the student could take in this school
    struct SilvyUniversityCourseInfo sInfo = GetSilvyUniversityNextSchoolCourse(
        oStudent, oProfessor);

    switch (sInfo.nCourseLevel)
    {

    case 100:
        iResult = 0;
        break;

    case 200:
        if ((nMageLevel < 2)  && (GetLocalInt(oStudent, "HallPass") != 1))
        {
            iResult = 1;
        }
        break;

    case 300:
        if ((nMageLevel < 3)   && (GetLocalInt(oStudent, "HallPass") != 1))
        {
            iResult = 1;
        }
        break;

    case 400:
        if ((nMageLevel < 4)   && (GetLocalInt(oStudent, "HallPass") != 1))
        {
            iResult = 1;
        }
        break;

    case 500:
        if ((nMageLevel < 5)  && (GetLocalInt(oStudent, "HallPass") != 1))
        {
            iResult = 1;
        }
        break;

    default:
        iResult = 0;
        break;

    }

    return iResult;
}