//
// Execs whatever the students current quest (course) is in this professor's
// magic school
//
#include "silvy_univ_inc"
#include "silvy_univ_func"

void main()
{
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    struct SilvyUniversityCourseInfo sInfo;

    sInfo = GetSilvyUniversityCurrentSchoolCourse(oStudent, oProfessor);

    // Get the quest dialog and start it off...
    ActionStartConversation(oStudent, sInfo.sQuestDialog);
}