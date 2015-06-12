//Secondary script for all Dean's Exam Static(deandragon) creatures 
//Wynna February 2009


#include "acr_creature_i"
#include "acr_xp_i"
#include "acr_quest_i"







void ACR_ApplyNLDDamageToCreature(object oTarget, int nSubdualDamage);


void ACR_ApplyNLDDamageToCreature(object oTarget, int nSubdualDamage)
{
    int nNLDTotal = _GetNLDTotal(oTarget);
    int nHPMax = GetMaxHitPoints(oTarget);
    int nCap = nHPMax + 10;
    nNLDTotal = ((nNLDTotal + nSubdualDamage) > nCap) ? nCap :
            nNLDTotal + nSubdualDamage;
    _SetNLDTotal(oTarget, nNLDTotal);
    ACR_ApplyNLDEffects(oTarget, nNLDTotal);
}

void main()
{
	//deandragon_e_air cold damage loop
	
			if(GetLocalInt(OBJECT_SELF, "ColdRep") == 1)
				{float fTimeLoop = 91.0;
				 int nRepCold = GetLocalInt(OBJECT_SELF, "nRepCold");
				 if(GetTag(GetArea(OBJECT_SELF)) == "5b_ext_frosthills_glacier")
					{object oMyListener = GetLocalObject(OBJECT_SELF, "oMyListener");
					 if(oMyListener == OBJECT_INVALID)
						 	{oMyListener = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_deanvoice_phoenix", GetLocation(OBJECT_SELF));
	   						 SetLocalObject(OBJECT_SELF, "oMyListener", oMyListener);
							 }
					 if(FindSubString(GetName(GetItemInSlot(INVENTORY_SLOT_CLOAK, OBJECT_SELF)), "Greatcloak") != -1)
						{SendMessageToPC(OBJECT_SELF, "Cloak Slot = " +  GetName(GetItemInSlot(INVENTORY_SLOT_CLOAK, OBJECT_SELF)));
						 fTimeLoop = 540.0;
						}
					if(GetIsSkillSuccessful(OBJECT_SELF, SKILL_SURVIVAL, 15, TRUE))
						{SetLocalInt(OBJECT_SELF, "Survival", 4);}
					if ((!GetHasSpellEffect(SPELL_ENDURE_ELEMENTS, OBJECT_SELF)) && (!GetHasSpellEffect(SPELL_RESIST_ENERGY, OBJECT_SELF))&& (!GetHasSpellEffect(SPELL_PROTECTION_FROM_ENERGY, OBJECT_SELF)))
				         {int nSurvival = GetLocalInt(OBJECT_SELF, "Survival");
						  int nDC = 15 + nRepCold - nSurvival;
						  if(!FortitudeSave(OBJECT_SELF, nDC, SAVING_THROW_TYPE_COLD, OBJECT_SELF))
							{ACR_ApplyNLDDamageToCreature(OBJECT_SELF, d6());
							 SendMessageToPC(OBJECT_SELF, "The bitter cold takes its toll!");
							 ACR_NLD_ReportTotal(OBJECT_SELF, OBJECT_SELF, 0);
							 }
						 }
					else {SendMessageToPC(OBJECT_SELF, "You feel your elemental protection spell keeping the worst of the cold at bay.");
					     }
					}
					SetLocalInt(OBJECT_SELF, "Survival", 0);
					nRepCold++;
					SetLocalInt(OBJECT_SELF, "nRepCold", nRepCold);
					if(GetTag(GetArea(OBJECT_SELF)) == "5b_ext_frosthills_glacier")
						{DelayCommand(fTimeLoop, ExecuteScript("slv_static_voice_cr_pc", OBJECT_SELF));}
					}
				 else {SetLocalInt(OBJECT_SELF, "ColdRep", 0);
				 	   SetLocalInt(OBJECT_SELF, "nRepCold", 0);
					  }
					
				
				
		//deandragon_e_fire heat damage loop
	 	if(GetLocalInt(OBJECT_SELF, "HeatRep") == 1)
				{if(FindSubString(GetTag(GetArea(OBJECT_SELF)), "sundabar_everfire") != -1)
					{float fTimeLoop = 91.0;
					 if(GetIsSkillSuccessful(OBJECT_SELF, SKILL_SURVIVAL, 15, TRUE))
							{SetLocalInt(OBJECT_SELF, "Survival", 4);}
						int nRep = GetLocalInt(OBJECT_SELF, "nRepHot");
						if ((!GetHasSpellEffect(SPELL_ENDURE_ELEMENTS, OBJECT_SELF)) && (!GetHasSpellEffect(SPELL_RESIST_ENERGY, OBJECT_SELF))&& (!GetHasSpellEffect(SPELL_PROTECTION_FROM_ENERGY, OBJECT_SELF)))
					         {
							 if(!FortitudeSave(OBJECT_SELF, 15 + nRep - GetLocalInt(OBJECT_SELF, "Survival"), SAVING_THROW_TYPE_FIRE, OBJECT_SELF))
								{ACR_ApplyNLDDamageToCreature(OBJECT_SELF, d6());
								 SendMessageToPC(OBJECT_SELF, "The excrutiating heat takes its toll!");
								 ACR_NLD_ReportTotal(OBJECT_SELF, OBJECT_SELF, 0);
								 }
							 }
						else {SendMessageToPC(OBJECT_SELF, "You feel your elemental protection spell keeping the worst of the heat at bay.");
							}
						
						SetLocalInt(OBJECT_SELF, "Survival", 0);
						nRep++;
						SetLocalInt(OBJECT_SELF, "nRepHot", nRep);
						DelayCommand(fTimeLoop, ExecuteScript("slv_static_voice_cr_pc", OBJECT_SELF));
						}
			
				}
			 
			
}