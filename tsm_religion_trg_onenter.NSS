//Wynna September 2007


#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_quest_i"
#include "acr_i"

void main()
{	
	ACR_TriggerOnEnter();
	object oQuester = GetEnteringObject();
    object oMod = GetModule();
	object oCreature;
	string sCreature;
	object oItem;
	string sItem;
	string sScene;
	
	if((GetIsPC(oQuester)) && (GetLocalObject(OBJECT_SELF, GetName(oQuester)) != oQuester))
	{if((GetTag(OBJECT_SELF) == "003_religion_quest2_helm") && (ACR_RetrieveQuestState("003_religion_helm", oQuester) == 2))
		{sCreature = "abr_cr_an_wild_rat_diseased";
		 sItem = "003_it_harvest_rat_tail_dsd";
		 sScene = "You hear the chittering of rats from nearby.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_berronar")  && (ACR_RetrieveQuestState("003_religion_berronar", oQuester) == 2))
		{sCreature = "abr_cr_an_wild_dogwolf";
		 sItem = "003_it_harvest_wolf_fang";
		 sScene = "A wolf howls, somewhere close.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
	
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_ilmater") && (ACR_RetrieveQuestState("003_religion_ilmater", oQuester) == 2))
		{sCreature = "abr_cr_an_wild_boar";
		 sItem = "003_it_harvest_pig_ear";
		 sScene = "The snorting and bellowing of an enraged swine echoes through the wood.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_kelemvor") && (ACR_RetrieveQuestState("003_religion_kelemvor", oQuester) == 2))
		{sCreature = "abr_cr_un_skeleton_guard01";
		 sItem = "003_it_harvest_undead_bone";
		 sScene = "Clattering undead lurch toward you, dropping bony pieces of themselves as they come.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_lathander") && (ACR_RetrieveQuestState("003_religion_lathander", oQuester) == 2))
		{sCreature = "abr_cr_un_allip_01";
		 sItem = "003_it_harvest_undead_bone";
		 sScene = "A ghost floats towards you, from out of the trunk of a burned out tree.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_redknight") && (ACR_RetrieveQuestState("003_religion_redknight", oQuester) == 2))
		{sCreature = "abr_cr_hu_lizman_wood05";
		 sItem = "003_it_harvest_lizardman_tail";
		 sScene = "A lizardman slithers out of the swamp!";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_sel_mie") && ((ACR_RetrieveQuestState("003_religion_selune", oQuester) == 2) || (ACR_RetrieveQuestState("003_religion_mielikki", oQuester) == 2)))
		{sCreature = "abr_wererat";
		 sScene = "Injured and bloody, a huge rat thrashes in its nest atop the body of the wolf that must have given it the terrible wounds it bears. The jaws of the wolf still clench a severed rat paw.  The lycanthrope is weakened, greatly.";
		 object oWolf = CreateObject(OBJECT_TYPE_PLACEABLE, "hrv_plc_corpse_wolf", GetLocation(OBJECT_SELF));
		 object oItem2 = CreateItemOnObject("003_it_harvest_were_paw", oWolf, 1);
	 	 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_temp_seld") && ((ACR_RetrieveQuestState("003_religion_tempus", oQuester) == 2) || (ACR_RetrieveQuestState("003_religion_everdusk", oQuester) == 2)))
		{sCreature = "abr_cr_hu_orcwarrior01";
		 sItem = "003_it_harvest_orc_ear";
		 sScene = "Bellowing, a tusked orc attacks from where it had been hiding!";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_torm_tyr") && ((ACR_RetrieveQuestState("003_religion_torm", oQuester) == 2) || (ACR_RetrieveQuestState("003_religion_tyr", oQuester) == 2)))
		{sCreature = "003_cr_ssthief1";
		 sItem = "003_it_shadowsword_sash";
		 sScene = "Something moves quietly in the dark nearby.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_silvanus") && (ACR_RetrieveQuestState("003_religion_silvanus", oQuester) == 2))
		{sCreature = "abr_cr_an_wild_bear";
		 sItem = "003_it_silvanus_target";
		 sScene = "Piggy eyes blinking, a brown bear sits on its haunches in the midst of the ruins of an oakwood and hide target, chewing contentedly on piece in its paws. A rumbling belch makes its way out of the bear's gut, wafting the unmistakable smell of fermented herbal potion. The bear looks dazed.";
		 object oTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_silvanus_target", GetLocation(OBJECT_SELF));
		 object oItem2 = CreateItemOnObject("003_it_silvanus_target", oTarget, 1);
	 	 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_mystra") && (ACR_RetrieveQuestState("003_religion_mystra", oQuester) == 2))
		{sCreature = "003_cr_mephit_fire";
		 sItem = "003_it_harvest_mephit_claw";
		 sScene = "Trailing fire from its wings, a mephit darts through the air.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_auril") && (ACR_RetrieveQuestState("003_religion_auril", oQuester) == 2))
		{sCreature = "abr_cr_hu_duergarrog_01";
		 sItem = "003_it_harvest_duergar_head";
	 	 sScene = "A twig snaps nearby, and a stubby figure in armor charges from out of hiding.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_yondalla") && (ACR_RetrieveQuestState("003_religion_yondalla", oQuester) == 2))
		{sCreature = "abr_cr_an_wild_rat_dire";
		 sItem = "003_it_harvest_rat_tail";
		 sScene = "A gigantic rat sits in the midst of a ripped open sack of grain.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_gond") && (ACR_RetrieveQuestState("003_religion_gond", oQuester) == 2))
		{sCreature = "abr_cr_vm_beetle_fire";
		 sItem = "003_it_harvest_beetle_fire_gland";
		 sScene = "Chittering and clicking its mandibles, a fire beetle glows in the darkness.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	} 
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_sune") && (ACR_RetrieveQuestState("003_religion_sune", oQuester) == 2))
		{sCreature = "abr_cr_an_wild_rat_maggot";
		 sItem = "003_it_religion_sune_envy";
		 object oCreature2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_vm_spider_medium", GetLocation(OBJECT_SELF));
		 object oItem2 = CreateItemOnObject("003_it_religion_sune_hatred", oCreature2, 1);
		 SetPlotFlag(oItem2, TRUE);
		 sScene = "A spider skitters down from the ceiling and a maggot covered rat pops out of a hole in the base of the wall.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_chauntea") && (ACR_RetrieveQuestState("003_religion_chauntea", oQuester) == 2))
		{sCreature = "abr_cr_an_wild_deer_stag";
		 sItem = "003_it_harvest_deer_venison";
		 sScene = "A magnificent stag browses on the haystacks.";
		 object oCreature2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_deer_stag", GetLocation(OBJECT_SELF));
		 object oItem2 = CreateItemOnObject("003_it_harvest_deer_venison", oCreature2, 1);
		 ChangeToStandardFaction(oCreature2, STANDARD_FACTION_HOSTILE);
	     SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	if((GetTag(OBJECT_SELF) == "003_religion_quest2_oghma") && (ACR_RetrieveQuestState("003_religion_oghma", oQuester) == 2))
		{sCreature = "abr_cr_vm_spider_large";
		 sItem = "003_it_harvest_spider_poison";
		 sScene = "A huge spider drops down from the rafters on a thread it spins for itself.";
		 SetLocalObject(OBJECT_SELF, GetName(oQuester), oQuester);
	 	}
		
	oCreature = CreateObject(OBJECT_TYPE_CREATURE, sCreature, GetLocation(OBJECT_SELF));
	ChangeToStandardFaction(oCreature, STANDARD_FACTION_HOSTILE);
	if(GetTag(oCreature) == "abr_wererat")
		{effect eDamage = EffectDamage(10, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_NORMAL, TRUE);
		 ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oCreature);
		 }
	if(GetTag(oCreature) == "abr_cr_an_wild_bear")
		{effect eDazed = EffectDazed();
		 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDazed, oCreature, 120.0);
		 }
	else
		{AssignCommand(oCreature, ActionAttack(oQuester, FALSE));
		}
	
	oItem = CreateItemOnObject(sItem, oCreature, 1);
	SetPlotFlag(oItem, TRUE);
	SendMessageToPC(oQuester, sScene);
	}
}