
func int C_NpcIsSummon(var C_Npc slf)
{
	if(slf.guild == GIL_SUMMONED_GOBBO_SKELETON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_WOLF)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_SKELETON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_GOLEM)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_DEMON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_STONEGUARDIAN)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_ZOMBIE)
	{
		return TRUE;
	};
	return FALSE;
};

