

  //Created by Wynna; March 2, 2009


void main()
{
    
  //Deandragon_d Surgical knife made of dragon talon
 
  SendMessageToPC(GetItemPossessor(OBJECT_SELF), "ItemPossessor(OBJECT_SELF)");
  object oKnife = GetObjectByTag("003_it_wpn_dragontalon");
  if(GetLastSpellHarmful() == FALSE)
  	{SendMessageToPC(GetItemPossessor(OBJECT_SELF), "The edge of the surgical blade grows -- if possible -- even sharper with the blessing.");
	 SetLocalInt(GetItemPossessor(OBJECT_SELF), "BlessedWeapon", 1);
	}
   
}