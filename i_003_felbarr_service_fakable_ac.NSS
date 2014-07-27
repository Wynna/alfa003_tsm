#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_quest_i"

  //Created by Wynna; May 15, 2009


void main()
{
    object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    
	SendMessageToPC(oUser, "You use materials at hand to copy the pass. When you are done, it looks pretty good to you, but will it pass inspection?");
	CreateItemOnObject("003_felbarr_service_fake", oUser, 1);
	DestroyObject(OBJECT_SELF, 1.0);
 
}