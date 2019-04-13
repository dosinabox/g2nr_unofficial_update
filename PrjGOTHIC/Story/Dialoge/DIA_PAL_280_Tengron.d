
instance DIA_Tengron_EXIT(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 999;
	condition = DIA_Tengron_EXIT_Condition;
	information = DIA_Tengron_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tengron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Tengron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tengron_First(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 2;
	condition = DIA_Tengron_First_Condition;
	information = DIA_Tengron_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tengron_First_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ScoutMine != LOG_Running) && (MIS_ScoutMine != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_First_Info()
{
	AI_Output(self,other,"DIA_Tengron_First_07_00");	//Что ты делаешь здесь?
	AI_Output(other,self,"DIA_Tengron_First_15_01");	//Я здесь по приказу лорда Хагена.
	AI_Output(self,other,"DIA_Tengron_First_07_02");	//Тебе абсолютно необходимо добраться до замка и поговорить с командующим Гарондом.
};


instance DIA_Tengron_HALLO(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 2;
	condition = DIA_Tengron_HALLO_Condition;
	information = DIA_Tengron_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tengron_HALLO_Condition()
{
	if((Npc_IsInState(self,ZS_Talk) && (MIS_ScoutMine == LOG_Running)) || (MIS_ScoutMine == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HALLO_Info()
{
	AI_Output(self,other,"DIA_Tengron_HALLO_07_00");	//Да пребудет с тобой Иннос! Ты принес мне новости из замка? Скоро прибудет подкрепление?
	if(Npc_IsDead(Fajeth) == FALSE)
	{
		AI_Output(other,self,"DIA_Tengron_HALLO_15_01");	//Я пришел не за тем, чтобы принести новости, а чтобы получить их.
		AI_Output(self,other,"DIA_Tengron_HALLO_07_02");	//Тогда поговори с Фаджетом. Он командует здесь. Но если у тебя будут новости из замка, дай мне знать.
	};
};


instance DIA_Tengron_News(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 7;
	condition = DIA_Tengron_News_Condition;
	information = DIA_Tengron_News_Info;
	permanent = FALSE;
	description = "Насчет новостей...";
};


func int DIA_Tengron_News_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_News_Info()
{
	AI_Output(other,self,"DIA_Tengron_News_15_00");	//Насчет новостей...
	AI_Output(self,other,"DIA_Tengron_News_07_01");	//Да, как там, в замке?
	AI_Output(other,self,"DIA_Tengron_News_15_02");	//Его все еще осаждают орки, и он все также открыт для атак драконов.
	AI_Output(self,other,"DIA_Tengron_News_07_03");	//Черт, я надеюсь, парни все же продержатся.
	AI_Output(self,other,"DIA_Tengron_News_07_04");	//Послушай, у меня есть друг в замке. Его зовут Удар. Мы давно знаем друг друга, и через многое прошли рука об руку.
	AI_Output(self,other,"DIA_Tengron_News_07_05");	//Я хочу, чтобы ты передал ему это кольцо. Пусть он сохранит его ради меня. Скажи ему, я заберу кольцо, когда вернусь.
	Info_ClearChoices(DIA_Tengron_News);
	Info_AddChoice(DIA_Tengron_News,"У меня нет времени на это.",DIA_Tengron_News_No);
	Info_AddChoice(DIA_Tengron_News,"Нет проблем ...",DIA_Tengron_News_Yes);
};

func void DIA_Tengron_News_No()
{
	AI_Output(other,self,"DIA_Tengron_News_No_15_00");	//У меня нет времени на это.
	AI_Output(self,other,"DIA_Tengron_News_No_07_01");	//Понимаю.
	Info_ClearChoices(DIA_Tengron_News);
};

func void DIA_Tengron_News_Yes()
{
	AI_Output(other,self,"DIA_Tengron_News_Yes_15_00");	//Нет проблем. Когда я буду в замке, я передам это кольцо Удару.
	AI_Output(self,other,"DIA_Tengron_News_Yes_07_01");	//Хорошо. Магия этого кольца придаст Удару силу. И не забудь сказать ему, что я потом заберу его.
	B_GiveInvItems(self,other,ItRi_Tengron,1);
	Info_ClearChoices(DIA_Tengron_News);
	Log_CreateTopic(Topic_TengronRing,LOG_MISSION);
	Log_SetTopicStatus(Topic_TengronRing,LOG_Running);
	B_LogEntry(Topic_TengronRing,"Тенгрон дал мне кольцо, которое я должен передать Удару в замке.");
};


instance DIA_Tengron_Situation(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 70;
	condition = DIA_Tengron_Situation_Condition;
	information = DIA_Tengron_Situation_Info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int DIA_Tengron_Situation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_Situation_Info()
{
	AI_Output(other,self,"DIA_Tengron_Situation_15_00");	//Как обстановка?
	AI_Output(self,other,"DIA_Tengron_Situation_07_01");	//Мы окружены монстрами, и нам удалось добыть очень мало руды. К тому же, мы потеряли много хороших людей.
	AI_Output(self,other,"DIA_Tengron_Situation_07_02");	//Я не знаю, сколько мы еще подержимся, но мы не сдадимся просто так!
};


instance DIA_Tengron_HELP(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 9;
	condition = DIA_Tengron_HELP_Condition;
	information = DIA_Tengron_HELP_Info;
	permanent = FALSE;
	description = "Мне нужна твоя помощь ...";
};


func int DIA_Tengron_HELP_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_Running) && Npc_KnowsInfo(other,DIA_Tengron_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Tengron_HELP_Info()
{
	AI_Output(other,self,"DIA_Tengron_HELP_15_00");	//Мне нужна твоя помощь. Фаджет хочет, чтобы я перебил снепперов и...
	AI_Output(self,other,"DIA_Tengron_HELP_07_01");	//Я выполняю приказы ТОЛЬКО Фаджета. И мне дан приказ охранять шахту. Именно этим я и занимаюсь.
	AI_Output(self,other,"DIA_Tengron_HELP_07_02");	//Может, кто-нибудь еще сможет помочь тебе.
};


instance DIA_Tengron_PICKPOCKET(C_Info)
{
	npc = PAL_280_Tengron;
	nr = 900;
	condition = DIA_Tengron_PICKPOCKET_Condition;
	information = DIA_Tengron_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Tengron_PICKPOCKET_Condition()
{
	return C_Beklauen(32,50);
};

func void DIA_Tengron_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
	Info_AddChoice(DIA_Tengron_PICKPOCKET,Dialog_Back,DIA_Tengron_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tengron_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Tengron_PICKPOCKET_DoIt);
};

func void DIA_Tengron_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
};

func void DIA_Tengron_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tengron_PICKPOCKET);
};

