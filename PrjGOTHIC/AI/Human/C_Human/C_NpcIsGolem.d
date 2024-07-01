
func int C_NpcIsGolem(var C_Npc slf)
{
	if(slf.guild == GIL_FIREGOLEM)
	{
		return TRUE;
	};
	if(slf.guild == GIL_ICEGOLEM)
	{
		return TRUE;
	};
	if(slf.guild == GIL_STONEGOLEM)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SWAMPGOLEM)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_GOLEM)
	{
		return TRUE;
	};
	if(slf.guild == GIL_STONEGUARDIAN)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_STONEGUARDIAN)
	{
		return TRUE;
	};
	return FALSE;
};

