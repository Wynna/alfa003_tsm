//
// Enrolls a student in the University
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

void main()
{
   object oStudent;
   if((GetIsObjectValid(GetLocalObject(OBJECT_SELF, "oRodScribe"))) && ((GetIsDM(OBJECT_SELF)) || (GetIsDMPossessed(OBJECT_SELF))))

    {oStudent = GetLocalObject(OBJECT_SELF, "oStudent");
    }

    else if ((GetTag(OBJECT_SELF) == "003_cr_slv_registrar") || (GetTag(OBJECT_SELF) == "003_cr_slv_registrar_Wand")|| (GetTag(OBJECT_SELF) == "003_cr_slv_librarian")|| (GetTag(OBJECT_SELF) == "003_cr_slv_librarian_Wand"))  
    {oStudent = GetPCSpeaker();
    }

    EnrollSilvyUniversityStudent(oStudent);
}