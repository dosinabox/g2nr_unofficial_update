
instance DIA_Addon_Wache_01_EXIT(C_Info)
{
	npc = BDT_1081_Addon_Wache_01;
	nr = 999;
	condition = DIA_Addon_Wache_01_EXIT_Condition;
	information = DIA_Addon_Wache_01_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Wache_01_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_01_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Wache_01_PICKPOCKET(C_Info)
{
	npc = BDT_1081_Addon_Wache_01;
	nr = 900;
	condition = DIA_Addon_Wache_01_PICKPOCKET_Condition;
	information = DIA_Addon_Wache_01_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Wache_01_PICKPOCKET_Condition()
{
	return C_Beklauen(38,99);
};

func void DIA_Addon_Wache_01_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Wache_01_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Wache_01_PICKPOCKET,Dialog_Back,DIA_Addon_Wache_01_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Wache_01_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Wache_01_PICKPOCKET_DoIt);
};

func void DIA_Addon_Wache_01_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Wache_01_PICKPOCKET);
};

func void DIA_Addon_Wache_01_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Wache_01_PICKPOCKET);
};


instance DIA_Addon_Wache_01_Hi(C_Info)
{
	npc = BDT_1081_Addon_Wache_01;
	nr = 2;
	condition = DIA_Addon_Wache_01_Hi_Condition;
	information = DIA_Addon_Wache_01_Hi_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Addon_Wache_01_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_01_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_01_Hi_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Addon_Wache_01_Hi_04_01");	//Только коснись Эстебана - и я порублю тебя на кусочки.
	AI_StopProcessInfos(self);
};

