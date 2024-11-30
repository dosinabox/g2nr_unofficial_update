
func int C_NpcIsPaladin(var C_Npc slf)
{
	if(slf.guild == GIL_PAL)
	{
		return TRUE;
	};
	if(C_IsNpc(slf,MIL_311_Andre))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,MIL_304_Torwache))
	{
		return TRUE;
	};
	if(C_IsNpc(slf,MIL_305_Torwache))
	{
		return TRUE;
	};
	return FALSE;
};

