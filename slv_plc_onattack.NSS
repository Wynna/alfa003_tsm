//OnDamage for all Silvy Uni placeables outside the classrooms
//Wynna February 2008


#include "acr_placeable_i"

void main()
{
	ACR_PlaceableOnPhysicalAttacked();
    object oStudent = GetLastAttacker();
    effect eKnockdown = EffectKnockdown();
	effect eStruck = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);			
	object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oStudent, 1);
	
	//Standard Enchantment
    if ((GetTag(OBJECT_SELF) == "slv_enc100_plc_mirror") && (GetTag(oStudent) == "003_cr_slv_procenc2"))

               {    effect eSmoke = EffectVisualEffect( VFX_DUR_SMOKE, FALSE);
                    effect eExplosion = EffectVisualEffect ( VFX_FNF_ELECTRIC_EXPLOSION, FALSE);
                    effect eChunk = EffectVisualEffect ( VFX_COM_CHUNK_STONE_MEDIUM, FALSE);
                    object oExit = GetLocalObject(OBJECT_SELF, "oExit");
					if(oExit == OBJECT_INVALID)
						{oExit = GetObjectByTag("slv_door_Enchantment1");
                    	SetLocalObject(OBJECT_SELF, "oExit", oExit);
						}
					object oMyMirror2WP = GetLocalObject(OBJECT_SELF, "oMyMirror2WP");
					if(oMyMirror2WP == OBJECT_INVALID)
						{oMyMirror2WP = GetWaypointByTag("Enc_Mirror2_Gaze_In");
						 SetLocalObject(OBJECT_SELF, "oMyMirror2WP", oMyMirror2WP);
						}
					object oMyProctor3WP = GetLocalObject(OBJECT_SELF, "oMyProctor3WP");
					if(oMyProctor3WP == OBJECT_INVALID)
						{oMyProctor3WP = GetWaypointByTag("003_cr_slv_procenc_Class");
						 SetLocalObject(OBJECT_SELF, "oMyProctor3WP", oMyProctor3WP);
						}
					float fMyProctor3Facing=GetFacing(oMyProctor3WP);
					
						
					
					ApplyEffectToObject(DURATION_TYPE_INSTANT, eSmoke, OBJECT_SELF, 3.0);
                    object oRubble = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_rubble", GetLocation(OBJECT_SELF));
			        DelayCommand(1.0, AssignCommand(oStudent, ClearAllActions(TRUE)));
				    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eExplosion, OBJECT_SELF, 3.0));
                    DelayCommand(1.1, PlaySound("as_cv_boomdist2"));
                    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eChunk, OBJECT_SELF, 3.0));
					//DelayCommand(4.0, AssignCommand(oStudent, SpeakString("*Elvish*That is more suitable.*/e* *Tones of satisfaction as she surveys the shards. *E*This one will do.*/E* *Picks up a piece of the broken mirror.", TALKVOLUME_TALK)));
					DelayCommand(4.0, AssignCommand(oStudent, SpeakString("*Murmurs in satisfaction as she surveys the shards of the mirror she just broke.", TALKVOLUME_TALK)));
					object oHandMirror = CreateItemOnObject("slv_enc200_handmirror", oStudent, 1);
					//DelayCommand(5.0, AssignCommand(oStudent, ActionStartConversation(oPC, "slv_procenc2", FALSE, TRUE, FALSE, TRUE)));
					DelayCommand(6.0, AssignCommand(oStudent, SpeakString("*Picks up a piece of the broken mirror.", TALKVOLUME_TALK)));
					DelayCommand(8.0, AssignCommand(oStudent, ActionForceMoveToObject(oMyMirror2WP, TRUE, 0.0)));
				    DelayCommand(15.0, AssignCommand(oStudent, ActionForceMoveToObject(oMyProctor3WP, TRUE, 0.0)));
				    DelayCommand(18.0, AssignCommand(oStudent, SetFacing(fMyProctor3Facing, TRUE)));
				    
					
				   
			}		
}			 			 