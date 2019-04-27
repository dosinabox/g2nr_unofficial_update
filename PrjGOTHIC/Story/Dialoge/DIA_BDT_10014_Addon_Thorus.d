
instance DIA_Addon_BDT_10014_Thorus_EXIT(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 999;
	condition = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Thorus_EXIT_Info()
{
	EnteredBanditsCamp = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10014_Thorus_Hi(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 2;
	condition = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Hi_Condition()
{
	if(RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//Ты знаешь правила. Никто не может попасть в шахту, если у него нет красной каменной плитки.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Дело не в шахте - мне нужно увидеть Ворона.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//Это ничего не меняет. Правила есть правила, они относятся ко всем. И даже к тебе.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//Возвращайся. Если ты попытаешься пробраться на верхний этаж без разрешения, стража убьет тебя. Таковы правила.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//Если тебе это не нравится, можешь поговорить с Эстебаном. Он ответственный за лагерь.
	};
	EnteredBanditsCamp = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BDT_10014_Thorus_Raven(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 3;
	condition = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent = FALSE;
	description = "Это очень важно, мне нужно попасть к Ворону...";
};


func int DIA_Addon_Thorus_Raven_Condition()
{
	if(RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//Это очень важно, мне нужно попасть к Ворону...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//Правда? Ты действительно думаешь, что сможешь пройти к нему?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//Его охранники твердо выполняют приказ не пускать НИКОГО. Ты умрешь даже раньше, чем сможешь его увидеть.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//Так что лучше выкинь эту идею из своей головы.
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Ворон - предводитель бандитов. Чтобы добраться до него, мне придется убить тех, кто встанет у меня на пути.");
};


instance DIA_Addon_BDT_10014_Thorus_Zeit(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent = FALSE;
	description = "Ты не помнишь меня? Я из Старого Лагеря...";
};


func int DIA_Addon_Thorus_Zeit_Condition()
{
	if((RavenIsDead == FALSE) && (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Zeit_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Ты не помнишь меня? Я из Старого Лагеря...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//Ты был одним из заключенных?! Возможно, ты был одним из моих стражников. И... это делает нас теперь друзьями?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//Нет, не делает.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Может быть, ты тот, кто уничтожил Барьер, а может - тот, кто убил моих приятелей.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//И что?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Эти времена прошли.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//Ты хочешь войти? Тогда достань себе красный камень и больше не трать мое время.
	};
};


var int Thorus_GoodOldPerm;

instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 4;
	condition = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent = TRUE;
	description = "Ну ладно тебе, впусти меня. Во имя старых добрых времен.";
};


func int DIA_Addon_Thorus_GoodOldPerm_Condition()
{
	if((MIS_Send_Buddler != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_BDT_10014_Thorus_Zeit) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_GoodOldPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//Ну ладно тебе, впусти меня. Во имя старых добрых времен.
	if(Thorus_GoodOldPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Давай я объясню тебе кое-что. Ты знаешь, почему я до сих пор жив?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Потому что я всегда был верен своим людям.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//Я согласен не со всем, что делает Ворон. Но я всегда выполняю правила.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//И ты тоже будешь это делать!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(твердо) Нет!
	};
};

func int C_PlayerHasWrongToken()
{
	if(C_ScHasMagicStonePlate() || Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) || Npc_HasItems(hero,ItMi_Addon_Stone_02) || Npc_HasItems(hero,ItMi_Addon_Stone_03) || Npc_HasItems(hero,ItMi_Addon_Stone_04) || Npc_HasItems(hero,ItMi_Addon_Stone_05))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};


instance DIA_Addon_BDT_10014_Thorus_Stein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent = TRUE;
	description = "Вот, у меня есть каменная плитка...";
};


func int DIA_Addon_Thorus_Stein_Condition()
{
	if(C_PlayerHasWrongToken() && (RavenIsDead == FALSE) && (MIS_Send_Buddler != LOG_Running) && (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Stein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//Вот, у меня есть каменная плитка...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//Это неправильный камень. Только красные камни являются пропуском.
};


instance DIA_Addon_BDT_10014_Thorus_Rein(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent = FALSE;
	description = "Вот, у меня есть красная каменная табличка...";
};


func int DIA_Addon_Thorus_Rein_Condition()
{
	if((MIS_Send_Buddler != LOG_SUCCESS) && Npc_HasItems(other,ItMi_Addon_Stone_01) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Rein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//Вот, у меня есть красная каменная табличка...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Хорошо.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//Ты убил Эстебана - так что ТЫ теперь будешь делать его работу.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//У них возникли проблемы с краулерами в шахте.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//Три работника уже погибли. Твоя задача - найти им замену.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//И когда я, наконец, смогу попасть в эту чертову шахту?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Делай свою работу - а после можешь заниматься, чем хочешь.
	MIS_Send_Buddler = LOG_Running;
	Log_CreateTopic(Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Buddler,LOG_Running);
	B_LogEntry(Topic_Addon_Buddler,"Я занял место Эстебана, и теперь мне нужно послать в шахту трех шахтеров.");
};


instance DIA_Addon_BDT_10014_Thorus_Sent(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 9;
	condition = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent = FALSE;
	description = "Я послал трех новых ребят.";
};


func int DIA_Addon_Thorus_Sent_Condition()
{
	if((Player_SentBuddler >= 3) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Sent_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//Я послал трех новых ребят.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//Хорошо. Тогда у меня нет повода тебя не пускать.
	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_BDT_10014_Thorus_Armor(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent = FALSE;
	description = "Эй, а что на тебе за доспехи? Где я могу достать такие же?";
};


func int DIA_Addon_Thorus_Armor_Condition()
{
	if(RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Armor_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Эй, а что на тебе за доспехи? Где я могу достать такие же?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//Нигде. Эти доспехи сделаны специально для охранника Ворона.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//Полагаю, что нет никакого вступительного экзамена для новых людей. Но окончательное решение принимаю не я, а Ворон.
};


instance DIA_Addon_Thorus_Gefangene(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 88;
	condition = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent = FALSE;
	description = "Как там заключенные?";
};


func int DIA_Addon_Thorus_Gefangene_Condition()
{
	if(!Npc_IsDead(Bloodwyn) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Gefangene_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//Как там заключенные?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Хм-м, они сделали свою работу. Насколько мне известно, они должны сейчас искать золото.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//А что, если они убегут?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//... Бладвин пошлет стражников за ними. Но я сильно сомневаюсь, что они настолько глупы, чтобы бежать.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Если только...
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Если только - что?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//... кто-нибудь не подобьет их на это. Но я не знаю никого, кто был бы достаточно глуп для этого... по крайней мере, пока Бладвин здесь.
	B_Say(other,self,"$VERSTEHE");
};


instance DIA_Addon_Thorus_Attack(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Attack_Condition;
	information = DIA_Addon_Thorus_Attack_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Attack_Condition()
{
	if((Npc_IsDead(Torwache2)) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Attack_Info()
{
	if(MIS_Send_Buddler != LOG_SUCCESS)
	{
		MIS_Send_Buddler = LOG_OBSOLETE;
	};
	B_CheckLog();
	EnteredBanditsCamp = TRUE;
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0); 
};


instance DIA_Addon_Thorus_Speech(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Thorus_Speech_Condition()
{
	if(Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Speech_Info()
{
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//Что ты затеваешь?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//Что???
	if(RavenIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Теперь ты убрал с дороги и Бладвина. Я уже задаюсь вопросом, кто будет следующим. Ворон? Или, может быть, я?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Ты боишься?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//Драки я не боюсь. Но я боюсь того, к чему могут привести твои действия.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//Этот лагерь - все, что у нас осталось.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//Может быть, он не всегда работал идеально, но он работает.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//Но с каждым человеком, которого ты убиваешь, исчезает кусочек нашего общества.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//Мы - бандиты. Головорезы, преступники, изгнанники.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Куда бы мы ни пошли, нас выследят, поймают и убьют.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//Для нас нет лучшего места, чем это, и нет лучшего времени, чем сейчас.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//Куда ты клонишь?
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//Этим людям нужен лидер. Кто способен им стать? Может быть, ты? Ты, человек, который никогда долго не остается на одном месте?
};


instance DIA_Addon_Thorus_Answer(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent = FALSE;
	description = "Тогда почему бы тебе не стать старшим в лагере?";
};


func int DIA_Addon_Thorus_Answer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Speech))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Answer_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Тогда почему бы тебе не стать старшим в лагере?
	if(RavenIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Допустим, а что с Вороном?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//У Ворона скоро будут другие заботы. Я позабочусь об этом.
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi))
	{
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//Ах, да. И позаботься о том, чтобы заключенные покинули лагерь спокойно.
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//Хорошо. Я разберусь с охраной.
		B_LogEntry(TOPIC_Addon_Sklaven,"Бладвин мертв. Теперь Торус позаботится о том, чтобы рабы смогли покинуть лагерь.");
		if(!Npc_IsDead(PrisonGuard))
		{
			B_LogEntry(TOPIC_Addon_Sklaven,"Нужно снова поговорить с охранником рабов. После этого Патрик и его люди смогут уйти.");
		}
		else
		{
			B_LogEntry(TOPIC_Addon_Sklaven,"С охранником покончено. Теперь Патрик с людьми может отправляться.");
		};
	};
};


instance DIA_Addon_Thorus_Raventot(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 99;
	condition = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent = FALSE;
	description = "Я сделал это. Ворон готов.";
};


func int DIA_Addon_Thorus_Raventot_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raventot_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_00");	//Я сделал это. Ворон готов.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_01");	//Значит, ты нанес Белиару неплохой удар.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//Теперь ты пойдешь дальше?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_03");	//Мои дела в долине закончены. Я могу отдохнуть несколько дней.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//(смеется) Да, ты постоянно куда-то движешься, так ведь? (серьезно) Счастливого тебе пути.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Кто знает, может, наши пути еще пересекутся.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Кто знает. У тебя на пути будет много ворот и много переходов. И на одном из них ты можешь встретить меня...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Thorus_PICKPOCKET(C_Info)
{
	npc = BDT_10014_Addon_Thorus;
	nr = 900;
	condition = DIA_Addon_Thorus_PICKPOCKET_Condition;
	information = DIA_Addon_Thorus_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Key;
};


func int DIA_Addon_Thorus_PICKPOCKET_Condition()
{
//	return C_StealItems(60,Hlp_GetInstanceID(ITKE_Addon_Thorus),1);
	if(Npc_HasItems(self,ITKE_Addon_Thorus))
	{
		return C_StealItem(60,Hlp_GetInstanceID(ITKE_Addon_Thorus));
	}
	else
	{
		return FALSE;
	};
};

func void DIA_Addon_Thorus_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Thorus_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Thorus_PICKPOCKET,Dialog_Back,DIA_Addon_Thorus_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Thorus_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Thorus_PICKPOCKET_DoIt);
};

func void DIA_Addon_Thorus_PICKPOCKET_DoIt()
{
//	B_StealItems(60,Hlp_GetInstanceID(ITKE_Addon_Thorus),1);
	B_StealItem(60,Hlp_GetInstanceID(ITKE_Addon_Thorus));
	Info_ClearChoices(DIA_Addon_Thorus_PICKPOCKET);
};

func void DIA_Addon_Thorus_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Thorus_PICKPOCKET);
};

