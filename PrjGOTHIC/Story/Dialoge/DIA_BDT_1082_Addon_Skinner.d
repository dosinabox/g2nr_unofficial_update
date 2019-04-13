
instance DIA_Addon_Skinner_EXIT(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 999;
	condition = DIA_Addon_Skinner_EXIT_Condition;
	information = DIA_Addon_Skinner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skinner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skinner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skinner_PICKPOCKET(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 900;
	condition = DIA_Addon_Skinner_PICKPOCKET_Condition;
	information = DIA_Addon_Skinner_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Addon_Skinner_PICKPOCKET_Condition()
{
	return C_Beklauen(100,200);
};

func void DIA_Addon_Skinner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skinner_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skinner_PICKPOCKET,Dialog_Back,DIA_Addon_Skinner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skinner_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skinner_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skinner_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Skinner_PICKPOCKET);
};

func void DIA_Addon_Skinner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skinner_PICKPOCKET);
	B_Say(self,self,"$AWAKE");
};


instance DIA_Addon_Skinner_Hi(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 2;
	condition = DIA_Addon_Skinner_Hi_Condition;
	information = DIA_Addon_Skinner_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skinner_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skinner_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_00");	//Ты зачем меня разбудил, а? Я уверен, что ты толком и не знаешь...
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_01");	//Нет - не надо ничего говорить. Оправдываться слишком поздно.
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_02");	//У тебя теперь есть выбор. Ты можешь сразиться со мной и моей Бетти. А можешь попробовать убежать.
	AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_03");	//И на твоем месте я бы начинал разбег...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Skinner_Attentat(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 9;
	condition = DIA_Addon_Skinner_Attentat_Condition;
	information = DIA_Addon_Skinner_Attentat_Info;
	permanent = FALSE;
	description = "По поводу нападения...";
};


func int DIA_Addon_Skinner_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skinner_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Skinner_Attentat_15_00");	//По поводу нападения...
	AI_Output(self,other,"DIA_Addon_Skinner_Attentat_08_01");	//Что тебе нужно?
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
	Info_AddChoice(DIA_Addon_Skinner_Attentat,"Я хочу убрать Эстебана.",DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA);
	Info_AddChoice(DIA_Addon_Skinner_Attentat,"Я хочу найти предателя.",DIA_Addon_Skinner_ATTENTAT_ADDON_PRO);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00");	//Я хочу убрать Эстебана.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");	//Отлично.
	Judas_Counter = Judas_Counter + 1;
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_PRO()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00");	//Я хочу найти предателя.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");	//Дерьмо.
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};

