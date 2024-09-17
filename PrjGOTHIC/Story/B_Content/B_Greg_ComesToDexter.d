
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
			if(!Npc_IsDead(BanditGuard))
			{
				BanditGuard.aivar[AIV_EnemyOverride] = FALSE;
				B_StartOtherRoutine(BanditGuard,"ATTACK");
			};
			if(!Npc_IsDead(Dexter))
			{
				Dexter.aivar[AIV_EnemyOverride] = FALSE;
				Npc_SendPassivePerc(Dexter,PERC_ASSESSFIGHTSOUND,Dexter,hero);
			};
			GregLocation = Greg_Dexter;
			B_StartOtherRoutine(Greg_NW,"DEXTER");
			B_StartOtherRoutine(BDT_1067_Bandit_L,"ATTACK");
			B_StartOtherRoutine(BDT_1068_Bandit_L,"ATTACK");
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
		B_StartOtherRoutine(Greg_NW,"DEXTER");
		B_Greg_ComesToDexter_OneTime = TRUE;
	};
};

