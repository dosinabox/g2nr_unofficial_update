
instance DIA_Ignaz_EXIT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 999;
	condition = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_Hallo(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ignaz_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Hallo_Info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//Ах - ты заглянул как раз вовремя. Мне нужен ассистент для магического эксперимента.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Я уверен, что тебе не терпится оказать мне услугу во имя науки.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Полегче, друг мой. Сначала скажи, в чем он заключается.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Я разработал новое заклинание. Заклинание Забвения.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//Я уже придумал, как можно использовать его, но у меня нет времени на проведение одного последнего теста.
};


instance DIA_Ignaz_Traenke(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent = FALSE;
	description = "И что я получу за то, что помогу тебе?";
};


func int DIA_Ignaz_Traenke_Condition()
{
	if(MIS_Ignaz_Charm != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Traenke_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//И что я получу за то, что помогу тебе?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//Я мог бы обучить тебя искусству приготовления зелий.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Я знаю рецепты лечебной эссенции и эссенции маны, а также зелья ускорения.
};


instance DIA_Ignaz_Experiment(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 4;
	condition = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent = FALSE;
	description = "Расскажи мне подробнее об этом эксперименте и самом заклинании.";
};


func int DIA_Ignaz_Experiment_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_Experiment_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Расскажи мне подробнее об этом эксперименте и самом заклинании.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//Это заклинание позволяет заставить кого-нибудь забыть некоторые события.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//Пока, я выяснил только, что оно работает, когда объект этого заклинания находится в ярости - например, если он только что был сбит с ног или ограблен.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//И даже несмотря на то, что эта неприятность произошла с ним только что, он все забудет.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//То есть, я должен сбить кого-нибудь с ног и наложить на него это заклинание?
	AI_Output(other,self,"DIA_Ignaz_Add_15_00");	//Это имеет смысл, только если жертва ДЕЙСТВИТЕЛЬНО очень зла после драки.
	AI_Output(other,self,"DIA_Ignaz_Add_15_01");	//(себе под нос) Здесь, в портовом квартале, люди привычны к дракам. Мне лучше поискать жертву где-нибудь в другом месте...
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Да, ты все правильно понимаешь. Но чтобы разозлить кого-нибудь, достаточно просто атаковать - вовсе нет необходимости сбивать его с ног.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Только ты должен проделать все это без свидетелей - если неподалеку будут находиться другие люди, у тебя обязательно возникнут проблемы с лордом Андрэ.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Также не имеет смысла налагать это заклинание на того, кто атакует тебя. Выжди подходящий момент.
};


instance DIA_Ignaz_teilnehmen(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 5;
	condition = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent = FALSE;
	description = "Хорошо, я испытаю это заклинание.";
};


func int DIA_Ignaz_teilnehmen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ignaz_Experiment))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_teilnehmen_Info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Хорошо, я испытаю это заклинание.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//Тогда возьми этот свиток и найди подходящего подопытного кролика.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//А когда закончишь, возвращайся и расскажи мне как все прошло.
	B_GiveInvItems(self,other,ItSc_Charm,1);
	MIS_Ignaz_Charm = LOG_Running;
	Log_CreateTopic(TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Running);
//	B_LogEntry(TOPIC_Ignaz,"Я должен испытать новое заклинание Игнаца. Это заклинание называется Забвение. Иногда кто-нибудь выходит из себя в результате драки или по другой причине и больше не хочет говорить со мной. Это идеальный момент для использования этого заклинания.");
//	B_LogEntry(TOPIC_Ignaz,"Это идеальная возможность испытать заклинание. Подопытный также забудет доложить о произошедшем властям. Я не думаю, что кто-либо в портовом квартале сильно обидится, если я вырублю его.");
	B_LogEntry(TOPIC_Ignaz,"Я должен испытать новое заклинание Игнаца. Это заклинание называется Забвение. Иногда кто-нибудь выходит из себя в результате драки или по другой причине и больше не хочет говорить со мной. Это идеальный момент для использования этого заклинания.");
	Log_AddEntry(TOPIC_Ignaz,"Подопытный также забудет доложить о произошедшем властям, но не должно быть ни одного свидетеля нашей драки или ссоры. Думаю, нет смысла испытывать заклинание в портовом квартале: драки там - привычное дело.");
	AI_StopProcessInfos(self);
};


func void B_IgnazScrolls()
{
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Если тебе нужны еще свитки с этим заклинанием, ты можешь купить их у меня.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Игнац продает различные свитки и алхимические принадлежности в портовом квартале.");
};

instance DIA_Ignaz_Running(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent = FALSE;
	description = "Насчет эксперимента...";
};


func int DIA_Ignaz_Running_Condition()
{
	if((MIS_Ignaz_Charm == LOG_Running) && (Charm_Test == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Running_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//Насчет эксперимента...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//У тебя получилось, да? Или ты просто попусту истратил мой свиток?
	B_IgnazScrolls();
};


instance DIA_Ignaz_Danach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent = FALSE;
	description = "Я использовал свиток.";
};


func int DIA_Ignaz_Danach_Condition()
{
	if((Charm_Test == TRUE) && (MIS_Ignaz_Charm == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Danach_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//Я использовал свиток.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Отлично, отлично. У тебя все получилось?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Да, заклинание сработало.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Превосходно. Может, с точки зрения науки это не очень большое достижение, но для меня оно очень много значит!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Теперь я могу уделить тебе время и обучить тебя искусству алхимии.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Я также могу продать тебе что-нибудь полезное, если ты, конечно, хочешь этого.
	Ignaz_TeachAlchemy = TRUE;
	if(!Npc_KnowsInfo(other,DIA_Ignaz_Running))
	{
		B_IgnazScrolls();
	};
	if(DIA_Kardif_Lernen_permanent == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Игнац может показать мне рецепты приготовления зелий. Он живет в портовом квартале.");
	};
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP(XP_MIS_Ignaz_Charm);
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_Trade(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Ignaz_Trade_Condition()
{
	if((MIS_Ignaz_Charm == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Ignaz_Running))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Trade_Info()
{
	if(Ignaz_flag == TRUE)
	{
		B_ClearAlchemyInv(self);
		if(Ignaz_flasks > 0)
		{
			CreateInvItems(self,ItMi_Flask,Ignaz_flasks);
		};
		Ignaz_flag = FALSE;
	};
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Ignaz_Teach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent = TRUE;
	description = "Обучи меня искусству алхимии.";
};


var int DIA_Ignaz_Teach_permanent;

func int DIA_Ignaz_Teach_Condition()
{
	if((DIA_Ignaz_Teach_permanent == FALSE) && (Ignaz_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Обучи меня искусству алхимии.
	if((PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE))
	{
		Info_ClearChoices(DIA_Ignaz_Teach);
		Info_AddChoice(DIA_Ignaz_Teach,Dialog_Back,DIA_Ignaz_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString(NAME_Speed_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente += 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente += 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ignaz_Teach_Health);
		talente += 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain_Ignaz == FALSE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//Также тебе понадобятся различные растения и другие ингредиенты.
			Alchemy_Explain_Ignaz = TRUE;
		};
		AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Что ты хочешь узнать?
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//Ты уже знаешь все, чему я мог обучить тебя.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};

func void DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices(DIA_Ignaz_Teach);
};

