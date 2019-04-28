
func int C_RedlightUndercoverCheckFailed(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(Npc_HasEquippedArmor(oth))
	{
		if(Hlp_IsItem(armor,ITAR_MIL_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_MIL_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PALN_M))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PAL_H))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_PALN_H))
		{
			return TRUE;
		};
	};
	if(Undercover_Failed == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};
