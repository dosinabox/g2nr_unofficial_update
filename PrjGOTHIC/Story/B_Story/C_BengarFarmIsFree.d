
func int C_BengarFarmIsFree()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
	if(MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		return TRUE;
	};
	if(Miliz_Flucht == TRUE)
	{
		return TRUE;
	};
	if(!Hlp_IsValidNpc(Rick) && !Hlp_IsValidNpc(Rumbold))
	{
		return TRUE;
	};
	if(Npc_IsDead(Rick) && Npc_IsDead(Rumbold))
	{
		return TRUE;
	};
	if((ScaredRick == TRUE) && (ScaredRumbold == TRUE))
	{
		return TRUE;
	};
	if(Npc_IsDead(Rick) && (ScaredRumbold == TRUE))
	{
		return TRUE;
	};
	if(Npc_IsDead(Rumbold) && (ScaredRick == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

