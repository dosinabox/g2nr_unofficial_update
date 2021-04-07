
func int B_GetLaresLocation()
{
	if(Npc_GetDistToWP(Lares,"NW_CITY_PATH_HABOUR_18") < 8000)
	{
		return LOC_CITY;
	};
	if(Npc_GetDistToWP(Lares,"NW_TAVERNE_BIGFARM_05") < 2000)
	{
		return LOC_TAVERNE;
	};
	if(Npc_GetDistToWP(Lares,"NW_FOREST_PATH_62") < 2000)
	{
		return LOC_FOREST_ORNAMENT;
	};
	if(Npc_GetDistToWP(Lares,"NW_FOREST_PATH_56") < 10000)
	{
		return LOC_FOREST_ORNAMENT;
	};
	return LOC_NONE;
};

