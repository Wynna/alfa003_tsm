////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ABR Store OnClosed Script
//     Filename : abr_storeclose.nss
//    $Revision:: 1        $ current version of the file
//        $Date:: 2009-02-01#$ date the file was created or modified
//       Author : AcadiusLost
//
//  Local Variable Prefix =
//
//  Dependencies external of nwscript:
//
//  Description
//  This script cleans up pointers for logging and merchant returns.
//
//  Revision History
//    2009-02-01  AcadiusLost: Inception
////////////////////////////////////////////////////////////////////////////////


void main() {
	object oPC = GetLastClosedBy();
	DeleteLocalInt(oPC, "ACR_GOLD");
	DeleteLocalObject(oPC, "ACR_STORE");
	
	object oMerchant = GetObjectByTag("003_cr_travel_rufus", 1);
	 if(GetTag(OBJECT_SELF) == "tsm_travel_gypsy_store")
		{oMerchant == GetObjectByTag("003_cr_travel_kaspar", 1);
		}
	effect eTest = GetFirstEffect(oMerchant); 
    while (GetIsEffectValid(eTest)) 
		{if (GetEffectCreator(eTest) == OBJECT_SELF) 
		{RemoveEffect(oMerchant, eTest); 
	      } 
      eTest = GetNextEffect(oMerchant); 
   		} 
	
}