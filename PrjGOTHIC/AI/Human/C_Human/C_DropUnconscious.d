
func int C_DropUnconscious()
{
	if((other.guild > GIL_SEPERATOR_HUM) || (other.guild == GIL_DMT) || (other.guild == GIL_BDT) || (other.aivar[AIV_DropDeadAndKill] == TRUE))
	{
		return FALSE;
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((self.guild != GIL_DMT) && (self.guild != GIL_BDT) && (self.aivar[AIV_DropDeadAndKill] == FALSE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

