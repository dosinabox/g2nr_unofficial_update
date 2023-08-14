
func int C_NpcIsIceCreature(var C_Npc slf)
{
	if(slf.guild == GIL_ICEGOLEM)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ICEWOLF)
	{
		return TRUE;
	};
	return FALSE;
};

