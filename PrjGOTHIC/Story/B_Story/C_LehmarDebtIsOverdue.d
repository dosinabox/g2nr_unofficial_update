
func int C_LehmarDebtIsOverdue()
{
	if(!C_DaysSinceEvent(Lehmar_GeldGeliehen_Day,2))
	{
		return FALSE;
	};
	if(Lehmar_GeldGeliehen == 0)
	{
		return FALSE;
	};
	if(RangerHelp_LehmarKohle == TRUE)
	{
		return FALSE;
	};
	return TRUE;
};

