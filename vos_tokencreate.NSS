//Vault of Sages Conversation driven creation of token.  
//Wynna March 2008


#include "acr_tools_i"

void main()
{
if(GetItemPossessedBy(GetPCSpeaker(), "003_it_vos_token") == OBJECT_INVALID)
    {CreateItemOnObject("003_it_vos_token", GetPCSpeaker(), 1);
     
    }
    else
    {DelayCommand(2.0, SpeakString("Your current token is still valid.", TALKVOLUME_TALK));
    }

}