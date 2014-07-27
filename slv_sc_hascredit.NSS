//
// Returns TRUE if the student has the special credit dispensation to skip the next course
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
     if(((GetItemPossessedBy(oStudent, "slv_dean_credit_01") != OBJECT_INVALID) && (nCourseLevel == 0))
		||	((GetItemPossessedBy(oStudent, "slv_dean_credit_02") != OBJECT_INVALID) && (nCourseLevel == 100))
		||	((GetItemPossessedBy(oStudent, "slv_dean_credit_03") != OBJECT_INVALID) && (nCourseLevel == 200))
		||	((GetItemPossessedBy(oStudent, "slv_dean_credit_04") != OBJECT_INVALID) && (nCourseLevel == 300)))
		
	 
	    {iResult = 1;}
		
    return iResult;
}