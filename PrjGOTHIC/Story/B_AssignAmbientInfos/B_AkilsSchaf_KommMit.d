
instance DIA_AkilsSchaf_EXIT(C_Info)
{
	npc = Follow_Sheep_AKIL;
	nr = 999;
	condition = DIA_AkilsSchaf_EXIT_Condition;
	information = DIA_AkilsSchaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_AkilsSchaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AkilsSchaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AkilsSchaf_KommMit(C_Info)
{
	npc = Follow_Sheep_AKIL;
	nr = 1;
	condition = DIA_AkilsSchaf_KommMit_Condition;
	information = DIA_AkilsSchaf_KommMit_Info;
	permanent = TRUE;
	description = "Иди за мной!";
};


func int DIA_AkilsSchaf_KommMit_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && !Npc_KnowsInfo(other,DIA_Akil_AkilsSchaf) && (MIS_Akil_SchafDiebe != FALSE))
	{
		return TRUE;
	};
};

func void DIA_AkilsSchaf_KommMit_Info()
{
	B_KommMit();
	B_LieselMaeh();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if(!Npc_IsDead(BDT_1025_Bandit_H))
	{
		BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
		BDT_1025_Bandit_H.aivar[AIV_IgnoresArmor] = TRUE;
	};
	if(!Npc_IsDead(BDT_1026_Bandit_H))
	{
		BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
		BDT_1026_Bandit_H.aivar[AIV_IgnoresArmor] = TRUE;
	};
	if(!Npc_IsDead(BDT_1027_Bandit_H))
	{
		BDT_1027_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
		BDT_1027_Bandit_H.aivar[AIV_IgnoresArmor] = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_AkilsSchaf_Wartehier(C_Info)
{
	npc = Follow_Sheep_AKIL;
	nr = 1;
	condition = DIA_AkilsSchaf_WarteHier_Condition;
	information = DIA_AkilsSchaf_WarteHier_Info;
	permanent = TRUE;
	description = "Подожди здесь!";
};


func int DIA_AkilsSchaf_WarteHier_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && !Npc_KnowsInfo(other,DIA_Akil_AkilsSchaf))
	{
		return TRUE;
	};
};

func void DIA_AkilsSchaf_WarteHier_Info()
{
	AI_Output(other,self,"DIA_Liesel_WarteHier_15_00");	//Подожди здесь!
	B_LieselMaeh();
	Npc_ExchangeRoutine(self,"CAVE");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};

