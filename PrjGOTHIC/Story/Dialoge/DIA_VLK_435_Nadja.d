
instance DIA_Nadja_EXIT(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 999;
	condition = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nadja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_PICKPOCKET(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 900;
	condition = DIA_Nadja_PICKPOCKET_Condition;
	information = DIA_Nadja_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Nadja_PICKPOCKET_Condition()
{
	return C_Beklauen(40,40);
};

func void DIA_Nadja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,Dialog_Back,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};

func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};


instance DIA_Nadja_STANDARD(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_STANDARD_Condition;
	information = DIA_Nadja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Nadja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE))
	{
		return TRUE;
	};
};


var int Nadja_LuciaInfo;

func void DIA_Nadja_STANDARD_Info()
{
	if(Nadja_LuciaInfo == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_00");	//Я буду разговаривать с тобой только после того, как ты поговоришь с Бромором.
	}
	else
	{
		AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//Эй, я не могу заняться тобой сейчас, детка. Если хочешь развлечься, поговори с Бромором.
	};
	if((SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE) && (Nadja_LuciaInfo == FALSE))
	{
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_01");	//Я только хотел задать тебе пару вопросов о пропавших людях.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_02");	//Я могла бы тебе кое-что рассказать, милый, но не здесь.
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_03");	//Тогда пойдем наверх.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_04");	//Хорошо. Но сначала ты должен договориться с Бромором. Неприятности мне не нужны.
		Nadja_LuciaInfo = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_Danach(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_Danach_Condition;
	information = DIA_Nadja_Danach_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Nadja_Danach_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE) && (Nadja_Nacht == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Danach_Info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//Заходи в другой раз.
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_hochgehen(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_hochgehen_Condition;
	information = DIA_Nadja_hochgehen_Info;
	important = FALSE;
	permanent = TRUE;
	description = "Пошли наверх.";
};


func int DIA_Nadja_hochgehen_Condition()
{
	if(Bromor_Pay == 1)
	{
		return TRUE;
	};
};

func void DIA_Nadja_hochgehen_Info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//Пошли наверх.
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//Сегодня тебе выпал счастливый билет, детка. Пойдем.
	Bromor_Pay = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_Addon_Nadja_LuciaInfo(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 5;
	condition = DIA_Addon_Nadja_LuciaInfo_Condition;
	information = DIA_Addon_Nadja_LuciaInfo_Info;
	description = "Ну а теперь мы можем поговорить?";
};


func int DIA_Addon_Nadja_LuciaInfo_Condition()
{
	if((Bromor_Pay == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) && (Nadja_LuciaInfo == TRUE))
	{
		return TRUE;
	};
};


var int Nadja_GaveLuciaInfo;

func void DIA_Addon_Nadja_LuciaInfo_Info()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_15_00");	//Ну а теперь мы можем поговорить?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_01");	//Да, здесь нас не подслушают.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_02");	//Бромору не нравится, когда мы разговариваем с гостями во время работы, если ему от этого никакой выгоды.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_03");	//Итак, ты хочешь узнать побольше о людях, которые исчезли в порту, не так ли?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_04");	//Я не знаю, смогу ли я тебе помочь, но по крайней мере я могу рассказать, что случилось с Люсией.
	Nadja_GaveLuciaInfo = TRUE;
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"А куда она исчезла?",DIA_Addon_Nadja_LuciaInfo_wo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Рассказывай.",DIA_Addon_Nadja_LuciaInfo_lucia);
};

func void DIA_Addon_Nadja_LuciaInfo_lucia()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_00");	//Рассказывай.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_01");	//Никто здесь особо не жалеет, что она исчезла.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//Почему?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_03");	//Здесь нет ни одного человека, которого она не пыталась использовать в своих интересах.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_04");	//Она была настоящей сукой!
};

func void DIA_Addon_Nadja_LuciaInfo_wo()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_wo_15_00");	//А куда она исчезла?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_01");	//Она часто встречалась с Элврихом, подмастерьем плотника Торбена из нижней части города.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_02");	//Готова поспорить, что она уехала с этим парнем.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Шлюха Люсия исчезла из борделя Бромора прошлой ночью. Возможно, она сбежала вместе с Элврихом, учеником плотника Торбена.");
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Куда они могли направиться?",DIA_Addon_Nadja_LuciaInfo_Elvrich);
};

func void DIA_Addon_Nadja_LuciaInfo_Elvrich()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00");	//Куда они могли направиться?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01");	//Если их не сожрали волки, то полагаю, они живут у фермеров.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02");	//А куда им еще деться?
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Что еще ты знаешь?",DIA_Addon_Nadja_LuciaInfo_sonst);
};

func void DIA_Addon_Nadja_LuciaInfo_sonst()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_sonst_15_00");	//Что еще ты знаешь?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_01");	//Я слышала странные истории о том, как люди исчезают.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_02");	//Но я сомневаюсь, что этим рассказам стоит верить.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_03");	//Тебе стоит поговорить с торговцами.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_04");	//К сожалению, это все, что я могу рассказать.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_05");	//Ну а теперь что будем делать, дорогуша? В конце концов, ты же деньги заплатил.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_06");	//Не хочешь позабавиться перед тем, как уедешь?
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Спасибо, но мне нужно идти.",DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Почему бы и нет? ...",DIA_Nadja_Poppen_Start);
};

func void DIA_Addon_Nadja_LuciaInfo_weiter()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_weiter_15_00");	//Спасибо, но мне нужно идти.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_weiter_16_01");	//Очень жаль. Ну что ж, тогда в другой раз.
	Bromor_Pay = FALSE;
	Nadja_Nacht = Nadja_Nacht + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
};


instance DIA_Nadja_Poppen(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_Poppen_Condition;
	information = DIA_Nadja_Poppen_Info;
	permanent = TRUE;
	description = "(развлечься)";
};


func int DIA_Nadja_Poppen_Condition()
{
	if((Bromor_Pay == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Poppen_Info()
{
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//Следующая пара часов принадлежит только нам.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//Расслабься. Ложись и получай удовольствие.
	Info_ClearChoices(DIA_Nadja_Poppen);
	Info_AddChoice(DIA_Nadja_Poppen,"Хорошо ...",DIA_Nadja_Poppen_Start);
};

func void DIA_Nadja_Poppen_Start()
{
	Bromor_Pay = FALSE;
	Nadja_Nacht = Nadja_Nacht + 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_LuciaInfo_Pop()
{
	DIA_Nadja_Poppen_Start();
};


instance DIA_Nadja_BUYHERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_BUYHERB_Condition;
	information = DIA_Nadja_BUYHERB_Info;
	permanent = TRUE;
	description = "Могу я здесь купить травки?";
};


func int DIA_Nadja_BUYHERB_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Npc_KnowsInfo(other,DIA_Nadja_WANT_HERB) == FALSE) && (Nadja_Money == FALSE) && (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_BUYHERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//Могу я здесь купить травки?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if(Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE)
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//Откуда мне знать? Да и если бы знала, все равно не сказала бы городскому стражнику.
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//Заплати несколько золотых, и я скажу, где ее достать.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//Сколько ты хочешь?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//50 золотых будет достаточно.
			Nadja_Money = TRUE;
		};
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};
};


instance DIA_Nadja_WANT_HERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_WANT_HERB_Condition;
	information = DIA_Nadja_WANT_HERB_Info;
	permanent = FALSE;
	description = "А теперь скажи мне, где можно купить травки (заплатить 50 золотых).";
};


func int DIA_Nadja_WANT_HERB_Condition()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50) && (Nadja_Money == TRUE) && (MIS_Andre_REDLIGHT == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Nadja_WANT_HERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//А теперь скажи мне, где можно купить травки.
	if(Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE)
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//Извини, я забыла.
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//Поговори с Боркой, детка. У него найдется травка для тебя.
		Knows_Borka_Dealer = TRUE;
	};
};

