
func int C_NpcIsDemon(var C_Npc slf)
{
	if(slf.guild == GIL_DEMON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SUMMONED_DEMON)
	{
		return TRUE;
	};
	return FALSE;
};

