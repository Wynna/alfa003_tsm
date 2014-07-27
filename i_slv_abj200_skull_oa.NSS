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
	
	effect eSplatDamage = EffectDamage(2, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL);
    object oItem;
 	effect eCut = EffectDamage( 1, DAMAGE_TYPE_SLASHING, DAMAGE_POWER_NORMAL, TRUE);


   if(GetTag(GetModuleItemAcquired()) == "slv_abj200_skull")
        {oStudent = GetItemPossessor(GetObjectByTag("slv_abj200_skull"));
         oItem = GetObjectByTag("slv_abj200_skull");
         }

	 
     string sItem = GetName(oItem);
 	
//Standard Abjuration:
          
				if(GetTag(GetModuleItemAcquired()) == "slv_abj200_skull") 
                    {object oMask = CreateItemOnObject("slv_abj200_mask", oStudent, 1);
                    AssignCommand(oStudent, ActionEquipItem(oMask, INVENTORY_SLOT_HEAD));
					FloatingTextStringOnCreature("The moment your hand touches the skull it turns into the mask of a clown's face. The mask affixes itself to your face. The other objects vanish!", oStudent, FALSE);
                    DestroyObject(oSkullPLC);
                    SetCampaignString("SLV_UNI", "Standard Abjuration", "Standard Abjuration" + sItem, oStudent);
                    DestroyObject(GetModuleItemAcquired());
					SetLocalObject(oMyTrigAll, "oMySkull", OBJECT_INVALID);
					DestroyObject(oShieldPLC);
					SetLocalObject(oMyTrigAll, "oMyShield", OBJECT_INVALID);
					DestroyObject(oSwordPLC);
					SetLocalObject(oMyTrigAll, "oMySword", OBJECT_INVALID);
				    DestroyObject(GetObjectByTag("slv_abj200_shield"));
				    DestroyObject(GetObjectByTag("slv_abj200_sword"));
				    }

			
}			  