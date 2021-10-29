
var int B_Greg_ComesToDexter_OneTime;

func void B_Greg_ComesToDexter()
{
	if(Greg_Rejected == FALSE)
	{
		if(!ArmorEquipped(Greg_NW,ITAR_PIR_H_Addon))
		{
			AI_EquipArmor(Greg_NW,ITAR_PIR_H_Addon);
		};
		if(B_Greg_ComesToDexter_OneTime == FALSE)
		{
			self.aivar[AIV_EnemyOverride] = FALSE;
			BanditGuard.aivar[AIV_EnemyOverride] = FALSE;
			Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,hero);
			GregLocation = Greg_Dexter;
			B_StartOtherRoutine(Greg_NW,"Dexter");
			B_StartOtherRoutine(BanditGuard,"Attack");
			B_StartOtherRoutine(BDT_1067_Bandit_L,"Attack");
			B_StartOtherRoutine(BDT_1068_Bandit_L,"Attack");
			B_Greg_ComesToDexter_OneTime = TRUE;
		};
	};
};

func void B_Greg_ComesToDexterLater()
{
	if(!ArmorEquipped(Greg_NW,ITAR_PIR_H_Addon))
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
	else if(C_IsNpc(slf,BDT_1040_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1041_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1042_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1043_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1044_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1045_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1046_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1047_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1048_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1049_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1061_Wache))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1062_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1063_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1064_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1065_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1066_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1067_Bandit_L))
	{
		return TRUE;
	}
	else if(C_IsNpc(slf,BDT_1068_Bandit_L))
	{
		return TRUE;
	};
	return FALSE;
};

