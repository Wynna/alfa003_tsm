//OnUse for all Dean's Exam (deandragon) placeables 
//Wynna February 2009


#include "acr_placeable_i"
#include "acr_xp_i"
#include "acr_quest_i"
#include "acr_i"

void main()
{
	ACR_PlaceableOnPhysicalAttacked();

	object oAttacker = GetLastAttacker();
	//Deandragon E shovel
		 	
	 if(GetTag(OBJECT_SELF) == "slv_deandragon_shovel_plc") 
	    {SendMessageToPC(oAttacker, "You pick up the tool.");
		object oShovelItem = CreateItemOnObject("slv_deandragon_shovel", oAttacker, 1);
		DestroyObject(OBJECT_SELF);
		return;
		}
					
	//deandragon k leomund secure shelter doors
	SpeakString("Called Death", TALKVOLUME_TALK);
	
	if(GetTag(OBJECT_SELF) == "leomund_shelter_door")
		{SpeakString("Tagged Death", TALKVOLUME_TALK);
	     object oCollBox = GetLocalObject(OBJECT_SELF, "MyCollBox");
		 DestroyObject(oCollBox);
		 object oDoor2 = GetNearestObjectByTag(GetTag(OBJECT_SELF), OBJECT_SELF, 2);
		 		 	
		if(GetLocalInt(OBJECT_SELF, "Spawned") != 1)
			{SpeakString("Spawned Death", TALKVOLUME_TALK);
	         string sSpawn;
			int iSpawn = Random(5) + 1;
			SendMessageToPC(GetEnteringObject(), "Creatures come boiling out the door!");
			if((iSpawn >= 1) && (iSpawn <=3))
				{CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldfighter02", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldfighter04", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldscout01", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldscout01", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldcaptain", GetLocation(OBJECT_SELF));
				}
			else if(iSpawn == 4)
				{CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldelite01", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldfighter03", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldfighter04", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldscout01", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldscout01", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldscout01", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldcaptain", GetLocation(OBJECT_SELF));
				}
			else if(iSpawn == 5)
				{CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldshaman", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldcaptain", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldscout01", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldscout01", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldfighter04", GetLocation(OBJECT_SELF));
				CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_koboldscout01", GetLocation(OBJECT_SELF));
				}
			}	
		}					
	
}