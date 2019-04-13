
instance DIA_Addon_Patrick_NW_EXIT(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 999;
	condition = DIA_Addon_Patrick_NW_EXIT_Condition;
	information = DIA_Addon_Patrick_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_NW_PICKPOCKET(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 900;
	condition = DIA_Addon_Patrick_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Patrick_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Patrick_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(35,50);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Patrick_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Patrick_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Patrick_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Patrick_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
};


instance DIA_Addon_Patrick_NW_Hi(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 2;
	condition = DIA_Addon_Patrick_NW_Hi_Condition;
	information = DIA_Addon_Patrick_NW_Hi_Info;
	permanent = FALSE;
	description = "Итак, с вами все в порядке?";
};


func int DIA_Addon_Patrick_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_00");	//Итак, с вами все в порядке?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_01");	//Все хорошо. Маги воды вывели нас из этой проклятой долины.
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_02");	//И что вы будете делать дальше?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_03");	//Я продолжу работать на Ли. А в один прекрасный день мы покинем этот остров...
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_04");	//И что будет тогда?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_05");	//Увидим. Если война все еще идет, мы будем сражаться с орками. Но это станет ясно позднее.
};

