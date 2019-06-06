
func int C_AkilFarmIsFree()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	}
	else if((ScaredAlvares == TRUE) && (ScaredEngardo == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

