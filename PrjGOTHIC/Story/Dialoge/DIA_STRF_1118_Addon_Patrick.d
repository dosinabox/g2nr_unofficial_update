
instance DIA_Addon_Patrick_EXIT(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 999;
	condition = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_Hi(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent = FALSE;
	description = "Меня послали маги воды. Я пришел, чтобы освободить вас.";
};


func int DIA_Addon_Patrick_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//Меня послали маги воды. Я пришел, чтобы освободить вас.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//Правда? А почему я должен тебе верить?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//Ты хочешь отсюда выбраться или нет?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//Конечно, хочу, но...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//Меня послал Ватрас. Если и это тебя не убедит, можешь оставаться гнить в этой дыре.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//Хорошо, хорошо, я тебе верю.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//Неужели? Надо же, это случилось быстрее, чем я думал. Хорошо, а теперь нам нужен план.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//Попытка побега будет слишком рискованной. Вильям уже попытался. Теперь он мертв...
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//Пленники - в основном крестьяне. Они мне доверяют, но на побег не осмелятся.
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
	Info_AddChoice(DIA_Addon_Patrick_Hi,"Как ты себе это представляешь? Я должен убедить Ворона освободить вас?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice(DIA_Addon_Patrick_Hi,"Мне нужно перебить всех бандитов до единого?",DIA_Addon_Patrick_Hi_Kill);
};

func void B_Say_Patrick_Plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//Так что выход у нас один.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//Ты должен сделать так, чтобы стражники пропустили нас. Тогда мы уйдем.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//Ладно, я позабочусь об этом. Скажи остальным, чтобы они готовились.
	B_LogEntry(TOPIC_Addon_Sklaven,"Рабы не осмелятся на побег. Я должен найти мирный способ вывести их из лагеря.");
};

func void DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//Как ты себе это представляешь? Я должен убедить Ворона освободить вас?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//(усмехается) Неплохая мысль.
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};

func void DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//Мне нужно перебить всех бандитов до единого?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//(испуганно) Это было бы безумием!
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};


instance DIA_Addon_Patrick_ready(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent = FALSE;
	description = "Все хорошо. Вы можете идти.";
};


func int DIA_Addon_Patrick_ready_Condition()
{
	if(((Ready_Togo == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi)) || (Npc_IsDead(PrisonGuard) && Npc_IsDead(Bloodwyn) && Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer)) || (Npc_IsDead(Thorus) && Npc_IsDead(Bloodwyn) && Npc_IsDead(PrisonGuard)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_ready_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_00");	//Все хорошо. Вы можете идти.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//Отлично! Я знаю на болоте одну пещеру, где мы можем укрыться. Но что нам делать дальше?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//Идите на юго-запад. Покинув болото, вы найдете развалины древнего храма. Там устроили лагерь маги воды.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//Они расскажут вам, как выбраться из этой долины.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//Спасибо, спасибо большое. Мы все перед тобой в долгу...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//Не за что.
	Sklaven_Flucht = TRUE;
	B_GivePlayerXP(XP_Addon_Flucht);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	B_StartOtherRoutine(Telbor,"FLUCHT");
	B_StartOtherRoutine(Tonak,"FLUCHT");
	B_StartOtherRoutine(Pardos,"FLUCHT");
	B_StartOtherRoutine(Monty,"FLUCHT");
	B_StartOtherRoutine(Buddler_1,"WORK");
	B_StartOtherRoutine(Buddler_2,"WORK");
	B_StartOtherRoutine(Buddler_3,"WORK");
	B_RemoveNpc(STRF_1128_Addon_Sklave);
	B_RemoveNpc(STRF_1129_Addon_Sklave);
	B_RemoveNpc(STRF_1130_Addon_Sklave);
	B_RemoveNpc(STRF_1136_Addon_Sklave);
	B_RemoveNpc(STRF_1137_Addon_Sklave);
	B_RemoveNpc(STRF_1138_Addon_Sklave);
	B_RemoveNpc(STRF_1139_Addon_Sklave);
	B_RemoveNpc(STRF_1140_Addon_Sklave);
};


instance DIA_Addon_Patrick_Killer(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent = FALSE;
	description = "Я разобрался с охранником. Вы можете идти.";
};


func int DIA_Addon_Patrick_Killer_Condition()
{
	if(Npc_IsDead(PrisonGuard) && (Ready_Togo == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_Killer_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//Я разобрался с охранником. Вы можете идти.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//А что с нами будет, когда мы покинем шахту? Оставшиеся охранники нас перебьют. Нет, это слишком рискованно.
};


instance DIA_Addon_Patrick_Hoehle(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent = TRUE;
	description = "Вы не хотите уйти отсюда?";
};


func int DIA_Addon_Patrick_Hoehle_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//Вы не хотите уйти отсюда?
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//Конечно, хотим. Но мы ждем подходящего момента.
};

