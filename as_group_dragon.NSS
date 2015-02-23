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

	object oPC=GetFirstPC();

	switch(Random(8)) {
        case 0:
            ACR_SpawnObject("003_cr_dragon_gold_vala", OBJECT_TYPE_CREATURE);
            SendMessageToAllDMs("Spawned Gold Dragon");
			break;
        case 1:
            ACR_SpawnObject("003_cr_dragon_gold_vala", OBJECT_TYPE_CREATURE);
            SendMessageToAllDMs("Spawned Gold Dragon");
			break;
        case 2:
            ACR_SpawnObject("003_cr_dragon_red", OBJECT_TYPE_CREATURE);
            SendMessageToAllDMs("Spawned Red Dragon");
			break;
        case 3:
            ACR_SpawnObject("003_cr_dragon_silver_dez", OBJECT_TYPE_CREATURE);
            SendMessageToAllDMs("Spawned Silver Dragon");
			break;
        case 4:
            ACR_SpawnObject("003_cr_dragon_silver_dez", OBJECT_TYPE_CREATURE);
            SendMessageToAllDMs("Spawned Silver Dragon");
			break;
        case 5:
            ACR_SpawnObject("003_cr_dragon_blue", OBJECT_TYPE_CREATURE);
            SendMessageToAllDMs("Spawned Blue Dragon");
			break;			
	    case 6:
            ACR_SpawnObject("003_cr_dragon_black", OBJECT_TYPE_CREATURE);
            SendMessageToAllDMs("Spawned Black Dragon");
			break;		
	    case 7:
            ACR_SpawnObject("003_cr_dragon_silver_dez", OBJECT_TYPE_CREATURE);
            SendMessageToAllDMs("Spawned Silver Dragon");
			break;
			
			}			
				
		
    
}