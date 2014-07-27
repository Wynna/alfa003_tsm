#include "silvy_univ_inc"
#include "silvy_univ_func"

  //Created by Wynna; November 4, 2008


void main()
{
    object oItem = GetItemActivated();
    object oUser = GetItemActivator();
    object oGem = GetItemActivatedTarget();
	int nValue = GetGoldPieceValue(oGem);

  //Spectacles of the Gemcutter
	
	 if((FindSubString(GetTag(oGem), "gem") != -1) || (FindSubString(GetTag(oGem), "GEM") != -1))
	 
	 	{SendMessageToPC(oUser, "The rough resale value of that gem is " + IntToString(nValue / 2));
		}
		
	 else
	 	{SendMessageToPC(oUser, "That item is not an unset gem!");
		}
 
}