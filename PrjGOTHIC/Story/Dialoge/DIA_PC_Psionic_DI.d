
instance DIA_Lester_DI_EXIT(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 999;
	condition = DIA_Lester_DI_EXIT_Condition;
	information = DIA_Lester_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lester_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_DI_Hello(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 1;
	condition = DIA_Lester_DI_Hello_Condition;
	information = DIA_Lester_DI_Hello_Info;
	permanent = TRUE;
	description = "Ты хочешь что-то сказать мне?";
};


func int DIA_Lester_DI_Hello_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Lester_DI_SCGotWarning1;
var int DIA_Lester_DI_SCGotWarning2;

func void DIA_Lester_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Lester_DI_Hello_15_00");	//Ты хочешь что-то сказать мне?
	if((Npc_IsDead(Mario_DI) == FALSE) && (ORkSturmDI == TRUE) && (DIA_Lester_DI_SCGotWarning1 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_01");	//Марио слинял, когда на нас напали орки. Несмотря на весь хаос, что творился на корабле, я смог проследить за ним.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_02");	//Он просто пошел через ряды орков, и те его даже пальцем не тронули.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_03");	//Я с самого начала не доверял этому парню. Он заодно с врагом.
		B_GivePlayerXP(XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if((Npc_IsDead(Mario_DI) == FALSE) && (DIA_Lester_DI_SCGotWarning2 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_04");	//Этот странный парень, который называет себя Марио, мне не нравится. У него тяжелая аура.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_05");	//Будь осторожен, мой друг.
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_06");	//Пока нет. Может быть позже.
	};
};


instance DIA_Lester_DI_MarioArsch(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 2;
	condition = DIA_Lester_DI_MarioArsch_Condition;
	information = DIA_Lester_DI_MarioArsch_Info;
	description = "Ты был прав. Марио предал нас.";
};


func int DIA_Lester_DI_MarioArsch_Condition()
{
	if(((DIA_Lester_DI_SCGotWarning2 == TRUE) || (DIA_Lester_DI_SCGotWarning2 == TRUE)) && (MIS_Mario_Ambush == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lester_DI_MarioArsch_Info()
{
	AI_Output(other,self,"DIA_Lester_DI_MarioArsch_15_00");	//Ты был прав. Марио предал нас.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_01");	//Да. Возможно я не очень-то проницательный, но в этом случае мне было ясно с самого начала.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_02");	//Постарайся тщательнее выбирать себе компаньонов в будущем.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_PC_Lester_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 5;
	condition = DIA_PC_Lester_DI_UndeadDragonDead_Condition;
	information = DIA_PC_Lester_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Мы здесь долго не задержимся.";
};


func int DIA_PC_Lester_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_PC_Lester_DI_UndeadDragonDead_OneTime;

func void DIA_PC_Lester_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_00");	//Мы здесь долго не задержимся.
	if(DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01");	//Похоже, мои головные боли ушли.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02");	//Как тебе удалось это?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_03");	//Я уничтожил врага.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04");	//Он, должно быть, был очень силен. Так кто это был, все-таки?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_05");	//Дракон-нежить.
		};
		if(SC_KnowsMadPsi == TRUE)
		{
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_06");	//Твой бывший друг из Болотного Лагеря доставил мне немало хлопот.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07");	//Да. Вера способна двигать горы. Так было всегда. К сожалению, они служили не тому богу.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08");	//Мне понадобится некоторое время, чтобы осознать все это.
		};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09");	//По счастью, больше ничего такого не повторится. Во всем мире нет столько болотной травы, сколько я готов сейчас выкурить.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Psionic_DI_PICKPOCKET(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 900;
	condition = DIA_Psionic_DI_PICKPOCKET_Condition;
	information = DIA_Psionic_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Psionic_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(56,25);
};

func void DIA_Psionic_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET,Dialog_Back,DIA_Psionic_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Psionic_DI_PICKPOCKET_DoIt);
};

func void DIA_Psionic_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

func void DIA_Psionic_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

