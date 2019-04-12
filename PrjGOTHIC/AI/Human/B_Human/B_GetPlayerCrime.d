
func int B_GetPlayerCrime(var C_Npc slf)
{
	if(slf.aivar[AIV_NpcSawPlayerCommit] <= CRIME_ATTACK)
	{
		if(slf.aivar[AIV_NpcSawPlayerCommitDay] < (Wld_GetDay() - 2))
		{
			return CRIME_NONE;
		};
	};
	if(slf.aivar[AIV_CrimeAbsolutionLevel] < B_GetCurrentAbsolutionLevel(slf))
	{
		return CRIME_NONE;
	};
	return slf.aivar[AIV_NpcSawPlayerCommit];
};

