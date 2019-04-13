
func void G_CanNotCast(var int bIsPlayer,var int nCircleNeeded,var int nCirclePossessed)
{
	var string strMessage;
	var int nDifference;
	var string strDifference;
	nDifference = nCircleNeeded - nCirclePossessed;
	strDifference = IntToString(nDifference);
	strMessage = ConcatStrings(PRINT_MAGCIRCLES_MISSING," ");
	strMessage = ConcatStrings(strMessage,strDifference);
	if(bIsPlayer)
	{
		Print(strMessage);
	};
};

