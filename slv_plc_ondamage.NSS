//OnDamage for all Silvy Uni placeables outside the classrooms
//Wynna February 2008


#include "acr_placeable_i"

void main()
{
	ACR_PlaceableOnDamaged();
    object oStudent = GetLastDamager();
    effect eKnockdown = EffectKnockdown();
	effect eStruck = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);			

	
	//Standard Divination
    if (GetTag(OBJECT_SELF) == "slv_div200_target")
		
            {object oMyTrigAll = GetLocalObject(OBJECT_SELF, "oMyTrigAll");
			 if(oMyTrigAll == OBJECT_INVALID)
			 	{oMyTrigAll = GetObjectByTag("Div_All_trig");
				 SetLocalObject(OBJECT_SELF, "oMyTrigAll", oMyTrigAll);
				}
			
			 

                  effect eSpark = EffectVisualEffect( VFX_IMP_FLAME_M, FALSE);
                    effect eFireball = EffectVisualEffect ( VFX_FNF_FIREBALL, FALSE);
                    effect eExplosion = EffectVisualEffect ( VFX_FNF_GAS_EXPLOSION_FIRE, FALSE);
                    effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE, FALSE);

                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSpark, OBJECT_SELF, 5.0);
                    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eExplosion, OBJECT_SELF, 5.0));
                    DelayCommand(1.1, PlaySound("as_cv_boomdist2"));
                    DelayCommand(2.8, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFireball, OBJECT_SELF, 5.0));
                    DelayCommand(3.0, PlaySound("as_wt_thundercl4"));
                    DelayCommand(3.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eShake, OBJECT_SELF, 5.0));
                    if(ReflexSave(oStudent, 10, SAVING_THROW_TYPE_NONE, OBJECT_SELF) == 1)
				           {SendMessageToPC(oStudent, "The room shakes and chunks of rock fly, but nothing strikes you.");
				            }
           			else
				           {SendMessageToPC(oStudent, "Stumbling to your knees, you are struck by flying debris.");
				            ApplyEffectToObject(DURATION_TYPE_INSTANT, eKnockdown, oStudent);
				            ApplyEffectToObject(DURATION_TYPE_INSTANT, eStruck, oStudent);
				           }
        			
					object oShardWP = GetLocalObject(OBJECT_SELF, "oShardWP");
					if(oShardWP == OBJECT_INVALID)
						{oShardWP = GetWaypointByTag("Div_All_Quests_Shard_WP");
						 SetLocalObject(OBJECT_SELF, "oShardWP", oShardWP);
						 }
					CreateObject(OBJECT_TYPE_ITEM, "slv_div200_shard", GetLocation(oShardWP), FALSE);
                    DelayCommand(4.0, SendMessageToPC(oStudent, "A shard of rock, melted to a glassy substance, lands on this side of the wall."));
				    DestroyObject(OBJECT_SELF, 3.7);
					SetLocalObject(oMyTrigAll, "oMyTarget", OBJECT_INVALID);
                    }
                  else  {SendMessageToPC(oStudent, "You damage the target without visible further effect!");
                   }
       

}			 			 