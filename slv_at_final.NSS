//
// This handles a final exam.  The fee is deducted, spellcraft check made, and
// if successful, studentadvances, gets the XP and the scroll.
//

#include "silvy_univ_inc"
#include "silvy_univ_func"

void main()
{
    object oStudent = GetPCSpeaker();
    object oProfessor = OBJECT_SELF;
    struct SilvyUniversityCourseInfo sInfo;

    sInfo = GetSilvyUniversityNextSchoolCourse(oStudent, oProfessor);

    // We can check, but it should be the Final Exam...
    if (sInfo.sCourseName != SilvyUniversityFinalExam)
    {
        SpeakString("Final exam name is " + sInfo.sCourseName);
        return;
    }

    // Take the exam fee
    TakeGoldFromCreature(sInfo.nFee, oStudent, TRUE);

    // Always pass, for testing...

    int nRoll = d20();
    int nRank = GetSkillRank(SKILL_SPELLCRAFT, oStudent);
    int nResult = nRoll + nRank;

    if (nResult >= sInfo.nDC)
    {
        // We advance the student by 'registering' for the final (to bump the
        // student's current course level, and then actually calling advance.
        SpeakString("Congratulations!  You've passed the Final Exam.");

        GraduateSilvyUniversityStudent(oStudent, sInfo);
    }

    else
    {
        SpeakString("I'm sorry.  You failed the Final Exam.  You may try " +
            "again anytime you like.");
    }
}