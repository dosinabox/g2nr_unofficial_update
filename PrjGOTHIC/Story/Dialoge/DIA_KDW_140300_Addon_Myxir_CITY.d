
instance DIA_Addon_Myxir_CITY_EXIT(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 999;
	condition = DIA_Addon_Myxir_CITY_EXIT_Condition;
	information = DIA_Addon_Myxir_CITY_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_CITY_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_CITY_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_CITY_HelloCITY(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_HelloCITY_Condition;
	information = DIA_Addon_Myxir_CITY_HelloCITY_Info;
	permanent = TRUE;
	description = "Ты останешься в городе?";
};


func int DIA_Addon_Myxir_CITY_HelloCITY_Condition()
{
	return TRUE;
};


var int DIA_Addon_Myxir_CITY_HelloCITY_OneTime;

func void DIA_Addon_Myxir_CITY_HelloCITY_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_00");	//Ты останешься в городе?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_01");	//Кто-то из нас должен оставаться здесь, когда Ватраса в городе нет.
	if((RavenIsDead == TRUE) && (DIA_Addon_Myxir_CITY_HelloCITY_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_02");	//Я хотел тебе сказать еще одну вещь.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_03");	//В Яркендаре ты совершил поистине героический подвиг.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_04");	//К сожалению, у меня еще есть незавершенные дела в Хоринисе.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_05");	//Это так, но я уверен, что ты справишься с ними, Хранитель.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_06");	//Увидим.
		DIA_Addon_Myxir_CITY_HelloCITY_OneTime = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance DIA_Addon_Myxir_CITY_TalkedToGhost(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 4;
	condition = DIA_Addon_Myxir_CITY_TalkedToGhost_Condition;
	information = DIA_Addon_Myxir_CITY_TalkedToGhost_Info;
	description = "Я говорил с Куарходроном.";
};


func int DIA_Addon_Myxir_CITY_TalkedToGhost_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Я говорил с Куарходроном.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(восхищенно) Тебе действительно удалось пробудить его от смертного сна?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//И что же сказал дух?
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Он рассказал мне о том, как попасть в храм Аданоса.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//Невероятно! Меня все больше и больше восхищают эти зодчие.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Кто знает, чего бы они могли добиться, если бы их цивилизация не погибла...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);
};

