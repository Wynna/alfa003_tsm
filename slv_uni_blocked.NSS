////////////////////////////////////////////////////////////////////////////////
//
//     Filename : slv_uni_blocked
//      Version : 1.1
//         Date : 2008-2-4
//       Author : Wynna
//
//  Description
//  This handles NPC behaviour in SLV Uni if blocked

////////////////////////////////////////////////////////////////////////////////


#include "acr_db_persist_i"
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_creature_i"
void main()
{

	ACR_CreatureOnBlocked();

    object oDoor = GetBlockingDoor();
	object oStudyWP;
	
	if(GetTag(oDoor) == "Abj_Dorm_2_Door")
		{oStudyWP = GetLocalObject(oDoor, "Abj_Dorm_2_Study_WP");
		}
		else if(GetTag(oDoor) == "Con_Dorm_2_Door")
		{oStudyWP = GetLocalObject(oDoor, "Con_Dorm_2_Study_WP");
		}
		else if(GetTag(oDoor) == "Div_Dorm_2_Door")
		{oStudyWP = GetLocalObject(oDoor, "Div_Dorm_2_Study_WP");
		}
		else if(GetTag(oDoor) == "Enc_Dorm_2_Door")
		{oStudyWP = GetLocalObject(oDoor, "Enc_Dorm_2_Study_WP");
		}
		else if(GetTag(oDoor) == "Evo_Dorm_2_Door")
		{oStudyWP = GetLocalObject(oDoor, "Evo_Dorm_2_Study_WP");
		}
		else if(GetTag(oDoor) == "Ill_Dorm_2_Door")
		{oStudyWP = GetLocalObject(oDoor, "Ill_Dorm_2_Study_WP");
		}
		else if(GetTag(oDoor) == "Nec_Dorm_2_Door")
		{oStudyWP = GetLocalObject(oDoor, "Nec_Dorm_2_Study_WP");
		}
		else if(GetTag(oDoor) == "Tra_Dorm_2_Door")
		{oStudyWP = GetLocalObject(oDoor, "Tra_Dorm_2_Study_WP");
		}
		else {}
    
    if(GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) >= 5)
    {
        if(GetIsDoorActionPossible(oDoor, DOOR_ACTION_OPEN) && GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) >= 7 )
        {
            DoDoorAction(oDoor, DOOR_ACTION_OPEN);
        }
        
		else if(GetDistanceBetween(OBJECT_SELF, oStudyWP) < (GetDistanceBetween(oStudyWP, oDoor)))
			{DoDoorAction(oDoor, DOOR_ACTION_UNLOCK);
			}
		else 
		{
            DoDoorAction(oDoor, DOOR_ACTION_KNOCK);
			
			
			}
    }
}