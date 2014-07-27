 
#include "ginc_wp"
void main()
{
    object oWP = GetWaypointByTag("cotd_statue");
    int iCurrentWP = GetCurrentWaypoint();
    ActionMoveToObject(oWP, TRUE, 2.0);
}