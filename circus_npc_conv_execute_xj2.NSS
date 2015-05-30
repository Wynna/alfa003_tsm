//Conversation driven for Jenny's circus act
//Wynna May 2015


void ActionCreateWynPlace(string sPlace, location lLocPlace)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, sPlace, lLocPlace);
}

void ActionCreateWynPlacedEffect(string sPlacedEffect, location lLocPlace)
{
    CreateObject(OBJECT_TYPE_PLACED_EFFECT, sPlacedEffect, lLocPlace);
}

void ReallyPlayCustomAnimation(object oObject, string sAnimationName, int nLooping, float fSpeed = 1.0f)
 {
    PlayCustomAnimation(oObject, sAnimationName, nLooping, fSpeed);
 }
 
void main()
{
		 
	
	//Water Genasi Acrobat	
	if((GetTag(OBJECT_SELF) == "003_cr_circus_jenny") && (GetTag(GetArea(OBJECT_SELF)) == "003_travelling_circus_int_bigtp"))
			{		  object oLadderCenterWestUp = GetWaypointByTag("003_plc_circus_ladder_cw_up_WP");
					  object oLadderCenterWestDown = GetWaypointByTag("003_plc_circus_ladder_cw_dn_WP");
					  object oLadderCenterEastUp = GetWaypointByTag("003_plc_circus_ladder_ce_up_WP");
					  object oLadderCenterEastDown = GetWaypointByTag("003_plc_circus_ladder_ce_dn_WP");
					  object oLadderHighwireDown = GetWaypointByTag("003_plc_circus_ladder_hw_up_WP");
					  object oLadderHighwireUp = GetWaypointByTag("003_plc_circus_ladder_hw_up_WP");
					  object oLadderHighwireGap = GetWaypointByTag("highwire_gap_south_WP");
					  object oLadderPlatformWestUp = GetWaypointByTag("003_plc_circus_ladder_pw_up_WP");
					  location lFountain = GetLocation(GetWaypointByTag("fountain_wp"));
					  object oHighwireCartwheel1=GetWaypointByTag("003_plc_circus_hw_1_WP");
					  object oHighwireCartwheel2=GetWaypointByTag("003_plc_circus_hw_2_WP");
					  object oHighwireCartwheel3=GetWaypointByTag("003_plc_circus_hw_3_WP");
					  object oHighwireCartwheel4=GetWaypointByTag("003_plc_circus_hw_4_WP");
					  object oHighwireCartwheel5=GetWaypointByTag("003_plc_circus_hw_5_WP");
					  object oHighwireCartwheel6=GetWaypointByTag("003_plc_circus_hw_6_WP");
					  object oExitTankRear=GetWaypointByTag("circus_highwire_fall_wp");
					  
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oLadderCenterWestUp, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oLadderCenterEastUp, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oHighwireCartwheel1, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oHighwireCartwheel2, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oHighwireCartwheel3, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oHighwireCartwheel4, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oHighwireCartwheel5, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oHighwireCartwheel6, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oHighwireCartwheel6, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oLadderPlatformWestUp, 1), 5.0);
					  DestroyObject(GetNearestObjectByTag("circus_fx_spotlight",oLadderHighwireGap, 1), 5.0);
					  ActionCreateWynPlace("fountain_collball", lFountain);
					  }
				  
		}
			 			 