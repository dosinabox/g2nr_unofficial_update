
func int C_DropUnconscious()
{
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};
	if(self.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(other.guild == GIL_DMT)
	{
		return FALSE;
	};
	if(self.guild == GIL_BDT)
	{
		return FALSE;
	};
	if(other.guild == GIL_BDT)
	{
		return FALSE;
	};
	if(self.aivar[AIV_DropDeadAndKill] == TRUE)
	{
		return FALSE;
	};
	if(other.aivar[AIV_DropDeadAndKill] == TRUE)
	{
		return FALSE;
	};
	return TRUE;
};

