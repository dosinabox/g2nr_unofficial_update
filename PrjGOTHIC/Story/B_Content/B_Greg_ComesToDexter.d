
var int B_Greg_ComesToDexter_OneTime;

func void B_Greg_ComesToDexter()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dexter))
	{
		if(B_Greg_ComesToDexter_OneTime == FALSE)
		{
			Dexter.aivar[AIV_EnemyOverride] = FALSE;
			GregLocation = Greg_Dexter;
			B_StartOtherRoutine(Greg_NW,"Dexter");
			B_Greg_ComesToDexter_OneTime = TRUE;
		};
	};
};

