
func int C_CanAskPiratesAboutFrancis()
{
	if(Npc_IsDead(Francis))
	{
		return FALSE;
	};
	if(Francis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};
	return FALSE;
};

