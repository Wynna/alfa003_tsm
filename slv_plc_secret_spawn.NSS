//OnSpawn for all Silvy Uni secret placeables outside the classrooms
//Wynna December 2007


#include "acr_placeable_i"

void main()
{

	object oStudent = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1);
    			
if(GetTag(GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, 2)) == "vala_bookcase_secret")
	{SendMessageToPC(oStudent, "A design of inlaid golden dragons on the sides of the bookshelf catches your eye.");
	 object oMyShelves = GetObjectByTag("vala_bookcase_secret");
	 SetLocalString(oMyShelves, "ACR_PSO_NAME", GetTag(oMyShelves));
	 
	}
	
}