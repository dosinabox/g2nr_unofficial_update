
instance DIA_Addon_BanditGuard_EXIT(C_Info)
{
	npc = BDT_1064_Bandit_L;
	nr = 999;
	condition = DIA_BanditGuard_EXIT_Condition;
	information = DIA_BanditGuard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BanditGuard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BanditGuard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Bdt_1064_Checkpoint = "NW_CASTLEMINE_TOWER_05";

instance DIA_Bdt_1064_BanditGuard_FirstWarn(C_Info)
{
	npc = BDT_1064_Bandit_L;
	nr = 1;
	condition = DIA_Bdt_1064_BanditGuard_FirstWarn_Condition;
	information = DIA_Bdt_1064_BanditGuard_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Bdt_1064_BanditGuard_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Bdt_1064_Checkpoint) <= 800)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bdt_1064_BanditGuard_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Dexwache_Add_04_00");	//Есть только один способ попасть в наш лагерь живым - через мост.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Bdt_1064_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Bdt_1064_BanditGuard_SecondWarn(C_Info)
{
	npc = BDT_1064_Bandit_L;
	nr = 2;
	condition = DIA_Bdt_1064_BanditGuard_SecondWarn_Condition;
	information = DIA_Bdt_1064_BanditGuard_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Bdt_1064_BanditGuard_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Bdt_1064_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 75)))
	{
		return TRUE;
	};
};

func void DIA_Bdt_1064_BanditGuard_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Dexwache_Add_04_01");	//Ты хочешь, чтобы я тебя ткнул этой штукой. Еще ОДИН шаг - и я сброшу тебя в обрыв!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Bdt_1064_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Bdt_1064_BanditGuard_Attack(C_Info)
{
	npc = BDT_1064_Bandit_L;
	nr = 3;
	condition = DIA_Bdt_1064_BanditGuard_Attack_Condition;
	information = DIA_Bdt_1064_BanditGuard_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Bdt_1064_BanditGuard_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Bdt_1064_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 75)))
	{
		return TRUE;
	};
};

func void DIA_Bdt_1064_BanditGuard_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Dexwache_Add_04_02");	//Ну, если ты этого хочешь...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Addon_BanditGuard_PERM(C_Info)
{
	npc = BDT_1064_Bandit_L;
	nr = 99;
	condition = DIA_BanditGuard_PERM_Condition;
	information = DIA_BanditGuard_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_BanditGuard_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_BanditGuard_PERM_Info()
{
	AI_Output(self,other,"DIA_Addon_Dexwache_Add_04_03");	//Не бормочи тут на меня!
	AI_StopProcessInfos(self);
};

