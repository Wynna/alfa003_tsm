//Silvy Uni Trigger OnEnter for NPCs.  
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
    object oMod = GetModule();
		
	
				
//Elementary Illusion

		if((GetName(OBJECT_SELF) == "Ill_Boy_Destroy") && (GetLocalInt(oStudent, "Destroy") == 1))
			{DestroyObject(oStudent, 3.0);
			}
}