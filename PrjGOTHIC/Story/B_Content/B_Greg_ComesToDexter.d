
var int B_Greg_ComesToDexter_OneTime;
var C_Item itm;

func void B_Greg_ComesToDexter()
{
	if(Greg_Rejected == FALSE)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dexter))
		{
			itm = Npc_GetEquippedArmor(Greg_NW);
			if(!Hlp_IsItem(itm,ITAR_PIR_H_Addon))
			{
				AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
			};
			if(B_Greg_ComesToDexter_OneTime == FALSE)
			{
				Dexter.aivar[AIV_EnemyOverride] = FALSE;
				BanditGuard.aivar[AIV_EnemyOverride] = FALSE;
				Npc_SendPassivePerc(Dexter,PERC_ASSESSFIGHTSOUND,Dexter,hero);
				GregLocation = Greg_Dexter;
				B_StartOtherRoutine(Greg_NW,"Dexter");
				B_StartOtherRoutine(BanditGuard,"Attack");
				B_StartOtherRoutine(BDT_1067_Bandit_L,"Attack");
				B_StartOtherRoutine(BDT_1068_Bandit_L,"Attack");
				B_Greg_ComesToDexter_OneTime = TRUE;
			};
		};
	};
};

func void B_Greg_ComesToDexterLater()
{
	itm = Npc_GetEquippedArmor(Greg_NW);
	if(!Hlp_IsItem(itm,ITAR_PIR_H_Addon))
	{
		AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
	};
	if(B_Greg_ComesToDexter_OneTime == FALSE)
	{
		GregLocation = Greg_Dexter;
		B_StartOtherRoutine(Greg_NW,"Dexter");
		B_Greg_ComesToDexter_OneTime = TRUE;
	};
};

func int C_AmIDexterBandit(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dexter))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDTWache))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1040_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1041_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1042_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1043_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1044_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1045_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1046_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1047_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1048_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1049_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1062_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1063_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BanditGuard))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1065_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1066_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1067_Bandit_L))
	{
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BDT_1068_Bandit_L))
	{
		return TRUE;
	};
	return FALSE;
};

