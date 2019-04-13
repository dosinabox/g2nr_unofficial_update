
instance DIA_1015_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1015_Bandit_L;
	nr = 999;
	condition = DIA_1015_BANDIT_EXIT_Condition;
	information = DIA_1015_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_1015_BANDIT_EXIT_Condition()
{
	return TRUE;
};

func void DIA_1015_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1015_BANDIT_AMBUSH(C_Info)
{
	npc = Bdt_1015_Bandit_L;
	nr = 2;
	condition = DIA_1015_BANDIT_AMBUSH_Condition;
	information = DIA_1015_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1015_BANDIT_AMBUSH_Condition()
{
	if(Npc_IsDead(Ambusher_1014) || Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_1015_BANDIT_AMBUSH_Info()
{
	AI_Output(self,other,"DIA_1015_BANDIT_AMBUSH_06_00");	//Ёй, € нигде не видел твою рожу раньше?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

