//Silvy Uni Item onActivate.  
//Wynna February 2008


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_items_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_db_persist_i"


void main()
{	
	object oItem = GetItemActivated();
 	object oStudent = GetItemActivator();
	string sItem = GetName(oItem);
 	
				
		//Elementary Transmutation
				     SendMessageToPC(oStudent, "Water spills into the bucket, filling it to the rim...and immediately begins to disappear in a haze of cold steam. It is evaporating before your eyes!");
					 CreateItemOnObject("slv_tra100_water", oStudent, 1);
					 DestroyObject(oItem);
					

}			  