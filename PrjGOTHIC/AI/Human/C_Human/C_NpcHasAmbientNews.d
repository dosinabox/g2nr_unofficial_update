
func int C_NpcHasAmbientNews(var C_Npc slf)
{
	if(slf.aivar[AIV_NewsOverride] == TRUE)
	{
		return FALSE;
	};
	if(B_GetPlayerCrime(slf) == CRIME_NONE)
	{
		return FALSE;
	};
	return TRUE;
};

