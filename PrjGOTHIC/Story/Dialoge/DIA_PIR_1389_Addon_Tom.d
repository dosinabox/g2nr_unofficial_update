
instance DIA_Addon_PIR_1389_Tom_EXIT(C_Info)
{
	npc = PIR_1389_Addon_Tom;
	nr = 999;
	condition = DIA_Addon_PIR_Tom_EXIT_Condition;
	information = DIA_Addon_PIR_Tom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_PIR_Tom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_PIR_Tom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

