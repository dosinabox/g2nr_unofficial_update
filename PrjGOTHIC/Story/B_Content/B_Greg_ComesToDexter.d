
var int B_Greg_ComesToDexter_OneTime;
var C_Item itm;

func void B_Greg_ComesToDexter()
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
			Npc_SendPassivePerc(Dexter,PERC_ASSESSFIGHTSOUND,Dexter,hero);
			GregLocation = Greg_Dexter;
			B_StartOtherRoutine(Greg_NW,"Dexter");
			B_StartOtherRoutine(BDT_1064_Bandit_L,"Attack");
			B_Greg_ComesToDexter_OneTime = TRUE;
		};
	};
};

