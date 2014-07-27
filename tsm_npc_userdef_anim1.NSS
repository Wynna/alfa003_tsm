#include "ginc_wp"

const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;


void main()
{

int nUser = GetUserDefinedEventNumber();

    if(nUser == EVENT_HEARTBEAT ) //HEARTBEAT
    {

	int iCurrentWP = GetCurrentWaypoint();
	//ActionSpeakString("Debug", TALKVOLUME_TALK); 
	FaceAndPause(iCurrentWP, 10.0);
	ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 60.0);
        


}	
    else if(nUser == EVENT_PERCEIVE) // PERCEIVE
    {

    }
    else if(nUser == EVENT_END_COMBAT_ROUND) // END OF COMBAT
    {

    }
    else if(nUser == EVENT_DIALOGUE) // ON DIALOGUE
    {

    }
    else if(nUser == EVENT_ATTACKED) // ATTACKED
    {

    }
    else if(nUser == EVENT_DAMAGED) // DAMAGED
    {

    }
    else if(nUser == EVENT_DISTURBED) // DISTURBED
    {

    }
    else if (nUser == EVENT_USER_DEFINED_PRESPAWN)
    {

    }
    else if (nUser == EVENT_USER_DEFINED_POSTSPAWN)
    {



}
}