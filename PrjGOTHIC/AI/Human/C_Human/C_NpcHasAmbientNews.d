
func int C_NpcHasAmbientNews(var C_Npc slf)
{
	if(slf.aivar[AIV_NewsOverride] == TRUE)
	{
		return FALSE;
	};
	if(B_GetPlayerCrime(slf) == CRIME_NONE)
	{
		if(slf.aivar[AIV_CommentedPlayerCrime] == TRUE)
		{
			return TRUE;
		};
		return FALSE;
	};
	return TRUE;
};

