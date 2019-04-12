
func int C_GetDistToCenter(var C_Npc slf,var int quarter)
{
	var int dist;
	if(quarter == Q_KASERNE)
	{
		if(Npc_GetDistToWP(slf,"NW_CITY_HABOUR_KASERN_CENTRE_03") < Npc_GetDistToWP(slf,"NW_CITY_KASERN_ARMORY_SHARP"))
		{
			dist = Npc_GetDistToWP(slf,"NW_CITY_HABOUR_KASERN_CENTRE_03");
		}
		else
		{
			dist = Npc_GetDistToWP(slf,"NW_CITY_KASERN_ARMORY_SHARP");
		};
	}
	else if(quarter == Q_GALGEN)
	{
		dist = Npc_GetDistToWP(slf,"NW_CITY_MERCHANT_PATH_33_B");
		if(dist > 1900)
		{
			dist = 100000;
		};
	}
	else if(quarter == Q_MARKT)
	{
		dist = Npc_GetDistToWP(slf,"NW_CITY_MERCHANT_PATH_36");
		if(dist > 2300)
		{
			dist = 100000;
		};
	}
	else if(quarter == Q_TEMPEL)
	{
		dist = Npc_GetDistToWP(slf,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	}
	else if(quarter == Q_UNTERSTADT)
	{
		dist = Npc_GetDistToWP(slf,"NW_CITY_MAINSTREET_05");
	}
	else if(quarter == Q_HAFEN)
	{
		if(Npc_GetDistToWP(slf,"NW_CITY_HABOUR_POOR_AREA_PATH_07") < Npc_GetDistToWP(slf,"NW_CITY_HABOUR_SMALLTALK_02"))
		{
			dist = Npc_GetDistToWP(slf,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
		}
		else
		{
			dist = Npc_GetDistToWP(slf,"NW_CITY_HABOUR_SMALLTALK_02");
		};
	}
	else if(quarter == Q_OBERSTADT)
	{
		if((Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_04") < Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_16")) && (Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_04") < Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_18")))
		{
			dist = Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_04");
		};
		if((Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_16") < Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_04")) && (Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_16") < Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_18")))
		{
			dist = Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_16");
		};
		if((Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_18") < Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_04")) && (Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_18") < Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_16")))
		{
			dist = Npc_GetDistToWP(slf,"NW_CITY_UPTOWN_PATH_18");
		};
	}
	else
	{
		PrintPlus("WRONG Q-PARAMETER!");
	};
	return dist;
};

func int C_IsQuarterNearest(var C_Npc slf,var int quart)
{
	var int quartDist;
	quartDist = C_GetDistToCenter(slf,quart);
	if((quartDist <= C_GetDistToCenter(slf,Q_KASERNE)) && (quartDist <= C_GetDistToCenter(slf,Q_GALGEN)) && (quartDist <= C_GetDistToCenter(slf,Q_MARKT)) && (quartDist <= C_GetDistToCenter(slf,Q_TEMPEL)) && (quartDist <= C_GetDistToCenter(slf,Q_UNTERSTADT)) && (quartDist <= C_GetDistToCenter(slf,Q_HAFEN)) && (quartDist <= C_GetDistToCenter(slf,Q_OBERSTADT)))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int C_NpcIsInQuarter(var C_Npc slf)
{
	if(C_IsQuarterNearest(slf,Q_KASERNE))
	{
		return Q_KASERNE;
	};
	if(C_IsQuarterNearest(slf,Q_GALGEN))
	{
		return Q_GALGEN;
	};
	if(C_IsQuarterNearest(slf,Q_MARKT))
	{
		return Q_MARKT;
	};
	if(C_IsQuarterNearest(slf,Q_TEMPEL))
	{
		return Q_TEMPEL;
	};
	if(C_IsQuarterNearest(slf,Q_UNTERSTADT))
	{
		return Q_UNTERSTADT;
	};
	if(C_IsQuarterNearest(slf,Q_HAFEN))
	{
		return Q_HAFEN;
	};
	if(C_IsQuarterNearest(slf,Q_OBERSTADT))
	{
		return Q_OBERSTADT;
	};
};

