
instance DIA_Thorben_EXIT(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 999;
	condition = DIA_Thorben_EXIT_Condition;
	information = DIA_Thorben_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thorben_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thorben_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Thorben_PICKPOCKET(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 900;
	condition = DIA_Thorben_PICKPOCKET_Condition;
	information = DIA_Thorben_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Thorben_PICKPOCKET_Condition()
{
	return C_Beklauen(30,28);
};

func void DIA_Thorben_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
	Info_AddChoice(DIA_Thorben_PICKPOCKET,Dialog_Back,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thorben_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};


instance DIA_Thorben_angepisst(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_angepisst_Condition;
	information = DIA_Thorben_angepisst_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Thorben_angepisst_Condition()
{
	if(Npc_IsDead(Gritta) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Thorben_angepisst_Info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//Ты убил мою Гритту. Я никогда не прощу тебя. Прочь с глаз моих, убийца!
	AI_StopProcessInfos(self);
};


instance DIA_Thorben_Hallo(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Hallo_Condition;
	information = DIA_Thorben_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thorben_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && !Npc_IsDead(Gritta))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Hallo_Info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//Ах! Новое лицо. Ты ведь не из Хориниса, да?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//Сейчас не лучшее время для путешествий. Бандиты повсюду, работы нет, а теперь еще и фермеры восстали.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//Каким ветром тебя сюда занесло?
};


instance DIA_Thorben_Arbeit(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Arbeit_Condition;
	information = DIA_Thorben_Arbeit_Info;
	permanent = FALSE;
	description = "Я ищу работу.";
};


func int DIA_Thorben_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Thorben_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//Я ищу работу.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//Ты что-нибудь знаешь о плотницком деле?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//Единственное, что я могу получить из дерева - это огонь.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//А что насчет замков?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//Нуууу...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//Извини, но я не могу взять тебя, если ты ничего не понимаешь в моем ремесле.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//И у меня нет денег, чтобы платить ученику.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Торбен не примет меня в ученики.");
};


instance DIA_Thorben_OtherMasters(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_OtherMasters_Condition;
	information = DIA_Thorben_OtherMasters_Info;
	permanent = FALSE;
	description = "А что, если я поступлю в ученики к одному из других здешних мастеров?";
};


func int DIA_Thorben_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//А что, если я поступлю в ученики к одному из других здешних мастеров?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//Хорошо, я дам свое одобрение.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//Но тебе нужно сначала получить благословение богов.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//Скажи, ты верующий человек?
	Info_ClearChoices(DIA_Thorben_OtherMasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(DIA_Thorben_OtherMasters,"Ну, если ты это имеешь в виду, я регулярно молюсь...",DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice(DIA_Thorben_OtherMasters,"Да. Я образцовый верующий, мастер Торбен.",DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Тогда иди к Ватрасу, жрецу Аданоса, пусть он тебе даст благословение.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//Он также подскажет тебе, где найти жреца Инноса. Ты должен получить и его благословение.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//А когда ты получишь благословение богов, я проголосую за тебя.
	MIS_Thorben_GetBlessings = LOG_Running;
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_Running);
	B_LogEntry(TOPIC_Thorben,"Торбен даст мне свое одобрение, если жрецы Аданоса и Инноса дадут мне свое благословение.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Да. Я образцовый верующий, мастер Торбен.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//Ну, если ты это имеешь в виду, я регулярно молюсь...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//Понимаю!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//Человек, который занимается ремеслом без благословения богов, никогда не получит моего одобрения.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Проси богов о прощении твоих прегрешений.
	B_Thorben_GetBlessings();
	Info_ClearChoices(DIA_Thorben_OtherMasters);
};


instance DIA_Thorben_ZUSTIMMUNG(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 1;
	condition = DIA_Thorben_ZUSTIMMUNG_Condition;
	information = DIA_Thorben_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Как насчет одобрения, мастер?";
};


func int DIA_Thorben_ZUSTIMMUNG_Condition()
{
	if((Player_IsApprentice == APP_NONE) && (MIS_Thorben_GetBlessings == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thorben_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//Как насчет одобрения, мастер?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Ватрас дал тебе благословение?
	if(Vatras_Segen > 0)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Да.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//А благословение жреца Инноса ты получил?
		if((Daron_Segen == TRUE) || (Isgaroth_Segen == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Да, получил.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//Тогда ты получишь и мое благословение. Не важно, какому пути ты решил следовать, гордись своим ремеслом, мой мальчик!
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP(XP_Zustimmung);
			Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
			B_LogEntry(TOPIC_Lehrling,"Торбен даст мне свое одобрение, если я захочу стать учеником.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Нет. Еще нет...
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//Ты знаешь мои условия. Ты можешь заниматься ремеслом только с благословения богов.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Еще нет...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//Тогда я не понимаю, зачем ты опять пришел ко мне. Ты знаешь мои условия.
	};
};


instance DIA_Thorben_Locksmith(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Locksmith_Condition;
	information = DIA_Thorben_Locksmith_Info;
	permanent = FALSE;
	description = "Так ты разбираешься в замках?";
};


func int DIA_Thorben_Locksmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Locksmith_Info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//Так ты разбираешься в замках?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//Какой смысл в хорошем сундуке без хорошего замка?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//Я делаю свои собственные замки. Так, по крайней мере, я могу быть уверен, что не делаю сундуки, которые ни от чего не защищают.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//Плохо сделанный замок легко сломать. А в Хоринисе очень много воров. Особенно в последнее время!
};


instance DIA_Thorben_Schuldenbuch(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Schuldenbuch_Condition;
	information = DIA_Thorben_Schuldenbuch_Info;
	permanent = FALSE;
	description = "У меня есть гроссбух Лемара...";
};


func int DIA_Thorben_Schuldenbuch_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) && ((SchuldBuchNamesKnown == TRUE) || Npc_KnowsInfo(other,DIA_Thorben_Gritta)))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//У меня есть гроссбух Лемара...
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//(подозрительно) Где ты взял его?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//Тебя должно интересовать не где я взял его, а то, что в нем записано твое имя.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Дай его сюда!
//	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//А что ты готов дать за него?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//У меня нет денег. Но ты можешь рассчитывать на мою сердечную благодарность.
//	B_GivePlayerXP(XP_Schuldenbuch);
};


instance DIA_Thorben_GiveBook(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_GiveBook_Condition;
	information = DIA_Thorben_GiveBook_Info;
	permanent = FALSE;
	description = "Вот твоя книга.";
};


func int DIA_Thorben_GiveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Schuldenbuch) && Npc_HasItems(other,ItWr_Schuldenbuch))
	{
		return TRUE;
	};
};

func void DIA_Thorben_GiveBook_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Вот твоя книга.
	if(ClassicLehmarBook == FALSE)
	{
		AI_PrintScreen("Долговая книга отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItWr_Schuldenbuch);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	};
	if(Thorben_TeachPlayer == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Если бы не ты, я бы платил Лемару до конца своих дней.
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
	B_GivePlayerXP(XP_Schuldenbuch);
};

instance DIA_Thorben_PleaseTeach(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_PleaseTeach_Condition;
	information = DIA_Thorben_PleaseTeach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня вскрывать замки отмычками?";
};


func int DIA_Thorben_PleaseTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Locksmith) && (Thorben_TeachPlayer == FALSE) && !Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		return TRUE;
	};
};

func void DIA_Thorben_PleaseTeach_Info()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//Ты можешь научить меня вскрывать замки отмычками?
	if(Npc_KnowsInfo(other,DIA_Thorben_GiveBook) || Npc_KnowsInfo(other,DIA_Addon_Thorben_ElvrichIsBack))
	{
		if(Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
		{
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Если бы не ты, я бы платил Лемару до конца своих дней.
		};
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Я обучу тебя тому, что ты хочешь знать.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Торбен может обучить меня пользоваться отмычками.");
		Thorben_TeachPlayer = TRUE;
	}
	else if(Thorben_GotGold == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//Ты принес мне 100 золотых монет. Это широкий жест с твоей стороны.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//Мне очень стыдно, но я вынужден попросить у тебя еще.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//Если я не отдам долг Лемару в ближайшее время, он натравит на меня своих головорезов.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//Дай мне еще 100 золотых, и я обучу тебя.
		Info_ClearChoices(DIA_Thorben_PleaseTeach);
		Info_AddChoice(DIA_Thorben_PleaseTeach,"Может быть, позже...",DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice(DIA_Thorben_PleaseTeach,"Отлично. Вот 100 золотых.",DIA_Thorben_PleaseTeach_Pay100);
	}
	else if((MIS_Matteo_Gold == LOG_SUCCESS) && (Gritta_WantPay == TRUE) && (Npc_HasItems(Gritta,ItMi_Gold) >= 80))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//Ты заплатил долг Гритты Маттео. Похоже, ты хороший человек. Я обучу тебя тому, что ты хочешь знать.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//Однако я не могу сделать это бесплатно.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//Сколько ты возьмешь?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 золотых монет.
		Info_ClearChoices(DIA_Thorben_PleaseTeach);
		Info_AddChoice(DIA_Thorben_PleaseTeach,"Может быть, позже...",DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice(DIA_Thorben_PleaseTeach,"Отлично. Вот 200 золотых.",DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Хмм... я не знаю, можно ли тебе доверять.
		if((other.guild != GIL_KDF) && (other.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//Боюсь, ты можешь оказаться одним из этих бездельников, которые приходят в город, только чтобы очистить сундуки честных людей.
		};
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//Я ничему не буду учить тебя, пока не буду уверен, что ты честный человек.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//Отлично. Вот 200 золотых.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//Эти деньги очень помогут мне. Мы приступим, как только ты будешь готов.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Торбен может обучить меня пользоваться отмычками.");
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//У тебя нет 200 монет. А мне нужна вся сумма.
	};
	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//Отлично. Вот 100 золотых.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//В таком случае, мы можем начать, когда ты будешь готов.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Торбен может обучить меня пользоваться отмычками.");
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//Эй, у тебя же нет 100 монет.
	};
	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Later()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Later_15_00");	//Может быть, позже...
	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};


instance DIA_Thorben_Teach(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 2;
	condition = DIA_Thorben_Teach_Condition;
	information = DIA_Thorben_Teach_Info;
	permanent = TRUE;
	description = B_BuildLearnString("Взлом замков",B_GetLearnCostTalent(other,NPC_TALENT_PICKLOCK,1));
};


func int DIA_Thorben_Teach_Condition()
{
	if((Thorben_TeachPlayer == TRUE) && !Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Teach_Info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Научи меня вскрывать замки!
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//Все, что тебе нужно - это отмычка. Если ты будешь осторожно поворачивать ее влево и вправо в замке, ты сможешь вскрыть его.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//Но если ты будешь вращать отмычку слишком сильно или слишком быстро в неправильном направлении, она сломается.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//Чем более опытным ты будешь становиться, тем меньше отмычек тебе понадобится. Вот, пожалуй, и все, что тебе нужно знать.
	};
};


var int Thorben_TradeLog;

instance DIA_Thorben_TRADE(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 3;
	condition = DIA_Thorben_TRADE_Condition;
	information = DIA_Thorben_TRADE_Info;
	permanent = TRUE;
	description = "Ты можешь продать мне отмычки?";
	trade = TRUE;
};


func int DIA_Thorben_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_Info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//Ты можешь продать мне отмычки?
	B_GiveTradeInv(self);
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//Если еще остались...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//Хорошо. Но они ничем не помогут тебе, пока ты не научишься пользоваться ими.
	};
	if(!Npc_HasItems(self,ItKe_Lockpick) && (Kapitel > Dietrichgeben))
	{
		CreateInvItems(self,ItKe_Lockpick,5);
		Dietrichgeben += 1;
	};
	if(Thorben_TradeLog == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Плотник Торбен продает отмычки.");
		Thorben_TradeLog = TRUE;
	};
	Trade_IsActive = TRUE;
};


instance DIA_Addon_Thorben_MissingPeople(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Addon_Thorben_MissingPeople_Condition;
	information = DIA_Addon_Thorben_MissingPeople_Info;
	description = "У тебя раньше был ученик?";
};


func int DIA_Addon_Thorben_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Arbeit) && (SC_HearedAboutMissingPeople == TRUE) && (Elvrich_GoesBack2Thorben == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//У тебя раньше был ученик?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//Да, и совсем недавно.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//И что случилось?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//Его имя Элврих. Он мой племянник.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//Я был им очень доволен, но однажды он просто взял и не пришел на работу.
	MIS_Thorben_BringElvrichBack = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Элврих, ученик плотника Торбена, пропал.");
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,Dialog_Back,DIA_Addon_Thorben_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"Ты не обращался к ополчению?",DIA_Addon_Thorben_MissingPeople_Mil);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"Как давно его не было?",DIA_Addon_Thorben_MissingPeople_wann);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople,"И где же Элврих сейчас?",DIA_Addon_Thorben_MissingPeople_where);
};

func void DIA_Addon_Thorben_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//Как давно его не было?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//Около двух недель.
};

func void DIA_Addon_Thorben_MissingPeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//И где же Элврих сейчас?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//Откуда мне знать? В последнее время он частенько появлялся у этого грязного борделя в порту.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//Не удивлюсь, если он и сейчас развлекается в постели с какой-нибудь шлюхой.
};

func void DIA_Addon_Thorben_MissingPeople_Mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//Ты не обращался к ополчению?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//Обращался, конечно. Я попросил их поймать этого лентяя и проследить, чтобы он вернулся на работу. Но я уже об этом жалею.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//Пусть делает все, что хочет. Рано или поздно он поймет, что без достойной работы в Хоринисе делать нечего.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//(цинично) Неужели?
};


instance DIA_Addon_Thorben_ElvrichIsBack(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information = DIA_Addon_Thorben_ElvrichIsBack_Info;
	description = "Элврих снова будет на тебя работать.";
};


func int DIA_Addon_Thorben_ElvrichIsBack_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && !Npc_IsDead(Elvrich))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//Элврих снова будет на тебя работать.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//Будем надеяться, что он больше не будет убегать, как только очередная девка покрутит задницей перед его носом.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//Возьми это золото в качестве награды за возвращение ученика.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	Elvrich.flags = 0;
	Elvrich.aivar[AIV_ToughGuy] = FALSE;
};


instance DIA_Thorben_Paladine(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Paladine_Condition;
	information = DIA_Thorben_Paladine_Info;
	permanent = FALSE;
	description = "Что ты знаешь о паладинах?";
};


func int DIA_Thorben_Paladine_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Thorben_Paladine_Info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//Что ты знаешь о паладинах?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//Немногое. Они прибыли на корабле с материка две недели назад.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//С тех пор они заперлись в верхнем квартале города.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Никто толком не знает, зачем они прибыли.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Многие опасаются нападения орков.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//А я думаю, что они здесь, чтобы подавить восстание фермеров.
};


instance DIA_Thorben_Bauernaufstand(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 4;
	condition = DIA_Thorben_Bauernaufstand_Condition;
	information = DIA_Thorben_Bauernaufstand_Info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о восстании фермеров?";
};


func int DIA_Thorben_Bauernaufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//Ты знаешь что-нибудь о восстании фермеров?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Ходят слухи, что лендлорд Онар нанял наемников, чтобы стряхнуть со своей шеи королевские войска.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//Он, вероятно, устал отдавать весь свой урожай паладинам и ополчению.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//Ну а в городе после этого стали расти цены на продовольствие.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Ферма Онара находится далеко на восток отсюда. Мы не знаем, были там сражения или нет.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//Если ты хочешь узнать больше, поспрашивай торговцев на рыночной пощади. Они лучше знают обстановку на острове, чем я.
};


instance DIA_Thorben_Gritta(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_Gritta_Condition;
	information = DIA_Thorben_Gritta_Info;
	permanent = FALSE;
	description = "Я насчет Гритты...";
};


func int DIA_Thorben_Gritta_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && !Npc_IsDead(Gritta))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Gritta_Info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//Я насчет Гритты...
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//Моей племянницы? Какое тебе дело до нее? Это насчет долга, да?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//Она должна 100 золотых торговцу Маттео.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//Скажи мне, что это не так! С тех пор, как она живет со мной, от нее одни проблемы!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//Она задолжала почти всем торговцам города.
	if(!Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//Мне пришлось занять 200 золотых у ростовщика Лемара, чтобы расплатиться с ее долгами! И вот теперь опять!
	};
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Гритта должна быть в доме.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//Иди, поговори с ней. Но я скажу тебе честно: у нее нет ни ОДНОЙ золотой монеты.
	if(Npc_HasItems(Gritta,ItMi_Gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//Посмотрим...
	};
};


instance DIA_Thorben_GrittaHatteGold(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 5;
	condition = DIA_Thorben_GrittaHatteGold_Condition;
	information = DIA_Thorben_GrittaHatteGold_Info;
	permanent = FALSE;
	description = "У твоей племянницы было 100 золотых монет.";
};


func int DIA_Thorben_GrittaHatteGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thorben_Gritta) && (Npc_HasItems(Gritta,ItMi_Gold) < 80) && !Npc_IsDead(Gritta))
	{
		return TRUE;
	};
};

func void DIA_Thorben_GrittaHatteGold_Info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//У твоей племянницы было 100 золотых монет.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//ЧТО? Ах она змея - это было МОЕ золото! Она взяла его из моего сундука.
	if(!Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Отдай мне его! Я должен сначала заплатить Лемару. Маттео может подождать!
	};
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Я уже отдал золото Маттео!",DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Нет. Маттео получит свои деньги назад.",DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold,"Вот твое золото.",DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if(Gritta_GoldGiven == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//И, насколько я знаю эту гадюку, я уверен, что она побежит прямо к стражникам и обвинит тебя тоже!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//Я должен уладить этот вопрос.
		B_DeletePetzCrime(Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//Я уже отдал золото Маттео!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//Черт! Ну, ладно, долг есть долг. По крайней мере, ты не присвоил это золото. Думаю, мне нужно поблагодарить тебя за это.
	B_Thorben_DeletePetzCrimeGritta();
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//Нет. Маттео получит свои деньги назад.
	if(!Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//Ты просто убиваешь меня. Лемар не отличается великодушием, когда дело доходит до долгов.
	};
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//Но, по крайней мере, ты расплатишься с долгами моей племянницы. Думаю, мне нужно поблагодарить тебя за это.
	B_Thorben_DeletePetzCrimeGritta();
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Вот твое золото.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	if(!Npc_KnowsInfo(other,DIA_Thorben_GiveBook))
	{
		AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//Спасибо! Теперь, у меня есть хотя бы часть денег, которые я должен Лемару.
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//Не могу поверить, что у нее хватило наглости взять мое золото!
	B_Thorben_DeletePetzCrimeGritta();
	Thorben_GotGold = TRUE;
	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};


instance DIA_Thorben_PICKPOCKET_Book(C_Info)
{
	npc = VLK_462_Thorben;
	nr = 700;
	condition = DIA_Thorben_PICKPOCKET_Book_Condition;
	information = DIA_Thorben_PICKPOCKET_Book_Info;
	permanent = TRUE;
	description = "(украсть долговую книгу будет довольно просто)";
};


func int DIA_Thorben_PICKPOCKET_Book_Condition()
{
	if((ClassicLehmarBook == FALSE) && (SchuldBuch_Stolen_Thorben == FALSE) && Npc_KnowsInfo(other,DIA_Thorben_GiveBook) && Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 20))
	{
		return TRUE;
	};
};

func void DIA_Thorben_PICKPOCKET_Book_Info()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET_Book);
	Info_AddChoice(DIA_Thorben_PICKPOCKET_Book,Dialog_Back,DIA_Thorben_PICKPOCKET_Book_BACK);
	Info_AddChoice(DIA_Thorben_PICKPOCKET_Book,DIALOG_PICKPOCKET,DIA_Thorben_PICKPOCKET_Book_DoIt);
};

func void DIA_Thorben_PICKPOCKET_Book_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		CreateInvItem(other,ItWr_Schuldenbuch);
		AI_PrintScreen("Долговая книга получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		B_GiveThiefXP();
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketSuccess));
		SchuldBuch_Stolen_Thorben = TRUE;
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Thorben_PICKPOCKET_Book);
};

func void DIA_Thorben_PICKPOCKET_Book_BACK()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET_Book);
};

