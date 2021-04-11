
func int B_GetLaresLocation()
{
	if(Npc_GetDistToWP(Lares,"NW_CITY_PATH_HABOUR_18") < 10000)
	{
		return LOC_CITY;
	};
	if((Npc_GetDistToWP(Lares,"NW_FOREST_PATH_62") < 2000) || (Npc_GetDistToWP(Lares,"NW_FOREST_PATH_56") < 10000))
	{
		return LOC_FOREST_ORNAMENT;
	};
	return LOC_NONE;
};

