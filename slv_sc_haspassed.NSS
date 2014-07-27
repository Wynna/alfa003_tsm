//
// Returns TRUE if the student has the paper proving passage of the final exam
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

    int nSchool = GetSilvyUniversitySchool(oProfessor);
    int nCourseLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
    // Does the student have the right paperwork for their level?
     if((GetItemPossessedBy(oStudent, "slv_grad_credit") != OBJECT_INVALID) && (nCourseLevel >= 3))
		
	 
	    {iResult = 1;}
		
    return iResult;
}