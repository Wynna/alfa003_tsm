
//Wynna April 2015

 
#include "acr_items_i"
#include "acr_db_persist_i"
#include "acr_quest_i"

void main()
{	
	object oItem = GetItemActivated();
 	object oStudent = GetItemActivator();
	object oTarget = GetItemActivatedTarget();
	 
	SetLocalInt(oStudent, "Xorn_Summoned", 1);	
	SendMessageToPC(oStudent, "You feel a faint tingle of arcane power.");
					 
}			  