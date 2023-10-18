
func int C_RengaruIsReadyToTalk()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
	if(!Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB))
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_05_01") <= 700)
	{
		return TRUE;
	};
	return FALSE;
};

