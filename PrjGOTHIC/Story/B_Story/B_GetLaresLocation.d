
func int B_GetLaresLocation()
{
	if(Npc_GetDistToWP(Lares,"NW_CITY_PATH_HABOUR_18") < 10000)
	{
		return LOC_NW_CITY;
	};
	return LOC_NONE;
};

