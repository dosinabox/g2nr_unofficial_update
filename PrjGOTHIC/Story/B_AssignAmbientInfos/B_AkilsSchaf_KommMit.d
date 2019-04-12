
instance DIA_AkilsSchaf_KommMit(C_Info)
{
	npc = Follow_Sheep_AKIL;
	nr = 1;
	condition = DIA_AkilsSchaf_KommMit_Condition;
	information = DIA_AkilsSchaf_KommMit_Info;
	description = "Пойдем со мной!";
};


func int DIA_AkilsSchaf_KommMit_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_AkilsSchaf_KommMit_Info()
{
	B_KommMit();
	B_LieselMaeh();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if(Npc_IsDead(BDT_1025_Bandit_H) == FALSE)
	{
		BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(Npc_IsDead(BDT_1026_Bandit_H) == FALSE)
	{
		BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	};
	AI_StopProcessInfos(self);
};

