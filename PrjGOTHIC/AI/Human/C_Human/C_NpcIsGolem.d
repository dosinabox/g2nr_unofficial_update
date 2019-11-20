
func int C_NpcIsGolem(var C_Npc slf)
{
	if((slf.guild == GIL_FIREGOLEM) || (slf.guild == GIL_ICEGOLEM) || (slf.guild == GIL_STONEGOLEM) || (slf.guild == GIL_SUMMONED_GOLEM) || (slf.guild == GIL_Stoneguardian) || (slf.guild == GIL_SummonedGuardian))
	{
		return TRUE;
	};
	return FALSE;
};

