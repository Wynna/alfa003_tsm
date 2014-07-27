#include "silvy_univ_inc"
#include "acr_spawn_i"
#include "acr_db_persist_i"
#include "silvy_univ_func"
void main()
{
             
//OnActivate Script for tests 
	object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    object oStudent = oUser;
	string sMessage = GetCampaignString("SLV_UNI", GetLastName(oItem), GetModule());
		 
	
	SendMessageToPC(oUser, "Silverymoon University Lady's College: Advanced " + sMessage);
	 
		  
}