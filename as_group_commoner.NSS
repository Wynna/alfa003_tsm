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

	switch(Random(35)) {
        case 0:
            ACR_SpawnObject("03_silvy_commoner_a", OBJECT_TYPE_CREATURE);
            break;
        case 1:
            ACR_SpawnObject("03_silvy_commoner_b", OBJECT_TYPE_CREATURE);
            break;
        case 2:
            ACR_SpawnObject("03_silvy_commoner_c", OBJECT_TYPE_CREATURE);
            break;
        case 3:
            ACR_SpawnObject("03_silvy_commoner_d", OBJECT_TYPE_CREATURE);
            break;			
	

      case 4:
            ACR_SpawnObject("03_silvy_commoner_e", OBJECT_TYPE_CREATURE);
            break;
        case 5:
            ACR_SpawnObject("03_silvy_commoner_f", OBJECT_TYPE_CREATURE);
            break;
        case 6:
            ACR_SpawnObject("03_silvy_commoner_g", OBJECT_TYPE_CREATURE);
            break;
        case 7:
            ACR_SpawnObject("03_silvy_commoner_h", OBJECT_TYPE_CREATURE);
            break;			
	
	

        case 8:
            ACR_SpawnObject("03_silvy_commoner_i", OBJECT_TYPE_CREATURE);
            break;
        case 9:
           ACR_SpawnObject("03_silvy_commoner_j", OBJECT_TYPE_CREATURE);
            break;
		case 10:
            ACR_SpawnObject("03_silvy_commoner_k", OBJECT_TYPE_CREATURE);
            break;
        case 11:
            ACR_SpawnObject("03_silvy_commoner_l", OBJECT_TYPE_CREATURE);
            break;
        case 12:
            ACR_SpawnObject("03_silvy_commoner_m", OBJECT_TYPE_CREATURE);
            break;
        case 13:
            ACR_SpawnObject("03_silvy_commoner_n", OBJECT_TYPE_CREATURE);
            break;			
	

      case 14:
            ACR_SpawnObject("03_silvy_commoner_o", OBJECT_TYPE_CREATURE);
            break;
        case 15:
            ACR_SpawnObject("03_silvy_commoner_p", OBJECT_TYPE_CREATURE);
            break;
        case 16:
            ACR_SpawnObject("03_silvy_commoner_q", OBJECT_TYPE_CREATURE);
            break;
        case 17:
            ACR_SpawnObject("03_silvy_commoner_r", OBJECT_TYPE_CREATURE);
            break;
			
			
			
			
			 case 18:
            ACR_SpawnObject("03_silvy_commoner_s", OBJECT_TYPE_CREATURE);
            break;
        case 19:
            ACR_SpawnObject("03_silvy_commoner_t", OBJECT_TYPE_CREATURE);
            break;
        case 20:
            ACR_SpawnObject("03_silvy_commoner_u", OBJECT_TYPE_CREATURE);
            break;
        case 21:
            ACR_SpawnObject("03_silvy_commoner_aa", OBJECT_TYPE_CREATURE);
            break;			
	

      case 22:
            ACR_SpawnObject("03_silvy_commoner_bb", OBJECT_TYPE_CREATURE);
            break;
        case 23:
            ACR_SpawnObject("03_silvy_commoner_cc", OBJECT_TYPE_CREATURE);
            break;
        case 24:
            ACR_SpawnObject("03_silvy_commoner_dd", OBJECT_TYPE_CREATURE);
            break;
        case 25:
            ACR_SpawnObject("03_silvy_commoner_ee", OBJECT_TYPE_CREATURE);
            break;			
	
	

        case 26:
            ACR_SpawnObject("03_silvy_commoner_ff", OBJECT_TYPE_CREATURE);
            break;
        case 27:
           ACR_SpawnObject("03_silvy_commoner_gg", OBJECT_TYPE_CREATURE);
            break;
		case 28:
            ACR_SpawnObject("03_silvy_commoner_hh", OBJECT_TYPE_CREATURE);
            break;
        case 29:
            ACR_SpawnObject("03_silvy_commoner_ii", OBJECT_TYPE_CREATURE);
            break;
        case 30:
            ACR_SpawnObject("03_silvy_commoner_jj", OBJECT_TYPE_CREATURE);
            break;
        case 31:
            ACR_SpawnObject("03_silvy_commoner_kk", OBJECT_TYPE_CREATURE);
            break;			
	

      case 32:
            ACR_SpawnObject("03_silvy_commoner_ll", OBJECT_TYPE_CREATURE);
            break;
        case 33:
            ACR_SpawnObject("03_silvy_commoner_mm", OBJECT_TYPE_CREATURE);
            break;
        case 34:
            ACR_SpawnObject("03_silvy_commoner_nn", OBJECT_TYPE_CREATURE);
            break;
        case 35:
            ACR_SpawnObject("03_silvy_commoner_oo", OBJECT_TYPE_CREATURE);
            break;
						
}}	
    
			
   