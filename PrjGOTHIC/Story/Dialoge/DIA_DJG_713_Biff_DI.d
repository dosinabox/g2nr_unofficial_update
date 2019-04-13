
instance DIA_Biff_DI_EXIT(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 999;
	condition = DIA_Biff_DI_EXIT_Condition;
	information = DIA_Biff_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_HALLO(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 10;
	condition = DIA_Biff_DI_HALLO_Condition;
	information = DIA_Biff_DI_HALLO_Info;
	important = TRUE;
};


func int DIA_Biff_DI_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_HALLO_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_00");	//И? Где все те сокровища, что ты мне обещал?
	if(Npc_KnowsInfo(other,DIA_Biff_DI_ORKS) == FALSE)
	{
		AI_Output(other,self,"DIA_Biff_DI_HALLO_15_01");	//Что я там говорил тебе раньше, в море?
	};
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_02");	//Сейчас твоя задача - охранять корабль.
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_03");	//Мне не улыбается плыть назад.
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_04");	//Черт. Если бы я знал это заранее, я бы лучше остался в Хоринисе.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_perm(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_perm_Condition;
	information = DIA_Biff_DI_perm_Info;
	permanent = TRUE;
	description = "На борту все спокойно?";
};


func int DIA_Biff_DI_perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Biff_DI_HALLO) && (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_perm_Info()
{
	AI_Output(other,self,"DIA_Biff_DI_perm_15_00");	//На борту все спокойно?
	AI_Output(self,other,"DIA_Biff_DI_perm_07_01");	//(сердито) Да, да. Все тихо.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_ORKS(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_ORKS_Condition;
	information = DIA_Biff_DI_ORKS_Info;
	important = TRUE;
};


func int DIA_Biff_DI_ORKS_Condition()
{
	if((Npc_GetDistToWP(self,"DI_SHIP_03") < 1000) && (OrkSturmDI == TRUE) && (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_ORKS_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_00");	//Эти мерзкие твари!
	AI_Output(other,self,"DIA_Biff_DI_ORKS_15_01");	//Черт, что ты делаешь здесь? Ты должен был охранять корабль.
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_02");	//Да никуда он не денется.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Biff_DI_UNDEADDRGDEAD(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 4;
	condition = DIA_Biff_DI_UNDEADDRGDEAD_Condition;
	information = DIA_Biff_DI_UNDEADDRGDEAD_Info;
	important = TRUE;
};


func int DIA_Biff_DI_UNDEADDRGDEAD_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_00");	//Что, все кончено?
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_01");	//Вроде бы да.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_02");	//И теперь, могу я...
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_03");	//Ты можешь перевернуть весь остров, если хочешь.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_04");	//Отлично.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PlunderTempel");
};


instance DIA_Biff_DI_plunder(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 5;
	condition = DIA_Biff_DI_plunder_Condition;
	information = DIA_Biff_DI_plunder_Info;
	important = TRUE;
};


func int DIA_Biff_DI_plunder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Biff_DI_plunder) && Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_plunder_Info()
{
	AI_Output(self,other,"DIA_Biff_DI_plunder_07_00");	//Черт. Не сейчас.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DI_PICKPOCKET(C_Info)
{
	npc = DJG_713_Biff_DI;
	nr = 900;
	condition = DIA_Biff_DI_PICKPOCKET_Condition;
	information = DIA_Biff_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Biff_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(92,450);
};

func void DIA_Biff_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
	Info_AddChoice(DIA_Biff_DI_PICKPOCKET,Dialog_Back,DIA_Biff_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Biff_DI_PICKPOCKET_DoIt);
};

func void DIA_Biff_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};

func void DIA_Biff_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};


