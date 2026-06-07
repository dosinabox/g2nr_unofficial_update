
func int C_MartinIsInTavern()
{
	if(!Hlp_IsValidNpc(Martin))
	{
		return FALSE;
	};
	if(C_NpcIsDown(Martin))
	{
		return FALSE;
	};
	if(Npc_GetDistToWP(Martin,"NW_CITY_HABOUR_TAVERN01_04") >= PERC_DIST_DIALOG)
	{
		return FALSE;
	};
	return TRUE;
};

