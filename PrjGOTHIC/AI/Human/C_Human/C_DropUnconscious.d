
func int C_DropUnconscious()
{
	if(!C_NpcIsHuman(self))
	{
		return FALSE;
	};
	if(!C_NpcIsHuman(other))
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

