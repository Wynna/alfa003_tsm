
void main()
{
    object oPC = GetEnteringObject();
    string sShelf = "Previous Section:  Continued";


   
    if((FindSubString(GetTag(OBJECT_SELF), "slv_library_shelf") != -1) && ((GetIsPC(oPC) == TRUE) || (GetIsDMPossessed(oPC))))
       {string sTag = GetTag(OBJECT_SELF);
	    if(sTag == "slv_library_shelf_1")
            {sShelf = "Abjuration";}
		if(sTag == "slv_library_shelf_2")
            {sShelf = "Alchemy";}
		if(sTag == "slv_library_shelf_3")
            {sShelf = "Artifacts";}
		if(sTag == "slv_library_shelf_4")
            {sShelf = "Astrology & Astronomy";}	
		if(sTag == "slv_library_shelf_5")
            {sShelf = "Augury";}
		if(sTag == "slv_library_shelf_6")
            {sShelf = "Bardic";}
		if(sTag == "slv_library_shelf_7")
            {sShelf = "Binding";}
		if(sTag == "slv_library_shelf_8")
            {sShelf = "Canticles and Cantrips";}	
		if(sTag == "slv_library_shelf_9")
            {sShelf = "Conjuration";}	
		if(sTag == "slv_library_shelf_10")
            {sShelf = "Demonology";}	
		if(sTag == "slv_library_shelf_11")
            {sShelf = "Divination";}	
		if(sTag == "slv_library_shelf_12")
            {sShelf = "Dragonology";}	
		if(sTag == "slv_library_shelf_13")
            {sShelf = "Enchantment";}
		if(sTag == "slv_library_shelf_14")
            {sShelf = "Excorcism";}
		if(sTag == "slv_library_shelf_15")
            {sShelf = "Fortune-telling";}
		if(sTag == "slv_library_shelf_16")
            {sShelf = "Geomancy";}
		if(sTag == "slv_library_shelf_17")
            {sShelf = "Hexing and Jinxing";}
		if(sTag == "slv_library_shelf_18")
            {sShelf = "Illusion";}
		if(sTag == "slv_library_shelf_19")
            {sShelf = "Monstrology";}
		if(sTag == "slv_library_shelf_20")
            {sShelf = "Necromancy";}
		if(sTag == "slv_library_shelf_21")
            {sShelf = "Planar Magic";}
		if(sTag == "slv_library_shelf_22")
            {sShelf = "Prestidigitation";}
		if(sTag == "slv_library_shelf_23")
            {sShelf = "Prophecy";}
		if(sTag == "slv_library_shelf_24")
            {sShelf = "Runes";}
		if(sTag == "slv_library_shelf_25")
            {sShelf = "Soothsaying";}
		if(sTag == "slv_library_shelf_26")
            {sShelf = "Sorcery";}
		if(sTag == "slv_library_shelf_27")
            {sShelf = "Spells";}
		if(sTag == "slv_library_shelf_28")
            {sShelf = "Superstitions (True and False)";}
    	if(sTag == "slv_library_shelf_29")
            {sShelf = "Thaumaturgy";}
		if(sTag == "slv_library_shelf_30")
            {sShelf = "Theomancy";}
		if(sTag == "slv_library_shelf_31")
            {sShelf = "Transmutation";}
		if(sTag == "slv_library_shelf_32")
            {sShelf = "Warlocks & Witchcraft";}
		if(sTag == "slv_library_shelf_33")
            {sShelf = "Wizardry";}
									
                   

        SendMessageToPC(oPC, "These shelves are labelled:  " + sShelf + ".");
        }

}