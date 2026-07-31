
func int C_NpcIsEvil(var C_Npc slf)
{
	if(slf.guild == GIL_DMT)
	{
		return TRUE;
	};
	if(slf.guild == GIL_DRAGON)
	{
		return TRUE;
	};
	if(slf.guild == GIL_ORC)
	{
		return TRUE;
	};
	if(slf.guild == GIL_DRACONIAN)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)
	{
		return TRUE;
	};
	if(C_NpcIsDemon(slf))
	{
		return TRUE;
	};
	if(C_NpcIsUndead(slf))
	{
		return TRUE;
	};
	return FALSE;
};

