
func int C_BennetIsInPrison()
{
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			return TRUE;
		};
	};
	return FALSE;
};

