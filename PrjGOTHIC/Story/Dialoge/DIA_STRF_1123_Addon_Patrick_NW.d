
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
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_01");	//Все хорошо. Маги Воды вывели нас из этой проклятой долины.
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_02");	//И что вы будете делать дальше?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_03");	//Я продолжу работать на Ли. А в один прекрасный день мы покинем этот остров...
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_04");	//И что будет тогда?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_05");	//Увидим. Если война все еще идет, мы будем сражаться с орками. Но это станет ясно позднее.
};

