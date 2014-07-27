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
	effect eSplatDamage = EffectDamage(2, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL);
	object oItem;
 	effect eCut = EffectDamage( 1, DAMAGE_TYPE_SLASHING, DAMAGE_POWER_NORMAL, TRUE);


	if(GetTag(GetModuleItemAcquired()) == "slv_tra100_empty")
        {oStudent = GetItemPossessor(GetObjectByTag("slv_tra100_empty"));
         oItem = GetObjectByTag("slv_tra100_empty");
         object oGiver = GetModuleItemLostBy();
		 }	 
     string sItem = GetName(oItem);
 	
				
		//Elementary Transmutation
				if((GetTag(oItem) == "slv_tra100_empty") && (GetTag(oStudent) == "slv_tra100_fountain"))  
					{SendMessageToPC(oGiver, "Water spills into the bucket, filling it to the rim...and immediately begins to disappear in a haze of cold steam. It is evaporating before your eyes!");
					 CreateItemOnObject("slv_tra100_water", oStudent, 1);
					 DestroyObject(oItem);
					 }

}			  