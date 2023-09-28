
instance DIA_Lester_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_EXIT_Condition;
	information = DIA_Lester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_Hello(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_Hello_Condition;
	information = DIA_Lester_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lester_Hello_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_Hello_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//Это ТЫ? Точно! Ох, как я рад видеть тебя!
	Info_ClearChoices(DIA_Lester_Hello);
	Info_AddChoice(DIA_Lester_Hello,"Я что, знаю тебя?",DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice(DIA_Lester_Hello,"Лестер! Как ты оказался здесь?",DIA_Lester_Hello_Lester);
};

func void DIA_Lester_Hello_Lester()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//Лестер! Как ты оказался здесь?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//Это был безумный побег. После того, как Барьер рухнул, я бродил там некоторое время в полном смятении.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//Потом я потратил несколько дней, пробираясь через все эти леса, пока, наконец, не оказался в этой долине.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//Диего, Милтен и Горн все еще в Долине Рудников. По крайней мере, я так думаю.
};

func void DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//Я что, знаю тебя?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Эй? У тебя все дома? Я рисковал своей шеей, чтобы ты мог заполучить этот чертов камень.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//За тобой должок... Ну, уж это-то ты должен помнить.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//А ты помнишь Диего, Милтена и Горна?
	Info_AddChoice(DIA_Lester_Hello,"Диего, Милтен и КТО?",DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice(DIA_Lester_Hello,"Конечно. Как они?",DIA_Lester_Hello_KnowFourFriends);
};

func void DIA_Lester_Hello_KnowFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Конечно. Как они?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Насколько я знаю, они выжили при разрушении Барьера.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Но я понятия не имею, где они сейчас - эта троица, вероятно, все еще ошивается в Долине Рудников.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Если ты наткнешься на них, дай мне знать.
};

func void DIA_Lester_Hello_WhoFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Диего, Милтен и КТО?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Только не говори мне, что ты ничего этого не помнишь. Фокусирующие камни - тролль - огромная куча руды, принадлежащая магам Воды?
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Я не знаю...
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Память к тебе еще вернется. Мне тоже понадобилось некоторое время, чтобы привести свою голову в порядок.
};


instance DIA_Lester_WhatHappened(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_WhatHappened_Condition;
	information = DIA_Lester_WhatHappened_Info;
	permanent = FALSE;
	description = "Что произошло?";
};


func int DIA_Lester_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//Что произошло?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//После того, как Спящий был повержен, все Братство как будто сошло с ума.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//Без своего хозяина они стали напоминать пустые оболочки.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//А ты? Что насчет тебя?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//Со мной тоже не все было ладно. У меня были кошмары, и даже галлюцинации. Но когда в моей голове более-менее прояснилось, я побежал оттуда.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//Как-то мне показалось, что я видел, как огромная черная тень налетела на группу беглецов и сожгла их в пепел, накрыв гигантским облаком огня.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//Тогда я даже подумал, что это прилетел дракон, чтобы убить меня.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//Ты видел что-нибудь еще?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//Нет - я вскочил и побежал!
};


instance DIA_Lester_MineColony(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_MineColony_Condition;
	information = DIA_Lester_MineColony_Info;
	permanent = FALSE;
	description = "Сколько ты уже скрываешься в этой долине?";
};


func int DIA_Lester_MineColony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_MineColony_Info()
{
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//Сколько ты уже скрываешься в этой долине?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//Точно не знаю. Может, неделю. Но есть еще кое-что:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//Когда я пришел сюда вечером, я взглянул на эту гору - там стояло всего несколько деревьев.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//А когда я посмотрел туда же на следующее утро, там уже стояла эта башня. Я готов поклясться, что раньше ее там не было. И с тех пор я не покидал эту долину.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//Ты имеешь в виду башню Ксардаса? Я знал, что он на многое способен, но создать башню вот так запросто...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//Ксардас, некромант? Он живет в этой башне? Мне это не нравится...
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//Не волнуйся, это он спас меня из храма Спящего. Он на нашей стороне.
};


instance DIA_Lester_SEND_XARDAS(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_SEND_XARDAS_Condition;
	information = DIA_Lester_SEND_XARDAS_Info;
	permanent = FALSE;
	description = "Ты должен рассказать Ксардасу об этой тени. Это может быть важно.";
};


func int DIA_Lester_SEND_XARDAS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_WhatHappened) && Npc_KnowsInfo(other,DIA_Lester_MineColony) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_SEND_XARDAS_Info()
{
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//Ты должен рассказать Ксардасу об этой тени. Это может быть важно.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//Ты не думаешь, что мне показалось? Ты хочешь сказать, что это действительно был...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//... дракон. Да.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//Ты опять лезешь в самое пекло. Я прав?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//Ну, не сказал бы, что в самое... пока...
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//(вздыхает) Хорошо, если это так важно, то я зайду к нему - но не сейчас.
		AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//Сейчас я собираюсь отдохнуть. Я все еще измотан после этого бегства из колонии.
	};
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//Мне кажется, у тебя большие планы. Увидимся позже у Ксардаса.
	AI_StopProcessInfos(self);
	if(Kapitel == 2)
	{
		Npc_ExchangeRoutine(self,"XARDAS");
		LesterMovedToXardas = TRUE;
	};
};


instance DIA_Addon_Lester_STADT(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_STADT_Condition;
	information = DIA_Addon_Lester_STADT_Info;
	description = "Я направляюсь в Хоринис. Что ты знаешь об этом городе?";
};


func int DIA_Addon_Lester_STADT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (PlayerEnteredCity == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_STADT_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_00");	//Я направляюсь в Хоринис. Что ты знаешь об этом городе?
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_01");	//Хоринис? Ну, это довольно большой морской порт.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_02");	//А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_03");	//Я должен поговорить с паладинами, которые обосновались в городе.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_04");	//(смеется) Неужели? Ха, да тебя не пустят даже в сам город, не то, что к паладинам.
};


instance DIA_Addon_Lester_Vorschlag(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_Vorschlag_Condition;
	information = DIA_Addon_Lester_Vorschlag_Info;
	description = "Может быть, ты знаешь способ, который поможет мне попасть в Хоринис?";
};


func int DIA_Addon_Lester_Vorschlag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lester_STADT) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (PlayerEnteredCity == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_00");	//Может быть, ты знаешь способ, который поможет мне попасть в Хоринис?
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_01");	//Знаю. Некоторое время назад я работал на старого алхимика по имени Константино.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_02");	//Он - довольно влиятельное лицо в городе. Ему удалось добиться того, чтобы стражники пропускали в город каждого, кто приносит ему редкие травы.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_03");	//Так что на самом деле все довольно просто. Тебе нужно собрать большую охапку растущих здесь повсюду растений, а затем сказать стражникам, что ты несешь их Константино.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_04");	//Но ты не должен собирать разные травы. Стражники не слишком сообразительны и в алхимии не разбираются.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_05");	//Чтобы они тебя пропустили, твоя охапка трав должна им понравиться.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_06");	//Думаю, десяти одинаковых растений будет достаточно.
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_07");	//Спасибо за совет.
	Log_CreateTopic(TOPIC_Addon_PickForConstantino,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino,LOG_Running);
	B_LogEntry(TOPIC_Addon_PickForConstantino,"Лестер говорит, что я могу пройти мимо городской стражи, если у меня будет 10 растений одного вида, и если я скажу им, что они предназначены для алхимика Константино.");
	MIS_Addon_Lester_PickForConstantino = LOG_Running;
};


instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS(C_Info)
{
	npc = PC_Psionic;
	nr = 5;
	condition = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;
	description = "Все сработало замечательно.";
};


func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition()
{
	if(MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00");	//Все сработало замечательно. Когда я сказал, что принес травы для Константино, стражники сразу же пропустили меня.
	AI_Output(self,other,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01");	//Как я и говорил. Я плохого не посоветую, друг мой.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lester_Perm(C_Info)
{
	npc = PC_Psionic;
	nr = 99;
	condition = DIA_Lester_Perm_Condition;
	information = DIA_Lester_Perm_Info;
	permanent = TRUE;
	description = "Что ты знаешь об этой местности?";
};


func int DIA_Lester_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (PlayerEnteredCity == FALSE) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_LESTER") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_Lester_Perm_Info()
{
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//Что ты знаешь об этой местности?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//Если ты пойдешь по этой тропинке, то попадешь на ферму. А еще чуть дальше начинается город.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//Но будь осторожен, по дороге тебе могут встретиться не только волки и крысы, но также гоблины и бандиты!
};


instance DIA_Lester_Sleep(C_Info)
{
	npc = PC_Psionic;
	nr = 99;
	condition = DIA_Lester_Sleep_Condition;
	information = DIA_Lester_Sleep_Info;
	permanent = TRUE;
	description = "Ты все еще чувствуешь себя измотанным?";
};


func int DIA_Lester_Sleep_Condition()
{
	if((Kapitel < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Lester_Sleep_Info()
{
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//Ты все еще чувствуешь себя измотанным?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//(зевает) Я рассказал Ксардасу все. А теперь я посплю немного. Денек...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//... другой... или даже больше.
	AI_StopProcessInfos(self);
};


instance DIA_Lester_BACKINTOWN(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_BACKINTOWN_Condition;
	information = DIA_Lester_BACKINTOWN_Info;
	important = TRUE;
};


func int DIA_Lester_BACKINTOWN_Condition()
{
	if((Npc_GetDistToWP(self,"LEVELCHANGE") <= 2000) && (Kapitel > 2) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Lester_BACKINTOWN_Info()
{
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//Эй, ты вернулся, наконец! Ты должен немедленно увидеться с Ксардасом. Возникли проблемы.
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//В это я готов поверить.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//После того, как ты ушел, здесь начался ад кромешный.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//Поговори с Ксардасом, он ждет тебя!
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_04");	//Он передал мне эту руну для тебя. Она поможет тебе добраться до него побыстрее. Увидимся там.
	CreateInvItems(self,ItRu_TeleportXardas,1);
	B_GiveInvItems(self,other,ItRu_TeleportXardas,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"XARDAS");
	LesterMovedToXardas = TRUE;
/*	if(Npc_KnowsInfo(other,DIA_Lester_SEND_XARDAS))
	{
		Npc_ExchangeRoutine(self,"XARDAS");
		LesterMovedToXardas = TRUE;
	}
	else
	{
		Npc_ExchangeRoutine(self,"START");
	};*/
};


instance DIA_Lester_PERM3(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_Lester_PERM3_Condition;
	information = DIA_Lester_PERM3_Info;
	permanent = TRUE;
	description = "Ты не очень-то хорошо выглядишь.";
};


func int DIA_Lester_PERM3_Condition()
{
	if((Kapitel >= 3) && (Lester_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Lester_PERM3_OneTime;

func void DIA_Lester_PERM3_Info()
{
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//Ты не очень-то хорошо выглядишь.
	if((hero.guild == GIL_KDF) && (DIA_Lester_PERM3_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//Я и чувствую себя не очень хорошо. Я совершенно обессилен, и еще эти постоянные головные боли...
		AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//Каждый раз, когда один из этих парней в черных рясах появляется здесь, они только усиливаются.
		if(SC_KnowsMadPsi == TRUE)
		{
			AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//И я могу сказать тебе почему.
			AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//Да? Боюсь, я не хочу этого знать.
			AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//Люди в черных рясах - или Ищущие, как мы, маги, называем их - были последователями сильного архидемона. Тебе это ни о чем не говорит?
			AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//Ммм. Нет. Если только ты не хочешь сказать мне, что...
			AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//Да, именно. Ищущие были последователями Спящего. Безумцы из секты отступников из Болотного Лагеря.
			AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//Это твои люди, Лестер. Бывшее Братство Спящего. Теперь они просто бездушные приспешники Зла.
			AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//У меня были подозрения, но я надеялся, что это не так. Ты хочешь сказать, он вернулся? Спящий опять здесь?
			AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//Хороший вопрос. Я знаю наверняка, только что я должен остановить Ищущих до того, как они станут слишком сильны.
			AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//Мне это не нравится, но я думаю, ты прав. Мне очень жаль, но с моей головой творится такое...
			B_LogEntry(TOPIC_DEMENTOREN,"Мои подозрения подтвердились. Даже у Лестера нет сомнений, что Ищущие - это последователи Спящего из старого лагеря в болотах.");
			B_GivePlayerXP(XP_Lester_KnowsMadPsi);
			DIA_Lester_PERM3_OneTime = TRUE;
		};
	}
	else if(Lester_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//Головные боли все еще мучают меня, но я надеюсь, эта проблема скоро будет решена.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//Так или иначе.
	}
	else if((hero.guild == GIL_DJG) && (Kapitel >= 4))
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//Мои головные боли стали просто невыносимыми. А теперь еще эти люди-ящеры постоянно нападают на меня. Я задаю себе вопрос - откуда они все взялись?
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//Эти головные боли все не прекращаются. Грядет что-то ужасное.
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//(вздыхает) Я думаю, мне лучше отдохнуть.
};


instance DIA_Lester_XARDASWEG(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_XARDASWEG_Condition;
	information = DIA_Lester_XARDASWEG_Info;
	description = "Где Ксардас?";
};


func int DIA_Lester_XARDASWEG_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info()
{
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");	//Где Ксардас?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//Он ушел, а его башню заняли эти демонические создания.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//Я думаю, он просто не хочет, чтобы кто-нибудь шарил в башне в его отсутствие.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//Куда он отправился?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//Он не сказал. Он только попросил меня передать тебе это письмо.
	CreateInvItems(self,ItWr_XardasLetterToOpenBook_MIS,1);
	B_GiveInvItems(self,other,ItWr_XardasLetterToOpenBook_MIS,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//Я прочел его. Извини. Мне было просто любопытно.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//И?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//Не знаю, я ничего не понял. Но мне ясно одно: Ксардаса мы теперь увидим нескоро.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//Я думаю, здесь стало слишком жарко для него, и он направился в горы.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Ксардас исчез. Лестер передал мне письмо, оставленное Ксардасом для меня.");
};


instance DIA_Lester_KnowWhereEnemy(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_KnowWhereEnemy_Condition;
	information = DIA_Lester_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я узнал, где скрывается враг.";
};


func int DIA_Lester_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lester_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//Я узнал, где скрывается враг.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//Не спрашивай меня, почему я так думаю, но мне кажется, я должен отправиться с тобой.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//Что ты хочешь сказать этим?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//Я не могу объяснить этого, но я знаю, что смогу получить ответ, только если отправлюсь с тобой.
	if(SCToldLesterHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"Лестер может обладать ценной информацией.");
		SCToldLesterHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//Извини, но корабль уже полон.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//Может, так и нужно. Может, моя судьба ничего не значит по сравнению с событиями, что ждут нас впереди.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//Ты знаешь, что тебе нужно делать. Сражайся со Злом - а обо мне не волнуйся.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//Моя судьба не важна.
	}
	else
	{
		Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy,"Я не могу взять тебя с собой.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy,"Тогда пойдем со мной, и получишь ответы на свои вопросы!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lester_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//Тогда пойдем со мной, и получишь ответы на свои вопросы!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//Встретимся в гавани. Я приду туда, когда буду готов.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//Поторопись. Времени у нас мало.
	B_JoinShip(self);
};

func void DIA_Lester_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//Я не могу взять тебя с собой.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//Понимаю. Я, вероятно, действительно мало чем смогу помочь тебе.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//Не важно, кого ты возьмешь с собой - главное, чтобы ты доверял им.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//И береги себя.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};


instance DIA_Lester_LeaveMyShip(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_LeaveMyShip_Condition;
	information = DIA_Lester_LeaveMyShip_Info;
	permanent = TRUE;
	description = "У меня все же нет места для тебя.";
};


func int DIA_Lester_LeaveMyShip_Condition()
{
	if((Lester_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//У меня все же нет места для тебя.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//Понимаю. Я, вероятно, сделал бы то же самое на твоем месте.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//Но если я понадоблюсь тебе, я буду рад помочь. Ты знаешь, где найти меня.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Lester_Nerver += 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lester_StillNeedYou(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_StillNeedYou_Condition;
	information = DIA_Lester_StillNeedYou_Info;
	permanent = TRUE;
	description = "Мне нужен друг, всегда готовый помочь.";
};


func int DIA_Lester_StillNeedYou_Condition()
{
	if(((Lester_IsOnBoard == LOG_OBSOLETE) || (Lester_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lester_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//Мне нужен друг, всегда готовый помочь.
	if((Lester_IsOnBoard == LOG_OBSOLETE) && (Lester_Nerver <= 2))
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//Я знал это! Мы будем сражаться рука об руку. Как в старые времена!
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//Берегись, Зло! Мы свернем тебе шею!
		B_JoinShip(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//Я думаю, будет лучше, если я все же останусь здесь. Удачи.
		AI_StopProcessInfos(self);
		Lester_IsOnBoard = LOG_FAILED;
	};
};

