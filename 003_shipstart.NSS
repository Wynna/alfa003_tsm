// Operates a ship trip.
// =======================================================================================
// startWP -- the waypoint representing the start of the trip
// endWP -- the waypoint representing the end of the trip
// tripLength -- the length of time, in minutes, that the trip should last
// =======================================================================================
// of note that the ship stays at the dock before the trip starts for two minutes. This is
// to allow full groups time to board. One of the main uses of a ship ride is to get to
// talk without all of those disruptive ATs.
// =======================================================================================

#include "acr_area_instance_i"
#include "003_silverymoon_i"

void CreateObjectNoReturn(int a, string b, location c, int d, string e)
{
	CreateObject(a,b,c,d,e);
}

void _AddDock(object oArea)
{
	object oPlac = GetFirstObjectInArea(oArea);
	while(GetIsObjectValid(oPlac))
	{
		if(GetTag(oPlac) == "PLANK_POSITION")     DelayCommand(1.0f, CreateObjectNoReturn(OBJECT_TYPE_PLACEABLE, "plc_hss_plank_str", GetLocation(oPlac), TRUE, "TEMP"));
		else if(GetTag(oPlac) == "DOCK_POSITION") DelayCommand(1.0f, CreateObjectNoReturn(OBJECT_TYPE_PLACEABLE, "plc_bc_dockg8", GetLocation(oPlac), TRUE, "TEMP"));
		oPlac = GetNextObjectInArea(oArea);
	}
}

void _RemoveDock(object oArea)
{
	object oPlac = GetFirstObjectInArea(oArea);
	while(GetIsObjectValid(oPlac))
	{
		if(GetTag(oPlac) == "TEMP") DestroyObject(oPlac, 0.0f);
		oPlac = GetNextObjectInArea(oArea);
	}
}

void GarbageCollection(object oShip, object oStartWP, object oEndWP)
{
	int notEmpty = 0;
	object oPC = GetFirstObjectInArea(oShip);
	while(GetIsObjectValid(oPC))
	{
		if(GetIsPC(oPC))
		{
			SendMessageToPC(oPC, "The transport remains where it is, and the guards or crew stop by on occasion, letting you know that it's time to get out.");
			notEmpty++;
		}
		oPC = GetNextObjectInArea(oShip);
	}
	if(notEmpty) 
	{
		DelayCommand(60.0f, GarbageCollection(oShip, oStartWP, oEndWP));
		return;
	}
	int count = 0;
	object oArea = GetLocalObject(OBJECT_SELF, ObjectToString(oStartWP) + "_" + ObjectToString(oEndWP) + "_" + IntToString(count));
	while(GetIsObjectValid(oArea))
	{
		if(oArea == oShip)
		{
			DeleteLocalObject(OBJECT_SELF, ObjectToString(oStartWP) + "_" + ObjectToString(oEndWP) + "_" + IntToString(count));
		}
		count++;
		oArea = GetLocalObject(OBJECT_SELF, ObjectToString(oStartWP) + "_" + ObjectToString(oEndWP) + "_" + IntToString(count));
	}
	ACR_ReleaseAreaInstance(oShip);
}

void StartShipTrip(object oShip)
{
	object oPC = GetFirstObjectInArea(oShip);
	while(GetIsObjectValid(oPC))
	{
		if(GetIsPC(oPC)) SendMessageToPC(oPC, "The transport sets off, and you are now underway.");
		oPC = GetNextObjectInArea(oShip);
	}
	DeleteLocalObject(oShip, "EXIT_WP");
	_RemoveDock(oShip);
}

void EndShipTrip(object oShip, object oStart, object oDest)
{
	string sTransport = GetTag(GetArea(oShip));
	string sArrival = "The calls of sailors and the thuds of ropes being tossed, sails being lowered and the hull against a dock all tell you it is time to disembark.";
	if(FindSubString(sTransport, "caravan")!= -1)
		{sArrival = "The crunch of gravel and the greetings of voices outside tell you that you have arrived and may leave the caravan wagon";}
	object oPC = GetFirstObjectInArea(oShip);
	while(GetIsObjectValid(oPC))
	{
		if(GetIsPC(oPC)) SendMessageToPC(oPC, sArrival);
		oPC = GetNextObjectInArea(oShip);
	}
	SetLocalObject(oShip, "EXIT_WP", oDest);
	DelayCommand(60.0f, GarbageCollection(oShip, oStart, oDest));
	_AddDock(oShip);
}

object GetShipTemplate(object oPC, object oShipboardWP)
{
	if(GetIsObjectValid(GetLocalObject(GetModule(), "SHIP_TEMPLATE"))) return GetLocalObject(GetModule(), "SHIP_TEMPLATE");
	
	object oShipWP = GetWaypointByTag(GetTag(oShipboardWP));
	object oTemplateArea = GetArea(oShipWP);
	if(GetIsObjectValid(oTemplateArea))
	{
		return oTemplateArea;
	}
	else
	{
		SendMessageToPC(oPC, "Error: Could not find the transportation's template area.");
		return OBJECT_INVALID;
	}
}
object GetShip(object oStartWP, object oEndWP, object oPC, float tripLength, object oShipboardWP)
{
	int count = 0;
	object oArea = GetLocalObject(OBJECT_SELF, ObjectToString(oStartWP) + "_" + ObjectToString(oEndWP) + "_" + IntToString(count));
	while(GetIsObjectValid(oArea))
	{
		if(GetLocalObject(oArea, "EXIT_WP") == oStartWP)
		{
			return oArea;
		}
		count++;
		oArea = GetLocalObject(OBJECT_SELF, ObjectToString(oStartWP) + "_" + ObjectToString(oEndWP) + "_" + IntToString(count));
	}
	oArea = GetShipTemplate(oPC, oShipboardWP);
	if(!GetIsObjectValid(oArea)) return OBJECT_INVALID;
	oArea = ACR_CreateAreaInstance(oArea);
	SetLocalObject(OBJECT_SELF, ObjectToString(oStartWP) + "_" + ObjectToString(oEndWP) + "_" + IntToString(count), oArea);
	SetLocalObject(oArea, "EXIT_WP", oStartWP);
	_AddDock(oArea);
	DelayCommand(2.0f * 30.0f, StartShipTrip(oArea));
	DelayCommand((2.0f + tripLength) * 60.0f, EndShipTrip(oArea, oStartWP, oEndWP));
	return oArea;
}

object GetShipWaypoint(object oShip, object oPC, object oShipboardWP)
{
	object oWP = GetFirstObjectInArea(oShip);
	while(GetIsObjectValid(oWP))
	{
		if(GetTag(oWP) == GetTag(oShipboardWP)) return oWP;
		oWP = GetNextObjectInArea(oShip);
	}
	SendMessageToPC(oPC, "Error: could not find transportation's entry waypoint");
	return OBJECT_INVALID;
}

void ManageShip(string startWP, string endWP, object oPC, float tripLength, object oShipboardWP)
{
	object oStartWP = GetWaypointByTag(startWP);
	object oEndWP = GetWaypointByTag(endWP);
	object oShip = GetShip(oStartWP, oEndWP, oPC, tripLength, oShipboardWP);
	if(!GetIsObjectValid(oShip)) return;
	object oWP = GetShipWaypoint(oShip, oPC, oShipboardWP);
	if(!GetIsObjectValid(oWP)) return;
	// Remove Silverymoon's wards.
	RemoveSilverymoonWards( oPC );
	AssignCommand(oPC, JumpToObject(oWP));
	
}

void main(string startWP, string endWP, float tripLength, string shipboardWP)
{
	object oPC = GetPCSpeaker();
	object oShipboardWP = GetWaypointByTag(shipboardWP);
    SendMessageToPC(oPC, "You board your transport, and make ready to depart.");
	AssignCommand(GetModule(), ManageShip(startWP, endWP, oPC, tripLength, oShipboardWP));}