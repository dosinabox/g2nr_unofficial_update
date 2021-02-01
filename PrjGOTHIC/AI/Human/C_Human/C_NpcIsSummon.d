
func int C_NpcIsSummon(var C_Npc slf)
{
	if(slf.guild == GIL_SUMMONED_GOBBO_SKELETON)
	{
		return TRUE;
	}
	else if(slf.guild == GIL_SUMMONED_WOLF)
	{
		return TRUE;
	}
	else if(slf.guild == GIL_SUMMONED_SKELETON)
	{
		return TRUE;
	}
	else if(slf.guild == GIL_SUMMONED_GOLEM)
	{
		return TRUE;
	}
	else if(slf.guild == GIL_SUMMONED_DEMON)
	{
		return TRUE;
	}
	else if(slf.guild == GIL_SummonedGuardian)
	{
		return TRUE;
	}
	else if(slf.guild == GIL_SummonedZombie)
	{
		return TRUE;
	};
	return FALSE;
};

