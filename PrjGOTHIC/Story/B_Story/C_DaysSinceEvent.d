
func int C_DaysSinceEvent(var int eventDay,var int days)
{
	if(eventDay <= (Wld_GetDay() - days))
	{
		return TRUE;
	};
	return FALSE;
};

