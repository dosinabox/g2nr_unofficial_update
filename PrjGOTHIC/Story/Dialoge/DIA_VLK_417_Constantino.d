
instance DIA_Constantino_EXIT(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 999;
	condition = DIA_Constantino_EXIT_Condition;
	information = DIA_Constantino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Constantino_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Constantino_PICKPOCKET(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 900;
	condition = DIA_Constantino_PICKPOCKET_Condition;
	information = DIA_Constantino_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Constantino_PICKPOCKET_Condition()
{
	return C_Beklauen(59,90);
};

func void DIA_Constantino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,Dialog_Back,DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};


instance DIA_Constantino_Hallo(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Hallo_Condition;
	information = DIA_Constantino_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Constantino_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//Что тебе нужно? Я не подаю милостыню.
	B_PlayerEnteredCity();
};


instance DIA_Constantino_AboutLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AboutLehrling_Condition;
	information = DIA_Constantino_AboutLehrling_Info;
	permanent = FALSE;
	description = "Я хочу поступить в ученики.";
};


func int DIA_Constantino_AboutLehrling_Condition()
{
	if(Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//Я хочу поступить в ученики.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Правда? И чьим учеником ты хочешь стать?
};


instance DIA_Constantino_Heilung(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Constantino_Heilung_Condition;
	information = DIA_Constantino_Heilung_Info;
	permanent = FALSE;
	description = "Мне нужно лечение.";
};


func int DIA_Constantino_Heilung_Condition()
{
	return TRUE;
};

func void DIA_Constantino_Heilung_Info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//Мне нужно лечение.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//(коротко) Зачем, ты ранен?
	Info_ClearChoices(DIA_Constantino_Heilung);
	Info_AddChoice(DIA_Constantino_Heilung,"В общем-то, нет.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice(DIA_Constantino_Heilung,"Да.",DIA_Constantino_Heilung_Ja);
};

func void DIA_Constantino_Heilung_Ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Да.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//Тогда иди к Ватрасу, он подлечит тебя. И перестань капать кровью на мой пол!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//У тебя всего лишь пустяковая царапина, а у меня есть дела поважнее, чем болтать с тобой.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Constantino_Heilung_Nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//В общем-то, нет.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//Тогда проваливай, а то тебе действительно понадобится медицинская помощь.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Constantino_LestersKraeuter(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Addon_Constantino_LestersKraeuter_Condition;
	information = DIA_Addon_Constantino_LestersKraeuter_Info;
	description = "Ты покупаешь травы?";
};


func int DIA_Addon_Constantino_LestersKraeuter_Condition()
{
	if((MIS_Constantino_BringHerbs == FALSE) && (MIS_Addon_Lester_PickForConstantino != FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info()
{
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//Ты покупаешь травы?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//Ну, если тебе есть, что предложить...
	B_GivePlayerXP(XP_Ambient);
};


var int Constantino_ItemsGiven_LittleMana;

instance DIA_Constantino_Trade(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 700;
	condition = DIA_Constantino_Trade_Condition;
	information = DIA_Constantino_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Constantino_Trade_Condition()
{
	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Trade_Info()
{
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Покажи мне свои товары.
	if(Constantino_flag == TRUE)
	{
		B_ClearAlchemyInv(self);
		if(Constantino_flasks > 0)
		{
			CreateInvItems(self,ItMi_Flask,Constantino_flasks);
		};
		Constantino_flag = FALSE;
	};
	if((Player_IsApprentice == APP_Constantino) && ((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF)) && (Constantino_ItemsGiven_LittleMana == FALSE))
	{
		CreateInvItems(self,ItPo_Perm_LittleMana,1);
		Constantino_ItemsGiven_LittleMana = TRUE;
	};
	if(Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Константино продает алхимические товары.");
		Constantino_Logpatch1 = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Constantino_NoTrade(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 700;
	condition = DIA_Constantino_NoTrade_Condition;
	information = DIA_Constantino_NoTrade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Constantino_NoTrade_Condition()
{
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_NoTrade_Info()
{
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(сердито) Ни за что! До меня дошли слухи, что ты обвиняешься в преступлении здесь, в Хоринисе!
	AI_StopProcessInfos(self);
};


instance DIA_Constantino_BeiDir(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BeiDir_Condition;
	information = DIA_Constantino_BeiDir_Info;
	permanent = FALSE;
	description = "Я хочу стать твоим учеником.";
};


func int DIA_Constantino_BeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BeiDir_Info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//Я хочу стать твоим учеником.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//МОИМ? Нет! Я уже как-то имел сомнительное удовольствие взять ученика. С меня достаточно.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//Я потратил несколько лет на его обучение, а потом этот идиот взял и отравился.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//Иди лучше попросись в ученики к другому мастеру!
};


instance DIA_Constantino_ZUSTIMMUNG(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_ZUSTIMMUNG_Condition;
	information = DIA_Constantino_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Я хочу стать учеником одного из других мастеров.";
};


func int DIA_Constantino_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//Я хочу стать учеником одного из других мастеров.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//Ты пришел получить мое одобрение?
	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Хм, что касается моего мнения, ты можешь стать учеником любого мастера.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//Ты его не получишь! То, что я слышал о тебе, говорит не в твою пользу.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//Я не проголосую за то, чтобы преступник вроде тебя занял уважаемое положение в этом городе.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Пока ты не уладишь этот вопрос с командующим городской стражей, мой ответ будет - нет!
	};
	if(Constantino_Logpatch2 == FALSE)
	{
		Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
		B_LogEntry(TOPIC_Lehrling,"Константино даст мне свое одобрение, если я не обвиняюсь ни в одном преступлении в городе.");
		Constantino_Logpatch2 = TRUE;
	};
};


instance DIA_Constantino_BringHerbs(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent = FALSE;
	description = "Что мне нужно сделать, чтобы стать ТВОИМ учеником?";
};


func int DIA_Constantino_BringHerbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_BeiDir) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BringHerbs_Info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//Что мне нужно сделать, чтобы стать ТВОИМ учеником?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(вздыхает) Я не вынесу, если ЕЩЕ ОДИН дилетант окажется на моей совести.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//В алхимии используется множество трав. В различных комбинациях они дают самые различные эффекты.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//Вероятно, о половине этих трав ты даже не слышал.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//(вздыхает) Вот - это список самых важных растений.
	B_GiveInvItems(self,other,ItWr_Kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//Принеси мне одно растение каждого вида, и, возможно, я переменю свое мнение насчет ученика.
	MIS_Constantino_BringHerbs = LOG_Running;
	Log_CreateTopic(TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ConstantinoPlants,LOG_Running);
	B_LogEntry(TOPIC_ConstantinoPlants,"Константино хочет получить по одному экземпляру каждого растения, иначе он не примет меня в ученики.");
};


instance DIA_Constantino_HerbsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_HerbsRunning_Condition;
	information = DIA_Constantino_HerbsRunning_Info;
	permanent = TRUE;
	description = "Насчет растений...";
};


func int DIA_Constantino_HerbsRunning_Condition()
{
	if(MIS_Constantino_BringHerbs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_HerbsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Насчет растений...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Если ты не можешь выполнить это задание самостоятельно, из тебя не получится хорошего алхимика!
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
	Info_AddChoice(DIA_Constantino_HerbsRunning,"Понимаю.",DIA_Constantino_HerbsRunning_Running);
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) && Npc_HasItems(other,ItPl_Mana_Herb_02) && Npc_HasItems(other,ItPl_Mana_Herb_03) && Npc_HasItems(other,ItPl_Health_Herb_01) && Npc_HasItems(other,ItPl_Health_Herb_02) && Npc_HasItems(other,ItPl_Health_Herb_03) && Npc_HasItems(other,ItPl_Dex_Herb_01) && Npc_HasItems(other,ItPl_Strength_Herb_01) && Npc_HasItems(other,ItPl_Speed_Herb_01) && Npc_HasItems(other,ItPl_Temp_Herb) && Npc_HasItems(other,ItPl_Perm_Herb))
	{
		Info_AddChoice(DIA_Constantino_HerbsRunning,"Я принес все растения, что ты просил!",DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//Я принес все растения, что ты просил!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//Что? Ты пытаешься обмануть меня, да?
	AI_PrintScreen("11 растений отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Dex_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Strength_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	CreateInvItems(self,ItPl_Mana_Herb_01,1);
	CreateInvItems(self,ItPl_Mana_Herb_02,1);
	CreateInvItems(self,ItPl_Mana_Herb_03,1);
	CreateInvItems(self,ItPl_Health_Herb_01,1);
	CreateInvItems(self,ItPl_Health_Herb_02,1);
	CreateInvItems(self,ItPl_Health_Herb_03,1);
	CreateInvItems(self,ItPl_Dex_Herb_01,1);
	CreateInvItems(self,ItPl_Strength_Herb_01,1);
	CreateInvItems(self,ItPl_Speed_Herb_01,1);
	CreateInvItems(self,ItPl_Temp_Herb,1);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//Клянусь Аданосом! Они все здесь, у меня перед глазами!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Кто знает, может, когда-нибудь из тебя действительно получится приличный алхимик.
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Constantino_Herbs);
	B_CheckLog();
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Константино примет меня в ученики, если другие мастера будут не против.");
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//Понимаю.
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};


var int Constantino_StartGuild;

instance DIA_Constantino_LEHRLING(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LEHRLING_Condition;
	information = DIA_Constantino_LEHRLING_Info;
	permanent = TRUE;
	description = "Могу я теперь стать твоим учеником?";
};


func int DIA_Constantino_LEHRLING_Condition()
{
	if((MIS_Constantino_BringHerbs == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Могу я теперь стать твоим учеником?
	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//Что касается моего мнения - да.
		stimmen += 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//Гараду важно только, чтобы ты был способен защищать город в случае нападения орков.
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//И, похоже, ты смог убедить его в этом.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//Но он считает, что ты трус.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//Но Гарад утверждает, что никогда тебя не видел.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Боспер очень неохотно отзывался о твоих способностях.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//Я полагаю, что он хотел бы взять тебя в ученики сам.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//Но все же, в конце концов, он согласился.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//Отказывать кому-либо в одобрении по этой причине, определенно, недостойно настоящего мастера!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//Но если все другие мастера согласятся, тебе не понадобится его голос.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//И Боспер пока тебя не видел.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Торбен - очень религиозный человек.
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//Он дал тебе свое благословение. Это хороший знак.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//Он даст свое одобрение только с благословения богов.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Торбен не знает, кто ты такой.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//Что касается Маттео - он расхваливает тебя на каждом углу.
				stimmen += 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Маттео говорит, что ты что-то должен ему. Если ты хочешь получить его голос, тебе лучше решить с ним эту мелкую проблему.
			}
			else if(MIS_Matteo_Gold == LOG_FAILED)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Маттео говорит, что никогда не видел тебя в своей лавке.
			}
			else
			{
//				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Маттео говорит, что еще не разговаривал с тобой по этому поводу.
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Маттео говорит, что ты понятия не имеешь, с кем имеешь дело.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Маттео говорит, что никогда не видел тебя в своей лавке.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//Теперь у тебя есть одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Ты готов приступить к обучению у меня?
			Info_ClearChoices(DIA_Constantino_LEHRLING);
			Info_AddChoice(DIA_Constantino_LEHRLING,"Мне нужно сначала подумать.",DIA_Constantino_LEHRLING_Later);
			Info_AddChoice(DIA_Constantino_LEHRLING,"Да, мастер.",DIA_Constantino_LEHRLING_Yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//Чтобы стать учеником в нижней части города, тебе нужно получить одобрение, по крайней мере, четырех мастеров.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//Это означает, что ты должен поговорить со всеми, кто еще не отдал за тебя свой голос.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(сердито) Ни за что! До меня дошли слухи, что ты обвиняешься в преступлении здесь, в Хоринисе!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//Я не возьму тебя в ученики, пока ты не уладишь этот вопрос с командующим городской стражи.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Да, мастер.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//(вздыхает) Хорошо! Надеюсь, я не пожалею об этом решении.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//С этого момента, ты можешь считать себя моим учеником.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine(Lothar,"START");
	Constantino_StartGuild = other.guild;
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(Topic_Bonus,"Константино принял меня в ученики. Теперь я смогу попасть в верхний квартал.");
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//Мне нужно сначала подумать.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//Хорошо! Если ты не сможешь отдать этому делу свое сердце, тебе лучше выбрать другую профессию.
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};


var int Constantino_MILKommentar;
var int Constantino_INNOSKommentar;

instance DIA_Constantino_AlsLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AlsLehrling_Condition;
	information = DIA_Constantino_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Constantino_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Constantino) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Constantino_AlsLehrling_Info()
{
	if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(сердито) Я отказываюсь обучать тебя, пока ты обвиняешься в преступлении в городе.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//Иди к лорду Андрэ и уладь этот вопрос с ним.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (Constantino_StartGuild != GIL_MIL) && (Constantino_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//Так ты поступил в ополчение? Я уже слышал об этом.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Ты так торопился стать учеником, а затем вот так просто взял и поступил в ополчение? Но я не стану делать тебе скидку на это.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//Я ожидаю, что ты будешь строго придерживаться нашего соглашения, и будешь регулярно приносить мне растения и грибы.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//Если это слишком тяжело для тебя - работать на двух работах одновременно, тебе просто придется меньше спать!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (Constantino_StartGuild != GIL_NOV) && (Constantino_StartGuild != GIL_KDF) && (Constantino_StartGuild != GIL_PAL) && (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//Я вижу, ты поступил в услужение к Инносу. Я полагаю, это значит, что с этого времени ты не сможешь уделять много внимания сбору трав для старика.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Но все же, я сочту за большую честь поддерживать тебя на твоем пути.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//И если, несмотря на твои новые обязанности, ты найдешь время заниматься алхимией, ты всегда можешь рассчитывать на теплый прием здесь.
		Constantino_INNOSKommentar = TRUE;
	}
	else if((Constantino_Lehrling_Day <= (Wld_GetDay() - 4)) && (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//Где ты пропадал?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//Я ожидаю от моего ученика большего усердия. Это никуда не годится, что ты появляешься здесь раз в месяц!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//Ты хотя бы принес мне грибы?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//Опять ты...
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Constantino_Aufgaben(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Aufgaben_Condition;
	information = DIA_Constantino_Aufgaben_Info;
	permanent = FALSE;
	description = "Каковы мои задачи?";
};


func int DIA_Constantino_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//Каковы мои задачи?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//Я понимаю, что не могу ожидать от молодого человека, что он будет проводить дни напролет вместе со мной в этой каморке.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//Время от времени ты должен приносить растения, которые мне необходимы. Взамен, я буду обучать тебя искусству алхимии.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//Ты можешь покупать у меня пробирки. Но большинство ингредиентов, впрочем, тебе придется добывать самому.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//И я ожидаю, что ты будешь вести себя как добропорядочный гражданин этого города.
};


instance DIA_Constantino_Mushrooms(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Mushrooms_Condition;
	information = DIA_Constantino_Mushrooms_Info;
	permanent = FALSE;
	description = "Какие растения я должен приносить?";
};


func int DIA_Constantino_Mushrooms_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_Aufgaben))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Mushrooms_Info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//Какие растения я должен приносить?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//Я буду покупать все, что ты принесешь мне - и буду платить за травы обычную цену.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//Но что касается грибов, для них у меня особая цена.
	MIS_Constantino_Mushrooms = LOG_Running;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Я могу продавать грибы Константино по очень хорошей цене.");
};


instance DIA_Constantino_MushroomsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_MushroomsRunning_Condition;
	information = DIA_Constantino_MushroomsRunning_Info;
	permanent = TRUE;
	description = "Тебе нужны были грибы...";
};


func int DIA_Constantino_MushroomsRunning_Condition()
{
	if(MIS_Constantino_Mushrooms == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//Тебе нужны были грибы...
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я собираюсь принести тебе их...",DIA_Constantino_MushroomsRunning_Later);
	if(Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Почему эти грибы так важны?",DIA_Constantino_MushroomsRunning_Why);
	};
	if(Npc_HasItems(other,ItPl_Mushroom_01) || Npc_HasItems(other,ItPl_Mushroom_02))
	{
//		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Я принес несколько грибов...",DIA_Constantino_MushroomsRunning_Sell);
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Посмотри, что у меня есть...",DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei;
	Dunkelpilz_dabei = FALSE;
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Посмотри, что у меня есть...
	if(Npc_HasItems(other,ItPl_Mushroom_01))
	{
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//Я принес несколько черных грибов.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//Ах! Это лучшие грибы! Отлично! Вот твое золото!
		Dunkelpilz_dabei = TRUE;
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01);
		B_GiveInvItems(other,self,ItPl_Mushroom_01,Npc_HasItems(other,ItPl_Mushroom_01));
	};
	if(Npc_HasItems(other,ItPl_Mushroom_02))
	{
		if(Dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//А вот еще другие...
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//У меня здесь несколько грибов!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//Эти не так хороши, как черные грибы, но я все равно возьму их.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02);
		B_GiveInvItems(other,self,ItPl_Mushroom_02,Npc_HasItems(other,ItPl_Mushroom_02));
	};
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Почему эти грибы так важны?
	if(Constantino_DunkelpilzCounter == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//Даже несмотря на то, что ты мой ученик, я не могу сказать тебе все.
	}
	else if(Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//Хорошо - я все же скажу тебе. Но ты должен сохранить это в тайне.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Черные грибы полны магической энергии. И каждый раз, когда ты съедаешь такой гриб, немного этой энергии аккумулируется твоим телом.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//А когда ты съешь достаточное количество этих грибов, твоя магическая энергия возрастет...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//Если бы я сказал тебе это ранее, ты бы слопал все эти грибы сам, разве нет?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//(вздыхает) Ох!
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//Ты уже спрашивал меня об этом. (озорно) Кто знает, может быть однажды я действительно скажу тебе...
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//Я собираюсь принести тебе их...
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//Отлично! Принеси мне все, что только найдешь...
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};


func void B_Constantino_TeachAlchemy()
{
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Константино может обучить меня искусству алхимии.");
};

instance DIA_Constantino_Alchemy(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Alchemy_Condition;
	information = DIA_Constantino_Alchemy_Info;
	permanent = TRUE;
	description = "Обучи меня искусству алхимии!";
};


func int DIA_Constantino_Alchemy_Condition()
{
	if((Player_IsApprentice == APP_Constantino) && (Constantino_TeachAlchemy == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Alchemy_Info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//Обучи меня искусству алхимии!
	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Хорошо. Сначала основы.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Все зелья делаются из растений - они обладают различной силой.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Но растения пускают всю свою силу в рост - а алхимия занимается изменением этой силы и направлением ее в нужное русло.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Ты должен знать правильную формулу и иметь соответствующие ингредиенты.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Я могу научить тебя многим таким формулам.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Готовить зелья, восстанавливающие твою потерянную силу, и даже зелья, которые воздействуют на твою силу перманентно.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Но нельзя выучить все сразу.
		B_Constantino_TeachAlchemy();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(сердито) Я отказываюсь обучать тебя, пока ты обвиняешься в преступлении в городе.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Constantino_NewRecipes(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent = TRUE;
	description = "Я хочу узнать новые рецепты зелий.";
};


func int DIA_Constantino_NewRecipes_Condition()
{
	if((Player_IsApprentice != APP_Constantino) && (Constantino_TeachAlchemy == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NewRecipes_Info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//Я хочу узнать новые рецепты зелий.
	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		if(Player_IsApprentice > APP_NONE)
		{
			AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//У тебя есть какой-нибудь опыт в алхимии?
			if(Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY))
			{
				AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Да, есть.
				AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//И ты все еще жив... это неплохой знак.
				AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//Я думаю, что могу показать тебе несколько рецептов. Но это зависит, конечно же, от того, что ты хочешь узнать.
				B_Constantino_TeachAlchemy();
			}
			else
			{
				AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Нет. Еще нет...
				AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(вздыхает) Я не вынесу, если ЕЩЕ ОДИН дилетант окажется на моей совести.
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Lothar_Add_01_15");	//Тебе придется стать учеником одного из мастеров в нижней части города.
			AI_StopProcessInfos(self);
			/*AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Мы можем как-нибудь договориться?
			B_Say_Gold(self,other,300);
			Info_ClearChoices(DIA_Constantino_NewRecipes);
			if(Npc_HasItems(other,ItMi_Gold) >= 300)
			{
				Info_AddChoice(DIA_Constantino_NewRecipes,"Вот, держи...",DIA_Constantino_NewRecipes_Ok);
			};
			Info_AddChoice(DIA_Constantino_NewRecipes,"Это слишком дорого для меня.",DIA_Constantino_NewRecipes_No);*/
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(сердито) Я отказываюсь обучать тебя, пока ты обвиняешься в преступлении в городе.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Constantino_TEACH(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_TEACH_Condition;
	information = DIA_Constantino_TEACH_Info;
	permanent = TRUE;
	description = "Каким рецептам ты можешь обучить меня?";
};


func int DIA_Constantino_TEACH_Condition()
{
	if(Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_TEACH_Info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//Каким рецептам ты можешь обучить меня?
	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE))
		{
			AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//Извини. Я больше ничему не могу научить тебя.
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//Есть несколько - выбирай.
			Info_ClearChoices(DIA_Constantino_TEACH);
			Info_AddChoice(DIA_Constantino_TEACH,Dialog_Back,DIA_Constantino_Teach_BACK);
			if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
			{
				Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Constantino_TEACH_Health01);
			};
			if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE))
			{
				Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Constantino_TEACH_Health02);
			};
			if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE))
			{
				Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString(NAME_HP_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Constantino_TEACH_Health03);
			};
			if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
			{
				Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString(NAME_HPMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Constantino_TEACH_PermHealth);
			};
			if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
			{
				Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Constantino_TEACH_Mana01);
			};
			if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
			{
				Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Constantino_TEACH_Mana02);
			};
			if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
			{
				Info_AddChoice(DIA_Constantino_TEACH,B_BuildLearnString(NAME_STR_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Constantino_TEACH_PermSTR);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(сердито) Ни за что! До меня дошли слухи, что ты обвиняешься в преступлении здесь, в Хоринисе!
		AI_StopProcessInfos(self);
	};	
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//Ингредиенты для лечебной эссенции - лечебные травы и луговой горец.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//Чтобы приготовить лечебный экстракт, тебе понадобятся лечебные растения и луговой горец.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//Кипятить этот экстракт нужно очень осторожно.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health03()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//Для создания лечебного эликсира требуется чуть больше опыта.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//Тебе понадобятся лечебные корни и луговой горец. При кипячении этого зелья нужно быть особенно внимательным.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermHealth()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//Эликсир жизни! Редкое варево. Но не из-за сложности приготовления - это зелье не так уж сложно сделать.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//Но в нем используются редкие ингредиенты. Тебе понадобятся лечебные корни и царский щавель.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//Эссенция маны - самое простое из магических зелий.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//Возьми огненную крапиву и луговой горец и вскипяти их на медленном огне.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Так как ты уже умеешь готовить эссенцию маны, если немного потренируешься, то сможешь готовить также и экстракт.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//Единственно, нужно уделить особое внимание процессу выпаривания этого зелья. В качестве ингредиентов для него используются огненная трава и луговой горец.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermSTR()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//Эликсир силы! Превосходное зелье. Для него тебе понадобятся редкий драконий корень и царский щавель.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//При кипячении этого зелья следи, чтобы пузырьки не стали слишком большими, иначе тебя будет ждать неприятный сюрприз!
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

