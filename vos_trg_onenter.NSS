//Vault of Sages Trigger OnEnter. All triggers.
//Wynna March 2008


#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"

void main()
{	
	ACR_TriggerOnEnter();
	object oPC = GetEnteringObject();
	object oArea = GetArea(oPC);
	object oBench1 = GetNearestObjectByTag("pat_mid_bench06", OBJECT_SELF, 1);
	object oBench2 = GetNearestObjectByTag("pat_mid_bench06", OBJECT_SELF, 2);
	object oAntipathy = GetObjectByTag("VoS_Exit_WP", 0);
    object oKeeper = GetObjectByTag("vos_keeper", 0);
    object oScribe = GetObjectByTag("vos_scribe", 0);
    object oScribe2 = GetObjectByTag("vos_scribe2", 0);
    string sShelf = "Previous Section:  Continued";


    if((GetItemPossessedBy(oPC, "003_it_vos_token") == OBJECT_INVALID) && (GetTag(OBJECT_SELF) == "VaultForehall"))
        {AssignCommand(oPC, ActionMoveToObject(oAntipathy, TRUE, 1.0));
          if(GetLocalInt(oPC, "VaultWarned") != 1) 
            {SetLocalInt(oPC, "VaultWarned", 1);
            SendMessageToPC(oPC, "You feel physically repelled from going further.  You are driven back towards the entry of the Forehall.");
            if(GetDistanceBetween(oPC, oScribe2) < 10.0)
				{DelayCommand(1.0, AssignCommand(oScribe2, SpeakString("You will require a reading token from Vault staff before proceeding to the galleries on this level or the one above.  All other floors are off-limits to the general public.", TALKVOLUME_TALK)));
            	}
			if(GetDistanceBetween(oPC, oScribe) < 10.0)
				{DelayCommand(1.0, AssignCommand(oScribe, SpeakString("You will require a reading token from Vault staff before proceeding to the galleries on this level or the one above.  All other floors are off-limits to the general public.", TALKVOLUME_TALK)));
            	}
			if(GetDistanceBetween(oPC, oKeeper) < 10.0)
				{DelayCommand(1.0, AssignCommand(oKeeper, SpeakString("You will require a reading token from Vault staff before proceeding to the galleries on this level or the one above.  All other floors are off-limits to the general public.", TALKVOLUME_TALK)));
            	}
			}
        }

    if((GetItemPossessedBy(oPC, "003_it_vos_token")!= OBJECT_INVALID) && (GetTag(OBJECT_SELF) == "VaultExit"))
        {DestroyObject(GetItemPossessedBy(oPC, "003_it_vos_token"));
         SendMessageToPC(oPC, "Your Vault token crumbles to dust.");
        }

    if(GetTag(OBJECT_SELF) == "VaultShelves")
        {if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_a")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Agriculture";}
             else
                 {sShelf = "Mathematics";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_b")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Alchemy";}
             else
                 {sShelf = "Medicine";}
              }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_c")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Art: Visual";}
            else
                 {sShelf = "Medicine";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_d")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Art: Visual";}
            else
                 {sShelf = "Medicine";}
             }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_e")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Art: Music";}
             else
                 {sShelf = "Mining Studies";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_f")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Art:  Music";}
             else
                 {sShelf = "Monstrography";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_g")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Astronomy";}
             else
                 {sShelf = "Monstrography";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_h")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Biography";}
             else
                 {sShelf = "Oceanography";}
             }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_i")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Botany";}
             else
                 {sShelf = "Philosophy";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_j")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Business";}
             else
                 {sShelf = "Philosophy";}
             }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_k")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Classics";}
             else
                 {sShelf = "Physics";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_l")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Classics";}
             else
                 {sShelf = "Poetry";}
             }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_m")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Classics";}
             else
                 {sShelf = "Politics";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_n")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Elemental Studies";}
             else
                 {sShelf = "Politics";}
             }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_o")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Engineering";}
             else
                 {sShelf = "Power";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_p")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Environmental Studies";}
             else
                 {sShelf = "Racial Studies";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_q")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Evil";}
             else
                 {sShelf = "Racial Studies";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_r")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Good";}
              else
                 {sShelf = "Racial Studies";}
             }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_s")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Foreign Language Texts: Dwarven:  Grammar";}
             else
                 {sShelf = "Racial Studies";}
             }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_t")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Foreign Language Texts:  Dwarven: Literature";}
             else
                 {sShelf = "Racial Studies";}
             }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_u")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Foreign Language Texts:  Elvish:  Literature";}
             else
                 {sShelf = "Racial Studies";}
             }
			if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_aa")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Foreign Language Texts:  General";}
            else
                 {sShelf = "Racial Studies";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_bb")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                {sShelf = "Foreign Language Texts:  Human Regional";}
             else
			 {sShelf = "Racial Studies";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_cc")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Geography";}
             else
                 {sShelf = "Racial Studies";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_dd")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Geography";}
            else
                 {sShelf = "Racial Studies";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_ee")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Geography";}
             else
                 {sShelf = "Social Studies";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_ff")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Geology";}
             else
                 {sShelf = "Social Studies";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_gg")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Health";}
             else
                 {sShelf = "Social Studies";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_hh")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "History:  Ancient";}
            else
                 {sShelf = "Sports";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_ii")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "History:  Modern";}
            else
                 {sShelf = "Sports";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_jj")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "History: Modern";}
            else
                 {sShelf = "Teaching Studies";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_kk")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "History: Modern";}
             else
                 {sShelf = "Technology";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_ll")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "History: Modern";}
             else
                 {sShelf = "Technology";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_mm")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "History: Racial";}
             else
                 {sShelf = "Textiles";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_nn")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "History: Racial";}
             else
                 {sShelf = "Theatre";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_oo")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "History: Racial";}
            else
                 {sShelf = "Theatre";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_pp")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                {sShelf = "History: Racial";}
             else
                 {sShelf = "Theology";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_qq")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Law";}
             else
                 {sShelf = "Theology";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_rr")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Law";}
            else
                 {sShelf = "Theology";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_ss")
            {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Law";}
             else
                 {sShelf = "Theology";}
            }
          if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_tt")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                {sShelf = "Law";}
             else
                 {sShelf = "Theology";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_uu")
             {if(GetTag(oArea) == "6d_int_silvy_vaultsages")
                 {sShelf = "Law";}
             else
                 {sShelf = "Transport Studies";}
            }
           if(GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, 1)) == "WP_vos_v")
                {if(GetTag(oArea) == "6d_int_silvy_vaultsages2")
                    {sShelf = "Racial Studies: High Elven VALoUr";
                    }
                 else
                 {sShelf = "Fochlucan Diaries: PerformABLE Moments";
                    }
                 } 

        SendMessageToPC(oPC, "These shelves are labelled:  " + sShelf + ".");
        }
	
	
	if(GetTag(OBJECT_SELF) == "bench_trigger")
		{SetUseableFlag(oBench1, TRUE);
		 SetUseableFlag(oBench2, TRUE);
		}
	
}