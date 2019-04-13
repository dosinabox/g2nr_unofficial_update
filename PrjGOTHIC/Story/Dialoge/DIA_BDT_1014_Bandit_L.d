
instance DIA_BDT_1014_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1014_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1014_BANDIT_EXIT_Condition;
	information = DIA_BDT_1014_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1014_BANDIT_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1014_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1014_BANDIT_KILLER(C_Info)
{
	npc = Bdt_1014_Bandit_L;
	nr = 1;
	condition = DIA_BDT_1014_BANDIT_KILLER_Condition;
	information = DIA_BDT_1014_BANDIT_KILLER_Info;
	important = TRUE;
};


func int DIA_BDT_1014_BANDIT_KILLER_Condition()
{
	if(Npc_KnowsInfo(other,dia_1013_bandit_ambush) || Npc_IsDead(Ambusher_1013) || (Bdt13_Friend == TRUE) || Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1014_BANDIT_KILLER_Info()
{
	AI_Output(self,other,"DIA_BDT_1014_BANDIT_KILLER_06_00");	//Это он, точно! Держи его!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

