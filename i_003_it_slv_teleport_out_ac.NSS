#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "003_silverymoon_i"
#include "acr_quest_i"
#include "acr_placeable_i"

  

void main()
{
    object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    object oGoTo = GetWaypointByTag("5f_deckon_thar_at_wp");
	location lGoTo = GetLocation(oGoTo);
	RemoveSilverymoonWards(oUser );
	 
  
	 AssignCommand(oUser, ActionJumpToLocation(lGoTo));
	 DelayCommand(10.0, DestroyObject(oItem));
	
	 
}