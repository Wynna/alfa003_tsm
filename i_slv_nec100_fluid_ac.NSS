
//Wynna February 2008
#include "silvy_univ_inc"
#include "acr_spawn_i"
#include "acr_db_persist_i"
#include "silvy_univ_func"
void main()
{
             
//OnActivate Script for Necromancy 100 level item
	object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    object oStudent = oUser;
	object oTarget = GetItemActivatedTarget();
	 //Elementary Necromancy

       
		if(oTarget == GetObjectByTag("slv_nec100_corpse"))
	         {SendMessageToPC(oUser, "You empty the bottle of embalming fluid onto the corpse.  The milky liquid flows into every wrinkle and wound of the body.");
	            SetLocalInt(oStudent, "Embalm", 1);
	            if(GetLocalInt(oStudent, "Wash") == 1)
	            {DelayCommand(3.0, SendMessageToPC(oStudent, "The bottle crumbles to dust.  The husk of a body looks...less dried out.  The skin seems more plastic and the stiff joints creak, relaxing where before they had been locked in rigid death."));
	             DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_PULSE_NEGATIVE, FALSE), oTarget));
	            }
	            else
	             {DelayCommand(5.0, SendMessageToPC(oStudent, "The bottle crumbles to dust.  The embalming fluid pools on the skin of the swollen body, refusing to sink further into blood-soaked flesh."));
	             }
			  }
			else
				{SendMessageToPC(oUser, "You empty the bottle of fluid into a milky, oily pool. Nothing happens.");
	           }
          

}