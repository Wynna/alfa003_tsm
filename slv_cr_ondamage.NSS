//OnDamage for all Silvy Uni creatures 
//Wynna February 2008


#include "acr_creature_i"

void main()
{
	ACR_CreatureOnDamaged();
    object oStudent = GetLastDamager();
    effect eKnockdown = EffectKnockdown();
	effect eStruck = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);			

	
	      


   
   
			      //Elementary Illusion
     if(GetTag(OBJECT_SELF) == "003_cr_slv_ill100boy") 
	 	{object oMyBearWP = GetLocalObject(OBJECT_SELF, "oMyBearWP");
		 if (oMyBearWP == OBJECT_INVALID)
			{oMyBearWP = GetWaypointByTag("Ill_All_Quests_Bear_WP");
			 SetLocalObject(OBJECT_SELF, "oMyBearWP", oMyBearWP);
			 }
		 object oMyBear = GetLocalObject(OBJECT_SELF, "oMyBear");
		 if (oMyBear == OBJECT_INVALID)
			{oMyBear = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_ill100bear", GetLocation(oMyBearWP));
		 	 SetLocalObject(OBJECT_SELF, "oMyBear", oMyBear);
			 }
	      object oMyBearskin = GetLocalObject(OBJECT_SELF, "oMyBearskin");
		 if (oMyBearskin == OBJECT_INVALID)
			{oMyBearskin = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_ill100_bearskin", GetLocation(oMyBearWP));
			SetLocalObject(OBJECT_SELF, "oMyBearskin", oMyBearskin);
			 }
	      DestroyObject(oMyBearskin);
          SpeakString("Ouch!  That hurts!  SNOUT!!  Here, boy!", TALKVOLUME_TALK);
	      SetLocalInt(oStudent, "HurtBoy", 1);
	      SendMessageToPC(oStudent, "The bearskin rug on the ground rises up, shakes off, yawns a mighty yawn...and is revealed as a real bear cub, previously under an illusion.");
	      DelayCommand(2.0, SendMessageToPC(oStudent, "The bear cub gives the air a deep sniff, then its beady eyes fix on the boy and next on you.  It lumbers a step closer to you, then stops to shake its head violently, fur bristling.  It roars, shaking the room....and vanishes, as does the boy."));
	      DelayCommand(2.5, AssignCommand(oMyBear, PlaySound("as_an_dragonror1")));
	      DestroyObject(oMyBear, 3.0);
	      DestroyObject(OBJECT_SELF, 3.1);
	      }
	     

 if((GetTag(OBJECT_SELF) == "003_cr_slv_ill100imp") || (GetTag(OBJECT_SELF) == "003_cr_slv_ill100pixie")) 
         {ClearAllActions(TRUE);
          DestroyObject(OBJECT_SELF);
          }
         
   


}			 			 