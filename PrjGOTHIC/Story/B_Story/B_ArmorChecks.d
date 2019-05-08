
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

func int C_KardifArmorCheckFailed(var C_Npc oth)
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
		if(Hlp_IsItem(armor,ITAR_NOV_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_L))
		{
			return TRUE;
		};
		if(Hlp_IsItem(armor,ITAR_KDF_H))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int AnyRangerRingEquipped()
{
	if((RangerRingIsLaresRing == TRUE) || (RangerRingIsMyRing == TRUE) || (RangerRingIsLanceRing == TRUE))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void B_BaltramRangerCheck(var C_Npc oth)
{
	var C_Item armor;
	armor = Npc_GetEquippedArmor(oth);
	if(SC_KnowsBaltramAsRanger == FALSE)
	{
		if(Npc_HasEquippedArmor(oth))
		{
			if(Hlp_IsItem(armor,ITAR_RANGER_Addon))
			{
				SC_KnowsBaltramAsRanger = TRUE;
			};
		};
		if(AnyRangerRingEquipped())
		{
			SC_KnowsBaltramAsRanger = TRUE;
		};
	};
};

