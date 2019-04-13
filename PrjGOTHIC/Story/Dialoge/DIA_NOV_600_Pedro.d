
instance DIA_Pedro_EXIT(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 999;
	condition = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pedro_WELCOME(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 1;
	condition = DIA_Pedro_WELCOME_Condition;
	information = DIA_Pedro_WELCOME_Info;
	important = TRUE;
};


func int DIA_Pedro_WELCOME_Condition()
{
	return TRUE;
};

func void DIA_Pedro_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//Добро пожаловать в монастырь Инноса, чужеземец.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Я брат Педро, скромный слуга Инноса и хранитель врат этого священного монастыря.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Что ты хочешь?
};


instance DIA_Pedro_Wurst(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Wurst_Condition;
	information = DIA_Pedro_Wurst_Info;
	permanent = FALSE;
	description = "Вот, возьми колбасу, брат!";
};


func int DIA_Pedro_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Вот, возьми колбасу, брат!
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//Я рад, что ты подумал обо мне. Обычно обо мне забывают.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//Ты можешь дать мне еще одну колбаску?
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Забудь об этом, тогда ее на всех не хватит.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//Эй, всего одну колбаску - никто даже не заметит этого. А ты кое-что получишь за это - я знаю место, где растет огненная крапива.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Если ты отнесешь ее Неорасу, он наверняка даст тебе ключ от библиотеки. Что скажешь?
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	Info_ClearChoices(DIA_Pedro_Wurst);
	Info_AddChoice(DIA_Pedro_Wurst,"Ладно, держи еще одну колбасу.",DIA_Pedro_Wurst_JA);
	Info_AddChoice(DIA_Pedro_Wurst,"Нет, забудь об этом.",DIA_Pedro_Wurst_NEIN);
};

func void DIA_Pedro_Wurst_JA()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Ладно, держи еще одну колбасу.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Отлично. Огненная крапива растет слева и справа по другую сторону моста.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Info_ClearChoices(DIA_Pedro_Wurst);
};

func void DIA_Pedro_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Нет, забудь об этом.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Ты хочешь выслужиться перед Гораксом, да? Эх, новые послушники все одинаковые...
	Info_ClearChoices(DIA_Pedro_Wurst);
};


instance DIA_Pedro_EINLASS(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_EINLASS_Condition;
	information = DIA_Pedro_EINLASS_Info;
	permanent = FALSE;
	description = "Я хочу войти в монастырь.";
};


func int DIA_Pedro_EINLASS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pedro_WELCOME))
	{
		return TRUE;
	};
};

func void DIA_Pedro_EINLASS_Info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Я хочу войти в монастырь.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Доступ в монастырь открыт только для слуг Инноса.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Если ты хочешь помолиться Инносу, иди к одному из придорожных алтарей. Ты найдешь там успокоение в молитвах.
};


instance DIA_Pedro_TEMPEL(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_TEMPEL_Condition;
	information = DIA_Pedro_TEMPEL_Info;
	permanent = FALSE;
	description = "Что нужно сделать, чтобы меня приняли в монастырь?";
};


func int DIA_Pedro_TEMPEL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_EINLASS) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pedro_TEMPEL_Info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Что нужно сделать, чтобы меня приняли в монастырь?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//Поступление в монастырь невозможно для тебя - ты уже выбрал свой путь.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Если ты хочешь быть принятым в Братство Инноса, ты должен знать и выполнять правила монастыря.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_03");	//Также каждый новичок должен принести дар Инносу.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_04");	//Овцу и 1000 золотых.
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//Это целая куча золота.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//Это знак того, что ты начинаешь новую жизнь в качестве слуги Инноса. Когда ты будешь принят, все твои предыдущие прегрешения будут прощены.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//И хорошенько подумай - потом ты не сможешь отказаться от своего решения стать слугой Инноса.
		SC_KnowsKlosterTribut = TRUE;
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster,"Чтобы стать послушником монастыря Инноса, мне нужна овца и огромная сумма золотом.");
	};
};


instance DIA_Addon_Pedro_Statuette(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Condition;
	information = DIA_Addon_Pedro_Statuette_Info;
	permanent = FALSE;
	description = "У меня есть вот эта статуэтка...";
};


func int DIA_Addon_Pedro_Statuette_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (MIS_Addon_Daron_GetStatue == LOG_Running) && Npc_KnowsInfo(other,DIA_Pedro_Rules) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_00");	//У меня есть вот эта статуэтка. Думаю, она пропала из монастыря.
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_01");	//Теперь я могу войти?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_02");	//Ну, думаю, что в таких исключительных обстоятельствах, ты можешь стать послушником бесплатно.
		Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
		B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Послушник Педро пропустил меня в монастырь, потому что я нес пропавшую статуэтку. Я должен отдать ее кому-то в монастыре.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_03");	//Боюсь, даже эта драгоценность не откроет тебе путь внутрь.
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_04");	//Ты уже выбрал свой путь. Монастырь для тебя закрыт.
	};
};


instance DIA_Addon_Pedro_Statuette_Abgeben(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information = DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent = FALSE;
	description = "Я могу отдать статуэтку тебе?";
};


func int DIA_Addon_Pedro_Statuette_Abgeben_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette) && (hero.guild != GIL_NONE) && (hero.guild != GIL_NOV) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Abgeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_Abgeben_15_00");	//Я могу отдать статуэтку тебе?
	AI_Output(self,other,"DIA_Addon_Pedro_Statuette_Abgeben_09_01");	//Конечно. Я позабочусь о ней. Благодарю тебя за щедрость.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Pedro_Rules(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Rules_Condition;
	information = DIA_Pedro_Rules_Info;
	permanent = FALSE;
	description = "Что это за правила, по которым вы живете?";
};


func int DIA_Pedro_Rules_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_TEMPEL))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Rules_Info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Что это за правила, по которым вы живете?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Иннос - бог правды и закона. Поэтому мы НИКОГДА не лжем и не совершаем преступлений.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Если ты согрешишь против брата из нашей общины или украдешь нашу собственность, тебе придется заплатить за это штраф.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Иннос также бог правления и огня.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Будучи послушником, ты должен проявлять ПОСЛУШАНИЕ и УВАЖЕНИЕ  ко всем Магам Огня.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Понятно.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//Кроме того, послушник ОБЯЗАН выполнять работу в монастыре на благо общины.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Если ты готов следовать этим правилам, и у тебя есть приношение Инносу, мы готовы принять тебя в монастырь в качестве послушника.
	};
};


instance DIA_Pedro_AUFNAHME(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_AUFNAHME_Condition;
	information = DIA_Pedro_AUFNAHME_Info;
	permanent = TRUE;
	description = "Я хочу стать послушником.";
};


var int DIA_Pedro_AUFNAHME_NOPERM;

func int DIA_Pedro_AUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pedro_Rules) && (DIA_Pedro_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void B_DIA_Pedro_AUFNAHME_Choice()
{
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"Я еще немного подумаю над этим.",DIA_Pedro_AUFNAHME_NO);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"Да, я хочу посвятить свою жизнь служению Инносу.",DIA_Pedro_AUFNAHME_YES);
};

func void DIA_Pedro_AUFNAHME_Info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Я хочу стать послушником.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Ты уже выбрал свой путь. Путь магии закрыт для тебя.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_AUFNAHME_09_02");	//Твое решение окончательно? Пути назад для тебя уже не будет.
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,ItMi_Gold) >= Summe_Kloster) && Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Я вижу, ты принес необходимое приношение. Если ты действительно желаешь этого, ты можешь стать послушником.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Однако, если ты примешь это решение, пути назад не будет - хорошо подумай, твой ли это путь!
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Ты не принес необходимое приношение.
	};
};

func void DIA_Pedro_AUFNAHME_YES()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Да, я хочу посвятить свою жизнь служению Инносу.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//Тогда добро пожаловать, брат. Я даю тебе этот ключ от монастырских ворот.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//В знак твоего добровольного принятия этого решения, ты должен сам открыть эти ворота и войти внутрь.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//Теперь ты послушник. Носи эту робу в знак того, что теперь ты член нашего братства.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//Когда ты войдешь в монастырь, подойди к Парлану. С этого момента он будет отвечать за тебя.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Мои прегрешения теперь прощены?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Пока еще нет. Поговори с мастером Парланом. Он благословит тебя и очистит от твоих грехов.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);
	CreateInvItems(other,ItAr_NOV_L,1);
	AI_EquipArmor(other,ItAr_NOV_L);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP(XP_AufnahmeNovize);
	if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE;
	};
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void DIA_Pedro_AUFNAHME_NO()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Я еще немного подумаю над этим.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Возвращайся, когда будешь готов.
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
};


instance DIA_Pedro_Monastery(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 90;
	condition = DIA_Pedro_Monastery_Condition;
	information = DIA_Pedro_Monastery_Info;
	permanent = TRUE;
	description = "Расскажи мне о жизни в монастыре.";
};


func int DIA_Pedro_Monastery_Condition()
{
	return TRUE;
};

func void DIA_Pedro_Monastery_Info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Расскажи мне о жизни в монастыре.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//Мы живем в монастыре, чтобы служить Инносу. Мы, послушники, выполняем различные работы и изучаем писания, когда у нас появляется такая возможность.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Маги присматривают за нами, а также изучают искусство магии.
};


instance DIA_Pedro_PICKPOCKET(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 900;
	condition = DIA_Pedro_PICKPOCKET_Condition;
	information = DIA_Pedro_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Pedro_PICKPOCKET_Condition()
{
	return C_Beklauen(45,60);
};

func void DIA_Pedro_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,Dialog_Back,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};

func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};

