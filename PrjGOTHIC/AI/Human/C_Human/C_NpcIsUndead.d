
func int C_NpcIsUndead(var C_Npc slf)
{
	if(slf.guild == GIL_GOBBO_SKELETON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_GOBBO_SKELETON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SKELETON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_SKELETON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SKELETON_MAGE)
	{
		return TRUE;
	};
	if(slf.guild == GIL_ZOMBIE)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_ZOMBIE)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SHADOWBEAST_SKELETON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_UNDEADORC)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		return TRUE;
	};
	return FALSE;
};

