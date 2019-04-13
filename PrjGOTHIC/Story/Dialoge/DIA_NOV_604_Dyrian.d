
instance DIA_Dyrian_EXIT(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 999;
	condition = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Hello(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Hello_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(печально) Что тебе нужно?
};


instance DIA_Dyrian_Wurst(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Wurst_Condition;
	information = DIA_Dyrian_Wurst_Info;
	permanent = FALSE;
	description = "Я занимаюсь распределением колбасы.";
};


func int DIA_Dyrian_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Я занимаюсь распределением колбасы.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Спасибо. Надеюсь, это не последняя колбаса, что я получу здесь.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_Dyrian_Job(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Dyrian_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Job_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Я грешен. Я нарушил правила поведения в монастыре.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Теперь я жду решения Высшего Совета. Не знаю, оставят ли меня в монастыре.
};


instance DIA_Dyrian_WhatDone(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent = FALSE;
	description = "Расскажи мне, что произошло.";
};


func int DIA_Dyrian_WhatDone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_WhatDone_Info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Расскажи мне, что произошло.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Я взял книгу в комнате одного из магов, когда подметал там, чтобы почитать ее на досуге.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Мастер Хиглас, конечно же, сразу заметил пропажу и спросил меня об этой книге.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Из страха быть наказанным, я солгал. А затем он застал меня в моей келье, когда я читал эту книгу.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Он очень разозлился и сообщил об этом Высшему Совету. Теперь они решают, могу ли я остаться в монастыре.
};


instance DIA_Dyrian_CanHelp(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent = TRUE;
	description = "Я могу тебе чем-нибудь помочь?";
};


func int DIA_Dyrian_CanHelp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Я могу тебе чем-нибудь помочь?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Нет, моя судьба зависит теперь только от милости Инноса и магов.
};


instance DIA_Dyrian_Scroll(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 1;
	condition = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_Scroll_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) || (MIS_RUNE == LOG_Running) || (MIS_GOLEM == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Scroll_Info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Эй, ты действительно потребовал Испытания Огнем?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Да. И я намерен пройти его.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Хорошо - возможно, я могу помочь тебе в этом. Я могу дать тебе свиток с очень сильным заклинанием. Заклинанием СОН. Ну, как?
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"Нет, мне не нужна твоя помощь.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"Что ты хочешь за это?",DIA_Dyrian_Scroll_How);
	Info_AddChoice(DIA_Dyrian_Scroll,"И что мне делать с ним?",DIA_Dyrian_Scroll_What);
};

func void DIA_Dyrian_Scroll_What()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//И что мне делать с ним?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//При помощи этого заклинания ты можешь погружать людей в магический сон на короткое время. Но только если их воля слабее твоей.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//Это моет быть очень полезным, если кто-то стоит у тебя на пути...
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//А как я узнаю, чья воля сильнее?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//Не стоит даже и пытаться испытывать это заклинание на магах. Но большинство послушников погрузить в сон тебе удастся.
};

func void DIA_Dyrian_Scroll_No()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Нет, мне не нужна твоя помощь.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Ты можешь обратиться ко мне в любое время, если передумаешь.
	Info_ClearChoices(DIA_Dyrian_Scroll);
};

func void DIA_Dyrian_Scroll_How()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Что ты хочешь за него?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//У каждого вновь посвященного мага есть право на одно желание.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//И если ты действительно пройдешь Испытание Огнем, ты можешь пожелать, чтобы я остался в монастыре.
	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll,"Нет, мне не нужна твоя помощь.",DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll,"Хорошо, давай мне этот свиток.",DIA_Dyrian_Scroll_Yes);
};

func void DIA_Dyrian_Scroll_Yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Хорошо, давай мне этот свиток.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Удачи тебе в этом испытании. Да поможет тебе Иннос.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
	Log_CreateTopic(Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus(Topic_DyrianDrin,LOG_Running);
	B_LogEntry(Topic_DyrianDrin,"Дуриан дал мне свиток с заклинанием Сон. Взамен, он хочет, чтобы если я стану магом, я замолвил за него словечко и он остался в монастыре.");
	Info_ClearChoices(DIA_Dyrian_Scroll);
};


instance DIA_Dyrian_Doch(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 4;
	condition = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent = TRUE;
	description = "Я передумал. Давай мне это заклинание сна.";
};


func int DIA_Dyrian_Doch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dyrian_Scroll) && (MIS_HelpDyrian != LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Doch_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Я передумал. Давай мне это заклинание сна.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Хорошо, если ты пройдешь испытание, то замолвишь за меня словечко, и меня оставят в монастыре.
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_Running;
};


instance DIA_Dyrian_HelloAgain(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 2;
	condition = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dyrian_HelloAgain_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_KDF) && (MIS_HelpDyrian == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//(радостно) Спасибо! Ты спас меня!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(испуганно) Ох - прошу простить меня, Мастер. Я не хотел показаться невежливым.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(с уважением) Я благодарю тебя за то, что мне позволено остаться в монастыре. Моя жизнь теперь переменится...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Как дела?
};


instance DIA_Dyrian_HowIsIt(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Dyrian_HowIsIt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_HelloAgain))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Хорошо. Мне очень нравится моя работа, Мастер.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_other(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Dyrian_other_Condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//Я благодарен Инносу за то, что могу жить в монастыре.
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_Kneipe(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Dyrian_Kneipe_Condition()
{
	if((MIS_HelpDyrian == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Kneipe_Info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//Ты еще спрашиваешь? Я так надеялся на тебя, а ты бросил меня в беде.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Теперь мне ничего не остается, кроме как заливать свое горе вином. И в этом виноват ты!
	Info_ClearChoices(DIA_Dyrian_Kneipe);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Вот, держи 5 золотых.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Я могу все объяснить.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice(DIA_Dyrian_Kneipe,"Следи за своими словами.",DIA_Dyrian_Kneipe_ShutUp);
};

func void DIA_Dyrian_Kneipe_Gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Вот, держи 5 золотых.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(нервно) 5 золотых? Ты даешь мне 5 золотых в качестве компенсации за то, что лишил меня смысла моей жизни?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Я возьму все твое золото!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

func void DIA_Dyrian_Kneipe_CanExplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//Я могу все объяснить.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Мне не нужны твои объяснения.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//Ты лжешь каждый раз, когда открываешь свой поганый рот. А теперь оставь меня.
	AI_StopProcessInfos(self);
};

func void DIA_Dyrian_Kneipe_ShutUp()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Следи за своими словами.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Да, давай, угрожай мне! Это все равно тебе не поможет.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//Я всем расскажу, какой ты вероломный ублюдок! Вот только прикончу эту бутылку...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//А теперь убирайся с глаз моих, ты мне противен!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_nachher(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 3;
	condition = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_Dyrian_nachher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dyrian_Kneipe))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_nachher_Info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Что с тобой?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Ах, оставь меня в покое! Я даже знать тебя не хочу!
	AI_StopProcessInfos(self);
};


instance DIA_Dyrian_PICKPOCKET(C_Info)
{
	npc = NOV_604_Dyrian;
	nr = 900;
	condition = DIA_Dyrian_PICKPOCKET_Condition;
	information = DIA_Dyrian_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Dyrian_PICKPOCKET_Condition()
{
	return C_Beklauen(10,15);
};

func void DIA_Dyrian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,Dialog_Back,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

