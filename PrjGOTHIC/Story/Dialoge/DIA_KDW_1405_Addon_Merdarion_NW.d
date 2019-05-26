
instance DIA_Addon_Merdarion_EXIT(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 999;
	condition = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_Hallo(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Hallo_Condition;
	information = DIA_Addon_Merdarion_Hallo_Info;
	description = "Занят?";
};


func int DIA_Addon_Merdarion_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Занят?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//Эти подземелья для меня - большая загадка. Трудно представить себе, что никто раньше их не нашел.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//Нам же удалось найти вход без особых сложностей.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//Люди так заняты своими повседневными делами, что никто не обращал должного внимания на эту постройку.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//Другого объяснения у меня нет.
};


instance DIA_Addon_Merdarion_Aufgabe(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Aufgabe_Condition;
	information = DIA_Addon_Merdarion_Aufgabe_Info;
	description = "Что ты хочешь здесь сделать?";
};


func int DIA_Addon_Merdarion_Aufgabe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//Что ты хочешь здесь сделать?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//Я пытаюсь выяснить, куда ведет этот круглый портал.
	if(MIS_Addon_Nefarius_BringMissingOrnaments != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//И еще я помогаю Нефариусу искать потерянный орнамент.
		if(!Npc_KnowsInfo(other,DIA_Addon_Nefarius_SCbringOrnaments))
		{
			B_LogEntry(TOPIC_Addon_KDW,"Нефариус ищет пропавший орнамент.");
		};
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//Можно сказать с уверенностью, что этот портал ведет в ту часть острова, которая доселе нам была неизвестна.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//(задумываясь) Я даже, пожалуй, никогда не слышал и не читал про нее...
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Cronos_NW,"START");
	SC_KnowsPortal = TRUE;
};


instance DIA_Addon_Merdarion_DaDurch(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_DaDurch_Condition;
	information = DIA_Addon_Merdarion_DaDurch_Info;
	description = "Ты действительно хочешь пройти через этот портал?";
};


func int DIA_Addon_Merdarion_DaDurch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_DaDurch_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//Ты действительно хочешь пройти через этот портал?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//Да. Ну, если мы найдем потерянный орнамент, конечно.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//Я полагаю, это достаточно рискованная затея.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//Но нам просто необходимо выяснить, как это может быть связано с постоянными землетрясениями.
};


instance DIA_Addon_Merdarion_Bedrohung(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Bedrohung_Condition;
	information = DIA_Addon_Merdarion_Bedrohung_Info;
	description = "А что тебе известно про землетрясения?";
};


func int DIA_Addon_Merdarion_Bedrohung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_DaDurch))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Bedrohung_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//А что тебе известно про землетрясения?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//Их причиной является что-то на другой стороне.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//Возможно, из-за этого пробуждаются каменные стражи.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//Но это уже не моя забота. Сатурас и Кронос могут рассказать тебе больше.
};


instance DIA_Addon_Merdarion_Wasdahinter2(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information = DIA_Addon_Merdarion_Wasdahinter2_Info;
	description = "И что, как ты думаешь, ты там найдешь?";
};


func int DIA_Addon_Merdarion_Wasdahinter2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//И что, как ты думаешь, ты там найдешь?
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//Я даже не знаю.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//Я полагаю, что на той стороне должно быть строение, схожее с этим. И аналог этого портала.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//Все остальное мы узнаем, только когда попадем туда.
};


instance DIA_Addon_Merdarion_PERM(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 99;
	condition = DIA_Addon_Merdarion_PERM_Condition;
	information = DIA_Addon_Merdarion_PERM_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня магии?";
};


func int DIA_Addon_Merdarion_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//Ты можешь научить меня магии?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//Когда мы окажемся там, я буду в полном твоем распоряжении.
};


instance DIA_Addon_Merdarion_Teleportstein(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_Teleportstein_Condition;
	information = DIA_Addon_Merdarion_Teleportstein_Info;
	description = "Как быстрее всего добраться в город?";
};


func int DIA_Addon_Merdarion_Teleportstein_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe) && (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS))
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//Как быстрее всего добраться в город?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//Я советую тебе пойти тем же путем, что ты и пришел.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//(прикидывая) Но ты также можешь... Нет, это слишком опасно.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//Выкладывай.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//Ладно. Строители этих залов передвигались своим способом.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//Насколько мы можем судить, они умели телепортироваться.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//В этом нет ничего необычного.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//Телепортационные камни, которые мы нашли в Хоринисе, в самом деле, весьма необычны.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//Кажется, что телепортационный камень в этих залах может вести в город.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//Но ни у кого из нас не хватило смелости это проверить.
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Что если мне попробовать переместиться с его помощью?",DIA_Addon_Merdarion_Teleportstein_ich);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Где находится этот камень?",DIA_Addon_Merdarion_Teleportstein_wo);
};

func void DIA_Addon_Merdarion_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//Где находится этот камень?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//За дверью, в комнате с бассейном. Я запер его там.
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein,"Дай мне ключ. Я хочу посмотреть на него.",DIA_Addon_Merdarion_Teleportstein_key);
};

func void DIA_Addon_Merdarion_Teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//Что если мне попробовать переместиться с его помощью?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//Не знаю. Нам слишком мало об этом известно. Возможно, ты не выживешь.
};

func void DIA_Addon_Merdarion_Teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//Дай мне ключ. Я хочу посмотреть на него.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//(неуверенно) Правда? Но я не отвечаю за последствия.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//Давай ключ.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//Если ты так хочешь. Пожалуйста.
	CreateInvItems(self,ItKe_PortalTempelWalkthrough_Addon,1);
	B_GiveInvItems(self,other,ItKe_PortalTempelWalkthrough_Addon,1);
	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Мердарион дал мне ключ от запертой двери. За ней находится телепорт, который перенесет меня обратно к городу.");
	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
};


instance DIA_Addon_Merdarion_WHereOtherTeleports(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information = DIA_Addon_Merdarion_WHereOtherTeleports_Info;
	description = "Где остальные телепортационные камни?";
};


func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein) && (SCUsed_NW_TELEPORTSTATION_MAYA == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//Где остальные телепортационные камни?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//Мы пока что нашли только один, где-то посередине Хориниса.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//Рядом с таверной 'Мертвая гарпия'.
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Рядом с таверной 'Мертвая гарпия' должен быть еще один телепорт.");
};


instance DIA_Addon_Merdarion_TeleportsteinSuccess(C_Info)
{
	npc = KDW_1405_Addon_Merdarion_NW;
	nr = 5;
	condition = DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information = DIA_Addon_Merdarion_TeleportsteinSuccess_Info;
	description = "Телепортационные камни, похоже, работают нормально.";
};


func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_Teleportstein) && (SCUsed_AllNWTeleporststones == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//Телепортационные камни, похоже, работают нормально.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//Ты сделал это? Ты действительно вошел туда?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//Да. Очевидно, они все еще работают.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//(восхищенно) Невероятно. Мне нужно будет поближе взглянуть на них.
};

