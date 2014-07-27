#include "acr_db_persist_i"
#include "silvy_univ_inc"
#include "silvy_univ_func"

void main ()
{
    
object oUser = GetPCSpeaker();

SendMessageToPC(oUser, "***");
SendMessageToPC(oUser, "ALL COURSE INFO FOR " + GetName(oUser) + ":");
SendMessageToPC(oUser, "Elementary Abjuration = " + GetCampaignString("SLV_UNI", "Elementary AbjurationInfo", oUser));
SendMessageToPC(oUser, "Elementary Conjuration = " + GetCampaignString("SLV_UNI", "Elementary ConjurationInfo", oUser));
SendMessageToPC(oUser, "Elementary Divination = " + GetCampaignString("SLV_UNI", "Elementary DivinationInfo", oUser));
SendMessageToPC(oUser, "Elementary Enchantment = " + GetCampaignString("SLV_UNI", "Elementary EnchantmentInfo", oUser));
SendMessageToPC(oUser, "Elementary Evocation = " + GetCampaignString("SLV_UNI", "Elementary EvocationInfo", oUser));
SendMessageToPC(oUser, "Elementary Illusion = " + GetCampaignString("SLV_UNI", "Elementary IllusionInfo", oUser));
SendMessageToPC(oUser, "Elementary Necromancy = " + GetCampaignString("SLV_UNI", "Elementary NecromancyInfo", oUser));
SendMessageToPC(oUser, "Elementary Transmutation = " + GetCampaignString("SLV_UNI", "Elementary TransmutationInfo", oUser));
SendMessageToPC(oUser, "Standard Abjuration = " + GetCampaignString("SLV_UNI", "Standard AbjurationInfo", oUser));
SendMessageToPC(oUser, "Standard Conjuration = " + GetCampaignString("SLV_UNI", "Standard ConjurationInfo", oUser));
SendMessageToPC(oUser, "Standard Divination = " + GetCampaignString("SLV_UNI", "Standard DivinationInfo", oUser));
SendMessageToPC(oUser, "Standard Enchantment = " + GetCampaignString("SLV_UNI", "Standard EnchantmentInfo", oUser));
SendMessageToPC(oUser, "Standard Evocation = " + GetCampaignString("SLV_UNI", "Standard EvocationInfo", oUser));
SendMessageToPC(oUser, "Standard Illusion = " + GetCampaignString("SLV_UNI", "Standard IllusionInfo", oUser));
SendMessageToPC(oUser, "Standard Necromancy = " + GetCampaignString("SLV_UNI", "Standard NecromancyInfo", oUser));
SendMessageToPC(oUser, "Standard Transmutation = " + GetCampaignString("SLV_UNI", "Standard TransmutationInfo", oUser));
SendMessageToPC(oUser, "Advanced Abjuration = " + GetCampaignString("SLV_UNI", "Advanced AbjurationInfo", oUser));
SendMessageToPC(oUser, "Advanced Conjuration = " + GetCampaignString("SLV_UNI", "Advanced ConjurationInfo", oUser));
SendMessageToPC(oUser, "Advanced Divination = " + GetCampaignString("SLV_UNI", "Advanced DivinationInfo", oUser));
SendMessageToPC(oUser, "Advanced Enchantment = " + GetCampaignString("SLV_UNI", "Advanced EnchantmentInfo", oUser));
SendMessageToPC(oUser, "Advanced Evocation = " + GetCampaignString("SLV_UNI", "Advanced EvocationInfo", oUser));
SendMessageToPC(oUser, "Advanced Illusion = " + GetCampaignString("SLV_UNI", "Advanced IllusionInfo", oUser));
SendMessageToPC(oUser, "Advanced Necromancy = " + GetCampaignString("SLV_UNI", "Advanced NecromancyInfo", oUser));
SendMessageToPC(oUser, "Advanced Transmutation = " + GetCampaignString("SLV_UNI", "Advanced TransmutationInfo", oUser));
SendMessageToPC(oUser, "Senior Abjuration =" + GetCampaignString("SLV_UNI", "Senior AbjurationInfo", oUser));
SendMessageToPC(oUser, "Senior Conjuration = " + GetCampaignString("SLV_UNI", "Senior ConjurationInfo", oUser));
SendMessageToPC(oUser, "Senior Divination = " + GetCampaignString("SLV_UNI", "Senior DivinationInfo", oUser));
SendMessageToPC(oUser, "Senior Enchantment = " + GetCampaignString("SLV_UNI", "Senior EnchantmentInfo", oUser));
SendMessageToPC(oUser, "Senior Evocation = " + GetCampaignString("SLV_UNI", "Senior EvocationInfo", oUser));
SendMessageToPC(oUser, "Senior Illusion = " + GetCampaignString("SLV_UNI", "Senior IllusionInfo", oUser));
SendMessageToPC(oUser, "Senior Necromancy = " + GetCampaignString("SLV_UNI", "Senior NecromancyInfo", oUser));
SendMessageToPC(oUser, "Senior Transmutation = " + GetCampaignString("SLV_UNI", "Senior TransmutationInfo", oUser));

if(GetTag(OBJECT_SELF) == "003_cr_slv_recordsclerk")
	{object oTranscript = CreateItemOnObject("slv_paper", oUser, 1);
	 string sTranscript = "Silverymoon University: Lady's College Transcript ****************************************************************************" + " " +
	 		"ALL COURSE INFO FOR " + GetName(oUser)     
			  + ": Elementary Abjuration = " + GetCampaignString("SLV_UNI", "Elementary AbjurationInfo", oUser)
			  + "; Elementary Conjuration = " + GetCampaignString("SLV_UNI", "Elementary ConjurationInfo", oUser)
			  + "; Elementary Divination = " + GetCampaignString("SLV_UNI", "Elementary DivinationInfo", oUser)
			  + "; Elementary Enchantment = " + GetCampaignString("SLV_UNI", "Elementary EnchantmentInfo", oUser)
			  + "; Elementary Evocation = " + GetCampaignString("SLV_UNI", "Elementary EvocationInfo", oUser)
			  + "; Elementary Illusion = " + GetCampaignString("SLV_UNI", "Elementary IllusionInfo", oUser)
			  + "; Elementary Necromancy = " + GetCampaignString("SLV_UNI", "Elementary NecromancyInfo", oUser)
			  + "; Elementary Transmutation = " + GetCampaignString("SLV_UNI", "Elementary TransmutationInfo", oUser)
			  + "; Standard Abjuration = " + GetCampaignString("SLV_UNI", "Standard AbjurationInfo", oUser)
			  + "; Standard Conjuration = " + GetCampaignString("SLV_UNI", "Standard ConjurationInfo", oUser)
		      + "; Standard Divination = " + GetCampaignString("SLV_UNI", "Standard DivinationInfo", oUser)
			  + "; Standard Enchantment = " + GetCampaignString("SLV_UNI", "Standard EnchantmentInfo", oUser)
			  + "; Standard Evocation = " + GetCampaignString("SLV_UNI", "Standard EvocationInfo", oUser)
			  + "; Standard Illusion = " + GetCampaignString("SLV_UNI", "Standard IllusionInfo", oUser)
			  + "; Standard Necromancy = " + GetCampaignString("SLV_UNI", "Standard NecromancyInfo", oUser)
			  + "; Standard Transmutation = " + GetCampaignString("SLV_UNI", "Standard TransmutationInfo", oUser)
		      + "; Advanced Abjuration = " + GetCampaignString("SLV_UNI", "Advanced AbjurationInfo", oUser)
			  + "; Advanced Conjuration = " + GetCampaignString("SLV_UNI", "Advanced ConjurationInfo", oUser)
			  + "; Advanced Divination = " + GetCampaignString("SLV_UNI", "Advanced DivinationInfo", oUser)
			  + "; Advanced Enchantment = " + GetCampaignString("SLV_UNI", "Advanced EnchantmentInfo", oUser)
			  + "; Advanced Evocation = " + GetCampaignString("SLV_UNI", "Advanced EvocationInfo", oUser)
			  + "; Advanced Illusion = " + GetCampaignString("SLV_UNI", "Advanced IllusionInfo", oUser)
			  + "; Advanced Necromancy = " + GetCampaignString("SLV_UNI", "Advanced NecromancyInfo", oUser)
			  + "; Advanced Transmutation = " + GetCampaignString("SLV_UNI", "Advanced TransmutationInfo", oUser)
			  + "; Senior Abjuration =" + GetCampaignString("SLV_UNI", "Senior AbjurationInfo", oUser)
			  + "; Senior Conjuration = " + GetCampaignString("SLV_UNI", "Senior ConjurationInfo", oUser)
			  + "; Senior Divination = " + GetCampaignString("SLV_UNI", "Senior DivinationInfo", oUser)
			  + "; Senior Enchantment = " + GetCampaignString("SLV_UNI", "Senior EnchantmentInfo", oUser)
			  + "; Senior Evocation = " + GetCampaignString("SLV_UNI", "Senior EvocationInfo", oUser)
			  + "; Senior Illusion = " + GetCampaignString("SLV_UNI", "Senior IllusionInfo", oUser)
			  + "; Senior Necromancy = " + GetCampaignString("SLV_UNI", "Senior NecromancyInfo", oUser)
			  + "; Senior Transmutation = " + GetCampaignString("SLV_UNI", "Senior TransmutationInfo", oUser);
	SetDescription(oTranscript, sTranscript);
	SetFirstName(oTranscript, sTranscript);
		  
	}
	
if ((GetCampaignString("SLV_UNI", "DeanDragonGreeted" + GetName(oUser),oUser) == "Yes")&& (GetCampaignString("SLV_UNI", "DeanDragonNamed" + GetName(oUser), oUser) == "Yes"))
            
		{
		SendMessageToPC(oUser, "***");
		SendMessageToPC(oUser, "ALL PROCTOR'S QUEST INFO FOR " + GetName(oUser) + ":");
		
		int iABC = 0;
		string sABC = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		string sLetter = GetSubString(sABC, iABC, 1);
		while (iABC < 26)
		     {SendMessageToPC(oUser, sLetter + " = " + GetCampaignString("SLV_UNI", "DragonQuest" + sLetter, oUser));
		     if(sLetter != "Z")
		       {iABC++;
		        sLetter = GetSubString(sABC, iABC, 1);
		       }
		       else break;
		     }
		}	 
}