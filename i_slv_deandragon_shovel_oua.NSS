//Wynna March 2009



void main()
{	
	object oStudent = GetModuleItemLostBy();
    object oMod = GetModule();
	object oReceiver = GetModuleItemAcquiredBy();
	object oItem = GetModuleItemLost();
	
	
	object oShovelPLC = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_deandragon_shovel_plc", GetLocation(oStudent));
    DestroyObject(oItem);
		
			 

	}