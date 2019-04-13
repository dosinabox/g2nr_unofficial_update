
instance DIA_Addon_Elvrich_EXIT(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 999;
	condition = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Elvrich_PICKPOCKET(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 900;
	condition = DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information = DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	return C_Beklauen(62,110);
};

func void DIA_Addon_Elvrich_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET,Dialog_Back,DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};

func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};


instance DIA_Addon_Elvrich_BanditsThere(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_BanditsThere_Condition;
	information = DIA_Addon_Elvrich_BanditsThere_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Elvrich_BanditsThere_NoPerm;

func int DIA_Addon_Elvrich_BanditsThere_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_BanditsThere_Info()
{
	if(Npc_IsDead(BDT_10307_Addon_RangerBandit_M) && Npc_IsDead(BDT_10308_Addon_RangerBandit_L) && Npc_IsDead(BDT_10309_Addon_RangerBandit_L) && Npc_IsDead(BDT_10310_Addon_RangerBandit_M))
	{
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//Слава богам! С бандитами покончено. Ты спас мне жизнь.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Elvrich_Wer(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Wer_Condition;
	information = DIA_Addon_Elvrich_Wer_Info;
	description = "Кто ты?";
};


func int DIA_Addon_Elvrich_Wer_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//Кто ты такой?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//Меня зовут Элврих. Я из города.
	if(MIS_Thorben_BringElvrichBack == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Мастер Торбен говорил, что ты пропал.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Эти подонки притащили меня сюда и держали в плену.
};


instance DIA_Addon_Elvrich_MissingPeople(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_MissingPeople_Condition;
	information = DIA_Addon_Elvrich_MissingPeople_Info;
	description = "В городе пропадали и другие люди.";
};


func int DIA_Addon_Elvrich_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer) && (SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//В городе пропадали и другие люди.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//Не знаю ничего о других людях. Могу рассказать только, что случилось со МНОЙ.
};


instance DIA_Addon_Elvrich_WhatExactly(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhatExactly_Condition;
	information = DIA_Addon_Elvrich_WhatExactly_Info;
	description = "И что же с тобой случилось?";
};


func int DIA_Addon_Elvrich_WhatExactly_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhatExactly_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//И что же с тобой случилось?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//Я шел на свидание. Я должен был встретиться со своей девушкой.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Ее зовут Люсия. Мы собирались направиться к горам, подальше от города и всех, кто там живет.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//Я дошел до места, где ждала меня Люсия, и вдруг появились бандиты и схватили нас обоих.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//Конечно, я сопротивлялся, но их было слишком много. Ты, кстати, их не встречал?
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Что хотели от тебя бандиты?",DIA_Addon_Elvrich_WhatExactly_Want);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Рассказывай.",DIA_Addon_Elvrich_WhatExactly_lucia);
};

func void DIA_Addon_Elvrich_WhatExactly_Want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//Что хотели от тебя бандиты?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//Несколько раз мне удавалось подслушать их беседы. Из них я понял, что нас собирались продать в рабство.
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Куда вас собирались увезти?",DIA_Addon_Elvrich_WhatExactly_Pirates);
};

func void DIA_Addon_Elvrich_WhatExactly_Pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Куда вас собирались увезти?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//Это место находится где-то здесь, на острове. Но похоже, что без корабля туда не добраться.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//Меня привели на побережье. На нем расположился небольшой пиратский лагерь.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//Один из бандитов подошел к пиратам и начал переговоры. У них разгорелся яростный спор.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//Я думаю, что бандит хотел, чтобы пираты куда-то нас перевезли.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//Но пираты отказались, и бандитам пришлось уйти. С тех пор мы здесь и сидим.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//По-моему, бандиты просто не знали, что им делать дальше. А потом пришел ты.
	Elvrich_SCKnowsPirats = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Элврих, ученик плотника из Хориниса Торбена, был похищен бандитами. Похоже, что пираты и бандиты в сговоре.");
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Пираты в Хоринисе?",DIA_Addon_Elvrich_WhatExactly_Here);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"Где находится лагерь пиратов?",DIA_Addon_Elvrich_WhatExactly_pirat);
};

func void DIA_Addon_Elvrich_WhatExactly_Here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Пираты в Хоринисе?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//Известно мне о них немного. Честно говоря, я тогда первый раз увидел пиратов.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//Они стараются оставаться в тени. Практически каждый из них - находящийся в розыске преступник.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//У пиратов есть суеверие - они боятся виселиц, так что в городе их не встретишь.
};

func void DIA_Addon_Elvrich_WhatExactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Расскажи мне о Люсии.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//Это девушка из портового района. Очень красивая. Она работала на этого мерзавца Бромора.
};

func void DIA_Addon_Elvrich_WhatExactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Где находится лагерь пиратов?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Недалеко от гавани Хориниса.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//Если ты встанешь на набережной лицом к морю, то он будет справа.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//Первый небольшой залив, который встретится тебе на пути, и будет нужным тебе местом.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Чтобы найти место встречи с пиратами, нужно пойти в порт Хориниса и встать на набережной лицом к морю. Затем нужно спрыгнуть в море и поплыть вдоль берега направо.");
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,Dialog_Back,DIA_Addon_Elvrich_WhatExactly_Back);
};

func void DIA_Addon_Elvrich_WhatExactly_Back()
{
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
};


instance DIA_Addon_Elvrich_Bromor(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Bromor_Condition;
	information = DIA_Addon_Elvrich_Bromor_Info;
	description = "Бромор сказал, что Люсия украла у него золотое блюдо...";
};


func int DIA_Addon_Elvrich_Bromor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Bromor_LuciaStoleGold == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_Bromor_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Бромор сказал, что Люсия украла у него золотое блюдо...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//Ну, если Люсия что-то и украла у Бромора, у нее отобрали это бандиты.
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"Золотая чаша Бромора, по всей видимости, находится у бандитов, живущих в лесном лагере к северу от фермы Секоба.");
};


instance DIA_Addon_Elvrich_WhereIsLucia(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information = DIA_Addon_Elvrich_WhereIsLucia_Info;
	description = "Где сейчас Люсия?";
};


func int DIA_Addon_Elvrich_WhereIsLucia_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_LuciasLetter != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//Где сейчас Люсия?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//Мы разделились на большом перекрестке перед фермой Онара.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//Люсию бандиты утащили в лес за фермой Секоба.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//Да защитит ее Иннос.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Люсию увели бандиты. Они направились в лес, который находится к северу от фермы Секоба.");
	SC_KnowsLuciaCaughtByBandits = TRUE;
};


instance DIA_Addon_Elvrich_FernandosWaffen(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information = DIA_Addon_Elvrich_FernandosWaffen_Info;
	description = "Бандиты, которые держали тебя в плену, получали груз оружия?";
};


func int DIA_Addon_Elvrich_FernandosWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//Бандиты, которые держали тебя в плену, получали груз оружия?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//О да. Оружия было столько, что они еле его унесли.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//Все это оружие они утащили в направлении фермы Секоба.
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"След ведет меня в лес, который находится к северу от фермы Секоба. Там разместились бандиты, получившие недавно большую партию оружия.");
};


instance DIA_Addon_Elvrich_LuciaLetter(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 4;
	condition = DIA_Addon_Elvrich_LuciaLetter_Condition;
	information = DIA_Addon_Elvrich_LuciaLetter_Info;
	description = "Я нашел письмо от Люсии.";
};


func int DIA_Addon_Elvrich_LuciaLetter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//Я нашел письмо от Люсии.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//(возбужденно) Что? Дай его сюда!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//(в отчаянии) Нет! Я не верю! Я просто не могу поверить.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//(в отчаянии) Она не может меня вот так вот бросить.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//Забери это письмо! Я не хочу его видеть. Я верю, что когда-нибудь она ко мне вернется.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Элврих не хочет верить, что Люсия ушла с бандитами добровольно. Несмотря на письмо, которое она ему написала, он все еще надеется на ее возвращение.");
	B_GivePlayerXP(XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
};


instance DIA_Addon_Elvrich_WasNun(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WasNun_Condition;
	information = DIA_Addon_Elvrich_WasNun_Info;
	permanent = FALSE;
	description = "Ты должен вернуться в город!";
};


func int DIA_Addon_Elvrich_WasNun_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhereIsLucia))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//Ты должен вернуться в город!
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//Именно это я и собираюсь сделать! Я возвращаюсь к мастеру Торбену.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//Ты пойдешь искать бандитов?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//Думаю, что да...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//Если найдешь Люсию, отведи ее в город, хорошо?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//Я посмотрю, что смогу сделать.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Элврих вернулся к мастеру Торбену.");
	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	EquipItem(self,ItMw_1h_Bau_Mace);
};


instance DIA_Addon_Elvrich_PERM(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_PERM_Condition;
	information = DIA_Addon_Elvrich_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Elvrich_PERM_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && Npc_IsInState(self,ZS_Talk) && (MIS_LuciasLetter != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_PERM_Info()
{
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//Спасибо, что спас меня!
};

