
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

