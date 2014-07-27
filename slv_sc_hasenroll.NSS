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

   // Does the student have the right paperwork?
     if((GetItemPossessedBy(oStudent, "slv_dean_enroll_01") != OBJECT_INVALID) 
		||	(GetItemPossessedBy(oStudent, "slv_dean_enroll_02") != OBJECT_INVALID) 
		||	(GetItemPossessedBy(oStudent, "slv_dean_enroll_03") != OBJECT_INVALID) 
		||	(GetItemPossessedBy(oStudent, "slv_dean_enroll_04") != OBJECT_INVALID)) 
		
	 
	    {iResult = 1;}
		
    return iResult;
}