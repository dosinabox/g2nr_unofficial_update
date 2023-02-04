
func int C_AkilFarmIsFree()
{
	if(AkilFarmIsFreeKap4 == TRUE)
	{
		return TRUE;
	};
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
	if((ScaredAlvares == TRUE) && (ScaredEngardo == TRUE))
	{
		return TRUE;
	};
	if(Npc_IsDead(Alvares) && (ScaredEngardo == TRUE))
	{
		return TRUE;
	};
	if(Npc_IsDead(Engardo) && (ScaredAlvares == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

