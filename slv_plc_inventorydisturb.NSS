//OnInventoryDisturb for all Silvy Uni placeables outside the classrooms
//Wynna November 2007


#include "acr_placeable_i"

void main()
{
	ACR_PlaceableOnDisturbed();
    object oItem = GetModuleItemAcquired();
	object oStudent = GetLastDisturbed();
	effect eSmoke = EffectVisualEffect(VFX_DUR_SMOKE, FALSE);	
		
	
		 
if((GetTag(OBJECT_SELF) == "slv_bookorders") && (GetTag(GetInventoryDisturbItem()) == "slv_paper3") && (GetInventoryDisturbType() == 0))
		{if(GetLocalInt(OBJECT_SELF, "Localization") != 1)
			{SetLocalObject(OBJECT_SELF, "Deliveries", GetObjectByTag("slv_stationary_cabinet2"));
			 object oDeliveries = GetLocalObject(OBJECT_SELF, "Deliveries");
		     SetLocalInt(OBJECT_SELF, "Localization", 1);
			 CopyItem(GetInventoryDisturbItem(), oDeliveries, TRUE);
		     DestroyObject(GetInventoryDisturbItem());
		}
			
		 else if(GetLocalInt(OBJECT_SELF, "Localization") == 1)
			{object oDeliveries = GetLocalObject(OBJECT_SELF, "Deliveries");
		    CopyItem(GetInventoryDisturbItem(), oDeliveries, TRUE);
		    DestroyObject(GetInventoryDisturbItem());
		   }
	 
	     ActionSpeakString("*Gulp* Thank you. Check back soon with library staff.", TALKVOLUME_TALK);	
		 SendMessageToPC(oStudent, "The order slides into a momentary dilation of a faint red glow deep in the statue's maw, and is gone.");
		 }	 	
	else if((GetTag(OBJECT_SELF) == "slv_bookorders") && (GetTag(GetInventoryDisturbItem()) != "slv_paper3")&& (GetInventoryDisturbType() == 0))
		{ActionSpeakString("Phtooey.", TALKVOLUME_TALK);	
		 CopyItem(GetInventoryDisturbItem(), oStudent, TRUE);
		 DestroyObject(GetInventoryDisturbItem());
		 }
}