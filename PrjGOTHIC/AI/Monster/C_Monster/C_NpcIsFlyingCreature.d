
func int C_NpcIsFlyingCreature(var C_Npc slf)
{
	if(slf.guild == GIL_BLOODFLY)
	{
		return TRUE;
	};
	if(slf.guild == GIL_WISP)
	{
		return TRUE;
	};
	if(slf.guild == GIL_HARPY)
	{
		return TRUE;
	};
	if(slf.guild == GIL_SKELETON_MAGE)
	{
		return TRUE;
	};
	return FALSE;
};

