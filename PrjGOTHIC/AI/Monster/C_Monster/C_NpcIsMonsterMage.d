
func int C_NpcIsMonsterMage(var C_Npc slf)
{
	if((slf.guild == GIL_SKELETON_MAGE) || (slf.guild == GIL_FIREGOLEM) || (slf.guild == GIL_ICEGOLEM) || (slf.guild == GIL_DRAGON))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

