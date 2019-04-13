
instance DIA_Sagitta_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_EXIT_Condition;
	information = DIA_Sagitta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HALLO(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 4;
	condition = DIA_Sagitta_HALLO_Condition;
	information = DIA_Sagitta_HALLO_Info;
	description = "Ты здесь совсем одна?";
};


func int DIA_Sagitta_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//Ты здесь совсем одна?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//Говори, что тебе нужно от меня, и уходи. Я занята.
	Info_ClearChoices(DIA_Sagitta_HALLO);
	Info_AddChoice(DIA_Sagitta_HALLO,Dialog_Back,DIA_Sagitta_HALLO_ende);
	Info_AddChoice(DIA_Sagitta_HALLO,"Ты можешь вылечить меня?",DIA_Sagitta_HALLO_Heil);
	Info_AddChoice(DIA_Sagitta_HALLO,"Что ты делаешь здесь?",DIA_Sagitta_HALLO_was);
	Info_AddChoice(DIA_Sagitta_HALLO,"Кто ты?",DIA_Sagitta_HALLO_wer);
};

func void DIA_Sagitta_HALLO_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//Ты что, никогда не слышал обо мне?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//Меня называют ведьмой-целительницей. А еще шаманкой.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//Но когда им плохо, все они неожиданно вспоминают старую добрую Сагитту и ее целебные травы.
};

func void DIA_Sagitta_HALLO_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//Я живу здесь, сколько себя помню, и занимаюсь травами.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//Лес - мой друг. Он дает мне то, что мне нужно.
};

func void DIA_Sagitta_HALLO_Heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//Ты можешь вылечить меня?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//Ты за этим пришел, да? Дай мне знать, если с тобой будет что-то не в порядке.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"У Сагитты, живущей за фермой Секоба, можно купить различные товары.");
};

func void DIA_Sagitta_HALLO_ende()
{
	Info_ClearChoices(DIA_Sagitta_HALLO);
};


instance DIA_Sagitta_TeachAlchemyRequest(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_TeachAlchemyRequest_Condition;
	information = DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня готовить зелья?";
};


func int DIA_Sagitta_TeachAlchemyRequest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO) && (MIS_Sagitta_Herb == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Sagitta_TeachAlchemyRequest_OneTime;

func void DIA_Sagitta_TeachAlchemyRequest_Info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//Ты можешь научить меня готовить зелья?
	if(DIA_Sagitta_TeachAlchemyRequest_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//Как интересно. Меня нечасто о таком просят.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//Так ты хочешь быть моим учеником? Тогда тебе сначала нужно доказать, что твои намерения серьезны.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//Я сейчас работаю над очень редким зельем, которое готовится из весьма специфических трав и растений.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//Если бы ты принес мне один ингредиент - очень редкое растение, которого у меня нет - я обучу тебя.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//Я уже сказала тебе: да, после того, как ты принесешь мне этот редкий ингредиент, что я просила.
	};
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Извини, но мне это не интересно.",DIA_Sagitta_TeachAlchemyRequest_nein);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Где можно найти этот ингредиент?",DIA_Sagitta_TeachAlchemyRequest_wo);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Что это за ингредиент?",DIA_Sagitta_TeachAlchemyRequest_was);
};

func void DIA_Sagitta_TeachAlchemyRequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//Что это за ингредиент?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//Это очень редкое растение - трава, называемая солнечное алоэ. Ты узнаешь его по сильному миндальному аромату.
};

func void DIA_Sagitta_TeachAlchemyRequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//Где можно найти этот ингредиент?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//Трава, необходимая мне, произрастает только в местах, где есть все питательные вещества, необходимые для ее роста.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//Обычно она встречается на экскрементах черного тролля.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//Вот почему мне так сложно достать эту траву, понимаешь?
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Посмотрим, может, мне удастся найти ее где-нибудь.",DIA_Sagitta_TeachAlchemyRequest_wo_ja);
};

func void DIA_Sagitta_TeachAlchemyRequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//Посмотрим, может, мне удастся найти ее где-нибудь.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//Удачи тебе в твоих поисках.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaHerb,LOG_Running);
	B_LogEntry(TOPIC_SagittaHerb,"Сагитте нужно очень странное растение. Это солнечное алоэ, оно растет только на экскрементах черного тролля.");
};

func void DIA_Sagitta_TeachAlchemyRequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//Извини, но мне это не интересно.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//Тогда хватит тратить мое время на всякую чепуху.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
};


instance DIA_Sagitta_Sagitta_Herb(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Sagitta_Herb_Condition;
	information = DIA_Sagitta_Sagitta_Herb_Info;
	description = "Я нашел солнечное алоэ.";
};


func int DIA_Sagitta_Sagitta_Herb_Condition()
{
	if(Npc_HasItems(other,ItPl_Sagitta_Herb_MIS) && (MIS_Sagitta_Herb == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Sagitta_Herb_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//Я нашел солнечное алоэ.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//Спасибо. Теперь ты можешь спрашивать меня обо всем, что хочешь узнать о приготовлении зелий.
	B_GiveInvItems(other,self,ItPl_Sagitta_Herb_MIS,1);
	Npc_RemoveInvItem(self,ItPl_Sagitta_Herb_MIS);
	Sagitta_TeachAlchemy = TRUE;
	MIS_Sagitta_Herb = LOG_SUCCESS;
	B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
};


instance DIA_Sagitta_Teach(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = DIA_Sagitta_Teach_Condition;
	information = DIA_Sagitta_Teach_Info;
	permanent = TRUE;
	description = "Какие зелья можешь ты научить меня варить?";
};


var int DIA_Sagitta_Teach_permanent;

func int DIA_Sagitta_Teach_Condition()
{
	if((DIA_Sagitta_Teach_permanent == FALSE) && (Sagitta_TeachAlchemy == TRUE) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//Какие зелья можешь ты научить меня варить?
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		Info_ClearChoices(DIA_Sagitta_Teach);
		Info_AddChoice(DIA_Sagitta_Teach,Dialog_Back,DIA_Sagitta_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente += 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_Mana_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente += 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,B_BuildLearnString(NAME_DEX_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente += 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//Прежде чем приступить к обучению тебя алхимии, я сначала расскажу, что необходимо иметь для приготовления зелий.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//Все зелья готовятся на алхимическом столе. Тебе также понадобится пустая мензурка, в которой будет храниться приготовленное зелье.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Тебе нужно смешать необходимые ингредиенты и все - зелье готово.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//Ну а дополнительные подробности ты всегда можешь узнать у меня, если захочешь.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//Так какое зелье тебя интересует?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//Ты уже знаешь все, чему я могла научить тебя.
		DIA_Sagitta_Teach_permanent = TRUE;
	};
};

func void DIA_Sagitta_Teach_BACK()
{
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Sagitta_Teach);
};


instance DIA_Sagitta_HEAL(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 99;
	condition = DIA_Sagitta_HEAL_Condition;
	information = DIA_Sagitta_HEAL_Info;
	permanent = TRUE;
	description = "Вылечи меня.";
};


func int DIA_Sagitta_HEAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEAL_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//Вылечи меня.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//Давай посмотрим, что там у тебя. Ммм. Моя мазь в момент заживит все твои раны.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//В настоящий момент тебе не нужно лечение.
	};
};


instance DIA_Sagitta_TRADE(C_Info)
{
	npc = BAU_980_Sagitta;
	condition = DIA_Sagitta_TRADE_Condition;
	information = DIA_Sagitta_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Какие товары ты можешь предложить мне?";
};


func int DIA_Sagitta_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_TRADE_Info()
{
	if(Sagitta_flag == TRUE)
	{
		B_ClearAlchemyInv(self);
		if(Sagitta_flasks > 0)
		{
			CreateInvItems(self,ItMi_Flask,Sagitta_flasks);
		};
		Sagitta_flag = FALSE;
	};
	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//Какие товары ты можешь предложить мне?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//Выбирай.
	Trade_IsActive = TRUE;
};


instance DIA_Sagitta_KAP3_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP3_EXIT_Condition;
	information = DIA_Sagitta_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP3_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_OBSESSION(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_OBSESSION_Condition;
	information = DIA_Sagitta_OBSESSION_Info;
	description = "Я ощущаю какую-то сильную внутреннюю тревогу. Мне нужна помощь.";
};


func int DIA_Sagitta_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//Я ощущаю какую-то сильную внутреннюю тревогу. Мне нужна помощь.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//Я вижу, сна тебе недостаточно, чтобы восстановиться. Ты попал под воздействие черного взгляда Ищущих.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//Иди к Пирокару, высшему магу монастыря. Моих скромных знаний здесь недостаточно.
};


instance DIA_Sagitta_Thekla(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Thekla_Condition;
	information = DIA_Sagitta_Thekla_Info;
	description = "Текла послала меня к тебе за травами.";
};


func int DIA_Sagitta_Thekla_Condition()
{
	if((MIS_Thekla_Paket == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Thekla_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//Текла послала меня к тебе за травами.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//Ах, да. Вообще-то я ожидала ее еще несколько дней назад.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//Вот, держи пакет. И поосторожнее с ним!
	CreateInvItems(self,ItMi_TheklasPaket,1);
	B_GiveInvItems(self,other,ItMi_TheklasPaket,1);
	B_GivePlayerXP(XP_AmbientKap3);
};


instance DIA_Sagitta_KAP4_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP4_EXIT_Condition;
	information = DIA_Sagitta_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP4_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HEALRANDOLPH(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_HEALRANDOLPH_Condition;
	information = DIA_Sagitta_HEALRANDOLPH_Info;
	permanent = TRUE;
	description = "У Рэндольфа похмельный синдром.";
};


var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && (Npc_HasItems(other,ItPo_HealRandolph_MIS) == 0) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEALRANDOLPH_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//У Рэндольфа похмельный синдром.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//И когда этот парень образумится?!
	};
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//Я уже давала ему лекарство. Не связывался бы ты с ним.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//Я дам тебе лекарство для него. Оно поставит его на ноги за пару дней.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//Но это обойдется тебе в 300 золотых.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//Что?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//Единственное, что ты можешь получить здесь бесплатно - это смерть, малыш.
		DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"Нет. Столько золота за такую ерунду?!",DIA_Sagitta_HEALRANDOLPH_no);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"Вот твои деньги.",DIA_Sagitta_HEALRANDOLPH_geld);
};

func void DIA_Sagitta_HEALRANDOLPH_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//Вот твои деньги.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//Очень хорошо. Ты всегда можешь потребовать от него компенсировать тебе расходы.
		CreateInvItems(self,ItPo_HealRandolph_MIS,1);
		B_GiveInvItems(self,other,ItPo_HealRandolph_MIS,1);
		DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry(TOPIC_HealRandolph,"Сагитта дала мне лекарство для Рэндольфа.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//Пока у тебя не будет всей суммы, я даже разговаривать об этом не буду.
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//Нет. Столько золота за такую ерунду?!
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//(смеется) Он не дал тебе денег? Это на него похоже!
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};


instance DIA_Sagitta_KAP5_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP5_EXIT_Condition;
	information = DIA_Sagitta_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP5_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};

/*
instance DIA_Sagitta_KAP6_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP6_EXIT_Condition;
	information = DIA_Sagitta_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
*/

instance DIA_Sagitta_PICKPOCKET(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 900;
	condition = DIA_Sagitta_PICKPOCKET_Condition;
	information = DIA_Sagitta_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120_Female;
};


func int DIA_Sagitta_PICKPOCKET_Condition()
{
	return C_Beklauen(103,360);
};

func void DIA_Sagitta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET,Dialog_Back,DIA_Sagitta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sagitta_PICKPOCKET_DoIt);
};

func void DIA_Sagitta_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
};

func void DIA_Sagitta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
};

