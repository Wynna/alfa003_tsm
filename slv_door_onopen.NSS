//OnOpen for all Silvy Uni doors outside the classrooms
//Wynna December 2007


#include "acr_door_i"
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_spawn_i"
#include "acr_db_persist_i"

void main()
{
	ACR_DoorOnOpen();
    object oStudent = GetLastOpenedBy();
	int nSchool = GetSilvyUniversitySchool(OBJECT_SELF);
	string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
	int nLevel = GetSilvyUniversitySchoolLevel(oStudent, nSchool);
		
    			
if(GetTag(OBJECT_SELF) == "vala_secret_door")
	{DelayCommand(30.0, ActionCloseDoor(OBJECT_SELF));
	 }
	 
else if(GetTag(OBJECT_SELF) == "Dean_Secret_Door") 
		{DelayCommand(120.0, ActionCloseDoor(OBJECT_SELF));
		 
		}			 
else if(GetTag(OBJECT_SELF) == "slv_enc_giant_door") 
		{DelayCommand(4.0, ActionCloseDoor(OBJECT_SELF));
		 DelayCommand(5.0, SetLocked(OBJECT_SELF, TRUE));
		}	 
else if((GetTag(OBJECT_SELF) == "slv_door_Enchantment1") && (nLevel == 200))
		{object oMyProctor2WP = GetLocalObject(OBJECT_SELF, "oMyProctor2WP");
		 if (oMyProctor2WP == OBJECT_INVALID)
				{oMyProctor2WP = GetWaypointByTag("Enc_All_Quests_Proctor2_WP");
				 SetLocalObject(OBJECT_SELF, "oMyProctor2WP", oMyProctor2WP);
				}
		object oMyProctor2 = GetLocalObject(OBJECT_SELF, "oMyProctor2");
		if (oMyProctor2 == OBJECT_INVALID)
				{oMyProctor2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_procenc2", GetLocation(oMyProctor2WP));
				SetLocalObject(OBJECT_SELF, "oMyProctor2", oMyProctor2);
				 }
			}		
		
else {DelayCommand(300.0, ActionCloseDoor(OBJECT_SELF));
	}
		 	 
	
}	