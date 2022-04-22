
var int SC_ForgotAboutCavalorn;
var int CavalornWeakComment;

instance DIA_Addon_Cavalorn_EXIT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 999;
	condition = DIA_Addon_Cavalorn_EXIT_Condition;
	information = DIA_Addon_Cavalorn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cavalorn_PICKPOCKET(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 900;
	condition = DIA_Addon_Cavalorn_PICKPOCKET_Condition;
	information = DIA_Addon_Cavalorn_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(украсть его колчан будет довольно просто)";
};


func int DIA_Addon_Cavalorn_PICKPOCKET_Condition()
{
	return C_CanStealFromNpc(25);
};

func void DIA_Addon_Cavalorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cavalorn_PICKPOCKET,Dialog_Back,DIA_Addon_Cavalorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cavalorn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Cavalorn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cavalorn_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 25)
	{
		CreateInvItems(self,ItRw_Arrow,44);
		B_GiveInvItems(self,other,ItRw_Arrow,44);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		B_LogEntry(Topic_PickPocket,ConcatStrings("Кавалорн",ConcatStrings(PRINT_PickPocketSuccess,"44 стрелы.")));
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket,ConcatStrings("Кавалорн",PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
};

func void DIA_Addon_Cavalorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
};


instance DIA_Addon_Cavalorn_MeetingIsRunning(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 1;
	condition = DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information = DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;

func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		if(Npc_GetDistToWP(self,"NW_LITTLESTONEHENDGE") < 2000)
		{
			return FALSE;
		};
		if(Npc_GetDistToWP(self,"NW_XARDAS_GOBBO_01") < 2000)
		{
			return FALSE;
		};
		if(Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 2000)
		{
			return FALSE;
		};
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Добро пожаловать в 'Кольцо', мой друг.
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Ватрас даст тебе следующее задание.
	AI_StopProcessInfos(self);
};


func void B_CavalornAboutHut()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//(пораженно) Правда? Хм-м. Я бы хотел пойти с тобой, но у меня здесь есть дела, которые я должен закончить.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//Будешь в Долине Рудников, посмотри, пожалуйста, стоит ли еще моя старая хижина. Я бы хотел туда вернуться когда-нибудь.
	MIS_Addon_Cavalorn_TheHut = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Кавалорн хочет, чтобы я проверил, цела ли еще его старая хижина в Долине Рудников. Насколько я помню, она находится среди холмов на западе, там, где был Старый Лагерь. Думаю, он там что-то оставил.");
};

instance DIA_Addon_Cavalorn_HALLO(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HALLO_Condition;
	information = DIA_Addon_Cavalorn_HALLO_Info;
	description = "Проблемы?";
};


func int DIA_Addon_Cavalorn_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Проблемы?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//(раздраженно) Черт. Я не знаю, где они все прячутся. Убиваешь одного - и вскоре они все возвращаются.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//(хитро) Погоди минутку. Я тебя знаю. Ты тот парень, что постоянно клянчил у меня стрелы в Долине Рудников.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Тебя зовут Кавалорн, верно?",DIA_Addon_Cavalorn_HALLO_Ja);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Что-то не припоминаю...",DIA_Addon_Cavalorn_HALLO_weissNicht);
};

func void DIA_Addon_Cavalorn_HALLO_weissNicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//Что-то не припоминаю...
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//Ну как же. Еще в моей хижине около Старого Лагеря я учил тебя, как стрелять из лука и незаметно передвигаться. Теперь вспоминаешь?
	SC_ForgotAboutCavalorn = TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Тебя зовут Кавалорн, верно?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Ага. Я вижу, ты все-таки не забыл меня после всего, через что мы прошли в этой клятой колонии.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Куда ты направляешься?
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"У меня нет определенной цели.",DIA_Addon_Cavalorn_HALLO_keinZiel);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"Назад в Долину Рудников.",DIA_Addon_Cavalorn_HALLO_Bauern);
	if(PlayerEnteredCity == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_HALLO,"В город.",DIA_Addon_Cavalorn_HALLO_Stadt);
	};
};

func void DIA_Addon_Cavalorn_HALLO_Stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//В город.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//(смеется) Ну-ну. В город. Хех.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//У тебя могут возникнуть сложности со стражей. Они уже не пускают каждого прохожего, весь район кишит бандитами.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//Несколько дней назад один из бывших заключенных Долины Рудников проходил здесь. Он сказал, что постоянно покидает Хоринис и возвращается.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//Он пошел в долину под башней. Должно быть, где-то там есть проход, около водопада.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Может быть, тебе стоит с ним поговорить.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Назад в Долину Рудников.
	B_CavalornAboutHut();
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//У меня нет определенной цели.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//Не хочешь мне говорить, да? Ну ладно.
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};


//////////////////////////////////////////////////////////////////////////////

instance DIA_Addon_Cavalorn_ImGoingToMineValley(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ImGoingToMineValley_Condition;
	information = DIA_Addon_Cavalorn_ImGoingToMineValley_Info;
	description = "Я собираюсь отправиться в Долину Рудников.";
};


func int DIA_Addon_Cavalorn_ImGoingToMineValley_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Hagen_BringProof == TRUE) && (Kapitel < 3) && (MIS_Addon_Cavalorn_TheHut == FALSE) && !Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) && (SC_OpenedCavalornsBeutel == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ImGoingToMineValley_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Я собираюсь отправиться в Долину Рудников.
	B_CavalornAboutHut();
};


////////////////////////////////////////////////////////////

instance DIA_Addon_Cavalorn_Beutel(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Beutel_Condition;
	information = DIA_Addon_Cavalorn_Beutel_Info;
	description = "Я был в твоей хижине в Долине Рудников.";
};


func int DIA_Addon_Cavalorn_Beutel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || (SC_OpenedCavalornsBeutel == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Beutel_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//Я был в твоей хижине в Долине Рудников.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//Так значит, она еще стоит.
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Да. И я знаю, зачем ты хотел туда вернуться.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Ты нашел его?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//Если ты имеешь в виду мешочек с кусками руды... да, он у меня.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//Ну ты, хитрый лис, знаешь об этом?
	if(MIS_Addon_Cavalorn_TheHut == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//А что еще тебе могло бы понадобиться в этой старой лачуге? Там нет больше ничего.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//Он у тебя с собой? Я дам тебе 100 золотых за него.
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Конечно.",DIA_Addon_Cavalorn_Beutel_ja);
	}
	else if(Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Нет, но у меня есть другой кусок руды.",DIA_Addon_Cavalorn_Beutel_jaerz);
	};
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Нет.",DIA_Addon_Cavalorn_Beutel_no);
};

func void B_BuildCavalornOreDialog()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,Dialog_Back,DIA_Addon_Cavalorn_Beutel_back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Почему ты не оставил ее себе?",DIA_Addon_Cavalorn_Beutel_why);
	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || Npc_HasItems(other,ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel,"Давай мне 100 золотых - и я отдам тебе твою руду.",DIA_Addon_Cavalorn_ErzGeben_Info);
	};
};

func void DIA_Addon_Cavalorn_Beutel_back()
{
	if(!Npc_HasItems(self,ItSe_ADDON_CavalornsBeutel) && !Npc_HasItems(self,ItMi_Nugget))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//Я надеюсь, что он вернется ко мне.
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
};

func void DIA_Addon_Cavalorn_Beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//Нет, но у меня есть другой кусок руды.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Тоже неплохо.
	B_BuildCavalornOreDialog();
};

func void DIA_Addon_Cavalorn_Beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Отлично.
	B_BuildCavalornOreDialog();
};

func void DIA_Addon_Cavalorn_Beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//Нет.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Тогда ПРИНЕСИ его мне. Я собирался сам идти в эту чертову Долину Рудников.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//Я почти плачу.
	B_BuildCavalornOreDialog();
};

func void DIA_Addon_Cavalorn_Beutel_why()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Почему ты не оставил ее себе?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//Я и не думал, что в Хоринисе руда стоит так много.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//За такой жалкий кусочек руды в колонии ты бы и место, где поспать, себе не выбил.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//А в портовом городе тебе без лишних сомнений раскроят череп, если узнают, что при тебе есть руда.
};


instance DIA_Addon_Cavalorn_ErzGeben(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ErzGeben_Condition;
	information = DIA_Addon_Cavalorn_ErzGeben_Info;
	description = "Давай мне 100 золотых - и я отдам тебе твою руду.";
};


func int DIA_Addon_Cavalorn_ErzGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Beutel) && (Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel) || Npc_HasItems(other,ItMi_Nugget)) && (MIS_Addon_Cavalorn_TheHut != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Давай мне 100 золотых - и я отдам тебе твою руду.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//По рукам. Вот деньги.
	CreateInvItems(self,ItMi_Gold,100);
	B_GiveInvItems(self,other,ItMi_Gold,100);
	if(Npc_HasItems(other,ItSe_ADDON_CavalornsBeutel))
	{
		B_GiveInvItems(other,self,ItSe_ADDON_CavalornsBeutel,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//Ты настоящий друг. Спасибо огромное.
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_CavalornsBeutel);
};


instance DIA_Addon_Cavalorn_WASMACHSTDU(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information = DIA_Addon_Cavalorn_WASMACHSTDU_Info;
	description = "Что ты здесь делаешь?";
};


func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//Сижу на месте. Если бы не эти чертовы бандиты, меня бы здесь не было.
};


instance DIA_Addon_Cavalorn_Banditen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 10;
	condition = DIA_Addon_Cavalorn_Banditen_Condition;
	information = DIA_Addon_Cavalorn_Banditen_Info;
	description = "Что такое с бандитами?";
};


func int DIA_Addon_Cavalorn_Banditen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_WASMACHSTDU) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Banditen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//Что такое с бандитами?
//	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Ты что, с Луны свалился?
//	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Э-э...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//Я говорю обо всем этом сброде из исправительной колонии, которые чувствуют себя здесь как дома, грабят и убивают всех, кого могут.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//(вздыхает) Думаю, мне повезло, что они меня не убили. Я отвлекся буквально на секунду - и меня уже оглушили ударом сзади дубинкой по голове.
	if(!C_BragoBanditsDead())
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//Даже не знаю, как теперь получить свои вещи обратно.
	};
};


instance DIA_Addon_Cavalorn_ARTEFAKT(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information = DIA_Addon_Cavalorn_ARTEFAKT_Info;
	description = "Тебя ограбили разбойники?";
};


func int DIA_Addon_Cavalorn_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen) && (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//Тебя ограбили разбойники?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//(в ярости) Да. Они выключили меня и бросили на завтрак гоблинам.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//Это были очень важные для меня вещи. Письмо и все деньги. Мне просто необходимо вернуть их.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//Но без компаньона, который мог бы меня прикрыть, я не вернусь туда. Эти трусливые твари...
};


instance DIA_Addon_Cavalorn_HELFEN(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_HELFEN_Condition;
	information = DIA_Addon_Cavalorn_HELFEN_Info;
	description = "Могу я помочь тебе с бандитами?";
};


func int DIA_Addon_Cavalorn_HELFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_ARTEFAKT) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && !C_BragoBanditsDead())
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//Могу я помочь тебе с бандитами?
	if(!Npc_HasEquippedArmor(other) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(хитро) Возможно. Но ты выглядишь таким тощим, ты наверняка не держал меча несколько недель.
		CavalornWeakComment = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Ну... У меня нет выбора, так что я принимаю твое предложение. У меня мало времени.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//Так, слушай. Вниз по этой дороге располагается одна из тех грязных дыр, где прячутся бандиты.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//Именно те ребята, что там сидят, меня и ограбили.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Скажи, когда будешь готов, и мы поймаем преступников.
	MIS_Addon_Cavalorn_KillBrago = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillBrago,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillBrago,"Бандиты украли у Кавалорна что-то ценное. Он хочет, чтобы я помог ему расправиться с ними.");
};


instance DIA_Addon_Cavalorn_AUSRUESTUNG(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information = DIA_Addon_Cavalorn_AUSRUESTUNG_Info;
	description = "Мне нужна экипировка получше.";
};


func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago != FALSE) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//Мне нужна экипировка получше.
	if(!C_BragoBanditsDead())
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Эти свиньи не оставили мне почти ничего.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//Я могу дать тебе волчий нож. Этого пока хватит?
	CreateInvItems(self,ItMW_Addon_Knife01,1);
	B_GiveInvItems(self,other,ItMW_Addon_Knife01,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//Ты называешь это ножом?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//А что по поводу лечения?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//У меня есть еще 2 лечебных зелья. Нужны?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Конечно. Давай сюда.
	CreateInvItems(self,ItPo_Health_01,2);
	B_GiveInvItems(self,other,ItPo_Health_01,2);
};


instance DIA_Addon_Cavalorn_LETSKILLBANDITS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information = DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;
	description = "Пойдем, разберемся с этими ребятами.";
};


func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition()
{
	if((MIS_Addon_Cavalorn_KillBrago == LOG_Running) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE) && (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS) && !C_BragoBanditsDead())
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Пойдем, разберемся с этими ребятами.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Конечно. Следи, чтобы ко мне не подходили сзади, ладно?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//Теперь их ждет неприятный сюрприз.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	if(Bdt_1013_Away == FALSE)
	{
		if(!Npc_IsDead(Ambusher_1013))
		{
			Ambusher_1013.aivar[AIV_EnemyOverride] = FALSE;
		};
	};
	if(!Npc_IsDead(Ambusher_1014))
	{
		Ambusher_1014.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(!Npc_IsDead(Ambusher_1015))
	{
		Ambusher_1015.aivar[AIV_EnemyOverride] = FALSE;
	};
};

func void B_Addon_Cavalorn_VatrasBrief()
{
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//И я, наконец, смогу выполнить свое задание. Я и так потерял уже слишком много времени.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//Что это за задание?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//(сам себе) Ах, да. Ведь сначала мне еще нужно будет попасть в город, и потом...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//(вздыхает) Не знаю, как мне удастся сделать это вовремя.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//(сухо) А что насчет меня?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//(оценивающе) Хм-м. А почему бы и нет... Ты можешь доставить письмо в город.
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"Кавалорн хочет, чтобы я доставил украденное бандитами письмо магу Воды Ватрасу, который читает проповеди в храме Аданоса в Хоринисе.");
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//Тогда у меня будет слегка больше времени, чтобы позаботиться о своей экипировке.
	if(MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//Письмо должно быть у одного из бандитов в кармане.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Отнеси его к Ватрасу, магу Воды, в город. Ты найдешь его в храме Аданоса. Он проповедует там весь день.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Скажи ему, что мне не удалось.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//А если он спросит, где я, просто скажи ему, что я уже на пути к месту встречи, ладно?
	};
	if(!Npc_HasEquippedArmor(other) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//А, да, и еще одно. Сначала купи приличную одежду у какого-нибудь фермера.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Иначе тебя могут принять за бандита. Вот пара монет.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
		{
			Log_CreateTopic(TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_City,LOG_Running);
			Log_AddEntry(TOPIC_City,"Кавалорн посоветовал мне купить приличую одежду, чтобы я не выглядел слишком подозрительно.");
		};
	};
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Cavalorn_KillBrago);
};


instance DIA_Addon_Cavalorn_BragoKilled(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BragoKilled_Condition;
	information = DIA_Addon_Cavalorn_BragoKilled_Info;
	important = TRUE;
};


func int DIA_Addon_Cavalorn_BragoKilled_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		if(C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//Готово. Ха. Им не следовало связываться со мной.
	B_Addon_Cavalorn_VatrasBrief();
};


instance DIA_Addon_Cavalorn_PCKilledBrago(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information = DIA_Addon_Cavalorn_PCKilledBrago_Info;
	description = "С бандитами покончено.";
};


func int DIA_Addon_Cavalorn_PCKilledBrago_Condition()
{
	if(((MIS_Addon_Cavalorn_KillBrago == FALSE) || ((Npc_GetDistToWP(self,"NW_XARDAS_GOBBO_01") < 500) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Banditen))
	{
		if(C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//С бандитами покончено.
	B_Addon_Cavalorn_VatrasBrief();
};


instance DIA_Addon_Cavalorn_JUNGS(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_JUNGS_Condition;
	information = DIA_Addon_Cavalorn_JUNGS_Info;
	description = "Интересные на тебе доспехи. Ты больше не принадлежишь к Теням?";
};


func int DIA_Addon_Cavalorn_JUNGS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_JUNGS_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Интересные на тебе доспехи. Ты больше не принадлежишь к Теням?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Тени? Они не существуют с тех пор, как пал Барьер.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//Когда мы могли, наконец, уйти из Долины Рудников, незачем было оставаться с ними.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Теперь я работаю на магов Воды. Я принадлежу к 'Кольцу Воды'.
	SC_KnowsRanger = TRUE;
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Кавалорн рассказал мне, что он принадлежит к сообществу, которое называется 'Кольцо Воды'.");
	Cavalorn_RangerHint = TRUE;
};


instance DIA_Addon_Cavalorn_Ring(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Ring_Condition;
	information = DIA_Addon_Cavalorn_Ring_Info;
	permanent = FALSE;
	description = "Расскажи мне о 'Кольце Воды'!";
};


func int DIA_Addon_Cavalorn_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ring_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Расскажи мне о 'Кольце Воды'!
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//Мне на самом деле нельзя говорить про него.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//Все, что я могу сделать - это отослать тебя к Ватрасу. Он - представитель магов Воды в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//Лучше тебе поговорить с ним. Скажи, что я тебя рекомендовал.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Может быть, он тебя примет в наши ряды. Нам срочно необходимы люди...
	B_LogEntry(TOPIC_Addon_RingOfWater,"О Кольце Воды мне может рассказать маг Воды Ватрас.");
};


instance DIA_Addon_Cavalorn_Feinde(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_Feinde_Condition;
	information = DIA_Addon_Cavalorn_Feinde_Info;
	permanent = FALSE;
	description = "Разве ты и твои ребята раньше не были врагами магов Воды?";
};


func int DIA_Addon_Cavalorn_Feinde_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Feinde_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Разве ты и твои ребята раньше не были врагами магов Воды?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Эти безумные дни закончились. Теперь нет 'Нового Лагеря' или 'Старого Лагеря'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//После того, как колония прекратила свое существование, каждый остался сам за себя.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//За большинством из бывших заключенных все еще идет охота.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//Маги Воды сумели разобраться с моим приговором, и теперь я могу передвигаться свободно.
};


instance DIA_Addon_Cavalorn_KdWTask(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 6;
	condition = DIA_Addon_Cavalorn_KdWTask_Condition;
	information = DIA_Addon_Cavalorn_KdWTask_Info;
	permanent = FALSE;
	description = "А что, собственно, делают маги Воды?";
};


func int DIA_Addon_Cavalorn_KdWTask_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS) && (MIS_Addon_Nefarius_BringMissingOrnaments == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_KdWTask_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//А что, собственно, делают маги Воды?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//Они затеяли кое-что серьезное. Это касается неизвестной области на острове.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//Неизвестной области? Где же она может быть?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//Я не могу тебе сказать. Поговори с Ватрасом в Хоринисе.
};


instance DIA_Addon_Cavalorn_BroughtLetter(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information = DIA_Addon_Cavalorn_BroughtLetter_Info;
	description = "Я передал Ватрасу твое письмо.";
};


func int DIA_Addon_Cavalorn_BroughtLetter_Condition()
{
	if((MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//Я передал Ватрасу твое письмо.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//Я и не ожидал другого. Спасибо.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_Ornament(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 2;
	condition = DIA_Addon_Cavalorn_Ornament_Condition;
	information = DIA_Addon_Cavalorn_Ornament_Info;
	description = "Ты что-то ищешь?";
};


func int DIA_Addon_Cavalorn_Ornament_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Ты что-то ищешь?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//А что, так заметно? Да, у меня есть поручение от магов Воды, я ищу потерянный орнамент.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//Как удобно. У меня то же поручение от Нефариуса.
	if(SC_KnowsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//Так значит, ты принадлежишь к 'Кольцу Воды'?
		if(SC_IsRanger == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Да.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Пока нет, но я работаю над этим.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//Я рад. Значит, мне не придется заниматься этим в одиночку.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//Ты уже нашел орнамент?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//Я знаю место, где он должен быть.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//Этот каменный круг похож на то, что описывал Нефариус.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Теперь нам надо просто найти механизм, который мы и должны найти.
};


instance DIA_Addon_Cavalorn_Triggered(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_Triggered_Condition;
	information = DIA_Addon_Cavalorn_Triggered_Info;
	description = "Я пробовал. Но он не работает, ничего не делает.";
};


func int DIA_Addon_Cavalorn_Triggered_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ornament) && (Ornament_Switched_Farm == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Triggered_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//Я пробовал. Но он не работает, ничего не делает.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Ужасно.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//Значит, фермеры Лобарта были правы.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//Они сказали, что один из них уже крутился здесь, возле камней.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//Каменный страж появился из ниоткуда и напал на него.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//Фермеры позвали ополченцев, те оповестили паладинов, которые и уничтожили монстра.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//Я уже обыскал здесь все. Если орнамент и был здесь, теперь он у паладинов.
	Info_ClearChoices(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Кому-то из нас придется подняться в верхнюю часть города.",DIA_Addon_Cavalorn_Triggered_Pal);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered,"Тогда я пойду и попрошу у них орнамент.",DIA_Addon_Cavalorn_Triggered_OBack);
};

func void B_Cavalorn_Triggered_Wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//Сейчас я снова иду в город. Встретимся у Ватраса.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"Одна из частей орнамента находится у паладинов в верхнем квартале.");
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_Running;
	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack()
{
	CreateInvItems(self,ITAR_Bau_L,1);
	AI_EquipArmor(self,ITAR_Bau_L);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Тогда я пойду и попрошу у них орнамент.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//Отлично.
	B_Cavalorn_Triggered_Wohin();
};

func void DIA_Addon_Cavalorn_Triggered_Pal()
{
	CreateInvItems(self,ITAR_Bau_L,1);
	AI_EquipArmor(self,ITAR_Bau_L);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Кому-то из нас придется подняться в верхнюю часть города.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//У меня нет на это времени. Это придется сделать тебе.
	B_Cavalorn_Triggered_Wohin();
};


instance DIA_Addon_Cavalorn_GotOrnaFromHagen(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 5;
	condition = DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information = DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;
	description = "Я достал у лорда Хагена пропавший орнамент.";
};


func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition()
{
	if(Lord_Hagen_GotOrnament == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//Я достал у лорда Хагена пропавший орнамент.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//Видишь! Я же говорил, что он у паладинов.
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Cavalorn_WannaLearn(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 7;
	condition = DIA_Addon_Cavalorn_WannaLearn_Condition;
	information = DIA_Addon_Cavalorn_WannaLearn_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня кое-чему?";
};


func int DIA_Addon_Cavalorn_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_HALLO))
	{
		if(C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Cavalorn_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Ты можешь научить меня кое-чему?
	if((CavalornWeakComment == FALSE) && (SC_ForgotAboutCavalorn == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01_add");	//Конечно, ты это прекрасно знаешь.
	};
	if(CavalornWeakComment == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Конечно, ты это прекрасно знаешь. Приятель, ты действительно много потерял.
	};
	if(SC_ForgotAboutCavalorn == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//Ты и правда ничего не помнишь, да?
	};
	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_OutTeacher,LogText_Addon_Cavalorn_Teach);
};


var int DIA_Cavalorn_Teacher_permanent;
var int Cavalorn_Merke_Bow;
var int Cavalorn_Merke_1h;
var int Cavalorn_Sneak_Comment;

func void B_BuildLearnDialog_Cavalorn()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
	Info_AddChoice(DIA_Addon_Cavalorn_TEACH,Dialog_Back,DIA_Addon_Cavalorn_Teach_Back);
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(NAME_Skill_Sneak,B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Addon_Cavalorn_Teach_Sneak);
	};
	if(VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Cavalorn)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_Cavalorn_Teach_Bow_1);
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Addon_Cavalorn_Teach_Bow_5);
	};
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Cavalorn)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Cavalorn_Teach_1H_1);
		Info_AddChoice(DIA_Addon_Cavalorn_TEACH,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Addon_Cavalorn_Teach_1H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) && (VisibleTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_Cavalorn) && (VisibleTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cavalorn))
	{
		if((RealTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_Cavalorn) && (RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cavalorn))
		{
			DIA_Cavalorn_Teacher_permanent = TRUE;
		};
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Cavalorn_TEACH(C_Info)
{
	npc = BAU_4300_Addon_Cavalorn;
	nr = 8;
	condition = DIA_Addon_Cavalorn_TEACH_Condition;
	information = DIA_Addon_Cavalorn_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу обучиться тому, что ты умеешь.";
};


func int DIA_Addon_Cavalorn_TEACH_Condition()
{
	if((Cavalorn_Addon_TeachPlayer == TRUE) && (DIA_Cavalorn_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//Я хочу обучиться тому, что ты умеешь.
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) || (VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Cavalorn) || (VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Cavalorn))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Хорошо. Что именно тебя интересует?
		Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
		Cavalorn_Merke_1h = other.HitChance[NPC_TALENT_1H];
	};
	B_BuildLearnDialog_Cavalorn();
};

func void DIA_Addon_Cavalorn_Teach_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//С мягкими подошвами тебе будет легче незаметно подобраться к противнику.
		Cavalorn_Sneak_Comment = TRUE;
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_Bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,TeachLimit_Bow_Cavalorn))
	{
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_Bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,TeachLimit_Bow_Cavalorn))
	{
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Cavalorn))
	{
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Cavalorn))
	{
		B_BuildLearnDialog_Cavalorn();
	};
};

func void DIA_Addon_Cavalorn_Teach_Back()
{
	if((Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW]) || (Cavalorn_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cavalorn_Sneak_Comment == TRUE))
	{
		if((CavalornWeakComment == TRUE) || (SC_ForgotAboutCavalorn == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//Уже лучше. Ты многое позабыл, но мы быстро вернем твои умения.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00_add");	//Уже лучше.
		};
	};
	Info_ClearChoices(DIA_Addon_Cavalorn_TEACH);
};

