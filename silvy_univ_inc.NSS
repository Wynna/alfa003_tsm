/*******************************************************************************
 * Name: silvy_univ_inc
 * Type: Silverymoon Include File
 * ---
 * Author: Cereborn
 * Date: 11/28/03
 * ---
 * Contains constants and functions prototypes used in the Silverymoon
 * University System
 *
 ******************************************************************************/

#include "acr_db_persist_i" 

//- External Constants -//

const int SilvyUniversityTuition = 50; // Gold Pieces

// Magic School Constants
const int SilvyUniversitySchoolUndefined = 0;
const int SilvyUniversitySchoolAbjuration = 1;
const int SilvyUniversitySchoolConjuration = 2;
const int SilvyUniversitySchoolDivination = 3;
const int SilvyUniversitySchoolEnchantment = 4;
const int SilvyUniversitySchoolEvocation = 5;
const int SilvyUniversitySchoolIllusion = 6;
const int SilvyUniversitySchoolNecromancy = 7;
const int SilvyUniversitySchoolTransmutation = 8;

const int SilvyUniversityTuitionToken = 801;
const int SilvyUniversityFeeToken = 802;
const int SilvyUniversityCourseNameToken = 803;
const int SilvyUniversitySchoolToken = 804;
const int SilvyUniversityCourseHourToken = 805;

// Special 'sentinel' constants
const int SilvyUniversityGraduateLvl = 500;
const string SilvyUniversityCourseComplete = "";
const string SilvyUniversityFinalExam = "Final Exam";



//- Aggregate Types -//

struct SilvyUniversityCourseInfo
{
    string sCourseName;
    string sQuestDialog; // Not used for final exams
    string sScroll;
    int nSchool;
    int nCourseLevel;
    int nFee;
    int nDC; // no longer used for final exams. Used to offer choice of dice roll or quest. Now all quest.
    int nXP;
	int nHour;
};



//- Function Prototypes -//

//
// SetSilvyUniversitySchool() - This function is used to specify the school
// to which a professor belongs.  It is normally called in the onSpawn event
// handler for the professor NPC.
//
void SetSilvyUniversitySchool(int nSchool, object oProfessor=OBJECT_SELF);

//
// SetSilvyUniversityCourse() - This function describes a course taught by a
// specific professor NPC.  It is normally called in the onSpawn event handler
// for the professor NPC, once for each of the 4 course levels.
//
void SetSilvyUniversityCourse(string sCourseName, int nCourseLevel, int nFee,
    string sQuestDialog, int nXP,  int nHour, string sScroll, int nDC=0,
    object oProfessor=OBJECT_SELF);

//
// SetSilvyUniversityFinal() - This function is called to provide the data for
// the Final Exam given by a specific NPC professor.  It is normally called in
// the onSpawn event handler for the professor NPC.  Note that this function is
// just a wrapper that calls SetSilvyUniversityCourse() with a sCourseName
// argument of "Final Exam".
//
void SetSilvyUniversityFinal(int nFee, int nDC, int nXP, int nHour, string sScroll,
    object oProfessor=OBJECT_SELF);

//
// GetSilvyUniversitySchool() - Use this to retrieve the School of Magic with
// which oProfessor is affiliated.
//
int GetSilvyUniversitySchool(object oProfessor=OBJECT_SELF);

//
// GetSilvyUniversityCourse() - This function returns all the data for the
// course taught by oProfessor at nCourseLevel.
//
struct SilvyUniversityCourseInfo GetSilvyUniversityCourse(int nCourseLevel,
    object oProfessor=OBJECT_SELF);

//
// GetSilvyUniversityFinal() - This function returns all the data for the
// Final given by oProfessor. It is just a wrapper around
// GetSilvyUniversityCourse(), called with a course level of
// 'SilvyUniversityGraduateLvl'.
//
struct SilvyUniversityCourseInfo GetSilvyUniversityFinal(
    object oProfessor=OBJECT_SELF);

//
// GetSilvyUniversityCurrentSchoolCourse() - This function finds oStudent's
// current level in the School of Magic taught by oProfessor, and then
// returns the data for the course offered by oProfessor at that level.
//
struct SilvyUniversityCourseInfo GetSilvyUniversityCurrentSchoolCourse(
   object oStudent, object oProfessor);

//
// GetSilvyUniversityNextSchoolCourse() - This function finds oStudent's
// current level in the School of Magic taught by oProfessor, and then
// returns the data for the course offered by oProfessor at the next level up
// from the student's current level.
//
struct SilvyUniversityCourseInfo GetSilvyUniversityNextSchoolCourse(
   object oStudent, object oProfessor);

//
// GetSilvyUniversityPreviousSchoolCourse() - This function finds oStudent's
// current level in the School of Magic taught by oProfessor, and then
// returns the data for the course offered by oProfessor at the previous level.
//
struct SilvyUniversityCourseInfo GetSilvyUniversityPreviousSchoolCourse(
   object oStudent, object oProfessor);


//
// EnrollSilvyUniversityStudent() - This function deducts the University tuition
// from oStudent, and gives a Student ID and Code of Conduct item. It also
// sets a Persistent Variable indicated that the student is enrolled.
//
void EnrollSilvyUniversityStudent(object oStudent);

//
// IsStudentEnrolledInSilvyUniversity() - This function returns TRUE if
// oStudent has enrolled in the University, FALSE otherwise.
//
int IsStudentEnrolledInSilvyUniversity(object oStudent);

//
// RegisterSilvyUniversityStudent() - Use this function to register oStudent
// for the course described by sInfo. This function will increment oStudent's
// course level within the school to level of the course registered for.
//
void RegisterSilvyUniversityStudent(object oStudent,
    struct SilvyUniversityCourseInfo sInfo);

//
// GetSilvyUniversityCurrentSchoolRegistration() - This function returns the
// name of the course oStudent is registered in for nSchool (or ""
// if not registered).
//
string GetSilvyUniversityCurrentSchoolRegistration(object oStudent,
    int nSchool);

//
// AdvanceSilvyUniversityStudent() - This function sets oStudent's currently
// registered course to 'SilvyUniversityCourseComplete', awards XP and a scroll
// if one has been specified.  Note that this function does NOT increment
// oStudent's course level within the school (that happens when a student
// registers for a course; the student's level is advanced to the level of
// the course at that time).
//
void AdvanceSilvyUniversityStudent(object oStudent,
    struct SilvyUniversityCourseInfo sInfo);

//
// UnadvanceSilvyUniversityStudent() - This function sets oStudent's last recorded
// registered course to 'SilvyUniversityCourseIncomplete', revokes XP IF it had
// been awarded and sets the persistent tag on this class back to its unadvanced
// status.  Note that this function does NOT deccrement
// oStudent's course level within the school (that happens when the registration
// function is used to get the PREVIOUS class and then applied).
//
void UnadvanceSilvyUniversityStudent(object oStudent,
    struct SilvyUniversityCourseInfo sInfo);

//
// GraduateSilvyUniversityStudent() - This function is called when oStudent
// passes a final exam.  sInfo is the course data for the final.  It calls
// AdvanceSilvyUniversityStudent(), sets the student's course level to
// 'SilvyUniversityGraduateLvl' (since the final wasn't actually registered
// for), and creates and gives oStudent a diploma from the appropriate school.
//
void GraduateSilvyUniversityStudent(object oStudent,
    struct SilvyUniversityCourseInfo sInfo);

//
// GetSilvyUniversitySchoolLevel() - This function retrieves oStudent's current
// course level in the specified school. Course levels have the following
// interpretation:
//    0 - Never registered for a course in this school
//  100 - Currently doing or completed a 100 level course in this school
//  200 - Currently doing or completed a 200 level course in this school
//  300 - Currently doing or completed a 300 level course in this school
//  400 - Currently doing or completed a 400 level course in this school
//  500 - Successfully completed a Final Exam for this school
//
int GetSilvyUniversitySchoolLevel(object oStudent, int nSchool);

//
// SchoolToString() - Use this function to get a string representation of a
// Magic School integer constant.  For example: SchoolToString(
// SilvyUniversitySchoolIllusion) returns "Illusion".
//
string SchoolToString(int nSchool);

//
// SetSilvyUniversityCourseTokens() - Custom tokens are used to set the School
// Name, Course Name, and Course Fee in the slv_professor dialog.  This function
// sets all the tokens given a course description (sInfo).
//

void SetSilvyUniversityCourseTokens(struct SilvyUniversityCourseInfo sInfo);

//
// GetSilvyUniversityMageLevel() - This is a utility function that returns a
// character's highest wizard or sorceror level.
//
int GetSilvyUniversityMageLevel(object oStudent);



//- Internal Constants -//

// Item ResRefs for diplomas, ids, etc.
const string SilvyUniversityCodeOfConductItem = "slv_codeofconduct";
const string SilvyUniversityStudentIDItem = "slv_studentid";
const string SilvyUniversityAbjurationDiplomaItem = "slv_diploma_abj";
const string SilvyUniversityConjurationDiplomaItem = "slv_diploma_con";
const string SilvyUniversityDivinationDiplomaItem = "slv_diploma_div";
const string SilvyUniversityEnchantmentDiplomaItem = "slv_diploma_enc";
const string SilvyUniversityEvocationDiplomaItem = "slv_diploma_evo";
const string SilvyUniversityIllusionDiplomaItem = "slv_diploma_ill";
const string SilvyUniversityNecromancyDiplomaItem = "slv_diploma_nec";
const string SilvyUniversityTransmutationDiplomaItem = "slv_diploma_tra";

// Local Variable Name Constants
const string SilvyUniversitySchoolVarName = "slvSchoolName";

const string SilvyUniversityName100VarName = "slv100Name";
const string SilvyUniversityFee100VarName = "slv100Fee";
const string SilvyUniversityDlog100VarName = "slv100QuestDlog";
const string SilvyUniversityScroll100VarName = "slv100Scroll";
const string SilvyUniversityXP100VarName = "slv100XP";
const string SilvyUniversityHour100VarName = "slv100Hour";
const string SilvyUniversityDC100VarName = "slv100DC";

const string SilvyUniversityName200VarName = "slv200Name";
const string SilvyUniversityFee200VarName = "slv200Fee";
const string SilvyUniversityDlog200VarName = "slv200QuestDlog";
const string SilvyUniversityScroll200VarName = "slv200Scroll";
const string SilvyUniversityXP200VarName = "slv200XP";
const string SilvyUniversityHour200VarName = "slv200Hour";
const string SilvyUniversityDC200VarName = "slv200DC";

const string SilvyUniversityName300VarName = "slv300Name";
const string SilvyUniversityFee300VarName = "slv300Fee";
const string SilvyUniversityDlog300VarName = "slv300QuestDlog";
const string SilvyUniversityScroll300VarName = "slv300Scroll";
const string SilvyUniversityXP300VarName = "slv300XP";
const string SilvyUniversityHour300VarName = "slv300Hour";
const string SilvyUniversityDC300VarName = "slv300DC";

const string SilvyUniversityName400VarName = "slv400Name";
const string SilvyUniversityFee400VarName = "slv400Fee";
const string SilvyUniversityDlog400VarName = "slv400QuestDlog";
const string SilvyUniversityScroll400VarName = "slv400Scroll";
const string SilvyUniversityXP400VarName = "slv400XP";
const string SilvyUniversityHour400VarName = "slv400Hour";
const string SilvyUniversityDC400VarName = "slv400DC";

const string SilvyUniversityName500VarName = "slv500Name";
const string SilvyUniversityFee500VarName = "slv500Fee";
const string SilvyUniversityDlog500VarName = "slv500QuestDlog";
const string SilvyUniversityScroll500VarName = "slv500Scroll";
const string SilvyUniversityXP500VarName = "slv500XP";
const string SilvyUniversityHour500VarName = "slv500Hour";
const string SilvyUniversityDC500VarName = "slv500DC";

// Persistent Variable Names
const string SilvyUniversityDBName = "SilvyU_Registrar";
const string SilvyUniversityEnrolledVarName = "slvEnrolled";
const string SilvyUniversityAbjurationLvlVarName = "slvAbjLvl";
const string SilvyUniversityConjurationLvlVarName = "slvConLvl";
const string SilvyUniversityDivinationLvlVarName = "slvDivLvl";
const string SilvyUniversityEnchantmentLvlVarName = "slvEncLvl";
const string SilvyUniversityEvocationLvlVarName = "slvEvoLvl";
const string SilvyUniversityIllusionLvlVarName = "slvIllLvl";
const string SilvyUniversityNecromancyLvlVarName = "slvNecLvl";
const string SilvyUniversityTransmutationLvlVarName = "slvTraLvl";

const string SilvyUniversityAbjurationCourseVarName = "slvAbjQst";
const string SilvyUniversityConjurationCourseVarName = "slvConQst";
const string SilvyUniversityDivinationCourseVarName = "slvDivQst";
const string SilvyUniversityEnchantmentCourseVarName = "slvEncQst";
const string SilvyUniversityEvocationCourseVarName = "slvEvoQst";
const string SilvyUniversityIllusionCourseVarName = "slvIllQst";
const string SilvyUniversityNecromancyCourseVarName = "slvNecQst";
const string SilvyUniversityTransmutationCourseVarName = "slvTraQst";