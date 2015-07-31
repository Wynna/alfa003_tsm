void main()
{
	object oArea = GetArea(OBJECT_SELF);
	object oExitWP = GetLocalObject(oArea, "EXIT_WP");
	if(oExitWP == OBJECT_INVALID) 
	{
		SendMessageToPC(GetClickingObject(), "You've already pushed away from shore.");
		return;
	}
	else 
	{
		AssignCommand(GetClickingObject(), JumpToObject(oExitWP));
	}
}