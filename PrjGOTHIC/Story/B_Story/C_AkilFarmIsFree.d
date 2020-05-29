
func int C_AkilFarmIsFree()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	}
	else if((ScaredAlvares == TRUE) && (ScaredEngardo == TRUE))
	{
		return TRUE;
	}
	else if(Npc_IsDead(Alvares) && (ScaredEngardo == TRUE))
	{
		return TRUE;
	}
	else if(Npc_IsDead(Engardo) && (ScaredAlvares == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

