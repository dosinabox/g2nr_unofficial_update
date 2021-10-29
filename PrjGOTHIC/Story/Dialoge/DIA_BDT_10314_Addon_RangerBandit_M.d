
instance DIA_10314_BANDIT_EXIT(C_Info)
{
	npc = BDT_10314_Addon_RangerBandit_M;
	nr = 999;
	condition = DIA_10314_BANDIT_EXIT_Condition;
	information = DIA_10314_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_10314_BANDIT_EXIT_Condition()
{
	return TRUE;
};

func void DIA_10314_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	self.aivar[AIV_IgnoresArmor] = TRUE;
	if(!Npc_IsDead(BDT_10311_Addon_RangerBandit_M))
	{
		BDT_10311_Addon_RangerBandit_M.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_10311_Addon_RangerBandit_M,other,AR_SuddenEnemyInferno,1);
	};
	if(!Npc_IsDead(BDT_10312_Addon_RangerBandit_L))
	{
		BDT_10312_Addon_RangerBandit_L.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_10312_Addon_RangerBandit_L,other,AR_SuddenEnemyInferno,1);
	};
	if(!Npc_IsDead(BDT_10313_Addon_RangerBandit_L))
	{
		BDT_10313_Addon_RangerBandit_L.aivar[AIV_IgnoresArmor] = TRUE;
		B_Attack(BDT_10313_Addon_RangerBandit_L,other,AR_SuddenEnemyInferno,1);
	};
};


instance DIA_10314_BANDIT_AMBUSH(C_Info)
{
	npc = BDT_10314_Addon_RangerBandit_M;
	nr = 2;
	condition = DIA_10314_BANDIT_AMBUSH_Condition;
	information = DIA_10314_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_10314_BANDIT_AMBUSH_Condition()
{
	if(Npc_GetDistToWP(other,"NW_FARM4_WOOD_RANGERBANDITS_03") <= 500)
	{
		return TRUE;
	};
};

func void DIA_10314_BANDIT_AMBUSH_Info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01");	//Отойди от этого оружия. Ну подожди!
};

