//
// Returns TRUE if the student is eligible to take the final exam in this
// professor's school of magic
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

int StartingConditional()
{
    int iResult = 0;
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;

    int nMageLevel = GetSilvyUniversityMageLevel(oStudent);

    if (nMageLevel > 4)
    {
        // is next course for me the final?
        struct SilvyUniversityCourseInfo sInfo;

        sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, oProfessor);
        if (sInfo.sCourseName == SilvyUniversityFinalExam)
        {
            iResult = 1;
            SetSilvyUniversityCourseTokens(sInfo);
        }
    }

    return iResult;
}