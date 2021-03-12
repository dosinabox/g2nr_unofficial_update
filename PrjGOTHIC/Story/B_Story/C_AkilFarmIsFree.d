
func int C_AkilFarmIsFree()
{
	if((ScaredAlvares == TRUE) && (ScaredEngardo == TRUE))
	{
		return TRUE;
	};
	if(Npc_IsDead(Alvares))
	{
		if(Npc_IsDead(Engardo) || (ScaredEngardo == TRUE))
		{
			return TRUE;
		};
	};
	if(Npc_IsDead(Engardo))
	{
		if(Npc_IsDead(Alvares) || (ScaredAlvares == TRUE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

