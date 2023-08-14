
func int C_NpcIsFireCreature(var C_Npc slf)
{
	if(slf.guild == GIL_FIREGOLEM)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST_FIRE)
	{
		return TRUE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	{
		return TRUE;
	};
	return FALSE;
};

