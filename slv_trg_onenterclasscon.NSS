//Silvy Uni Trigger OnEnter. All triggers.
//Wynna September 2007


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "bbs_include"

void main()
{	
	ACR_TriggerOnEnter();
	object oStudent = GetEnteringObject();
	object oMaster = GetMaster(oStudent);
    	
    int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
 	 if((GetIsPC(oStudent)) && (nSchool == 0))
    		{SetSilvyUniversitySchool(SilvyUniversitySchoolConjuration, OBJECT_SELF);
			 SetLocalString(oStudent, "sSchool", "Conjuration");
			 }
	//Elementary Conjuration

	
	
						object oMyPlate = GetLocalObject(OBJECT_SELF, "oMyPlate");
						if (oMyPlate == OBJECT_INVALID)
							{oMyPlate = GetObjectByTag("slv_con100_pplate");
							 SetLocalObject(OBJECT_SELF, "oMyPlate", oMyPlate);
							 }
						object oMyCollGate1 = GetLocalObject(OBJECT_SELF, "oMyCollGate1");
					    if (oMyCollGate1 == OBJECT_INVALID)
							{oMyCollGate1 = GetObjectByTag("slv_con100_collbox1");
							 SetLocalObject(OBJECT_SELF, "oMyCollGate1", oMyCollGate1);
							 }
						object oMyCollGate2 = GetLocalObject(OBJECT_SELF, "oMyCollGate2");
						 if (oMyCollGate2 == OBJECT_INVALID)
							{oMyCollGate2 = GetObjectByTag("slv_con100_collbox2");
							 SetLocalObject(OBJECT_SELF, "oMyCollGate2", oMyCollGate2);
							 }
							 
						object oMyConAll = GetLocalObject(OBJECT_SELF, "oMyConAll");
						object oMyGate = GetLocalObject(oMyConAll, "oMyGate");
						if (oMyGate == OBJECT_INVALID)
								{oMyGate = GetObjectByTag("slv_con100_gate");
								 SetLocalObject(oMyConAll, "oMyGate", oMyGate);
								 }
						if(oStudent == GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oMaster))
						    {object oMyPlate = GetLocalObject(OBJECT_SELF, "oMyPlate");
							 SendMessageToPC(oMaster, "You see the pressure plate pulse warningly beneath your familiar, and a sense of rejection that the familiar feels echoes in your own mind.");
						     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_SPELL_BESTOW_CURSE, FALSE), oMyPlate, 5.0);
						     }
							 
						else if(oMaster != OBJECT_INVALID)
							{SendMessageToPC(oMaster, "The pressure plate in the middle of the fenced area erupts in joyful, spinning light. You feel somehow beckoned by the lights.");
						    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_AOE_SHADOW_PLAGUE, FALSE), oMyPlate, 5.0);
						    DelayCommand(0.5, SendMessageToPC(oMaster, "The portcullis rattles downward, away into a slot in the floor."));
						    DestroyObject(oMyGate, 1.1);
							SetLocalObject(oMyConAll, "oMyGate", OBJECT_INVALID);
					        DestroyObject(oMyCollGate1);
							SetLocalObject(OBJECT_SELF, "oMyCollGate1", OBJECT_INVALID);
					        DestroyObject(oMyCollGate2);
							SetLocalObject(OBJECT_SELF, "oMyCollGate2", OBJECT_INVALID);
					        }
								
				     else if((GetIsPC(oStudent) && (GetLocalInt(oStudent, "ConjPlateDown") != 1)))
						    {object oMyPlate = GetLocalObject(OBJECT_SELF, "oMyPlate");
							 SetLocalInt(oStudent, "ConjPlateDown", 1);
						     SetCampaignString("SLV_UNI", "Elementary Conjuration", "Elementary Conjuration", oStudent);
						     if(ACR_RetrieveQuestState("slv_con100", oStudent) == 1)
								{DelayCommand(4.0, ACR_AddPersistentJournalQuestEntry("slv_con100", 2, oStudent, 0, 0, 0, 0));
								}
							SendMessageToPC(oStudent, "The pressure plate sinks and flashes beneath your feet.");
						     DelayCommand(2.0, SendMessageToPC(oStudent, "It glows, brightening and dimming, pulsing with your heartbeat before fading.  You feel recognized as an inhabitant of this plane."));
						     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_SPELL_GLYPH_WARDING, FALSE), oMyPlate, 6.0);
						     }
}