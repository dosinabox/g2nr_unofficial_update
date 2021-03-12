
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
	if(slf.guild == GIL_Stoneguardian)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SummonedGuardian)
	{
		return TRUE;
	};
	return FALSE;
};

