
func int C_NpcIsPaladin(var C_Npc slf)
{
	if(slf.guild == GIL_PAL)
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Andre))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,MIL_304_Torwache))
	{
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Torwache_305))
	{
		return TRUE;
	};
	return FALSE;
};

