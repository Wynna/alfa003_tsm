////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Spawn System
//     Filename : as_group_example.nss
//      Version : 1.0
//         Date : 2006-9-17
//       Author : Ronan
//
//  Description
//  This is a simple example of a spawn group script which is used by the ACR's
//  spawn system. Though the name of the script is "as_group_example", the spawn
//  point which uses this script would simply have "example" listed as a spawn
//  group name, since the "as_group_" is always added on to the beginning. For a
//  more complex example of spawn groups, see the script "as_group_complex".
//
//  Revision History
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// This line is required on all spawn group scripts.
#include "acr_spawn_i"

////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Global Variables ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// This is the main function, which is what the spawn system runs when this
// spawn group is spawned.
void main();

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void main() {

	switch(Random(5)) 
	{
        case 0:
            ACR_SpawnObject("abr_cr_hu_goblinfighter01", OBJECT_TYPE_CREATURE);
            break;
        case 1:
            ACR_SpawnObject("abr_cr_hu_goblinfighter02", OBJECT_TYPE_CREATURE);
            break;
        case 2:
            ACR_SpawnObject("abr_cr_hu_goblinfighter03", OBJECT_TYPE_CREATURE);
            break;
        case 3:
            ACR_SpawnObject("abr_cr_hu_goblinfighter04", OBJECT_TYPE_CREATURE);
            break;	
		case 4:
            ACR_SpawnObject("abr_cr_hu_goblinfighter05", OBJECT_TYPE_CREATURE);
            break;
	
	}

	switch(Random(5))
	{
        case 0:
            ACR_SpawnObject("abr_cr_hu_goblinrunner01", OBJECT_TYPE_CREATURE);
            break;
        case 1:
            ACR_SpawnObject("abr_cr_hu_goblinrunner02", OBJECT_TYPE_CREATURE);
            break;
        case 2:
            ACR_SpawnObject("abr_cr_hu_goblinrunner03", OBJECT_TYPE_CREATURE);
            break;
        case 3:
            ACR_SpawnObject("abr_cr_hu_goblinrunner04", OBJECT_TYPE_CREATURE);
            break;	
		case 4:
            ACR_SpawnObject("abr_cr_hu_goblinrunner05", OBJECT_TYPE_CREATURE);
            break;
	
	}
	
	switch(Random(5))
	{
        case 0:
            ACR_SpawnObject("abr_cr_hu_goblinscout01", OBJECT_TYPE_CREATURE);
            break;
        case 1:
            ACR_SpawnObject("abr_cr_hu_goblinscout02", OBJECT_TYPE_CREATURE);
            break;
        case 2:
            ACR_SpawnObject("abr_cr_hu_goblinscout03", OBJECT_TYPE_CREATURE);
            break;
        case 3:
            ACR_SpawnObject("abr_cr_hu_goblinscout04", OBJECT_TYPE_CREATURE);
            break;	
		case 4:
            ACR_SpawnObject("abr_cr_hu_goblinscout05", OBJECT_TYPE_CREATURE);
            break;
	
	}
   
}