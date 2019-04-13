
instance DIA_Canthar_PICKPOCKET(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 900;
	condition = DIA_Canthar_PICKPOCKET_Condition;
	information = DIA_Canthar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Canthar_PICKPOCKET_Condition()
{
	return C_Beklauen(20,25);
};

func void DIA_Canthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
	Info_AddChoice(DIA_Canthar_PICKPOCKET,Dialog_Back,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Canthar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};

func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};


instance DIA_Canthar_EXIT(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 999;
	condition = DIA_Canthar_EXIT_Condition;
	information = DIA_Canthar_EXIT_Info;
	permanent = TRUE;
	description = "Мне нужно идти!";
};


func int DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Canthar_EXIT_Info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//Мне нужно идти!
	AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//Как знаешь.
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_PersonalCRIMES(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_PersonalCRIMES_Condition;
	information = DIA_Canthar_PersonalCRIMES_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Canthar_PersonalCRIMES_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PersonalCRIMES_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//Это было очень глупо с твоей стороны атаковать меня.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//(насмешливо) Ты думал, что так просто сможешь справиться со мной?
	};
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//Либо ты сейчас извинишься, либо я позабочусь, чтобы ты горько пожалел о том, что сделал!
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//А что именно ты имел в виду?
	B_Say_Gold(self,other,100);
	Info_ClearChoices(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice(DIA_Canthar_PersonalCRIMES,"У меня нет столько!",DIA_Canthar_PersonalCRIMES_NotEnough);
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Canthar_PersonalCRIMES,"Вот твое золото - давай забудем об этом!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//Вот твое золото - давай забудем об этом!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//Очень разумно с твоей стороны!
	self.aivar[AIV_LastFightComment] = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//У меня нет столько!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//Тогда зачем ты попусту тратишь мое время?
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_Hallo(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_Hallo_Condition;
	information = DIA_Canthar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Canthar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Hallo_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//Посмотрите, кто у нас здесь!
		AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//Ты ведь идешь в город - я не прав?
		AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//Может быть.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//Хм! (фыркает) ты похож на беглеца! Все беглецы направляются в город.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//Возможно, ты даже беглый каторжник из колонии.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//(торопливо) Меня не волнует, откуда ты пришел. Но мне кажется, у меня есть интересное предложение для тебя...
		Canthar_GotMe = TRUE;
	}
	else if(Hlp_IsItem(itm,ITAR_Bau_L) || Hlp_IsItem(itm,ITAR_Bau_M))
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//Как идет работа, крестьянин?
		Info_ClearChoices(DIA_Canthar_Hallo);
		Info_AddChoice(DIA_Canthar_Hallo,"Я похож на фермера?",DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice(DIA_Canthar_Hallo,"Мне не на что жаловаться.",DIA_Canthar_Hallo_Bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//Что я могу сделать для тебя?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//Мне не на что жаловаться.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//Могу я что-нибудь сделать для тебя?
	Info_ClearChoices(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//Я похож на фермера?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//Ты выглядишь как фермер. Но говоришь совсем не так, как они!
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//(в раздумьях) Если я ни в чем не ошибаюсь, у меня есть интересное предложение для тебя...
	Canthar_GotMe = TRUE;
	Info_ClearChoices(DIA_Canthar_Hallo);
};


instance DIA_Canthar_WhatOffer(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_WhatOffer_Condition;
	information = DIA_Canthar_WhatOffer_Info;
	permanent = FALSE;
	description = "Что ты можешь предложить мне?";
};


func int DIA_Canthar_WhatOffer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Canthar_WhatOffer_Info()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//Что ты можешь предложить мне?
	if(Canthar_GotMe == TRUE)
	{
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//Судя по тому, как ты выглядишь, стража никогда не пустит тебя в город.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//(иронично) Если ты будешь говорить так же 'убедительно' со стражей у ворот, как говоришь со мной, они никогда не пустят тебя в город.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//Я могу помочь тебе попасть в город.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//У меня есть вот этот клочок бумаги. С королевской печатью и подписью губернатора. Пропуск.
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//С этим пропуском в кармане ты сможешь спокойно войти в город, и страже придется пропустить тебя.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//Тебе это интересно?
		Info_ClearChoices(DIA_Canthar_WhatOffer);
		Info_AddChoice(DIA_Canthar_WhatOffer,"Нет! Оставь эту бумагу себе!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice(DIA_Canthar_WhatOffer,"Что ты хочешь за этот пропуск?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice(DIA_Canthar_WhatOffer,"А как ТЫ попадешь в город?",DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice(DIA_Canthar_WhatOffer,"Это похоже на подвох...",DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//Я бродячий торговец. Я торгую всем.
	};
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Кантар торгует различным оружием.");
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//Это похоже на подвох...
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//Нет! Никакого подвоха. Ты просто окажешь мне услугу.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//А как ТЫ попадешь в город?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//Стража знает меня. Я просто скажу им, что потерял мой пропуск.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//Что ты хочешь за этот пропуск?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//(удовлетворенно) Я ЗНАЛ, что не ошибся в тебе!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//Послушай. Ты получишь от меня пропуск. Прямо сейчас!
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//Просто так?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//Да. НО: если я встречу тебя в городе, ты будешь должен оказать мне услугу.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//Ну что, договорились?
	Info_AddChoice(DIA_Canthar_WhatOffer,"Конечно. Давай сюда эту бумагу.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//Конечно. Давай сюда эту бумагу.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//Держи. Но обращайся с ней аккуратно, она очень ценная.
	CreateInvItems(self,ItWr_Passierschein,1);
	B_GiveInvItems(self,other,ItWr_Passierschein,1);
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//И еще одно: даже и не думай нарушить свое слово!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//Я торговец и имею очень большое влияние в городе - просто так это тебе с рук не сойдет, уж поверь мне!
	Canthar_Gefallen = TRUE;
	Info_ClearChoices(DIA_Canthar_WhatOffer);
	Log_CreateTopic(TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_City,LOG_Running);
	B_LogEntry(TOPIC_City,"Я получил пропуск у торговца Кантара, который позволит мне попасть в город. Взамен, я должен оказать ему услугу в следующий раз, когда увижу его в городе.");
};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//Нет! Оставь эту бумагу себе!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//Хм. Похоже, я недооценил тебя, а?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//Ладно. Тебе нужно что-нибудь еще? Может тебе показать мои товары?
	Info_ClearChoices(DIA_Canthar_WhatOffer);
};


instance DIA_Canthar_TRADE(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 888;
	condition = DIA_Canthar_TRADE_Condition;
	information = DIA_Canthar_TRADE_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары!";
	trade = TRUE;
};


func int DIA_Canthar_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info()
{
	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//Покажи мне свои товары!
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Выбирай.
};


instance DIA_Canthar_PAYPRICEINCITY(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_PAYPRICEINCITY_Condition;
	information = DIA_Canthar_PAYPRICEINCITY_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Canthar_PAYPRICEINCITY_Condition()
{
	if((Canthar_InStadt == TRUE) && (Npc_IsDead(Sarah) == FALSE) && (Canthar_GotMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PAYPRICEINCITY_Info()
{
	if(Canthar_Gefallen == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//За тобой должок. И пришло время вернуть его.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//Эй, ты, у меня есть предложение для тебя.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//Что ты хочешь?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//Я хочу вернуть мой старый прилавок на рыночной площади. Сара увела его у меня.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//И я хочу, чтобы она вернула мне этот прилавок назад.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//А моя роль в этом какая?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//Я дам тебе письмо, которое ты должен подложить в ее карман.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//Затем ты пойдешь к Андрэ и скажешь ему, что Сара продает оружие Онару.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//Ее посадят в тюрьму, ты получишь награду, а я свой прилавок.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//У тебя есть два дня на выполнение этого.
	if(Canthar_Gefallen == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//А что мне с этого будет?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//Когда я верну себе прилавок, ты получишь оружие от меня - очень хорошее оружие.
	};
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"Нет, я не буду участвовать в этом.",DIA_Canthar_PAYPRICEINCITY_Nein);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"Хорошо, я сделаю это.",DIA_Canthar_PAYPRICEINCITY_Ok);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"А что будет, если я откажусь?",DIA_Canthar_PAYPRICEINCITY_If);
};

func void DIA_Canthar_PAYPRICEINCITY_If()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//А что будет, если я откажусь?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//Это будет очень глупо с твоей стороны. Понимаешь, я знаю, что ты беглый каторжник.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//Если об этом прознают остальные, это нанесет значительный урон твоей репутации в городе...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//Нет, я не буду участвовать в этом.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//Это было неверное решение, мой мальчик. Но мы еще поговорим.
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};

func void DIA_Canthar_PAYPRICEINCITY_Ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//Хорошо, похоже, у меня нет выбора.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//Ты сообразительный парень. Вот, держи письмо.
	CreateInvItems(self,ItWr_Canthars_KomproBrief_MIS,1);
	B_GiveInvItems(self,other,ItWr_Canthars_KomproBrief_MIS,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//А как я подложу ей это письмо?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//Пусть она покажет тебе свои товары - а пока она будет делать это, ты подложишь ей письмо.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//И помни, я очень влиятельный человек, так что не пытайся провести меня.
	MIS_Canthars_KomproBrief = LOG_Running;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay();
	Log_CreateTopic(TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Canthar,LOG_Running);
	if(Canthar_Gefallen == TRUE)
	{
		B_LogEntry(TOPIC_Canthar,"Кантар хочет, чтобы я оказал ему услугу, как обещал.");
	}
	else
	{
		B_LogEntry(TOPIC_Canthar,"Кантар пообещал дать мне оружие, взамен на оказанную ему услугу.");
	};
	B_LogEntry(TOPIC_Canthar,"Я должен подложить письмо  торговке Саре, которое даст повод подозревать ее в том, что она продает оружие Онару. Затем я должен пойти к лорду Андре и настучать на нее.");
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};


instance DIA_Canthar_SARAHERLEDIGT(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_SARAHERLEDIGT_Condition;
	information = DIA_Canthar_SARAHERLEDIGT_Info;
	permanent = TRUE;
	description = "Насчет Сары ...";
};


func int DIA_Canthar_SARAHERLEDIGT_Condition()
{
	if(MIS_Canthars_KomproBrief == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Canthar_SARAHERLEDIGT_Info()
{
	if(Npc_IsDead(Sarah) == FALSE)
	{
		if(MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() + 2))
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_00");	//У тебя нет работы для меня?
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//Сначала подложи письмо Саре, а затем сходи к Андрэ и обвини ее.
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//Сделай же это. И не пытайся обмануть меня, ты пожалеешь об этом.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_03");	//Ты попусту тратишь свое драгоценное время. За дело!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//Сара мертва.
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//Правда? Превосходно. Значит, ты выполнил свою часть нашей маленькой сделки.
		MIS_Canthars_KomproBrief = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self,"MARKTSTAND");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_Success(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_Success_Condition;
	information = DIA_Canthar_Success_Info;
	permanent = FALSE;
	description = "Насчет Сары ...";
};


func int DIA_Canthar_Success_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_SUCCESS) && (Npc_IsDead(Sarah) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Success_Info()
{
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//Отлично. Сара отправилась туда, где ей самое место.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//Я забрал ее товары, так что, если тебе нужно оружие, заходи ко мне.
	if(Kapitel == 1)
	{
		CreateInvItems(self,ItMw_ShortSword3,1);
		CreateInvItems(self,ItMw_ShortSword4,1);
		CreateInvItems(self,ItMw_ShortSword5,1);
		CreateInvItems(self,ItMw_Kriegshammer1,1);
		CreateInvItems(self,ItMw_1h_Vlk_Sword,1);
		CreateInvItems(self,ItMw_1h_Nov_Mace,1);
	};
	if(Kapitel == 2)
	{
		CreateInvItems(self,ItMw_Stabkeule,1);
		CreateInvItems(self,ItMw_Steinbrecher,1);
		CreateInvItems(self,ItMw_Schwert2,1);
		CreateInvItems(self,ItMw_Bartaxt,1);
	};
	if(Canthar_Gefallen == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//Ты собирался дать мне оружие.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//Правильно. Вот, это оружие - произведение оружейного искусства.
		B_GiveInvItems(self,other,ItMw_Schiffsaxt,1);
	};
	B_GivePlayerXP(XP_Canthars_KomproBrief);
};


instance DIA_Canthar_Again(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_Again_Condition;
	information = DIA_Canthar_Again_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Canthar_Again_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Again_Info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//Ох, опять ты.
	if(MIS_Canthars_KomproBrief == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//Почему ты не в тюрьме?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//Меня отпустили. Как я уже говорил тебе - я очень влиятельный человек в этом городе.
	}
	else if(MIS_Canthars_KomproBrief == LOG_Running)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//Кстати, я разделался с Сарой сам. Ты можешь забыть об этом деле с письмом.
	}
	else if(MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//Разве я не предупреждал тебя? Было бы лучше, если бы ты делал то, что я говорю.
	};
	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//Теперь все торговцы узнали, что ты беглый каторжник.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//Какая жалость - теперь ты не сможешь купить на рыночной площади даже куска хлеба.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//Я могу, конечно же, уладить эту проблему для тебя, это будет стоить, скажем...
	B_Say_Gold(self,other,Canthar_Gold);
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_Pay(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_Pay_Condition;
	information = DIA_Canthar_Pay_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Canthar_Pay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_Again) && (Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Pay_Info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//Ты готов заплатить?
	Info_ClearChoices(DIA_Canthar_Pay);
	if(Npc_HasItems(other,ItMi_Gold) >= Canthar_Gold)
	{
		Info_AddChoice(DIA_Canthar_Pay,"Хорошо, я заплачу ...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice(DIA_Canthar_Pay,"У меня нет с собой столько денег...",DIA_Canthar_Pay_Nein);
	Info_AddChoice(DIA_Canthar_Pay,"Сколько там нужно?",DIA_Canthar_Pay_Wieviel);
};

func void DIA_Canthar_Pay_Ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//Хорошо, я заплачу, ты не оставляешь мне выбора.
	B_GiveInvItems(other,self,ItMi_Gold,Canthar_Gold);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//(ухмыляется) Хорошо. А теперь я позабочусь, чтобы твоя репутация среди торговцев выросла опять.
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE;
	Info_ClearChoices(DIA_Canthar_Pay);
};

func void DIA_Canthar_Pay_Nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//У меня нет с собой столько денег...
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//Тогда добудь их.
	Info_ClearChoices(DIA_Canthar_Pay);
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_Pay_Wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//Сколько там нужно?
	B_Say_Gold(self,other,Canthar_Gold);
};


instance DIA_Canthar_CANTHARANGEPISST(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_CANTHARANGEPISST_Condition;
	information = DIA_Canthar_CANTHARANGEPISST_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Canthar_CANTHARANGEPISST_Condition()
{
	if((Canthar_Ausgeliefert == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_CANTHARANGEPISST_Info()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//Я предупреждал тебя, но ты не слушал. Мы обсудим этот вопрос позже.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//А теперь проваливай, я хочу отдохнуть.
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_MinenAnteil(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 3;
	condition = DIA_Canthar_MinenAnteil_Condition;
	information = DIA_Canthar_MinenAnteil_Info;
	description = "Ты продаешь поддельные акции!";
};


func int DIA_Canthar_MinenAnteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_MinenAnteil_Info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//Ты продаешь поддельные акции!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//Да? И что?! Если не я, так другой.
	B_GivePlayerXP(XP_Ambient);
};

