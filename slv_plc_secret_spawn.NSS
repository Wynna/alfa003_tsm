//OnSpawn for all Silvy Uni secret placeables outside the classrooms
//Wynna December 2007


#include "acr_placeable_i"

void main()
{
	int nStudent = 1;
	object oStudent = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, nStudent);
    if(ACR_RetrieveQuestState("slv_deandragon_m", oStudent)== 2)
			{SendMessageToPC(oStudent, "A flicker like a dying ember catches your eye from beneath a pile of bloody bones beside the smoking brazier.");}
	else
		{DestroyObject(GetObjectByTag("slv_it_wpn_lsw_daybreaker", 0));}	 
	 
	
}