
func int C_NpcIsMonsterMage(var C_Npc slf)
{
	if(slf.guild == GIL_SKELETON_MAGE)
	{
		return TRUE;
	};
	if(slf.guild == GIL_FIREGOLEM)
	{
		return TRUE;
	};
	if(slf.guild == GIL_ICEGOLEM)
	{
		return TRUE;
	};
	if(slf.guild == GIL_DRAGON)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		return TRUE;
	};
	return FALSE;
};

