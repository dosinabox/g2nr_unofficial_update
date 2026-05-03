
func int C_AkilFarmIsFree()
{
	if(AkilFarmIsFreeKap4 == TRUE)
	{
		return TRUE;
	};
	if(!Hlp_IsValidNpc(Alvares) && !Hlp_IsValidNpc(Engardo))
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
	if(ScaredEngardo == TRUE)
	{
		if(Npc_IsDead(Alvares))
		{
			return TRUE;
		};
	};
	if(ScaredAlvares == TRUE)
	{
		if(Npc_IsDead(Engardo))
		{
			return TRUE;
		};
	};
	return FALSE;
};

