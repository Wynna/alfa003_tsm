//Silvy Uni Item onAcquire.  
//Wynna February 2008
 

#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_items_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_db_persist_i"


void main()
{	
	object oStudent;
	object oGiver;
    object oMod = GetModule();
	object oShieldPLC = GetLocalObject(OBJECT_SELF, "oShieldPLC");
	if(oShieldPLC == OBJECT_INVALID)
		{oShieldPLC = GetObjectByTag("slv_abj200_plc_shield", 0);
		}
   	object oSkullPLC = GetLocalObject(OBJECT_SELF, "oSkullPLC");
	if(oSkullPLC == OBJECT_INVALID)
		{oSkullPLC = GetObjectByTag("slv_abj200_plc_skull", 0);
		}
	object oSwordPLC = GetLocalObject(OBJECT_SELF, "oSwordPLC");
	if(oSwordPLC == OBJECT_INVALID)
		{oSwordPLC = GetObjectByTag("slv_abj200_plc_sword", 0);
		}
	object oMyTrigAll = GetLocalObject(oShieldPLC, "oMyTrigAll");
	if(oMyTrigAll == OBJECT_INVALID)
		{oMyTrigAll = GetObjectByTag("Abj_All", 0);
		}
	
	object oItem;
 	effect eCut = EffectDamage( 1, DAMAGE_TYPE_SLASHING, DAMAGE_POWER_NORMAL, TRUE);
	object oProctorWP = GetWaypointByTag("Abj_200_Proc_MM");

    if(GetTag(GetModuleItemAcquired()) == "slv_abj200_shield")
        {oStudent = GetItemPossessor(GetObjectByTag("slv_abj200_shield", 0));
         oItem = GetObjectByTag("slv_abj200_shield");
         }

 
     string sItem = GetName(oItem);
 	
//Standard Abjuration:
          
             if(GetTag(GetModuleItemAcquired()) == "slv_abj200_shield")
                    {object oProctor = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_invis", GetLocation(oProctorWP));
				    FloatingTextStringOnCreature("The moment you pick up the shield it and the other objects vanish!  You feel an overpowering sensation of danger as well as a conviction that you are protected from it.", oStudent, FALSE);
                    SendMessageToPC(oStudent, "Your hands and lips move in the casting of a Shield spell upon yourself.");
					ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSpellImmunity(SPELL_MAGIC_MISSILE), oStudent, 30.0f);
					ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_SPELL_SHIELD), oStudent, 30.0f);
					DestroyObject(oShieldPLC);
                    AssignCommand(oStudent, ActionCastSpellAtObject(SPELL_SHIELD, oStudent, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
                    SetCampaignString("SLV_UNI", "Standard Abjuration", "Standard Abjuration", oStudent);
                    DestroyObject(GetModuleItemAcquired());
					SetLocalObject(oMyTrigAll, "oMyShield", OBJECT_INVALID);
					DestroyObject(oSkullPLC);
					SetLocalObject(oMyTrigAll, "oMySkull", OBJECT_INVALID);
					DestroyObject(oSwordPLC);
					SetLocalObject(oMyTrigAll, "oMySword", OBJECT_INVALID);
					DestroyObject(GetObjectByTag("slv_abj200_sword"));
				    DestroyObject(GetObjectByTag("slv_abj200_skull"));
				    DelayCommand(5.0, AssignCommand(oProctor, ActionCastSpellAtObject(SPELL_MAGIC_MISSILE, oStudent, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
				    DelayCommand(7.0, ACR_AddPersistentJournalQuestEntry("slv_abj200", 2, oStudent, 0, 0, 0, 0));
		       }
					

}			  