
instance DIA_Addon_Monty_NW_EXIT(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 999;
	condition = DIA_Addon_Monty_NW_EXIT_Condition;
	information = DIA_Addon_Monty_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Monty_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Monty_NW_Hi(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 2;
	condition = DIA_Addon_Monty_NW_Hi_Condition;
	information = DIA_Addon_Monty_NW_Hi_Info;
	permanent = FALSE;
	description = "Ну что, ты вернулся к своей работе?";
};


func int DIA_Addon_Monty_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_00");	//Ну что, ты вернулся к своей работе?
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_01");	//Представляешь, пока меня не было, они ничуть не продвинулись вперед. Мне пришлось снова засесть за чертежи.
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_02");	//Что ж, не буду тебя отвлекать.
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_03");	//(смеется) Спасибо. Удачи!
};


instance DIA_Addon_Monty_NW_PICKPOCKET(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 900;
	condition = DIA_Addon_Monty_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Monty_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Monty_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(60,60);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Monty_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Monty_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Monty_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Monty_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
};

func void DIA_Addon_Monty_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Monty_NW_PICKPOCKET);
};

