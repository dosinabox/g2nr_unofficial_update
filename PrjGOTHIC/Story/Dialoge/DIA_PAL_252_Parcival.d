
instance DIA_Parcival_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Schurfer(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Schurfer_Condition;
	information = DIA_Parcival_Schurfer_Info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне о старателях?";
};


func int DIA_Parcival_Schurfer_Condition()
{
	if(MIS_ScoutMine == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parcival_Schurfer_Info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//Что ты можешь рассказать мне о старателях?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//Я отправил все три отряда.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Их возглавили Маркос, Фаджет и Сильвестро.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Группа Маркоса пошла по направлению к старой шахте - ее ведет старый рудокоп Гримс.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//Другие две группы вышли вместе.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Джерган, один из наших разведчиков, доложил, что они разбили лагерь неподалеку от большой башни.
	B_LogEntry(TOPIC_ScoutMine,"Отряды старателей возглавляли паладины. Маркос, Фаджет и Сильвестро.");
	B_LogEntry(TOPIC_ScoutMine,"Группа Маркоса пошла по направлению к старой шахте. Их разведчиком был рудокоп Гримс.");
	B_LogEntry(TOPIC_ScoutMine,"Другие две группы вышли вместе. Они разбили лагерь неподалеку от большой башни.");
};


instance DIA_Parcival_Diego(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 9;
	condition = DIA_Parcival_Diego_Condition;
	information = DIA_Parcival_Diego_Info;
	permanent = FALSE;
	description = "А с какой группой старателей пошел Диего?";
};


func int DIA_Parcival_Diego_Condition()
{
	if((SearchForDiego == LOG_Running) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Diego_Info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//А с какой группой старателей пошел Диего?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//Этот каторжник - Диего? Он с группой паладина Сильвестро.
	B_LogEntry(TOPIC_ScoutMine,"Диего пошел со старателями, возглавляемыми паладином Сильвестро.");
};


instance DIA_Parcival_Weg(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_Weg_Condition;
	information = DIA_Parcival_Weg_Info;
	permanent = FALSE;
	description = "Ты знаешь, как добраться до этих шахт?";
};


func int DIA_Parcival_Weg_Condition()
{
	if(MIS_ScoutMine == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parcival_Weg_Info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//Ты знаешь, как добраться до этих шахт?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//Через долину вообще нет безопасного пути. Но мне все же кажется, что будет лучше избегать прямой дороги.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Держись подальше от орков и лесов - и да хранит тебя Иннос.
	B_LogEntry(TOPIC_ScoutMine,"Похоже, прямой путь к старателям может оказаться не лучшим выбором. Мне лучше обходить стороной леса и лагеря орков.");
};


instance DIA_Parcival_DRAGON(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGON_Condition;
	information = DIA_Parcival_DRAGON_Info;
	description = "Как ситуация?";
};


func int DIA_Parcival_DRAGON_Condition()
{
	return TRUE;
};

func void DIA_Parcival_DRAGON_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//Как обстановка?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//Мы окружены орками. Похоже, они здесь надолго.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//Но значительно больше меня тревожат нападения драконов. Они уже уничтожили весь внешний круг.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Еще одно нападение драконов, и мы понесем большие потери.
};


instance DIA_Parcival_DRAGONS(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGONS_Condition;
	information = DIA_Parcival_DRAGONS_Info;
	description = "Сколько всего драконов?";
};


func int DIA_Parcival_DRAGONS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parcival_DRAGON) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGONS_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//Сколько всего драконов?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//Мы не знаем, сколько их всего, но больше одного, это точно.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//Но и это еще не все. Вся Долина Рудников кишит дьявольскими созданиями, поддерживающими драконов.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Не стоит обманывать себя - без подкрепления извне наши шансы выбраться отсюда живыми ничтожны.
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_BRAVE(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_BRAVE_Condition;
	information = DIA_Parcival_BRAVE_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_BRAVE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(hero,DIA_Parcival_DRAGONS) && (Kapitel < 3) && (Parcival_BRAVE_LaberCount <= 6))
	{
		return TRUE;
	};
};


var int Parcival_BRAVE_LaberCount;

func void DIA_Parcival_BRAVE_Info()
{
	var int randy;
	if(Parcival_BRAVE_LaberCount < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//Пока все спокойно. Но все может быстро перемениться.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//Мы будем держаться, сколько сможем.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Иннос поможет нам. Его свет озаряет наши сердца!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Эй! Тебе что, нечего больше делать, как болтать со мной? Проваливай!
		B_GivePlayerXP(XP_Ambient);
	};
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
};


instance DIA_Parcival_KAP3_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP3_EXIT_Condition;
	information = DIA_Parcival_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_ALLESKLAR(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_ALLESKLAR_Condition;
	information = DIA_Parcival_ALLESKLAR_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Parcival_ALLESKLAR_Condition()
{
	if((Kapitel == 3) && (DIA_Parcival_ALLESKLAR_NervCounter < 3) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};


var int DIA_Parcival_ALLESKLAR_NervCounter;

func void DIA_Parcival_ALLESKLAR_Info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Все в порядке?
	if(DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Пока да!
	}
	else if(DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Да, черт тебя побери.
	}
	else if(Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(смеется) Ах. Теперь я понимаю, что ты задумал. Нет, дружок. Не на этот раз.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Не отвлекай меня.
	};
	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
};


instance DIA_Parcival_KAP4_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP4_EXIT_Condition;
	information = DIA_Parcival_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_AnyNews(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_AnyNews_Condition;
	information = DIA_Parcival_AnyNews_Info;
	description = "Ничего важного не произошло?";
};


func int DIA_Parcival_AnyNews_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Ничего важного не произошло?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//Ты один из этих отбросов общества, что называют себя охотниками на драконов?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//Вообще-то, я полагал, что у тебя хватит ума не связываться с этими недоумками.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//Я обеспокоен. Очень сильно обеспокоен.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Чем?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//Недавно здесь появились эти люди. Они называют себя охотниками на драконов.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//С моей точки зрения все они бездельники и преступники.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//Если бы это было в моей власти, я бы выгнал их всех из замка. Пусть орки позаботятся о них.
	Info_ClearChoices(DIA_Parcival_AnyNews);
	Info_AddChoice(DIA_Parcival_AnyNews,"Но в отличие от лорда Хагена, они все же здесь.",DIA_Parcival_AnyNews_LordHagen);
	Info_AddChoice(DIA_Parcival_AnyNews,"Ты должен дать им шанс.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice(DIA_Parcival_AnyNews,"Тебе не кажется, что ты преувеличиваешь?",DIA_Parcival_AnyNews_Overact);
};

func void DIA_Parcival_AnyNews_LordHagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Но в отличие от лорда Хагена, они все же здесь.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//(горько смеется) Да, к сожалению, они все, что у нас есть.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Воистину Иннос подвергает нас суровому испытанию.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//Ты должен дать им шанс.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//И они его получат. К сожалению.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Гаронд убежден, что они могут помочь нам.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//Но я глаз с них не спущу. У нас и так хватает проблем с орками. И дополнительные неприятности нам совсем ни к чему.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Тебе не кажется, что ты преувеличиваешь?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//Абсолютно нет. В нашей ситуации нам нужны люди, являющие собой пример героизма.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Воины, которые пробудят огонь Инноса в сердцах наших бойцов.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//А вместо этого эти проходимцы разлагают боевой дух моих солдат.
};


instance DIA_Parcival_Jan(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Jan_Condition;
	information = DIA_Parcival_Jan_Info;
	permanent = FALSE;
	description = "Мне нужно поговорить с тобой о Яне.";
};


func int DIA_Parcival_Jan_Condition()
{
	if((MIS_JanBecomesSmith == LOG_Running) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Jan_Info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//Мне нужно поговорить с тобой о Яне.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Яне? Кто это?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//Охотник на драконов. Он кузнец.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//Ох, да. Я помню. Что насчет него?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//Он хочет работать в кузнице.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//Это даже не обсуждается. Он не наш человек и я не доверяю ему.
};


instance DIA_Parcival_ThinkAgain(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_ThinkAgain_Condition;
	information = DIA_Parcival_ThinkAgain_Info;
	permanent = TRUE;
	description = "Ты не мог бы пересмотреть свое мнение насчет Яна?";
};


func int DIA_Parcival_ThinkAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Parcival_ThinkAgain_Info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Ты не мог бы пересмотреть свое мнение насчет Яна?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//Нет, мое решение окончательно.
};


instance DIA_Parcival_TalkedGarond(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_TalkedGarond_Condition;
	information = DIA_Parcival_TalkedGarond_Info;
	description = "Гаронд хочет, чтобы Ян работал в кузнице.";
};


func int DIA_Parcival_TalkedGarond_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_Success) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};

func void DIA_Parcival_TalkedGarond_Info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Гаронд хочет, чтобы Ян работал в кузнице.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Ммм. Если это действительно так, то я не имею ничего против этого.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//Хотя я и считаю ошибкой доверять этому Яну.
};


instance DIA_Parcival_PERMKAP4(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 43;
	condition = DIA_Parcival_PERMKAP4_Condition;
	information = DIA_Parcival_PERMKAP4_Info;
	permanent = TRUE;
	description = "А кроме этого?";
};


func int DIA_Parcival_PERMKAP4_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_AnyNews))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PERMKAP4_Info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//А кроме этого?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Ах, оставь меня в покое!
};


instance DIA_Parcival_KAP5_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP5_EXIT_Condition;
	information = DIA_Parcival_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_VERRAETER(C_Info)
{
	npc = PAL_252_Parcival;
	condition = DIA_Parcival_VERRAETER_Condition;
	information = DIA_Parcival_VERRAETER_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_VERRAETER_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGateOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_VERRAETER_Info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Предатель! Я точно знаю, что это ТЫ открыл ворота.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//Ты заплатишь за это.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_PARCIVAL_KAP6_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = dia_parcival_kap6_exit_condition;
	information = dia_parcival_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_parcival_kap6_exit_condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void dia_parcival_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_PICKPOCKET(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 900;
	condition = DIA_Parcival_PICKPOCKET_Condition;
	information = DIA_Parcival_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Parcival_PICKPOCKET_Condition()
{
	return C_Beklauen(84,460);
};

func void DIA_Parcival_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,Dialog_Back,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};

func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};

