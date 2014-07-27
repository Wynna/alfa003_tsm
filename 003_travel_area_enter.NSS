// 10.23.2009 - AcadiusLost; added exception for relogging PCs.
//  3.28.2010 - TestAndSet fix -AL

#include "acr_area_i" 
#include "dmfi_inc_tool"

	 
void main ()  {


effect eSlow = SupernaturalEffect(EffectMovementSpeedDecrease(85)); 
effect eShrink = SupernaturalEffect(EffectSetScale( 0.2)); 
effect eTravel = EffectLinkEffects(eSlow, eShrink); 
eTravel = EffectLinkEffects(eTravel, SupernaturalEffect(EffectCutsceneGhost()));
object oEnterer = GetEnteringObject(); 
effect eTest = GetFirstEffect(oEnterer); 


if ((GetIsPC(oEnterer) && !GetIsDM(oEnterer))) 
{ 
	while (GetIsEffectValid(eTest)) {
		if (GetEffectCreator(eTest) == OBJECT_SELF) {
			SendMessageToAllDMs("Relogging PC: Removing eTest from " + GetName(oEnterer));
			RemoveEffect(oEnterer, eTest); 
	    } 
		eTest = GetNextEffect(oEnterer); 
	}
	AssignCommand(OBJECT_SELF, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eTravel, oEnterer)); 
 	DisplayGuiScreen(oEnterer, SCREEN_DMFI_FOLLOWOFF, FALSE, "dmfifollowoff.xml");
} 

effect eCutsceneInvis = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
object oPartyLeader = GetFactionLeader(oEnterer);
if((oEnterer != oPartyLeader) && (!GetIsDMPossessed(oEnterer)))
	{DelayCommand(3.0, SetCommandable(FALSE, oEnterer));
	 DelayCommand(5.0, AssignCommand(oEnterer, ActionForceFollowObject(oPartyLeader, 0.5, 0)));
	 //DelayCommand(10.0, _TestAndSetCollision(oEnterer));
	 AssignCommand(OBJECT_SELF, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eCutsceneInvis, oEnterer));
	}
	 
	
ACR_AreaOnClientEnter(); 

SendMessageToPC(oEnterer, "You have entered Travel area "+GetName(OBJECT_SELF) + "."); 
}