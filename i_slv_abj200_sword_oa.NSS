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
	effect eSplatDamage = EffectDamage(2, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL);
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


    if(GetTag(GetModuleItemAcquired()) == "slv_abj200_sword")
        {oStudent = GetItemPossessor(GetObjectByTag("slv_abj200_sword"));
         oItem = GetObjectByTag("slv_abj200_sword");
         }
  string sItem = GetName(oItem);
 	   

				if(GetTag(GetModuleItemAcquired()) == "slv_abj200_sword") 
                    {FloatingTextStringOnCreature("The moment your hand touches the sword, the blade shifts just enough to cut you. It and the other objects vanish!", oStudent, FALSE);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eCut, oStudent);
					DestroyObject(oSwordPLC);
                    SetCampaignString("SLV_UNI", "Standard Abjuration", "Standard Abjuration" + sItem, oStudent);
                    DestroyObject(GetModuleItemAcquired());
					SetLocalObject(oMyTrigAll, "oMySword", OBJECT_INVALID);
					DestroyObject(oShieldPLC);
					SetLocalObject(oMyTrigAll, "oMyShield", OBJECT_INVALID);
					DestroyObject(oSkullPLC);
					SetLocalObject(oMyTrigAll, "oMySkull", OBJECT_INVALID);
					DestroyObject(GetObjectByTag("slv_abj200_shield"));
				    DestroyObject(GetObjectByTag("slv_abj200_skull"));
				    }


}			  