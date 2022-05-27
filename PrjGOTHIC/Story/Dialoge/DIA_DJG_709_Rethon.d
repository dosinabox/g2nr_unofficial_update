
instance DIA_Rethon_EXIT(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 999;
	condition = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rethon_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rethon_HALLO(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 5;
	condition = DIA_Rethon_HALLO_Condition;
	information = DIA_Rethon_HALLO_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Rethon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rethon_HALLO_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Rethon_HALLO_12_01");	//Готовлюсь к сражению, что же еще?
};


instance DIA_Rethon_KAMPF(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 6;
	condition = DIA_Rethon_KAMPF_Condition;
	information = DIA_Rethon_KAMPF_Info;
	description = "С кем ты собрался сражаться?";
};


func int DIA_Rethon_KAMPF_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_KAMPF_Info()
{
	AI_Output(other,self,"DIA_Rethon_KAMPF_15_00");	//С кем ты собрался сражаться?
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_01");	//Я хочу вызвать на бой паладинов и показать этим жирным лентяям, где раки зимуют.
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_02");	//Идиот. С драконами, конечно же. А ты что подумал?
};


instance DIA_Rethon_PALADINE(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 6;
	condition = DIA_Rethon_PALADINE_Condition;
	information = DIA_Rethon_PALADINE_Info;
	description = "Паладины не против того, что вы здесь?";
};


func int DIA_Rethon_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_PALADINE_Info()
{
	AI_Output(other,self,"DIA_Rethon_PALADINE_15_00");	//Паладины не против того, что вы здесь?
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_01");	//Чушь. У них совсем другие проблемы. Большинство из них рады, что вообще живы.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_02");	//Боевой дух у них ни к черту. Это начало их конца.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_03");	//Я хочу сказать, ты только посмотри на их старые зазубренные клинки, которые они постоянно чинят.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_04");	//Любой разумный воин давно бы сбежал отсюда.
};


instance DIA_Rethon_WOGRUPPE(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 7;
	condition = DIA_Rethon_WOGRUPPE_Condition;
	information = DIA_Rethon_WOGRUPPE_Info;
	description = "Ты отстал от своей группы?";
};


func int DIA_Rethon_WOGRUPPE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_WOGRUPPE_Info()
{
	AI_Output(other,self,"DIA_Rethon_WOGRUPPE_15_00");	//Ты отстал от своей группы?
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_01");	//Моей группы? Да у меня нет группы. Я охотник за трофеями.
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_02");	//Если я вернусь домой без трофея, никто не поймет, зачем я ходил сюда. Поэтому я не хочу ни с кем делиться.
};


instance DIA_Rethon_DRACHENGESEHEN(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 8;
	condition = DIA_Rethon_DRACHENGESEHEN_Condition;
	information = DIA_Rethon_DRACHENGESEHEN_Info;
	description = "Ты уже видел дракона?";
};


func int DIA_Rethon_DRACHENGESEHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_KAMPF))
	{
		return TRUE;
	};
};

func void DIA_Rethon_DRACHENGESEHEN_Info()
{
	AI_Output(other,self,"DIA_Rethon_DRACHENGESEHEN_15_00");	//Ты уже видел дракона?
	AI_Output(self,other,"DIA_Rethon_DRACHENGESEHEN_12_01");	//Нет. Я хочу привести свое оружие в порядок, прежде чем отправлюсь охотиться на него.
};


instance DIA_Rethon_ANGST(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 9;
	condition = DIA_Rethon_ANGST_Condition;
	information = DIA_Rethon_ANGST_Info;
	description = "А ты не боишься, что кто-нибудь может тебя опередить?";
};


func int DIA_Rethon_ANGST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_WOGRUPPE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_ANGST_Info()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_15_00");	//А ты не боишься, что кто-нибудь может тебя опередить?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_01");	//Что? Кто? Сильвио?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rethon_ANGST_12_02");	//Твой босс действительно думает, что ему здесь что-то светит, ха?
		AI_Output(other,self,"DIA_Rethon_ANGST_15_03");	//Я не из людей Сильвио. Я работаю сам на себя.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_04");	//Ох. Это хорошо. Забудь о том, что я говорил.
	};
	AI_Output(self,other,"DIA_Rethon_ANGST_12_05");	//Ты видел этих жалких трусов, что он привел с собой?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_06");	//Сильвио должен радоваться, если ему удастся выбраться отсюда живым.
	if(Npc_IsDead(DJG_Sylvio))
	{
		AI_Output(other,self,"DIA_Rethon_ANGST_15_07");	//Не удастся. Он мертв.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//Я рад.
	}
	else
	{
		Info_AddChoice(DIA_Rethon_ANGST,Dialog_Back,DIA_Rethon_ANGST_weiter);
		Info_AddChoice(DIA_Rethon_ANGST,"Похоже, ты не особенно-то любишь его.",DIA_Rethon_ANGST_sylviomoegen);
		if(!Npc_KnowsInfo(other,DIA_SylvioDJG_HelloAgain) && !Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT))
		{
			Info_AddChoice(DIA_Rethon_ANGST,"И где сейчас Сильвио?",DIA_Rethon_ANGST_woSylvio);
		};
		Info_AddChoice(DIA_Rethon_ANGST,"Сильвио был здесь?",DIA_Rethon_ANGST_sylviohier);
	};
};

func void DIA_Rethon_ANGST_weiter()
{
	Info_ClearChoices(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviohier_15_00");	//Сильвио был здесь?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_01");	//Здесь, в замке, ты хочешь сказать? Да, был. Но очень недолго.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_02");	//Он поболтал с несколькими парнями здесь, а затем опять исчез.
};

func void DIA_Rethon_ANGST_sylviomoegen()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviomoegen_15_00");	//Похоже, ты не особенно-то любишь его.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_01");	//Что ты хочешь этим сказать - любишь? Было бы лучше, если бы я его вообще не знал.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_02");	//У Сильвио нет друзей. Ему нужны люди, которые идут за ним и не задают вопросов.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_03");	//Это не по мне. Я работаю один.
};

func void DIA_Rethon_ANGST_woSylvio()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_woSylvio_15_00");	//И где сейчас Сильвио?
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_01");	//Паладины говорили, что-то о ледяном драконе на западе. Он, по слухам, самый опасный и сильный из всех драконов.
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_02");	//Ты бы видел блеск в глазах Сильвио, когда он услышал об этом. Даже гадать не нужно, куда он пошел.
	B_LogEntry(TOPIC_DRACHENJAGD,"Охотник на драконов Ретон бормотал что-то о ледяном драконе.");
	B_LogEntry(TOPIC_Dragonhunter,"Сильвио был в замке, а затем отправился на поиски ледяного дракона.");
};


instance DIA_Rethon_MEINEWAFFE(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 10;
	condition = DIA_Rethon_MEINEWAFFE_Condition;
	information = DIA_Rethon_MEINEWAFFE_Info;
	description = "Ты можешь помочь мне улучшить мое оружие?";
};


func int DIA_Rethon_MEINEWAFFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_MEINEWAFFE_Info()
{
	AI_Output(other,self,"DIA_Rethon_MEINEWAFFE_15_00");	//Ты можешь помочь мне улучшить мое оружие?
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_01");	//Улучшить? Лучше купи что-нибудь новое и выброси этот хлам, что ты носишь с собой.
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_02");	//Возможно, у меня найдется что-нибудь для тебя. Тебе это интересно?
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Охотник на драконов Ретон продает оружие в замке.");
};


instance DIA_Rethon_TRADE(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 11;
	condition = DIA_Rethon_TRADE_Condition;
	information = DIA_Rethon_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Что ты можешь продать мне?";
};


func int DIA_Rethon_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_MEINEWAFFE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_TRADE_Info()
{
	AI_Output(other,self,"DIA_Rethon_TRADE_15_00");	//Что ты можешь продать мне?
	B_ClearSmithInv(self);
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_01");	//Ох, как низко я опустился! Теперь я даже продаю мое оружие паладину!
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_02");	//У меня мало что есть для мага, но все же ты можешь взглянуть.
	}
	else
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_03");	//Думаю, у меня есть именно то, что тебе нужно, приятель.
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

