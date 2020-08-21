
func void G_CanNotCast(var int bIsPlayer,var int nCircleNeeded,var int nCirclePossessed)
{
	/*if(bIsPlayer)
	{
		Print(ConcatStrings(PRINT_MAGCIRCLES_MISSING,IntToString(nCircleNeeded - nCirclePossessed)));
	};*/
	if(bIsPlayer)
	{
		if(nCircleNeeded > 6)
		{
			Print(PRINT_MAGCIRCLES_PAL);
		}
		else
		{
			Print(PRINT_MAGCIRCLES_LOW);
		};
	};
};

