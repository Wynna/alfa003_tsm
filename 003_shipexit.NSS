void main()
{
	object oArea = GetArea(OBJECT_SELF);
	object oExitWP = GetLocalObject(oArea, "EXIT_WP");
	if(oExitWP == OBJECT_INVALID) 
	{
		SendMessageToPC(GetClickingObject(), "Your journey has begun.");
		return;
	}
	else 
	{
		AssignCommand(GetClickingObject(), JumpToObject(oExitWP));
	}
}