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
    // Lets say this spawn group is an orc hunting party. Lets spawn some level
    // 1 warrior orcs, with either a level 3 leader who is either a warrior,
    // ranger, druid or cleric.
/*    ACR_SpawnObject("abr_cr_hu_bugbear02", OBJECT_TYPE_CREATURE);

    // Lets add three more of those generic orc warriors.
    ACR_SpawnObject("abr_cr_hu_bugbear03", OBJECT_TYPE_CREATURE);
    ACR_SpawnObject("abr_cr_hu_bugbear04", OBJECT_TYPE_CREATURE);
    ACR_SpawnObject("abr_cr_hu_bugbear01", OBJECT_TYPE_CREATURE);
    
	//location lLoc = _SPAWN_CHILD_COUNT(
    //    240.0,  // 240 degrees, put this one at 8 o'clock.
    //    6.0,    // Six meters out, so the radius of the circle is 6m.
    //    60.0); // Turned 180 + 240 degrees, so it faces the center.
    //ACR_SpawnObjectAtLocation("c_chicken_acr", OBJECT_TYPE_CREATURE, lLoc);
	
    // Now lets say we have 4 possible leaders for this group of thugs. We want
*/    // to randomly select one of them.
   switch(Random(4)) {
        // Each "case" is a possible result of random(4). So only one of the
        // following will be run. And yes, its supposed to start at 0 and not
        // reach 4, Random(4) returns a number from 0 to 3.
        case 0:
            // This is a level 3 warrior orc.
            ACR_SpawnObject("abr_cr_hu_bugbear02", OBJECT_TYPE_CREATURE);
            break;
        case 1:
            // This is a level 3 ranger orc.
            ACR_SpawnObject("abr_cr_hu_bugbear01", OBJECT_TYPE_CREATURE);
            break;
        case 2:
            // This is a level 3 cleric, a shaman.
            ACR_SpawnObject("abr_cr_hu_bugbear03", OBJECT_TYPE_CREATURE);
            break;
        case 3:
            // This is a level 3 druid, also a shaman.
            ACR_SpawnObject("abr_cr_hu_bugbear04", OBJECT_TYPE_CREATURE);
            break;
	}		
 
    }