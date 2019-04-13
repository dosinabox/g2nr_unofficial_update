
instance DIA_GornNW_KAP3_EXIT(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 999;
	condition = DIA_GornNW_KAP3_EXIT_Condition;
	information = DIA_GornNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_Hallo(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 1;
	condition = DIA_GornNW_Hallo_Condition;
	information = DIA_GornNW_Hallo_Info;
	permanent = FALSE;
	description = "С тобой все в порядке?";
};


func int DIA_GornNW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_GornNW_Hallo_Info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_00");	//С тобой все в порядке?
	if(MIS_RescueGorn == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_01");	//Ты спас меня, парень.
		AI_Output(self,other,"DIA_GornNW_Add_12_02");	//Я никогда не забуду этого.
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_03");	//Милтен вытащил меня.
		AI_Output(self,other,"DIA_GornNW_Add_12_04");	//Я никогда не забуду этого.
	};
};


instance DIA_GornNW_WhatNext(C_Info)
{
	npc = PC_Fighter_NW_vor_DJG;
	nr = 1;
	condition = DIA_GornNW_WhatNext_Condition;
	information = DIA_GornNW_WhatNext_Info;
	permanent = TRUE;
	description = "Что ты собираешься делать теперь?";
};


func int DIA_GornNW_WhatNext_Condition()
{
	return TRUE;
};

func void DIA_GornNW_WhatNext_Info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_05");	//Что ты собираешься делать теперь?
	AI_Output(self,other,"DIA_GornNW_Add_12_06");	//Сначала я отъемся.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//А потом?
	AI_Output(self,other,"DIA_GornNW_Add_12_08");	//Кто знает ... Возможно, я опять вернусь в колонию.
	AI_Output(self,other,"DIA_GornNW_Add_12_09");	//Кто-то ведь должен присматривать за орками - иначе они могут появиться у нас на пороге без всякого предупреждения.
};

