////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_trg_onenter.nss
//    $Revision:: 236        $ current version of the file
//        $Date:: 2007-01-21#$ date the file was created or modified
//       Author : Cipher
//
//    Var Prefix:
//  Dependencies:
//
//  Description
//  This script calls the ACR's OnEnter code for triggers, and any
//  custom code a server may need. It is not updated in ACR updates.
//
//  Revision History
//  2009/08/6  Wynna  
//  2015/1/13  Wynna - Disabled
//  2015/2/27  Wynna - Revised and reinstated
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "acr_trigger_i"
#include "acr_quest_i"
#include "acr_spawn_i"
#include "acr_language_i"

void TSM_SendText(object oPC, string sText, int bFloat=FALSE, int nColor=COLOR_CYAN, int bFaction=FALSE);

void TSM_SendText(object oPC, string sText, int bFloat=FALSE, int nColor=COLOR_CYAN, int bFaction=FALSE)
{   //Purpose: Send text to a pc or faction in color quickly
    //Original Scripter: Demetrious
    //Last Modified By: Demetrious 10/12/6
    object oFaction;
	
	if (bFloat)
		FloatingTextStringOnCreature(sText, oPC, bFaction, 3.0);
	else
	{
		if (bFaction)
        {
            oFaction = GetFirstFactionMember(oPC, TRUE);
            while (GetIsObjectValid(oFaction))
            {
                if ((GetDistanceBetween(oFaction, oPC)<30.0) && (GetArea(oFaction)==GetArea(oPC)))
                    SendMessageToPC(oPC, sText);
                oFaction = GetNextFactionMember(oPC, TRUE);
            }
        }
        else SendMessageToPC(oPC, sText);
	}	
}

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

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////



void main()
{
ACR_TriggerOnEnter();

// Custom code goes here.
object oPC = GetEnteringObject();
object oPartyLeader = GetFactionLeader(oPC);
object oPartyMember = GetFirstFactionMember(oPartyLeader, TRUE);
string sTravelArea = GetTag(GetArea(OBJECT_SELF));
object oDestTrig = GetNearestObject(OBJECT_TYPE_TRIGGER, oPartyLeader, 1);
if(oDestTrig==OBJECT_SELF)
	{oDestTrig = GetNearestObject(OBJECT_TYPE_TRIGGER, oPartyLeader, 2);}
string sDestWP= GetLocalString(oDestTrig, "sDestination");
if(GetName(OBJECT_SELF)== "Sundabar")
	{sDestWP = "TM_Sundabar_WP";}
if(GetName(OBJECT_SELF)== "Hawk_Nest")
	{sDestWP = "TM_Hawk_Nest_WP";}
if(GetName(OBJECT_SELF)== "North Pass")
	{sDestWP = "6e_northpass_from_TM";}
if(GetName(OBJECT_SELF)== "Delzoun")
	{sDestWP = "TM_Delzoun_WP";}
if(GetName(OBJECT_SELF)== "Moonwood East")
	{sDestWP = "TM_MW_East_WP";}
	
object oDestWP = GetWaypointByTag(sDestWP);
object oMobDest;

if((FindSubString(GetTag(GetArea(oDestWP)), "travel_map_east") != -1) || (FindSubString(GetTag(GetArea(oDestWP)), "travel_map_west") != -1) || (FindSubString(GetTag(GetArea(oDestWP)), "herald") != -1) || ((FindSubString(GetTag(GetArea(oDestWP)), "silverymoon") != -1) && (FindSubString(GetTag(GetArea(oDestWP)), "pass") == -1)))
	{return;}

string sArea;
string sSpotPC;
string sListenPC;
string sSpotListenPC;
string sDragonDirection;
string sPCCombat;
int DCSpot;
int DCSpotNight;
int DCListen;

	
	if(FindSubString(sDestWP, "_RM_") != -1)
			  {DCSpot = 12;
			   sArea = "Rivermoot";
			   DCListen = 12;
			   sSpotPC = "You spot movement near the hillside by the watchtower.";
			   sListenPC = "You hear voices and the rattling of stones turning underfoot." ;
			   sSpotListenPC = "You can both hear and see at least one figure on the road ahead.";
			   sPCCombat = "You see people in combat on the road to Rivermoot!";
			   sDragonDirection = "It passes over, though, and is gone.";
			  }
			else if(FindSubString(sDestWP, "Orphanage") != -1)
			  {DCSpot = 12;
			   sArea = "Orphanage";
			   DCListen = 12;
			   sSpotPC = "At least one distant figure moves on the grounds of the estate to the north.";
			   sListenPC = "Voices and the distant sound of inhabitants going about day to day life drift down to the road." ;
			   sSpotListenPC = "You can both hear and see those going about their day to the north.";
			   sPCCombat = "You see people in combat near the Wands Estate!";
			   sDragonDirection = "It lands above the statues carved into the cliff of the far riverbank and dips its head for a drink!";
			  }
			else if(FindSubString(sDestWP, "Wendover") != -1)
			   {sArea = "Wendover";
				DCSpot = 15;
				DCListen = 15;
				sSpotPC = "Shapes move in the murk to the north.";
			    sListenPC = "Is that the eery moan of a disembodied voice you hear from the direction of the haunted crypt?" ;
			    sSpotListenPC = "Movement too purposeful and voices too loud to belong to the dead disturb the area north of the highway.";
			    sPCCombat = "You see people in combat near Wendover Crypt!";
			    sDragonDirection = "It turns a lazy circle above the middle of the lake, inspecting the crypts from the air, and then continues on the way it was going. It is soon out of sight.";
			    }
			else if(FindSubString(sDestWP, "River_Road") != -1)
			    {DCSpot = 10;
				 sArea = "River_Road";
				 DCListen = 10;
				 sSpotPC = "Although distant from any major settlement, ahead you see others who seem to have cause to wander the Surbrin's shores between Winter's Edge and the Frost Hills.";
				 sListenPC = "The babble of the Surbrin, here broad and shallow, does not cover the sounds of travellers nearby.";
				 sSpotListenPC = "A party of travellers walks the road beside the Surbrin River.";
				 sPCCombat = "Another party has met battle somewhere nearby, on the banks of the Surbrin!";
				 sDragonDirection = "It sets wings and lands on top of a hill in sight of the Surbrin's waters!";
				}
			else if(FindSubString(sDestWP, "Great_Oak") != -1)
			    {DCSpot = 20;
				 sArea = "Great_Oak";
				 DCListen = 20;
				 sSpotPC = "You get a glimpse of movement through the trees to the north.";
				 sListenPC = "You hear a rustling of leaves slightly too loud to be the wind.";
				 sSpotListenPC = "For a moment, you hear a bit of a calm, low conversation blown to you by the breeze, too distant to make out individual words, but your eye is drawn to a momentary movement on a high hill that thrusts its one lone oak above the tops of the surrounding trees. You saw a willowy female figure, briefly.";
				 sPCCombat = "People are fighting something amongst the trees to the north!";
				 sDragonDirection = "It folds its wings and lands on a hill north of the road to the east!";
				}
			else if(FindSubString(sDestWP, "Blasted") != -1)
			    {DCSpot = 12;
				 sArea = "Blasted_Tower";
				 DCListen = 12;
				 sSpotPC = "Against the backdrop of what looks to have been a rain of granite projectiles long ago, you spot humanoid movement.";
				 sListenPC = "The crunch of footsteps sounds on granite flakes that have peeled off pillars of rock to the north, over decades or centuries.";
				 sSpotListenPC = "Whatever he, she or they are doing in there, you both spot and overhear at least one non-monstrous creature to the north, amid the pillars of rock jutting from the earth at all angles.";
				 sPCCombat = "The cries of adventurers and combat drift to you from the direction of a tower amid pillars of natural granite!";
				 sDragonDirection = "It circles, then flares wings to land on a tall pillar of rock east of the Blasted Tower";
				}
			else if(FindSubString(sDestWP, "North_Road") != -1)
			    {sArea = "North_Road"; 
				 DCSpot = 10;
				 DCListen = 10;
				 sSpotPC = "Movement ahead--somebody travels the North Road." ;
				 sListenPC = "A rattle of falling debris and the crunch of footsteps on this rocky stretch of road alerts you to company.";
				 sSpotListenPC = "A party moves down the road, the sound of the passage and the party itself confined by high stone walls.";
				 sPCCombat = "Your journey is interrupted by the clash and screams of unknown people's battle echoing amid the high cliffs!";
				 sDragonDirection = "Wings driving dust before it, it lands on a plateau overlooking the road!";
				 }
			else if(FindSubString(sDestWP, "_HH_") != -1)
			    {sArea = "High_Hold";
				 DCSpot = 10;
				 DCListen = 10;
				 sSpotPC = "You approach High Hold, and somebody -- or something -- else is also approaching." ;
				 sListenPC = "A rattle of falling debris and the crunch of footsteps on this rocky stretch of road alerts you to company.";
				 sSpotListenPC = "You hear voices and see movement on the road.";
				 sPCCombat = "Your journey is interrupted by the clash and screams of unknown people's battle echoing amid the high cliffs!";
				 sDragonDirection = "It circles, perhaps looking for prey. Whatever it seeks, it eventually flies on without landing.";
				 }
			else if(FindSubString(sDestWP, "Flying_Griffon") != -1)
			    {sArea = "Flying_Griffon";
				 DCSpot = 10;
				 DCListen = 10;
				 sSpotPC = "You spot a group of travellers, maybe heading for the inn on this stretch of road.";
				 sListenPC = "The sounds of an adventuring party stand out from the creak of wagons and chatter of travellers.";
				 sSpotListenPC = "Amid the bustle of traffic on this road, you both see and hear a party of travellers ahead who stand out from the crowd.";
				 sPCCombat = "Ahead, another party has been waylaid on the road!";
				 sDragonDirection = "Shadow flitting across the boulders of this narrow valley, it sinks to the top of a outcropping near the Inn!";
				}
			else if(FindSubString(sDestWP, "MW_North") != -1)
			    {DCSpot = 15;
				 sArea = "Moonwood_North";
				 DCListen = 13;
				 sSpotPC = "Shadows move among the trees, difficult to make out.";
				 sListenPC = "Leaves crunch nearby, as if at an unwary step." ;
				 sSpotListenPC = "You spot a party of travellers strolling through the woods.";
				 sPCCombat = "Battle cries echo through the wood, and figures struggle amid the tree trunks.";
				 sDragonDirection = "Trees swaying in the wind of its arrival, it touches down high atop a knoll to the north and then lifts off almost immediately, flying away.";
				 }
			else if(FindSubString(sDestWP, "NR2") != -1)
			    {DCSpot = 12;
				 sArea = "NR2";
				 DCListen = 12;
				 sSpotPC = "A figure -- or the shadow of one -- passes across the rutted entrance to an island tower and its causeway." ;
				 sListenPC = "A flock of crows burst up from the ground, screeching their disapproval of someone moving through the crackling brush.";
				 sSpotListenPC = "Sound and movement signal that the signposted tower of Wima Duvabiddle has visitors.";
				 sPCCombat = "Your journey is interrupted by the clash and screams of unknown people's battle echoing amid the high cliffs!";
				 sDragonDirection = "Accompanied by a minor avalanche as its claws sink into the ground, it finds a perch on a plateau north of the sign pointing to the tower";
				 }
			else if(FindSubString(sDestWP, "Meteor") != -1)
			    {DCSpot = 10;
				 sArea = "Meteor";
				 DCListen = 10;
				 sSpotPC = "At least one figure moves around the edge of the lake, on the red-stained earth of the shore.";
				 sListenPC = "The sound of water lapping can't disguise the sound of visitors to the lake. A shower of gravel plops into the water and wet earth sucks at boots with somebody's footsteps." ;
				 sSpotListenPC = "At least one figure dallies at the lake shore. You can hear footsteps in the wet mud and see movement through the trees.";
				 sPCCombat = "Steel flashes and war cries sound from the shores of the lake! People have joined battle there.";
				 sDragonDirection = "It dives into the water in a fountain of spray, only to emerge and find a perch on the island of rock in the center of the lake";
				}
				
			else if((FindSubString(sDestWP, "MW_West_W") != -1) || (FindSubString(sDestWP, "MW_East") != -1))
			    {DCSpot = 15;
				 sArea = "Moonwood";
				 DCListen = 13;
				 sSpotPC = "Shadows move among the trees, difficult to make out.";
				 sListenPC = "Leaves crunch nearby, as if at an unwary step." ;
				 sSpotListenPC = "You spot a party of travellers strolling through the woods.";
				 sPCCombat = "Battle cries echo through the wood, and figures struggle amid the tree trunks.";
				 sDragonDirection = "It passes over, and you hear the sounds of its roar fading in the distance. The sounds of the forest are slow to re-establish themselves.";
				 }
		   else if(FindSubString(sDestWP, "_WE_") != -1)
			    {DCSpot = 15;
				 sArea = "WE";
				 DCListen = 13;
				 sSpotPC = "Shadows move among the trees, difficult to make out.";
				 sListenPC = "Leaves crunch nearby, as if at an unwary step." ;
				 sSpotListenPC = "You spot a party of travellers strolling through the woods.";
				 sPCCombat = "Battle cries echo through the wood, and figures struggle amid the tree trunks.";
				 sDragonDirection = "Sinking from the sky, it is lost behind the trees, but you hear a mighty splashing from off in the distance.";
				 }
			 else if(FindSubString(sDestWP, "Surbrin") != -1)
			    {DCSpot = 15;
				 sArea = "Surbrin";
				 DCListen = 13;
				 sSpotPC = "Shadows move among the trees, difficult to make out.";
				 sListenPC = "Leaves crunch nearby, as if at an unwary step." ;
				 sSpotListenPC = "You spot a party of travellers strolling through the woods.";
				 sPCCombat = "Battle cries echo through the wood, and figures struggle amid the tree trunks.";
				 sDragonDirection = "The dragon's flight seems purposeful. It flies overhead, straight as an arrow and at high speed, rapidly dwindling out of sight";
				 }
			 else if(FindSubString(sDestWP, "Quaervarr") != -1)
			    {DCSpot = 15;
				 sArea = "Quaervarr";
				 DCListen = 13;
				 sSpotPC = "Shadows move among the trees, difficult to make out.";
				 sListenPC = "Leaves crunch nearby, as if at an unwary step." ;
				 sSpotListenPC = "You spot a party of travellers strolling through the woods.";
				 sPCCombat = "Battle cries echo through the wood, and figures struggle amid the tree trunks.";
				 sDragonDirection = "Winging straight as an arrow over the forest, it does not land, and eventually dwindles in the distance to a speck in the sky, and is gone.";
				 }
			else if(FindSubString(sDestWP, "Nether_Junction") != -1)
			    {DCSpot = 10;
				 sArea = "Nether_Junction";
				 DCListen = 10;
				 sSpotPC = "You can see a party of travellers ahead for a long way before coming in range to hail them.";
				 sListenPC = "Sounds echo off the rock face to the east, carrying ahead of some travelling party." ;
				 sSpotListenPC = "A group of travellers walks the road, visible and audible from a distance.";
				 sPCCombat = "Ahead, travellers have apparently been attacked on the road!";
				 sDragonDirection = "Driving a nearby heard into a terrified stampede, it settles on a plateau overlooking the road and folds its wings.";
				}
			else if(FindSubString(sDestWP, "Nether_Foothill") != -1)
			    {DCSpot = 10;
				 sArea = "Nether_Foothills";
				 DCListen = 10;
				 sSpotPC = "You can see a party of travellers in the hills.";
				 sListenPC = "Sounds carry a long way in the wilderness, announcing the approach of some travelling party." ;
				 sSpotListenPC = "A group of travellers travels the wilderness, visible and audible from a distance.";
				 sPCCombat = "Ahead, travellers have apparently been attacked in the wilderness!";
				 sDragonDirection = "It dips and soars on the thermals of the lower Nether Mountains, and with a tilt of its wings, drops out of sight in the higher mountains to the north";
				}
			else if(FindSubString(sDestWP, "Nether_Slope") != -1)
			    {DCSpot = 10;
				 sArea = "Nether_Slopes";
				 DCListen = 10;
				 sSpotPC = "You can see a party of travellers beneath the mountain escarpments.";
				 sListenPC = "Sounds carry a long way in the wilderness, announcing the approach of some travelling party." ;
				 sSpotListenPC = "A group of travellers travels the wilderness, visible and audible from a distance.";
				 sPCCombat = "Ahead, travellers have apparently been attacked in the wilderness!";
				 sDragonDirection = "Wings flaring, it settles on a ledge of the lower escarpments of the mountains";
				}
			else if(FindSubString(sDestWP, "Khelb") != -1)
			    {DCSpot = 10;
				 sArea = "Khelb";
				 DCListen = 10;
				 sSpotPC = "At least one figure that does not appear to be the usual rustic farmer moves near the settlement of Khelb.";
				 sListenPC = "The voices of locals drift down from Khelb's ridgeline, speaking of current visitors to the village.";
				 sSpotListenPC = "You spot a figure whose garb and bearing sets him or her apart from the locals and overhear villagers speaking of visitors.";
				 sPCCombat = "Somewhere nearby, Khelb's pastoral quiet is shattered by the sounds of combat and the cries of adventurers!";
				 sDragonDirection = "Circling the village once, it flares wings and lands atop a cliff overlooking the waterfall to the south";
				}
			else if(FindSubString(sDestWP, "Silvy_Pass") != -1)
			    {sArea = "Silvy_Pass";
				 DCSpot = 12;
				 DCListen = 12;
				 sSpotPC = "You spot travellers trudging either up or down on the steep incline of Silverymoon Pass Road.";
				 sListenPC = "The sounds of travellers echo in the Pass long before you see them.";
				 sSpotListenPC = "You have encountered another party of travellers on the narrow path of the Pass.";
				 sPCCombat = "A party ahead of you has encountered trouble on their trip through Silverymoon Pass!";
				 sDragonDirection = "The vast creature blocks out the sky before it passes over, finding a perch that commands full view of the Pass in both directions";
				 }
			else if(FindSubString(sDestWP, "Hawk") != -1)
			    {DCSpot = 12;
				 sArea = "Hawk_Nest";
				 DCListen = 12;
				 sSpotPC = "Seen above the tree line, travellers seem to have broken their journey at the Hawk's Nest.";
				 sListenPC = "Carried on the clear mountain air, the voices of the knights who man the Hawk's Nest reach you, apparently in conversation with a visitor or visitors.";
				 sSpotListenPC = "The crunching of snow on the path above, the jingle of steel and movement against the stone walls of the Hawk Nest signal travellers coming or going from the fortress.";
				 sPCCombat = "Your travels have brought you into sight of people in combat with something on the slopes near the Hawk's Nest!";
				 sDragonDirection = "The dragon lands on a plateau above the fort and surveys the surroundings!";
				}
		   else if(FindSubString(sDestWP, "northpass") != -1)
			    {DCSpot = 12;
				 sArea = "North_Pass";
				 DCListen = 12;
				 sSpotPC = "Amid the snow glare, you see movement.";
				 sListenPC = "The thin, cold air carries the sounds of travellers.";
				 sSpotListenPC = "Despite the altitude and freezing temperatures, others have ventured into this icy wilderness.";
				 sPCCombat = "You see people in combat on the icy slopes!";
				 sDragonDirection = "The dragon seems to be flying for sheer joy, soaring amid the chasms and peaks of the Nether Mountains";
				 }
			else if(FindSubString(sDestWP, "Silvy_Pass") != -1)
			    {DCSpot = 12;
				 sArea = "Silvy_Pass";
				 DCListen = 12;
				 sSpotPC = "Amid the snow glare, you see movement.";
				 sListenPC = "The thin, cold air carries the sounds of travellers.";
				 sSpotListenPC = "Despite the altitude and freezing temperatures, others have ventured into this icy wilderness.";
				 sPCCombat = "You see people in combat on the icy slopes!";
				 sDragonDirection = "The dragon circles, then lands on a plateau near the center of the Pass";
				 }
			else if(FindSubString(sDestWP, "Auril") != -1)
			    {DCSpot = 12;
				 sArea = "Nether_Summit";
				 DCListen = 12;
				 sSpotPC = "Amid the snow glare, you see movement.";
				 sListenPC = "The thin, cold air carries the sounds of travellers.";
				 sSpotListenPC = "Despite the altitude and freezing temperatures, others have ventured into this icy wilderness.";
				 sPCCombat = "You see people in combat on the icy slopes!";
				 sDragonDirection = "The dragon soars, twining and winding into the crevices of the Nether Mountains";
				 }
			else if(FindSubString(sDestWP, "Delzoun") != -1)
			    {DCSpot = 12;
				 sArea = "Delzoun";
				 DCListen = 12;
				 sSpotPC = "Amid the snow glare, you see movement.";
				 sListenPC = "The thin, cold air carries the sounds of travellers.";
				 sSpotListenPC = "Despite the altitude and freezing temperatures, others have ventured into this icy wilderness.";
				 sPCCombat = "You see people in combat on the icy slopes!";
				 sDragonDirection = "The dragon soars, twining and winding into the crevices of the Nether Mountains";
				 }
			else if(FindSubString(sDestWP, "Auvandell") != -1)
			    {DCSpot = 12;
				 sArea = "Auvandell";
				 DCListen = 12;
				 sSpotPC = "You catch brief sight of a traveller or travellers on the road beneath the village of Auvandell.";
				 sListenPC = "Voices drift down the hill from Auvandell, speaking of passers by on the road.";
				 sSpotListenPC = "The squeak of leather and the soft sounds of sheathed steel draw your eyes to movement of an indeterminate amount of travellers on the road below Auvandell.";
				 sPCCombat = "You see people in combat on the road beneath Auvandell!";
				 sDragonDirection = "The dragon seems to know where it is bound, gliding to a rest on top of a tall pillar of rock southwest of Auvandell";
				}
			else if(FindSubString(sDestWP, "RWK") != -1)
			    {DCSpot = 12;
				 sArea = "RWK";
				 DCListen = 12;
				 sSpotPC = "You see travellers up ahead, silhouetted against the Keep.";
				 sListenPC = "Voices drift down the road from Rauvenwatch Keep.";
				 sSpotListenPC = "The squeak of leather and the jingle of equipment draw your eyes to movement of an indeterminate amount of travellers on the road to Rauvenwatch.";
				 sPCCombat = "You see people in combat on the road to Rauvenwatch!";
				 sDragonDirection = "The sounds of an uproar from the Keep sound as the dragon continues on through the sky, winging away and out of sight.";
				 }
			else if(FindSubString(sDestWP, "Sundabar") != -1)
			    {DCSpot = 12;
				 sArea = "Sundabar";
				 DCListen = 12;
				 sSpotPC = "You see travellers up ahead, heading to or from the walls of Sundabar.";
				 sListenPC = "Voices drift down the road from Sundabar.";
				 sSpotListenPC = "The squeak of leather and the jingle of equipment draw your eyes to movement of an indeterminate amount of travellers on the road to Sundabar.";
				 sPCCombat = "You see people in combat on the road to Rauvenwatch!";
				 sDragonDirection = "The dragon folds its wings and plummets between two peaks, out of sight. A moment later it rises, flapping, carrying a struggling, roaring ogre over the mountains. They are quickly gone.";
				}
						
			DCSpotNight = DCSpot + 5;
			SetLocalString(OBJECT_SELF, "sArea", sArea);
			
			SetLocalString(OBJECT_SELF, "sPCCombat", sPCCombat);
			SetLocalString(OBJECT_SELF, "sSpotPC", sSpotPC);
			SetLocalString(OBJECT_SELF, "sListenPC", sListenPC);
			SetLocalString(OBJECT_SELF, "sSpotListenPC", sSpotListenPC);
			SetLocalString(OBJECT_SELF, "sDragonDirection", sDragonDirection);
			SetLocalInt(OBJECT_SELF, "DCSpot", DCSpot);
			SetLocalInt(OBJECT_SELF, "DCSpotNight", DCSpotNight);
			SetLocalInt(OBJECT_SELF, "DCListen", DCListen);
		
	
			
//Begin actual encounter definitions, both for other PCs and mobs
if(oPC == oPartyLeader) 
	{int nCount=1;
	 while (nCount < 25)
	 	{oMobDest = GetNearestObject(OBJECT_TYPE_WAYPOINT, oDestWP, nCount);
		 //SendMessageToPC(oPC, "GetName oMobDest=" + GetName(oMobDest));
	 		if((GetName(oMobDest) == sArea + "_TM_Encounter_1") || (GetName(oMobDest) == sArea + "_TM_Encounter_2") || (GetName(oMobDest) == sArea + "_TM_Encounter_3"))
	 			{if(((GetName(oMobDest) == sArea + "_TM_Encounter_1") || (GetName(oMobDest) == sArea + "_TM_Encounter_3")) && (Random(2) == 1))
				 	{break;}
				 else if(GetName(oMobDest) == sArea + "_TM_Encounter_2")
				 	{break;}
				}
			else 
				{nCount++;}
		}
	object oDestinationDragon = GetWaypointByTag(sArea + "_TM_Encounter_Sky");
	//Roll iGroup. The monster group is needed now to assign some specialized destinations at the end of the next set of brackets.  
	int iGroup = Random(100);
	//if the PC is looking for orcs for one of two quests, make sure s/he finds orcs
	if((ACR_RetrieveQuestState("003_religion_tempus", oPC) == 2) || (ACR_RetrieveQuestState("003_religion_everdusk", oPC) == 2))
			{iGroup = 53;
			}
	//if the destination is Wendover, always use undead, even if the generic road is chosen instead of the crypt itself as the destination
	if(sArea == "Wendover") 
		{iGroup = 95;
		}
	
	//SendMessageToPC(oPC, "iGroup = " + IntToString(iGroup));
		
	//if the PC is looking for orcs for one of two quests, send them to the generic Pass area; 
	//if the mob is a dragon, always send it to the dragon destination
	
	if((iGroup > 9) && (iGroup < 11))
		 	{int nCount=1;
			 while (nCount < 50)
			 	{oDestinationDragon = GetNearestObject(OBJECT_TYPE_WAYPOINT, oDestWP, nCount);
			 		 if(GetName(oDestinationDragon) == sArea + "_TM_Encounter_Sky") 
			 			{break;}
					else 
						{nCount++;}
				}
			oMobDest = oDestinationDragon;
			 }
//SendMessageToPC(oPC, "MobDest = " + GetName(oMobDest));			
	
	//Now that our destinations are set for PCParty and mob/OtherParty, begin checking for a PCxPC encounter on the highway
	//Clear previous highway meeting, party-relevant, non-permanent trigger settings
	SetLocalInt(OBJECT_SELF, "PCxPC", 0);
	SetLocalInt(OBJECT_SELF, "iPC", 0);
	SetLocalObject(OBJECT_SELF, "oOtherPartyLeader", OBJECT_INVALID);
	SetLocalInt(OBJECT_SELF, "iOtherPartyStealthHide", 0);
	SetLocalInt(OBJECT_SELF, "iOtherPartyStealthMS", 0);
	SetLocalInt(OBJECT_SELF, "iPartyStealthHide", 0);
	SetLocalInt(OBJECT_SELF, "iPartyStealthMS", 0);

	//Set party meeting relevant variables on OBJECT_SELF (trigger), PC Party and any Other Party within 5.0
	//Increment the AreaNumber int on the PartyMember, to be drawn as PreviousAreaNumber next time this fires
	//Refresh auto-follow on Party Members now, since this is the first PartyMember loop in the script
	//Set oPCDestination on Party Members now, since this is the first PartyMember loop in the script
	//Set Party Member name strings on each other for 30 minutes so that PCxPC meetings aren't forced after departy
	object oOtherPC = GetFirstObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(oPartyLeader), FALSE, OBJECT_TYPE_CREATURE);
	while(oOtherPC != OBJECT_INVALID)
		{SetLocalInt(oOtherPC, "FavoredEnemyBonus", 0);
		 if((!GetIsDM(oOtherPC)) && (GetFactionLeader(oOtherPC) == oPartyLeader)  && (GetIsPC(oOtherPC)))
			   {if(oOtherPC != oPartyLeader)
			   		{
				    AssignCommand(oOtherPC, ActionForceFollowObject(oPartyLeader, 0.5, 0));
					SetLocalString(oPartyLeader, GetName(oOtherPC), GetName(oOtherPC));
					SetLocalString(oOtherPC, GetName(oPartyLeader), GetName(oPartyLeader));
					DelayCommand(1800.0, SetLocalString(oOtherPC, GetName(oPartyLeader), GetName(oPartyLeader)));
					DelayCommand(1800.0, SetLocalString(oPartyLeader, GetName(oOtherPC), GetName(oOtherPC)));
					}
					
				//Set variables: Party Hide and Move Silently for PartyLeader Party
				if(GetStealthMode(oPartyLeader) == (STEALTH_MODE_ACTIVATED))
					{while(oPartyMember != OBJECT_INVALID)
					 	{int iPartyStealthHide = GetSkillRank(SKILL_HIDE, oPartyMember, FALSE);
						 if(iPartyStealthHide < GetLocalInt(OBJECT_SELF, "iPartyStealthHide"))
						 	{SetLocalInt(OBJECT_SELF, "iPartyStealthHide", iPartyStealthHide);
						 	}
						 int iPartyStealthMS = GetSkillRank(SKILL_MOVE_SILENTLY, oPartyMember, FALSE);
						 if(iPartyStealthMS < GetLocalInt(OBJECT_SELF, "iPartyStealthMS"))
						 	{SetLocalInt(OBJECT_SELF, "iPartyStealthMS", iPartyStealthMS);
						 	}
					 				
						oPartyMember = GetNextFactionMember(oPartyLeader);
						}
					}
				}
				
		
		//Toggle PCxPC to indicate another party on the road and set Other Party variables
		//Set Other Party Member name strings on each other for 30 minutes so that PCxPC meetings aren't forced after departy
		if((!GetIsDM(oOtherPC)) && (GetFactionLeader(oOtherPC) != oPartyLeader))
				{SetLocalInt(OBJECT_SELF, "PCxPC", 1);
				 SetLocalObject(OBJECT_SELF, "oOtherPartyLeader", GetFactionLeader(oOtherPC));
				 object oOtherPartyLeader = GetLocalObject(OBJECT_SELF, "oOtherPartyLeader");
				 object oOtherFaction = GetFirstFactionMember(oOtherPartyLeader, TRUE);
				 SetLocalString(oOtherPartyLeader, GetName(oOtherFaction), GetName(oOtherFaction));
				 SetLocalString(oOtherFaction, GetName(oOtherPartyLeader), GetName(oOtherPartyLeader));
				 DelayCommand(1800.0, SetLocalString(oOtherFaction, GetName(oOtherPartyLeader), GetName(oOtherPartyLeader)));
				 DelayCommand(1800.0, SetLocalString(oOtherPartyLeader, GetName(oOtherFaction), GetName(oOtherFaction)));
				
				
				//Set variables: Party Hide and Move Silently for other party
				if(GetStealthMode(oOtherPartyLeader) == (STEALTH_MODE_ACTIVATED))
						{int iOtherPartyStealthHide = GetSkillRank(SKILL_HIDE, oOtherPC, FALSE);
						 if(iOtherPartyStealthHide < GetLocalInt(OBJECT_SELF, "iOtherPartyStealthHide"))
						 	{SetLocalInt(OBJECT_SELF, "iOtherPartyStealthHide", iOtherPartyStealthHide);
						 	}
						 int iOtherPartyStealthMS = GetSkillRank(SKILL_MOVE_SILENTLY, oOtherPC, FALSE);
						 if(iOtherPartyStealthMS < GetLocalInt(OBJECT_SELF, "iOtherPartyStealthMS"))
						 	{SetLocalInt(OBJECT_SELF, "iOtherPartyStealthMS", iOtherPartyStealthMS);
						 	}
						 }
				 
				}		
		 oOtherPC = GetNextObjectInShape(SHAPE_SPHERE, 5.0, GetLocation(oPartyLeader), FALSE, OBJECT_TYPE_CREATURE);
		}
		
		object oOtherPartyLeader = GetLocalObject(OBJECT_SELF, "oOtherPartyLeader");
		object oOtherFaction = GetFirstFactionMember(oOtherPartyLeader);
							
	 	//If there is another party on the highway and both groups are not stealthed, jump both parties to meeting area
		//If one or both parties are stealthed, give spot/listen rolls and SendTexts if passed
		//Set DCs for spot/listen rolls and strings for SendTexts
		//Grab cached possible destinations, so that they can be despawned in advance of a PCxPC meeting
		int iPCxPC = GetLocalInt(OBJECT_SELF, "PCxPC");
		if(iPCxPC == 1) 
		   {int iPartyStealthHide = GetLocalInt(OBJECT_SELF, "iPartyStealthHide");				
			int iPartyStealthMS = GetLocalInt(OBJECT_SELF, "iPartyStealthMS");				
			int iOtherPartyStealthHide = GetLocalInt(OBJECT_SELF, "iOtherPartyStealthHide");				
			int iOtherPartyStealthMS = GetLocalInt(OBJECT_SELF, "iOtherPartyStealthMS");				
								 
			int iPartySpotDC = d20(1) + iOtherPartyStealthHide;
			int iPartyListenDC = d20(1) + iOtherPartyStealthMS;
			int iOtherPartySpotDC = d20(1) + iPartyStealthHide;
			int iOtherPartyListenDC = d20(1) + iPartyStealthMS;
		
			string sSpotPC_Stealth = "You catch a glimpse of a travelling party ahead, slipping from shadow to shadow slowly and stealthily.";
			string sListenPC_Stealth = "You hear the muted sounds of travellers on the road ahead. The sounds are soft and muffled.";
			string sSpotListenPC_Stealth = "Sharp eyes and ears allow you to both see and hear a travelling party ahead despite that party's apparent attempt at stealth.";
			string sMeeting = "If you wish to speak with them, perhaps you can convince them to step off the road with you.";
			string sSpotted;	
			sPCCombat = "There is fighting on the road ahead!";
				
					
			
			//Here's where we jump the parties if neither are stealthed				
			if((GetStealthMode(oOtherPartyLeader) != STEALTH_MODE_ACTIVATED) && (GetStealthMode(oPartyLeader) != STEALTH_MODE_ACTIVATED))
				{//First check to see if they've been together recently. If so, assume they don't want an auto-port
				if(GetLocalString(oPartyLeader, GetName(oOtherPartyLeader)) == GetName(oOtherPartyLeader))
					{if(GetLocalInt(oPartyLeader, "TravelledWith " + GetName(oOtherPartyLeader)) == 0)
							{TSM_SendText(oPartyLeader, "Another party of travellers nearby is led by someone with whom you have recently travelled. If you wish to speak to the other party, perhaps you can convince them to step off the road with you.");
							 SetLocalInt(oPartyLeader, "TravelledWith " + GetName(oOtherPartyLeader), 1);
							 DelayCommand(1800.0, SetLocalInt(oPartyLeader, "TravelledWith " + GetName(oOtherPartyLeader), 0));
							 TSM_SendText(oOtherPartyLeader, "Another party of travellers nearby is led by someone with whom you have recently travelled. If you wish to speak to the other party, perhaps you can convince them to step off the road with you.");
							 SetLocalInt(oOtherPartyLeader, "TravelledWith " + GetName(oPartyLeader), 1);
							 DelayCommand(1800.0, SetLocalInt(oOtherPartyLeader, "TravelledWith "+ GetName(oPartyLeader), 0));
							}
						 //Of course, if they're travelling together as solo parties to avoid encounters, that isn't going to work
						 //Give them two hints, then begin rolling encounters as if they were partied as one party
						 else if(GetLocalInt(oPartyLeader, "TravelledWith " + GetName(oOtherPartyLeader)) == 1)
						 	{TSM_SendText(oPartyLeader, "A party of travellers nearby is led by someone with whom you have recently travelled. Perhaps you had better join together as one party to provide protection on the road.");
							 SetLocalInt(oPartyLeader, "TravelledWith " + GetName(oOtherPartyLeader), 2);
							 TSM_SendText(oOtherPartyLeader, "A party of travellers nearby is led by someone with whom you have recently travelled. Perhaps you had better join together as one party to provide protection on the road.");
							 SetLocalInt(oOtherPartyLeader, "TravelledWith " + GetName(oPartyLeader), 2);
							 }						
						 }
					
				//If they haven't travelled or been PCxPC ported together within the last 30 minutes, do the autojump
				else if(GetLocalString(oPartyLeader, GetName(oOtherPartyLeader)) != GetName(oOtherPartyLeader))
					{while(oPartyMember != OBJECT_INVALID)
						{//Set oPCDestination on the jumper so that DMFI follow-off can grab it later if needed
						 while(oOtherFaction != OBJECT_INVALID)
							{//Set those strings to avoid autoporting for 30 minutes
							 SetLocalString(oPartyMember, GetName(oOtherFaction), GetName(oOtherFaction));
					     	 DelayCommand(1800.0, SetLocalString(oPartyMember, GetName(oOtherFaction), ""));
					 	 	 SetLocalString(oOtherFaction, GetName(oPartyMember), GetName(oPartyMember));
					     	 DelayCommand(1800.0, SetLocalString(oOtherFaction, GetName(oPartyMember), ""));
					 	 	 //The Other Party only needs to be told once they're pausing, not once per PartyMember
							 if(GetLocalInt(oOtherFaction, "Pause") != 1)
							 	{TSM_SendText(oOtherFaction, "Another party of travellers nearby causes you to pause in your journey.");
						    	 SetLocalInt(oOtherFaction, "Pause", 1);
								 DelayCommand(10.0, SetLocalInt(oOtherFaction, "Pause", 0));
								 SetLocalString(oOtherFaction, sArea, sArea);	  
					  		     DelayCommand(1800.0, SetLocalString(oOtherFaction, sArea, ""));
								 } 
							oOtherFaction = GetNextFactionMember(oOtherPartyLeader, TRUE);
							}
						 //Set the sArea string to avoid porting to this area in a monster encounter for 30 minutes
						 SetLocalString(oPartyMember, sArea, sArea);	  
			  		     DelayCommand(1800.0, SetLocalString(oPartyMember, sArea, ""));
						 TSM_SendText(oPartyMember, "Another party of travellers nearby causes you to pause in your journey.");
						 oPartyMember = GetNextFactionMember(oPartyLeader, TRUE);
						}
						
				//Jump 'em
					 DelayCommand(5.0, AssignCommand(OBJECT_SELF, JumpPartyToArea(oPartyLeader, oDestWP)));
					 DelayCommand(6.0, AssignCommand(OBJECT_SELF, JumpPartyToArea(oOtherPartyLeader, oDestWP)));
					}
				}
				
			//Here's where we start checking spot rolls for stealthed parties
			 else if((GetStealthMode(oOtherPartyLeader) == STEALTH_MODE_ACTIVATED) && (GetStealthMode(oPartyLeader) != STEALTH_MODE_ACTIVATED))
				{//if the Other Party is stealthed, give each PartyMember a spot/listen roll against the cached worst Hide/MS of the OtherParty
				while(oPartyMember != OBJECT_INVALID)
					{if(GetIsSkillSuccessful(oPartyMember, SKILL_SPOT, iPartySpotDC, FALSE))
						{if(GetIsSkillSuccessful(oPartyMember, SKILL_LISTEN, iPartyListenDC, FALSE))
							{TSM_SendText(oPartyMember, sSpotListenPC_Stealth);
							}
						 else{TSM_SendText(oPartyMember, sSpotPC_Stealth);
						 	}
						TSM_SendText(oPartyMember, sMeeting);
						sSpotted = "One of your party members points out an approaching travelling party.";
						}
					 else if(GetIsSkillSuccessful(oPartyMember, SKILL_LISTEN, iPartyListenDC, FALSE))
							{TSM_SendText(oPartyMember, sListenPC_Stealth);
							 TSM_SendText(oPartyMember, sMeeting);
							 sSpotted = "One of your party members points out an approaching travelling party.";
						     }
					else
						{TSM_SendText(oPartyMember, sSpotted);
						}
						
					oPartyMember = GetNextFactionMember(oPartyLeader, TRUE);
					}
					
				//Warn the stealthed Other Party that others are rolling against them	
				 while(oOtherFaction != OBJECT_INVALID)
					{TSM_SendText(oOtherFaction, "There is another party of travellers ahead. Perhaps they have not seen or heard your stealthy progress.");
					 oOtherFaction = GetNextFactionMember(oOtherPartyLeader);
					}	
				}
				
			//if the PartyLeader Party is stealthed, give each Other Party Member a spot/listen roll 
			//against the cached worst Hide/MS of the PartyLeader Party
				else if((GetStealthMode(oOtherPartyLeader) != STEALTH_MODE_ACTIVATED) && (GetStealthMode(oPartyLeader) == STEALTH_MODE_ACTIVATED))
				{while(oOtherFaction != OBJECT_INVALID)
					{if(GetIsSkillSuccessful(oOtherFaction, SKILL_SPOT, iOtherPartySpotDC, FALSE))
						{if(GetIsSkillSuccessful(oOtherFaction, SKILL_LISTEN, iOtherPartyListenDC, FALSE))
							{TSM_SendText(oOtherFaction, sSpotListenPC_Stealth);
							}
						 else{TSM_SendText(oOtherFaction, sSpotPC_Stealth);
						 	}
						TSM_SendText(oOtherFaction, sMeeting);
						sSpotted = "One of your party members points out an approaching travelling party.";
						}
					 else if(GetIsSkillSuccessful(oOtherFaction, SKILL_LISTEN, iOtherPartyListenDC, FALSE))
							{TSM_SendText(oOtherFaction, sListenPC_Stealth);
							 TSM_SendText(oOtherFaction, sMeeting);
							 sSpotted = "One of your party members points out an approaching travelling party.";
						    }
					else
						{TSM_SendText(oOtherFaction, sSpotted);
						}
												
					oOtherFaction = GetNextFactionMember(oOtherPartyLeader);
					}
					
				 //Warn the stealthed PartyLeader Party that others are rolling against them	
				 while(oPartyMember != OBJECT_INVALID)
					{TSM_SendText(oPartyMember, "There is another party of travellers ahead. Perhaps they have not seen or heard your stealthy progress.");
					 oPartyMember = GetNextFactionMember(oPartyLeader);
					}	
				}
				
			//if both parties are stealthed, roll against each other
			else if((GetStealthMode(oOtherPartyLeader) == STEALTH_MODE_ACTIVATED)&& (GetStealthMode(oPartyLeader) == STEALTH_MODE_ACTIVATED))
				{while(oOtherFaction != OBJECT_INVALID)
					{if(GetIsSkillSuccessful(oOtherFaction, SKILL_SPOT, iOtherPartySpotDC, FALSE))
						{if(GetIsSkillSuccessful(oOtherFaction, SKILL_LISTEN, iOtherPartyListenDC, FALSE))
							{TSM_SendText(oOtherFaction, sSpotListenPC_Stealth);
							}
						 else{TSM_SendText(oOtherFaction, sSpotPC_Stealth, TRUE, COLOR_CYAN);
						 	}
						TSM_SendText(oOtherFaction, sMeeting);
						sSpotted = "One of your party members points out an approaching travelling party.";
						}
					 else if(GetIsSkillSuccessful(oOtherFaction, SKILL_LISTEN, iOtherPartyListenDC, FALSE))
							{TSM_SendText(oOtherFaction, sListenPC_Stealth);
							 TSM_SendText(oOtherFaction, sMeeting);
							 sSpotted = "One of your party members points out an approaching travelling party.";
						     }
					 else
						{TSM_SendText(oOtherFaction, sSpotted, TRUE, COLOR_CYAN);
						}
					 oOtherFaction = GetNextFactionMember(oOtherPartyLeader);
					}
					
				 while(oPartyMember != OBJECT_INVALID)
					{if(GetIsSkillSuccessful(oPartyMember, SKILL_SPOT, iPartySpotDC, FALSE))
						{if(GetIsSkillSuccessful(oPartyMember, SKILL_LISTEN, iPartyListenDC, FALSE))
							{TSM_SendText(oPartyMember, sSpotListenPC_Stealth, TRUE, COLOR_CYAN);
							}
						 else{TSM_SendText(oPartyMember, sSpotPC_Stealth, TRUE, COLOR_CYAN);
						 	}
						TSM_SendText(oPartyMember, sMeeting, TRUE, COLOR_CYAN);
						sSpotted = "One of your party members points out an approaching travelling party.";
						}
					 else if(GetIsSkillSuccessful(oPartyMember, SKILL_LISTEN, iPartyListenDC, FALSE))
							{TSM_SendText(oPartyMember, sListenPC_Stealth, TRUE, COLOR_CYAN);
							 TSM_SendText(oPartyMember, sMeeting, TRUE, COLOR_CYAN);
							 sSpotted = "One of your party members points out an approaching travelling party.";
							}
					 else
						{TSM_SendText(oPartyMember, sSpotted, TRUE, COLOR_CYAN);
						}
					oPartyMember = GetNextFactionMember(oPartyLeader);
					}	
				}
				//At this point, if there IS another party within range and the two parties have NOT gotten two hints to join together, return.
				//Otherwise, if the parties are travelling together too long, go ahead to first check for yet more PCs in the passing areas,
				//then roll encounters with wandering monsters
				if(GetLocalInt(oPartyLeader, "TravelledWith " + GetName(oOtherPartyLeader)) != 2)
					{return;}
			 }
		
					 
																 
		//If no PCxPC Travel Map meeting called for, check the destination area for PCs						
		//Send the PCCombat message to the triggering Party if applicable, then return. It is assumed such combat is visible from the road.
		//If stealthed, give spots to the triggering party against the resident party's Hide/MS
		if(iPCxPC != 1) 
		{	sPCCombat = GetLocalString(OBJECT_SELF, "sPCCombat");
			sSpotListenPC = GetLocalString(OBJECT_SELF, "sSpotListenPC");
			sSpotPC = GetLocalString(OBJECT_SELF, "sSpotPC");
			sListenPC = GetLocalString(OBJECT_SELF, "sListenPC");
			object oObjectPC = GetFirstObjectInArea(GetArea(oDestWP));
			while(oObjectPC != OBJECT_INVALID)
					{if((GetIsPC(oObjectPC)) && (oPartyLeader != oObjectPC))
					 	{SetLocalInt(OBJECT_SELF, "iPC", 1);
						 if(GetIsInCombat(oObjectPC))
							 {while(oPartyMember != OBJECT_INVALID)
								{TSM_SendText(oPartyMember, sPCCombat, TRUE, COLOR_CYAN);
								 oPartyMember = GetNextFactionMember(oPC, TRUE);
								}
							 return;
							}
					 	 else if (GetStealthMode(oObjectPC) != STEALTH_MODE_ACTIVATED)
						 	{int Area_PC_Stealth_Hide = DCSpot;
							 int Area_PC_Stealth_MS = DCListen;
							 break;
							 }
							 
						 else if (GetStealthMode(oObjectPC) == STEALTH_MODE_ACTIVATED)
						 	{int Area_PC_Stealth_Hide = GetSkillRank(SKILL_HIDE, oObjectPC, FALSE);
							 if(Area_PC_Stealth_Hide < GetLocalInt(OBJECT_SELF, "Area_PC_Stealth_Hide"))
							 	{SetLocalInt(OBJECT_SELF, "Area_PC_Stealth_Hide", Area_PC_Stealth_Hide);
							 	}
							 int Area_PC_Stealth_MS = GetSkillRank(SKILL_MOVE_SILENTLY, oObjectPC, FALSE);
							 if(Area_PC_Stealth_MS < GetLocalInt(OBJECT_SELF, "Area_PC_Stealth_MS"))
							 	{SetLocalInt(OBJECT_SELF, "Area_PC_Stealth_MS", Area_PC_Stealth_MS);
							 	}
							}
						 }
					  oObjectPC = GetNextObjectInArea(GetArea(oDestWP));	
					}
			//Give the PartyMembers Spot/Listen vs. the area DCSpot/DCListen if any of the resident PCs aren't stealthed
			//Give the PartyMembers Spot/Listen vs. the worst Hide/MS of the resident PC party if all are stealthed
			int iPC = GetLocalInt(OBJECT_SELF, "iPC");
			if(iPC == 1)
				{while(oPartyMember != OBJECT_INVALID)
					{int Area_PC_Stealth_Hide = GetLocalInt(OBJECT_SELF, "Area_PC_Stealth_Hide");
					 int Area_PC_Stealth_Listen = GetLocalInt(OBJECT_SELF, "Area_PC_Stealth_MS");
					 if(GetIsSkillSuccessful(oPartyMember, SKILL_SPOT, Area_PC_Stealth_Hide, FALSE))
							{if(GetIsSkillSuccessful(oPartyMember, SKILL_LISTEN, Area_PC_Stealth_Listen, FALSE))
								{TSM_SendText(oPartyMember, sSpotListenPC, TRUE, COLOR_CYAN);
								}
							 else 
								{TSM_SendText(oPartyMember, sSpotPC, TRUE, COLOR_CYAN);
								}
							}
					 else if(GetIsSkillSuccessful(oPartyMember, SKILL_LISTEN, Area_PC_Stealth_Listen, FALSE))
								{TSM_SendText(oPartyMember, sListenPC, TRUE, COLOR_CYAN);
								}
							 
					 oPartyMember = GetNextFactionMember(oPC, TRUE);
					  }
				  
				 //if any PCs are in the Destination Area, even if the triggering party failed spot/listen on them, do not spawn monsters on them		  
				 SetLocalInt(OBJECT_SELF, "iPC", 0);
				return;
				}
			} 	
						
	
	//Now that we've passed both the PCxPC travel map meetings and the checks on PCs in the areas associated with this trigger, have we rolled 								
	//our encounter chance on this PartyLeader for this trigger within 30 minutes? 
	//If so, return. If not, set this trigger on Party Members for 30 minutes and proceed.
	if(GetLocalString(oPartyLeader, GetName(OBJECT_SELF)) == GetName(OBJECT_SELF))
			{return;}
			
	else {DelayCommand(1.0, SetLocalString(oPartyLeader, GetName(OBJECT_SELF), GetName(OBJECT_SELF)));
		  DelayCommand(1800.0, SetLocalString(oPartyLeader, GetName(OBJECT_SELF), ""));
		   while(oPartyMember != OBJECT_INVALID)
			  	{SetLocalString(oPartyMember, GetName(OBJECT_SELF), GetName(OBJECT_SELF));
			  	 DelayCommand(1800.0, SetLocalString(oPartyMember, GetName(OBJECT_SELF), ""));
			     oPartyMember = GetNextFactionMember(oPartyLeader, TRUE);
				 }
			}	
		 
			 
	//Go ahead and make a wandering monster roll
		int iRandomEnc = Random(100);
		//if the PC is looking for orcs for one of two quests, make sure s/he finds orcs
		if((ACR_RetrieveQuestState("003_religion_tempus", oPC) == 2) || (ACR_RetrieveQuestState("003_religion_everdusk", oPC) == 2))
			{iRandomEnc = 1;
			}
	    //SendMessageToPC(oPC, "iRandomEnc for " + GetName(OBJECT_SELF) + " = " + IntToString(iRandomEnc));
		
		 if(((!GetIsNight()) && (iRandomEnc < 11)) 
				|| ((GetIsNight()) && (iRandomEnc < 21))
				)   
						
			//Pull the remaining local trigger area variables cached earlier and so far unused, and define others for the first time
	 		{	sArea = GetLocalString(OBJECT_SELF, "sArea");
				sDragonDirection = GetLocalString(OBJECT_SELF, "sDragonDirection");
				DCSpot = GetLocalInt(OBJECT_SELF, "DCSpot");
				DCSpotNight = GetLocalInt(OBJECT_SELF, "DCSpotNight");
				DCListen = GetLocalInt(OBJECT_SELF, "DCListen");
				int iRangerLvlMult;
				string sLinguage;
				string sLangRace;
				string sSpotListen;
				string sSpot;
				string sListen;	 
				string sPosition = "You move quickly to the best defensive position you can find.";
			    string sLookSee = "Uneasy for some reason, you move off the road to have a look around.";
				//Define the group script to run on the waypoint cached as the the mob destination, and monster specific variables
				string sGroup;	 
				if((iGroup < 10 ))
					{sGroup = "argent";
					 sSpotListen = "The clomping of military boots and the jingle of military hardware fill the air. You see a column of Argent Legion soldiers.";
					 sSpot = "You see a file of soldiers.";
					 sListen = "A commanding voice barks an order to troops to halt, somewhere nearby.";
					 sPosition = "";
					 }
				else if((iGroup < 10 ))
					{sGroup = "kis";
					 sSpotListen = "Armor creaks and helmets shine. You see a Knights in Silver patrol.";
					 sSpot = "You see a file of soldiers.";
					 sListen = "A commanding voice barks an order to troops to halt.";
					 sPosition = "";
					 }
				else if(iGroup < 11)
					{object oArea = GetArea(oDestWP);
					 sGroup = "dragon";
					 sSpotListen = "A thunderous roar splits the air from high, high above you as a huge, scaled, winged form flies overhead. Has it seen you? Is it hunting? " + sDragonDirection + ".";
					 sSpot = "The shadow of a massive winged form flashes over the ground, casting you momentarily in its pall. Dread creeps over you.  " + sDragonDirection + ".";
					 sListen = "A thunderous roar echoes suddenly, from above. Only one creature could make that bellow...but where is the dragon?";
					 DCSpot = 5;
				     DCListen = 0;
				 	 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(272, oPartyMember, TRUE)) || (GetHasFeat(1209, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 17)
					{sGroup = "merchant";
					 sSpotListen = "The cheerful whistling and periodic calls of 'Goods for sale!' draw your eyes to a travelling merchant.";
					 sListen = "Somewhere close, you hear a voice calling out: 'Goods for sale!'.";
					 sSpot = "You spot a travelling merchant, by his pack and heavy load of gear.";
					 sPosition = "";
					 }
				else if(iGroup < 22)
					{sGroup = "priest";
					 sSpotListen = "The sound of quiet prayer draws your attention to a figure in clerical garb.";
					 sSpot = "A figure in clerical garb strolls nearby.";
					 sListen = "The soft chanting of someone in prayer reaches your ears.";
					 sPosition = "";
					 }
				else if(iGroup < 27)
					{sGroup = "gnolls_low";
					 sLinguage = LNG_GNOLL;
					 sLangRace = "gnoll";
					 sSpotListen = "Menacing dog-headed figures whine and shake their weaponry. Mangy looking gnolls!";
					 sSpot = "Mangy gnolls snuffle around the underbrush.";
					 sListen = "Somewhere nearby you hear barking and growling strung together into a conversation.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(274, oPartyMember, TRUE)) || (GetHasFeat(1211, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 32)
					{sGroup = "gnolls_elite";
					 sLinguage = LNG_GNOLL;
					 sLangRace = "gnoll";
					 sSpotListen = "Battle-scarred, very large gnolls growl and yip at each other. They appear well armed and experienced!";
					 sSpot = "Battle-scarred, very large gnolls growl and yip at each other.";
					 sListen = "Somewhere nearby you hear barking and growling strung together into a conversation.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(274, oPartyMember, TRUE)) || (GetHasFeat(1211, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 37)
					{sGroup = "goblins_low";
					 sLinguage = LNG_GOBLIN;
					 sLangRace = "goblin";
					 sSpotListen = "Runty, wart-skinned goblins screech and yammer at each other.";
					 sSpot = "Movement in the underbrush seems to be made by small, ugly, green-skinned humanoids.";
					 sListen = "High, thin, vicious voices converse somewhere nearby.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(273, oPartyMember, TRUE))|| (GetHasFeat(1210, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 45)
					{sGroup = "goblins_elite";
					 sLinguage = LNG_GOBLIN;
					 sLangRace = "goblin";
					 sSpotListen = "Jabbering back and forth, goblins, muscled and well-armed for their kind, stalk among the rocks, trees and brush.";
					 sSpot = "Ugly, green-skinned goblins, large for their race, lope along nearby.";
					 sListen = "High, thin, vicious voices converse somewhere nearby in a monstrous language.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(273, oPartyMember, TRUE))|| (GetHasFeat(1210, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 47)
					{sGroup = "lycanthrope";
					 sSpotListen = "A creature half fur and fangs, half humanoid, stalks you. An animal's cry bursts from its throat, but the movement of the creature are too sentient to be pure beast.";
					 sSpot = "You spot a creature half animal, half humanoid.";
					 sListen = "You hear the howls and shrieks of some wild animal.";
					object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(284, oPartyMember, TRUE))|| (GetHasFeat(1219, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 50)
					{sGroup = "ogre_low";
					 sLinguage = LNG_GIANT;
					 sLangRace = "ogre, a dialect of giant";
					 sSpotListen = "Grunting what sounds like curses, crashing, thrusting all out of its path, at least one ogre lumbers nearby.";
					 sSpot = "A huge, mis-shapen humanoid lurches along, carrying a club.";
					 sListen = "A crashing and grunting of what sounds like curses has silenced all natural sounds.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(279, oPartyMember, TRUE)) || (GetHasFeat(1216, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 62)
					{sGroup = "orcs_low";
					 sLinguage = LNG_ORC;
					 sLangRace = "orcish";
					 sSpotListen = "Orcs bellow and snarl, laying waste to all natural beauty around them.";
					 sListen = "Deep, bestial voices growl and bellow, fighting amongst themselves, or preparing to attack?";
					 sSpot = "You spot orcs!";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(275, oPartyMember, TRUE)) || (GetHasFeat(1212, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 67)
					{sGroup = "orcs_elite";
					 sLinguage = LNG_ORC;
					 sLangRace = "orcish";
					 sSpotListen = "Orcs, large even for their kind and well-armed, form an apparently seasoned battle group.";
					 sSpot = "You spot huge, well-armed orcs.";
					 sListen = "Rough, crude, arguments in a bestial tongue drift through the air.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(275, oPartyMember, TRUE)) || (GetHasFeat(1212, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 69)
					{sGroup = "trolls";
					 sLinguage = LNG_GIANT;
					 sLangRace = "troll, a dialect of giant";
					 sSpotListen = "Guttural mumbling and lurching footsteps warn you in time to spot the unmistakable sight -- and smell -- of troll.";
					 sSpot = "You spot a troll.";
					 sListen = "Guttural mumbling sounds and footsteps drag with a rubbery, squishing sound. Something large comes this way.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(279, oPartyMember, TRUE)) || (GetHasFeat(1216, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 71)
					{sGroup = "uthgardt_br";
					 sSpotListen = "You see a hunting party of barbaric humans with black feathers in their hair and beards.";
					sSpot = "You spot shaggy-haired humans wearing animal skin clothes and black feathers in their hair.";
					sListen = "Harsh tongues speak back and forth in a northern dialect, somewhere nearby.";
					object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(267, oPartyMember, TRUE)) || (GetHasFeat(1204, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 73)
					{sGroup = "uthgardt_gw";
					 sSpotListen = "You see a hunting party of barbaric humans wearing wolf skins.";
					 sSpot = "You spot shaggy-haired humans wearing gray wolf skins.";
					 sListen = "Harsh tongues speak back and forth in a northern dialect, somewhere nearby.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(267, oPartyMember, TRUE)) || (GetHasFeat(1204, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 85)
					{sGroup = "wild";
					 if((FindSubString(sArea, "Nether") !=-1) || (FindSubString(sArea, "Pass") !=-1)  || (FindSubString(sArea, "Delzoun") !=-1))
					 	{sGroup = "wild_cold";}
					 sSpotListen = "A wild animal crashes through the landscape nearby.";
					 sSpot = "A wild animal crashes through the landscape, nearby.";
					 sListen = "The grunt and cough of a wild animal sounds from somewhere nearby.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(269, oPartyMember, TRUE))|| (GetHasFeat(1206, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if(iGroup < 90)
					{sGroup = "wolves_timber";
					 sSpotListen = "Lean gray shapes flit through the shadows. A moment later, the howling of wolves splits the air.";
					 sSpot = "Timber wolves lope silently along.";
					 sListen = "Wolves howl from somewhere nearby.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(269, oPartyMember, TRUE))|| (GetHasFeat(1206, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				else if((iGroup < 100) && (GetIsNight()))
					{sGroup = "undead_low";
					 sSpotListen = "A chill creeps over your skin at the sound and sight of undead.";
					 sSpot = "Lurching or clattering, silent or shadowed, the passage of undead chills the air. They have risen near your position";
					 sListen = "Chilling moans and the whisper of heartless, lifeless voices sound in the night from somewhere nearby.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(285, oPartyMember, TRUE))|| (GetHasFeat(1220, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
				
				else if(iGroup < 100)
					{sGroup = "goblins_low";
					 sLinguage = LNG_GOBLIN;
					 sLangRace = "goblin";
					 sSpotListen = "Runty, wart-skinned goblins screech and yammer at each other.";
					 sSpot = "Movement in the underbrush seems to be made by small, ugly, green-skinned humanoids.";
					 sListen = "High, thin, vicious voices converse somewhere nearby.";
					 object oPartyMember = GetFirstFactionMember(oPC, TRUE);
					 while(oPartyMember != OBJECT_INVALID)
					 	{if((GetHasFeat(273, oPartyMember, TRUE))|| (GetHasFeat(1210, oPartyMember, TRUE)))
							{if(GetLevelByClass(7, oPartyMember) < 20)
							 	{iRangerLvlMult = 4;}
							 if(GetLevelByClass(7, oPartyMember) < 15)
							 	{iRangerLvlMult = 3;}
							 if(GetLevelByClass(7, oPartyMember) < 10)
							 	{iRangerLvlMult = 2;}
							 if(GetLevelByClass(7, oPartyMember) < 5)
							 	{iRangerLvlMult = 1;}
							 SetLocalInt(oPartyMember, "FavoredEnemyBonus", 1 * iRangerLvlMult); 
							}
						 oPartyMember = GetNextFactionMember(oPC, TRUE);
					 	} 
					}
						
				string sLangSuccess = "You recognize the language as " + sLangRace + ".";
				//SendMessageToPC(oPC, "sGroup = " + sGroup);
			 
			 				
				//if the Party Leader has not been in an encounter in the selected area in the last 30 minutes, or any encounter for 10 minutes
				//create the encounter, set the variables on all PartyMembers
				//to avoid encounters for 10 minutes and encounters in this area for 30,
				//make spot/listen rolls
				//SendMessageToPC(oPC, "iEncounter = " + IntToString(GetLocalInt(oPC, "iEncounter")));
			 
				if((GetLocalString(oPartyLeader, GetTag(GetArea(oDestWP))) != GetTag(GetArea(oDestWP))) && (GetLocalInt(oPC, "iEncounter") != 1))
				       {SendMessageToAllDMs("Spawning Travel Encounter: " + sGroup + " at " + GetName(oMobDest) + " on " + GetName(oPartyLeader));
					  	//SendMessageToPC(oPC, "Spawning Travel Encounter: " + sGroup + " at " + GetName(oMobDest) + " on " + GetName(oPartyLeader));	
						ACR_SetIsSpawnPointEnabled(oMobDest, TRUE, FALSE);
					    ACR_SpawnGroup(sGroup, oMobDest);
						
						
						oPartyMember = GetFirstFactionMember(oPartyLeader);
						while(oPartyMember != OBJECT_INVALID)
							{int iFavoredEnemyBonus = GetLocalInt(oPartyMember, "FavoredEnemyBonus");
							SetLocalInt(oPartyMember, "iEncounter", 1);
							SetLocalString(oPartyMember, GetTag(GetArea(oDestWP)), GetTag(GetArea(oDestWP)));
							DelayCommand(600.0, SetLocalInt(oPartyMember, "iEncounter", 0));
							DelayCommand(1800.0, SetLocalString(oPartyMember, GetTag(GetArea(oDestWP)), ""));
							 if(GetIsSkillSuccessful(oPartyMember, SKILL_SPOT, DCSpot - iFavoredEnemyBonus, FALSE) )
									{if(GetIsSkillSuccessful(oPartyMember, SKILL_LISTEN - iFavoredEnemyBonus, DCListen, FALSE))
										{TSM_SendText(oPartyMember, sSpotListen, TRUE, COLOR_CYAN);
										 DelayCommand(4.0, TSM_SendText(oPartyMember, sPosition, TRUE, COLOR_CYAN));
										 sLookSee = "One of your party members shouts a warning!";
										 }
									 else{TSM_SendText(oPartyMember, sSpot, TRUE, COLOR_CYAN);
										 DelayCommand(4.0, TSM_SendText(oPartyMember, sPosition, TRUE, COLOR_CYAN));
										 sLookSee = "One of your party members shouts a warning!";
										 }
									 }	 
							  else if(GetIsSkillSuccessful(oPartyMember, SKILL_LISTEN, DCListen - iFavoredEnemyBonus, FALSE)) 
									{TSM_SendText(oPartyMember, sListen, TRUE, COLOR_CYAN);
									 if(_IsLanguageKnown(oPartyMember, sLinguage) == TRUE) 
											{DelayCommand(2.0, TSM_SendText(oPartyMember, sLangSuccess, TRUE, COLOR_CYAN));
											}
									 DelayCommand(4.0, TSM_SendText(oPartyMember, sPosition, TRUE, COLOR_CYAN));
									 sLookSee = "One of your party members shouts a warning!";
									}
							else
								{TSM_SendText(oPartyMember, sLookSee, TRUE, COLOR_CYAN);
								 DelayCommand(4.0, TSM_SendText(oPartyMember, sPosition, TRUE, COLOR_CYAN));
								 sLookSee = "One of your party members shouts a warning!";
									}		
							
							
							if((iGroup==10)&& (oMobDest != OBJECT_INVALID))
								{DelayCommand(180.0, SendMessageToPC(oPartyMember, "The dragon spreads its wings and launches into the air. It rises quickly higher and flies away without a backwards look."));
								 DelayCommand(185.0, ACR_SetIsSpawnPointEnabled(oMobDest, 0, 1));
								}
											
							  oPartyMember = GetNextFactionMember(oPartyLeader, TRUE);
							  }
							
							
							
							
						
						//if the PartyLeader Party is stealthed, give the monsters a spot/listen roll 
						//against the cached worst Hide/MS of the PartyLeader Party. If the monsters fail, apply a bonus to iRandomEnc.
						//The bonus applied is a +1 if the monster fails only Spot or Listen, or a +2 if the monster fails both.
						//If the new iRandomEnc puts the party outside the encounter percentage, abort the port...but leave the critter spawned.
						//Tell the Party that their stealthy progress has helped them avoid a {Jabberwocky} but it could still lurk in X Area.
						object oChild = GetFirstObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(oMobDest), FALSE, OBJECT_TYPE_CREATURE); 
						if(GetStealthMode(oPartyLeader) == STEALTH_MODE_ACTIVATED)
						   {int iPartyStealthHide = GetLocalInt(OBJECT_SELF, "iPartyStealthHide");				
							int iPartyStealthMS = GetLocalInt(OBJECT_SELF, "iPartyStealthMS");				
						    int iMobSpotDC = d20(1) + iPartyStealthHide;
							int iMobListenDC = d20(1) + iPartyStealthMS;
							int iStealth;
							while(oChild != OBJECT_INVALID)
								{DelayCommand(9.5, SetLocalInt(oChild, "ACR_FLOCKING", 1));
								DelayCommand(10.0, ExecuteScript("acf_cre_onspawnin", oChild));
								 if(!GetIsSkillSuccessful(oChild, SKILL_SPOT, iMobSpotDC, FALSE))
										{if(!GetIsSkillSuccessful(oChild, SKILL_LISTEN, iMobListenDC, FALSE))
											{iStealth = 2;}
										 else{iStealth = 1;}
										}
								else if(!GetIsSkillSuccessful(oChild, SKILL_LISTEN, iMobListenDC, FALSE))
											{iStealth = 1;
											}
								iRandomEnc = iRandomEnc + iStealth;
								oChild = GetNextObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(oMobDest), FALSE, OBJECT_TYPE_CREATURE);
								}
								
								
						if(iRandomEnc >= 0)    
								{while(oPartyMember != OBJECT_INVALID)
										{SetLocalInt(oPartyMember, "iEncounter", 0);
										 DelayCommand(11.0, SendMessageToPC(oPartyMember, "You have successfully avoided at least one wandering monster. It may still lurk in the region around " + GetName(GetArea(oDestWP)) + "."));
										 oPartyMember = GetNextFactionMember(oPartyLeader, TRUE);
										}
									 //return;
									}
									
						}
						
							 	
						 
									
						DelayCommand(12.0, JumpPartyToArea(oPartyLeader, oDestWP));
						
						//Drag in other parties that are within 5.0
						if(GetDistanceBetween(oPartyLeader, oOtherPartyLeader) < 5.0)
							{while(oOtherFaction != OBJECT_INVALID)
								{SetLocalObject(oOtherFaction, "oPCDestination", oDestWP);
								 TSM_SendText(oOtherFaction, "You and another party of travellers have stumbled into some trouble on the road!", TRUE, COLOR_CYAN);
								 oOtherFaction = GetNextFactionMember(oOtherPartyLeader, TRUE);
								  }
							 DelayCommand(12.0, JumpPartyToArea(oOtherPartyLeader, oDestWP));
							}
						}	
					}	
					
			}
}