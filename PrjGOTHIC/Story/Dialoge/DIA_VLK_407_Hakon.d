
instance DIA_Hakon_EXIT(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 999;
	condition = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hakon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Sperre(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Sperre_Condition;
	information = DIA_Hakon_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hakon_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Sperre_Info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Проваливай, каторжник! Кантар рассказал мне, какой ты грязный ублюдок!
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Hallo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Hallo_Condition;
	information = DIA_Hakon_Hallo_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Hakon_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//Я Хакон, торговец оружием.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//В наши дни каждый должен носить оружие. Особенно, когда выходишь за городские стены.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Хакон торгует оружием на рыночной площади.");
};


instance DIA_Hakon_Trade(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 99;
	condition = DIA_Hakon_Trade_Condition;
	information = DIA_Hakon_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Hakon_Trade_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Покажи мне свои товары.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//Для меня большая честь, что представитель святой церкви проявил интерес к моим товарам.
	};
};


instance DIA_Addon_Hakon_MissingPeople(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Addon_Hakon_MissingPeople_Condition;
	information = DIA_Addon_Hakon_MissingPeople_Info;
	description = "Что ты знаешь об исчезновениях людей?";
};


func int DIA_Addon_Hakon_MissingPeople_Condition()
{
	if(SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Hakon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//Что ты знаешь об исчезновениях людей?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//Я вижу множество людей, проходящих через восточные ворота.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//Некоторых из приходящих в город я раньше никогда не видел, а некоторые из уходящих больше не возвращаются.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//Но недавно случилось нечто действительно странное.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//В город пришел один человек... Вроде бы его звали Джо. Он что-то болтал о том, что скоро он разбогатеет.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//Он утверждал, что нашел способ пробраться в одну из городских башен, где хранится оружие ополчения.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//С тех пор я его не видел. Хотя раньше я встречался с ним каждый день.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//Я рассказал об этом ополчению.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//Но лорд Андре сказал, что не понимает, о чем я говорю. Он даже не знал, что это за парень.
	Log_CreateTopic(TOPIC_Addon_Joe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe,LOG_Running);
	B_LogEntry(TOPIC_Addon_Joe,"Хакон, торговец из Хориниса, говорит, что человек по имени Джо бесследно исчез. Хакон утверждает, что Джо знает, как проникнуть в одну из башен города, где ополчение хранит оружие.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_OutOfTown(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_OutOfTown_Condition;
	information = DIA_Hakon_OutOfTown_Info;
	permanent = FALSE;
	description = "Расскажи мне подробнее о местности вокруг города.";
};


func int DIA_Hakon_OutOfTown_Condition()
{
	return TRUE;
};

func void DIA_Hakon_OutOfTown_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//Расскажи мне подробнее о местности вокруг города.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//Сейчас там стало очень опасно
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Из-за бандитов, с одной стороны, и из-за нашествия диких зверей с другой.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Даже зверям, похоже, нечего есть в эти смутные времена.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//Они стали подходить совсем близко к городу, чего раньше не было.
};


instance DIA_Hakon_Paladine(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Paladine_Condition;
	information = DIA_Hakon_Paladine_Info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о паладинах?";
};


func int DIA_Hakon_Paladine_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Paladine_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//Ты знаешь что-нибудь о паладинах?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Да! Они разорили меня!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//Теперь все, что можно купить в этом городе - это короткий меч, и то в лучшем случае.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//Они забрали себе все, что длиннее фута с половиной.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(с сарказмом) А взамен, теперь я могу бесплатно жить в отеле - ха!
};


instance DIA_Hakon_WoWaffen(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_WoWaffen_Condition;
	information = DIA_Hakon_WoWaffen_Info;
	permanent = FALSE;
	description = "Где ты берешь оружие?";
};


func int DIA_Hakon_WoWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Hakon_WoWaffen_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Где ты берешь оружие?
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Нигде! Раньше моим поставщиком был Гарад.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//Раньше моим поставщиком был кузнец Гарад.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//А теперь все, что он делает, забирают паладины.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//Он работает на этих парней днем и ночью как безумный, без какой-либо оплаты. Он думает, что это его долг.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//Все, что я могу предложить тебе сейчас - это остатки ...
};


instance DIA_Hakon_HaradBandits(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_HaradBandits_Condition;
	information = DIA_Hakon_HaradBandits_Info;
	permanent = FALSE;
	description = "Гарад рассказал мне о нападении бандитов ...";
};


func int DIA_Hakon_HaradBandits_Condition()
{
	if(Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hakon_HaradBandits_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Гарад рассказал мне о нападении бандитов ...
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Ох? И?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//Он проголосует за меня при поступлении в ученики, если я уничтожу этих бандитов.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(смеется) Старый добрый Гарад. Возможно, он так хочет сказать мне 'извини', за то, что не может сейчас делать оружие для меня.
};


instance DIA_Hakon_Banditen(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Banditen_Condition;
	information = DIA_Hakon_Banditen_Info;
	permanent = FALSE;
	description = "Что ты знаешь об этих бандитах?";
};


func int DIA_Hakon_Banditen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hakon_HaradBandits) || Npc_KnowsInfo(hero,DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Banditen_Info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//Что ты знаешь об этих бандитах?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//Что я знаю о них? Они ограбили меня на пути в город!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//И не только меня. Они давно уже здесь разбойничают.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//Ополчение пыталось выследить их, но безуспешно.
	MIS_HakonBandits = LOG_Running;
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HakonBanditen,LOG_Running);
	B_LogEntry(TOPIC_HakonBanditen,"Хакон, торговец оружием, был ограблен бандитами неподалеку от города.");
};


instance DIA_Hakon_Wieviel(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Wieviel_Condition;
	information = DIA_Hakon_Wieviel_Info;
	permanent = FALSE;
	description = "Я разберусь с этим ...";
};


func int DIA_Hakon_Wieviel_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wieviel_Info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//Я разберусь с этим ...
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//Что, ТЫ хочешь расправиться с бандитами? В одиночку? Ты, наверное хороший боец?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//Сколько ты готов дать за это?
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//(лукаво) Ты ведь хочешь быть на хорошем счету у Гарада, да?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//Я не думаю, что должен платить тебе за это ...
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//Но это опасное дело.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//Ладно, мне это тоже нужно. Я заплачу тебе 100 золотых, если ты уничтожишь этих бандитов.
		MIS_HakonBanditsPay = TRUE;
	};
	Info_ClearChoices(DIA_Hakon_Banditen);
};


instance DIA_Hakon_Miliz(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_Miliz_Condition;
	information = DIA_Hakon_Miliz_Info;
	permanent = FALSE;
	description = "Ты не знаешь, кто в ополчении занимался их поиском?";
};


func int DIA_Hakon_Miliz_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Miliz_Info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Ты не знаешь, кто в ополчении занимался их поиском?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//Парень по имени Пабло. Он, и еще несколько парней ходили на поиски этих бандитов. Но они не нашли их.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//Ты знаешь, где мне найти Пабло?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//Он патрулирует город. Ты найдешь его либо на рыночной пощади, либо в нижней части города.
	B_LogEntry(TOPIC_HakonBanditen,"Пабло, городской стражник, занимался бесплодными поисками бандитов.");
};


instance DIA_Hakon_Wo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Wo_Condition;
	information = DIA_Hakon_Wo_Info;
	permanent = FALSE;
	description = "Где они напали на тебя?";
};


func int DIA_Hakon_Wo_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wo_Info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Где они напали на тебя?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//Около фермы Акила. Выйдешь из вот этих городских ворот и иди по дороге направо.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//Вскоре ты увидишь каменную лестницу. Эти ублюдки пришли оттуда. Ручаюсь, у них там логово где-то в лесу.
};


instance DIA_Hakon_Success(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Success_Condition;
	information = DIA_Hakon_Success_Info;
	permanent = FALSE;
	description = "Я расправился с бандитами.";
};


func int DIA_Hakon_Success_Condition()
{
	if((MIS_HakonBandits == LOG_Running) && Npc_IsDead(Bandit_1) && Npc_IsDead(Bandit_2) && Npc_IsDead(Bandit_3))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Success_Info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//Я расправился с бандитами.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Правда? Кто-нибудь может подтвердить это. У тебя есть доказательства?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(вздыхает) Мне что, вернуться назад и отрезать им головы?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(поспешно) Нет - я не думаю, что это необходимо. Я верю тебе.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//Ты оказал очень большую услугу всем торговцам в городе.
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//Гарад будет доволен - я надеюсь.
	};
	if(MIS_HakonBanditsPay == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//Вот деньги, как я и обещал.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Hakon_Bandits);
};


instance DIA_Hakon_Minenanteil(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Minenanteil_Condition;
	information = DIA_Hakon_Minenanteil_Info;
	permanent = FALSE;
	description = "Где ты взял эти акции, что ты продаешь здесь?";
};


func int DIA_Hakon_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Где ты взял эти акции, что ты продаешь здесь?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Извини, но я не могу сказать тебе этого. Это слишком опасно для меня.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_PICKPOCKET(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 900;
	condition = DIA_Hakon_PICKPOCKET_Condition;
	information = DIA_Hakon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Hakon_PICKPOCKET_Condition()
{
	return C_Beklauen(45,65);
};

func void DIA_Hakon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,Dialog_Back,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};

func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};


instance DIA_Hakon_Kapitel2(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Kapitel2_Condition;
	information = DIA_Hakon_Kapitel2_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hakon_Kapitel2_Condition()
{
	if((Kapitel >= 2) && (Canthar_Sperre == FALSE) && (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Kapitel2_Info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//Опять ты!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Гарад, наконец, закончил эту свою чертову работу для паладинов.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//Это означает, что я теперь могу предложить новое оружие. Тебе это интересно?
};

