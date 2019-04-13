
instance DIA_Baltram_EXIT(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 999;
	condition = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Baltram_Hallo(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Hallo_Condition;
	information = DIA_Baltram_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Nagur_Bote == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Hallo_Info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//Добро пожаловать, чужеземец, меня зовут Бальтрам. Ты хочешь запастись продовольствием?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Боюсь, что мне придется разочаровать тебя. В настоящий момент я мало что могу предложить.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Но скоро я жду новую поставку.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Если ты пришел купить у меня съестные припасы, ты пришел напрасно.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Я не самого лучшего мнения о вас, наемниках! От вас одни проблемы.
	};
};


instance DIA_Addon_Baltram_LaresAbloese(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 1;
	condition = DIA_Addon_Baltram_LaresAbloese_Condition;
	information = DIA_Addon_Baltram_LaresAbloese_Info;
	important = TRUE;
};


func int DIA_Addon_Baltram_LaresAbloese_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SCIsWearingRangerRing == TRUE) && (MIS_Lares_BringRangerToMe == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_00");	//Почему ты так подозрительно на меня смотришь?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_01");	//Я заметил у тебя знак Кольца Воды.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_02");	//Ты тоже член этого общества?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_03");	//А что, если так?
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_04");	//Я должен передать тебе, что дежурящий в порту Ларес хочет, чтобы его сменили.
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_05");	//Хорошо. Я прослежу, чтобы это сделали.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_06");	//Понятно.
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_Addon_BringRangerToLares,"Бальтрам, торговец на рыночной площади, позаботится, чтобы Лареса заменили на его посту. Ларес может покинуть гавань ПРЯМО СЕЙЧАС.");
	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};


instance DIA_Baltram_Job(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 3;
	condition = DIA_Baltram_Job_Condition;
	information = DIA_Baltram_Job_Info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};


func int DIA_Baltram_Job_Condition()
{
	if((MIS_Nagur_Bote != LOG_Running) && (MIS_Nagur_Bote != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Job_Info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//У тебя есть работа для меня?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Нет, у меня уже есть мальчик на побегушках. Попробуй поговорить с другими торговцами.
};


instance DIA_Baltram_Trick(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_Trick_Condition;
	information = DIA_Baltram_Trick_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Trick_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Nagur_Bote == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Trick_Info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Ты ищешь работу?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Конечно, а что нужно?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//Мой мальчик на побегушках не вернулся, а я жду поставку от фермера Акила.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//И во сколько ты оцениваешь эту работу?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//Я дам тебе 50 золотых монет.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Отлично, я согласен.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//Хорошо, просто скажи Акилу, что тебя послал я. Он передаст тебе пакет. Принеси его мне.
	MIS_Baltram_ScoutAkil = LOG_Running;
	B_LogEntry(TOPIC_Nagur,"Бальтрам нанял меня в качестве мальчика на побегушках. Теперь, я должен доставить ему посылку с фермы Акила.");
	Log_CreateTopic(TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram,LOG_Running);
	B_LogEntry(TOPIC_Baltram,"Если я принесу Бальтраму его посылку, он заплатит мне 50 золотых монет.");
};


var int Baltram_TradeLOG;

instance DIA_Baltram_WAREZ(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_WAREZ_Condition;
	information = DIA_Baltram_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Baltram_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Baltram_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Покажи мне свои товары.
	if(Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Бальтрам торгует продуктами на рыночной площади.");
		Baltram_TradeLOG = TRUE;
	};
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Им не стоило допускать, чтобы все зашло так далеко. Теперь вот один из наемников убил паладина.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Что-то подобное обязательно должно было случиться!
	};
	if((MIS_BaltramTrade != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Такие как ты ничего от меня не получат.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Почему?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Сначала ты сбиваешь фермеров с пути истинного, а затем ведешь себя так, как будто ничего не произошло.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//Теперь проваливай, ты распугаешь всех моих клиентов.
		MIS_BaltramTrade = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Baltram_Skip(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_Skip_Condition;
	information = DIA_Addon_Baltram_Skip_Info;
	description = "Значит, ты торгуешь с пиратами?";
};


func int DIA_Addon_Baltram_Skip_Condition()
{
	if(SCKnowsBaltramAsPirateTrader == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_Skip_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_00");	//(мимоходом) Значит, ты торгуешь с пиратами?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_01");	//(испуганно) Что? Кто тебе это сказал?
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_02");	//Я говорил с одним из них. Похоже, он ждет тебя в своей бухте.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_03");	//Что же мне было делать? Времена сейчас тяжелые. Каждый выкручивается, как может.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Ты не боялся, что тебя могут раскрыть?",DIA_Addon_Baltram_Skip_erwischen);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Ты понесешь за это наказание!",DIA_Addon_Baltram_Skip_MIL);
};

func void DIA_Addon_Baltram_Skip_Back()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Back_15_00");	//Это все, что я хотел узнать.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_MIL_15_00");	//Ты понесешь за это наказание!
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_MIL_01_01");	//Послушай! Давай я расскажу тебе все, что я знаю, а ты не станешь меня выдавать, хорошо?
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"И чем же ты торговал?",DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Что ты знаешь о пиратах?",DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_erwischen()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_erwischen_15_00");	//Ты не боялся, что тебя могут раскрыть?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_01");	//Я понимал, что такое возможно. Ты же меня раскрыл, верно?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_02");	//Надеюсь, что ты будешь держать рот на замке.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"И чем же ты торговал?",DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Что ты знаешь о пиратах?",DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_was()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_was_15_00");	//И чем же ты торговал?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_01");	//В основном, я продавал им еду.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_02");	//А за это получал от них лучший ром на Хоринисе.
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Это все, что я хотел узнать.",DIA_Addon_Baltram_Skip_Back);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Я бы мог совершить сделку вместо тебя.",DIA_Addon_Baltram_Skip_Ich);
};

func void DIA_Addon_Baltram_Skip_Ich()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Ich_15_00");	//(усмехается) Я бы мог совершить сделку вместо тебя.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_01");	//Это было бы замечательно. Я сейчас не могу уходить из города.
	CreateInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	B_GiveInvItems(self,other,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_02");	//Вот, возьми этот пакет и передай Скипу, что на этот раз мне нужно больше рома.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_03");	//Как минимум три бутылки.
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,"Бальтрам дал мне пакет. Я должен отнести его Скипу.");
	MIS_Addon_Baltram_Paket4Skip = LOG_Running;
};

func void DIA_Addon_Baltram_Skip_pirat()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_pirat_15_00");	//Что ты знаешь о пиратах?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_01");	//Они живут в удаленной части острова.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_02");	//Насколько я знаю, попасть туда можно только на корабле.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_03");	//Жители Хориниса их боятся. Это и понятно, ведь пираты - отчаянные головорезы.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_04");	//Однако я считаю, что бандиты еще хуже.
};


instance DIA_Addon_Baltram_SkipsRum(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_SkipsRum_Condition;
	information = DIA_Addon_Baltram_SkipsRum_Info;
	description = "Я принес ром. Но Скип дал мне всего две бутылки.";
};


func int DIA_Addon_Baltram_SkipsRum_Condition()
{
	if((Skip_Rum4Baltram == TRUE) && (MIS_Addon_Baltram_Paket4Skip == LOG_Running) && (Npc_HasItems(other,ItFo_Addon_Rum) >= 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_SkipsRum_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_SkipsRum_15_00");	//Я принес ром. Но Скип дал мне всего две бутылки.
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_01");	//(сердито) Дороговато получается... Что он о себе возомнил? Ладно, давай их сюда.
	B_GiveInvItems(other,self,ItFo_Addon_Rum,2);
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_02");	//Что ж, много заплатить я тебе не могу. Думаю, этого хватит.
	CreateInvItems(self,ItMi_Gold,10);
	B_GiveInvItems(self,other,ItMi_Gold,10);
	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Baltram_AkilsHof(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_AkilsHof_Condition;
	information = DIA_Baltram_AkilsHof_Info;
	permanent = FALSE;
	description = "Где мне найти ферму Акила?";
};


func int DIA_Baltram_AkilsHof_Condition()
{
	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Где мне найти ферму Акила?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Как только выйдешь из восточных ворот, держись дороги, ведущей на юго-восток.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Вскоре ты увидишь каменную лестницу. Когда ты поднимешься по ней, то уже сможешь видеть ферму Акила.
};


instance DIA_Baltram_Lieferung(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Baltram_Lieferung_Condition;
	information = DIA_Baltram_Lieferung_Info;
	permanent = FALSE;
	description = "Я принес пакет от Акила.";
};


func int DIA_Baltram_Lieferung_Condition()
{
	if(Npc_HasItems(other,ItMi_BaltramPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Baltram_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//Я принес пакет от Акила.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Превосходно. Теперь я опять смогу торговать свежими продуктами. Вот твои 50 золотых монет.
	B_GiveInvItems(other,self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP(XP_Baltram_ScoutAkil);
	Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	CreateInvItems(self,ItFo_Cheese,5);
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Beer,5);
	CreateInvItems(self,ItFo_Bacon,5);
	CreateInvItems(self,ItFo_Sausage,5);
};


instance DIA_Baltram_LetUsTrade(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_LetUsTrade_Condition;
	information = DIA_Baltram_LetUsTrade_Info;
	permanent = FALSE;
	description = "Может, нам опять поработать вместе?";
};


func int DIA_Baltram_LetUsTrade_Condition()
{
	if(MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Может, нам опять поработать вместе?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//Послушай, если ты принесешь мне 10 окороков и 10 бутылок вина, тогда я опять готов иметь с тобой дело.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Я попробую.
	MIS_BaltramTrade = LOG_Running;
};


var int BaltramEnoughBacon;
var int BaltramEnoughWine;

instance DIA_Baltram_HaveYourWarez(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_HaveYourWarez_Condition;
	information = DIA_Baltram_HaveYourWarez_Info;
	permanent = TRUE;
	description = "Я принес то, что ты просил.";
};


func int DIA_Baltram_HaveYourWarez_Condition()
{
	if((MIS_BaltramTrade == LOG_Running) && (MIS_BaltramTrade != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//Я принес то, что ты просил.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Покажи.
	if(Npc_HasItems(other,ItFo_Bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Мы договорились на 10 окороков. Возвращайся когда добудешь их.
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//А что насчет 10 бутылок вина? Ты что, забыл про них?
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	if((BaltramEnoughBacon == TRUE) && (BaltramEnoughWine == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Хммм, товар не самого лучшего качества, но в наше время не приходится привередничать.
		B_GiveInvItems(other,self,ItFo_Bacon,10);
		B_GiveInvItems(other,self,ItFo_Wine,10);
		MIS_BaltramTrade = LOG_SUCCESS;
		B_GivePlayerXP(XP_BaltramTrade);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//Теперь ничто не мешает нам вести дела.
	};
};


instance DIA_Baltram_PICKPOCKET(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 900;
	condition = DIA_Baltram_PICKPOCKET_Condition;
	information = DIA_Baltram_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Baltram_PICKPOCKET_Condition()
{
	return C_Beklauen(76,175);
};

func void DIA_Baltram_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,Dialog_Back,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

