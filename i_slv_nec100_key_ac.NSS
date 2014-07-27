
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
	object oCrank = GetObjectByTag("slv_nec100_crank");
	object oTarget = GetItemActivatedTarget();
	
 //Elementary Necromancy

        if(oTarget == oCrank)
	       {SendMessageToPC(oUser, "The key unlocks a mechanism within the wheel.");
	         CreateItemOnObject("slv_nec100_key", oCrank, 1);
	         DestroyObject(oItem);
	         if(GetLocalInt(oStudent, "Wash") != 1)
	            {SetLocalInt(oStudent, "Wash", 1);
	             DelayCommand(3.0, SendMessageToPC(oStudent, "The wheel turns gently, unwinding.  Water gurgles through the pipes under the table.  The body swells, until putrid fluids begin to flow into the murky pool.  Waste water drains under the table.  Pipes driven into the body from below sluice it clean, internally, until the wheel comes to a rest and the water slows, shutting off."));
	             
	             }
	         else
	            {DelayCommand(3.0, SendMessageToPC(oStudent, "The key turns once again. Nothing but clean water washes into the murky pool.  The body is drained."));
	             }
	         if(GetLocalInt(oStudent, "Embalm") == 1)
	            {DelayCommand(6.0, SendMessageToPC(oStudent, "However, water seeps from the pores of the dead man's skin, then trickles from eye sockets and mouth.  The embalming fluid is washed off...wasted."));
	             SetLocalInt(oStudent, "Embalm", 0);
	             }
	         else
	            {DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_PULSE_NEGATIVE, FALSE), GetObjectByTag("slv_nec100_crank", 0)));
	            }

         }
		 else
		 	{SendMessageToPC(oUser, "The key does not seem to fit that object.");
	         }
     
}