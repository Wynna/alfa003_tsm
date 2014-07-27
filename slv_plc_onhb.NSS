//Silvy Uni Trigger OnEnter. All triggers.
//Wynna September 2007


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_placeable_i"
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_spawn_i"



void main()
{	
	ACR_TriggerOnHeartbeat();
	object oStudent;
    object oMod = GetModule();
	

	//Elementary Abjuration
	
	if(GetTag(OBJECT_SELF) == "slv_abj100_hb_plc")
		{object oMyTrig = GetObjectByTag("Abjuration1_trig");
		 object oInside = GetLocalObject(oMyTrig, "oInside");
		 int nSchool = GetSilvyUniversitySchool(oMyTrig);
		 string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
		 object oMyChest = GetLocalObject(OBJECT_SELF, "oMyChest");
		 if (GetHasSpellEffect(SPELL_ENDURE_ELEMENTS, oStudent))
				{if (oMyChest == OBJECT_INVALID)
					{oMyChest = GetObjectByTag("slv_abj100_chest");
					 SetLocalObject(OBJECT_SELF, "oMyChest", oMyChest);
					}
				 SetLocked(oMyChest, FALSE);
				 SendMessageToPC(oStudent, "You feel the comforting warmth of your Endure Elements spell protecting you from the cold. The iced shut lock on the chest visibly thaws.");
				 DelayCommand(300.0, SetLocked(oMyChest, TRUE));
				 if((sCurrentCourse == "Elementary Abjuration") && (GetLocalString(oStudent, sCurrentCourse) != sCurrentCourse))
					  {SetLocalString(oStudent, sCurrentCourse, "Elementary Abjuration, chest");
					    }
				 }
				   else
				      {object oMyIceLeaveWP = GetLocalObject(OBJECT_SELF, "oMyIceLeaveWP");
					   if(oMyIceLeaveWP == OBJECT_INVALID)
						   {oMyIceLeaveWP = GetNearestObjectByTag("Abj_All_Quests_IceGo_WP", OBJECT_SELF, 1);
							SetLocalObject(OBJECT_SELF, "oMyIceLeaveWP", oMyIceLeaveWP);
							 }
						SendMessageToPC(oStudent, "The cold pouring off the blocks of ice drives you away.");
				        AssignCommand(oStudent, ActionForceMoveToObject(oMyIceLeaveWP, TRUE, 0.0, 10.0));
				        if((sCurrentCourse == "Elementary Abjuration") && (GetLocalString(oStudent, sCurrentCourse) != sCurrentCourse))
					         {SetLocalString(oStudent, sCurrentCourse, "Elementary Abjuration, chest");
					          
				            }
		
						}
			}
}