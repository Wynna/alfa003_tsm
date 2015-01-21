#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "003_silverymoon_i"

  //Created by Wynna; November 4, 2008


void main()
{
    object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    object oGoTo = GetWaypointByTag("003_slv_maze_teleport_wp");
	location lGoTo = GetLocation(oGoTo);
	 
  //One-time, one-way device to teleport to the teleportation platform of the Master's Hall at the Lady's College
	 SetLocalInt(GetEnteringObject(), "Landed", 0);
	 AssignCommand(oUser, ActionJumpToLocation(lGoTo));
	 DestroyObject(oItem);
	 ApplySilverymoonWards(oUser);
 
}