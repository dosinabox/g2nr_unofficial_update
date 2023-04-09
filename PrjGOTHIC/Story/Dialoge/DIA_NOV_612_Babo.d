
instance DIA_Babo_Kap1_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Babo_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Hello_Info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//(испуганно) Привет, ты тоже новичок здесь, да?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Да. Ты давно здесь?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//Четыре недели. Тебе уже выдали боевой посох?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Пока нет.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//Тогда возьми вот этот. Мы, послушники, всегда ходим с посохом, чтобы показать, что мы способны защитить себя. Ты умеешь сражаться?
	CreateInvItem(other,ItMw_1h_Nov_Mace);
	AI_PrintScreen("Боевой посох получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//Ну, мне случалось пользоваться оружием...
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//Если хочешь, я могу обучить тебя кое-чему. Но у меня есть просьба...
};


instance DIA_Babo_Anliegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent = FALSE;
	description = "Что за просьба?";
};


func int DIA_Babo_Anliegen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_Hello) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Anliegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//Что за просьба?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//Ну, один из паладинов, Сержио, сейчас живет в монастыре.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//Если ты сможешь убедить его дать мне несколько уроков, тогда я потренирую тебя.
	if(!Npc_IsDead(Sergio))
	{
		AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//Я посмотрю, что можно сделать.
		MIS_Babo_Training = LOG_Running;
		Log_CreateTopic(Topic_BaboTrain,LOG_MISSION);
		Log_SetTopicStatus(Topic_BaboTrain,LOG_Running);
		B_LogEntry(Topic_BaboTrain,"Если я смогу убедить паладина Сержио немного потренироваться с Бабо, он научит меня искусству обращения с двуручным оружием.");
	}
	else
	{
		DIA_Common_HeIsDead();
		//TODO озвучить
		AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01_add");	//(ошеломленно) Что?! Что это все значит?
		DIA_Common_EverythingWillBeAlright();
	};
};


func void B_BaboIsTeacher()
{
	if(Babo_TeachPlayer == FALSE)
	{
		AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//Если хочешь, я также могу показать тебе несколько секретов боевого искусства.
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Бабо может обучить меня искусству обращения с двуручным оружием.");
		Babo_TeachPlayer = TRUE;
	};
};

instance DIA_Babo_Sergio(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent = FALSE;
	description = "Я поговорил с Сержио. Он будет тренировать тебя по 2 часа каждое утро, с 5 часов.";
};


func int DIA_Babo_Sergio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sergio_Babo) && !Npc_IsDead(Sergio))
	{
		return TRUE;
	};
};

func void DIA_Babo_Sergio_Info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//Я поговорил с Сержио. Он будет тренировать тебя по 2 часа каждое утро, с 5 часов.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//Спасибо! Какая честь для меня!
	B_BaboIsTeacher();
	B_GivePlayerXP(XP_Ambient * 2);
};


var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;

func void B_BuildLearnDialog_Babo()
{
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Babo)
	{
		Info_ClearChoices(DIA_Babo_Teach);
		Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
		Info_AddChoice(DIA_Babo_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
		Info_AddChoice(DIA_Babo_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Babo)
		{
			DIA_Morgan_Teacher_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Babo)),-1,53,FONT_Screen,2);
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//Ты знаешь больше о двуручном оружии, чем я мог бы научить тебя.
		AI_StopProcessInfos(self);
	};
};

func void B_BaboTeachComment()
{
	if(Babo_Labercount == 0)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Сражайся за Инноса. Иннос - наша жизнь, и твоя вера придаст тебе силы.
	}
	else if(Babo_Labercount == 1)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//Слуга Инноса никогда не провоцирует противника - он удивляет его!
	}
	else if(Babo_Labercount == 2)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//Куда бы ты ни шел - всегда бери с собой свой посох.
	}
	else if(Babo_Labercount == 3)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//Слуга Инноса всегда готов к бою. Если у тебя нет никакой магии, твой посох - твой самый важный элемент обороны.
	}
	else if(Babo_Labercount == 4)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//Слуга Инноса сражается не только своим посохом, но также и своим сердцем.
	}
	else if(Babo_Labercount == 5)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//Ты должен понимать, до какого предела ты можешь отступить.
	}
	else if(Babo_Labercount == 6)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Помни, ты хорошо сражаешься, когда ты контролируешь противника и не даешь ему шанса контролировать себя.
	}
	else if(Babo_Labercount == 7)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//Когда ты бросаешь бой, ты только теряешь.
	};
	Babo_Labercount += 1;
	if(Babo_Labercount > 7)
	{
		Babo_Labercount = 0;
	};
};

instance DIA_Babo_Teach(C_Info)
{
	npc = NOV_612_Babo;
	nr = 100;
	condition = DIA_Babo_Teach_Condition;
	information = DIA_Babo_Teach_Info;
	permanent = TRUE;
	description = "Я готов к обучению.";
};


func int DIA_Babo_Teach_Condition()
{
	if((Babo_TeachPlayer == TRUE) && (DIA_Babo_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babo_Teach_Info()
{
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Я готов к обучению.
	B_BuildLearnDialog_Babo();
};

func void DIA_Babo_Teach_Back()
{
	Info_ClearChoices(DIA_Babo_Teach);
};

func void DIA_Babo_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Babo))
	{
		B_BaboTeachComment();
		B_BuildLearnDialog_Babo();
	};
};

func void DIA_Babo_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Babo))
	{
		B_BaboTeachComment();
		B_BuildLearnDialog_Babo();
	};
};

instance DIA_Babo_Wurst(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Wurst_Condition;
	information = DIA_Babo_Wurst_Info;
	permanent = FALSE;
	description = "Вот, держи колбасу.";
};


func int DIA_Babo_Wurst_Condition()
{
	if(C_CanFeedNOV(self))
	{
		return TRUE;
	};
};

func void DIA_Babo_Wurst_Info()
{
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Вот, держи колбасу.
	AI_WaitTillEnd(self,other);
	B_FeedNOV(self);
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//У-у-у, баранья колбаса, отлично! Какой потрясающий вкус - м-м-м, дай мне еще одну колбаску!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Тогда у меня не хватит колбасы для других.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//У тебя все равно на одну колбаску больше, чем нужно. Ну, на ту, что предназначена для тебя. Мы же друзья. Что мы будем делить какую-то колбасу?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//Ну же, я дам тебе за нее свиток 'Огненная стрела'.
	Info_ClearChoices(DIA_Babo_Wurst);
	if(Npc_HasItems(other,ItFo_Schafswurst))
	{
		Info_AddChoice(DIA_Babo_Wurst,"Хорошо, держи еще одну колбасу.",DIA_Babo_Wurst_JA);
	};
	Info_AddChoice(DIA_Babo_Wurst,"Нет, я не сделаю этого.",DIA_Babo_Wurst_NEIN);
};

func void DIA_Babo_Wurst_JA()
{
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//Хорошо, держи еще одну колбасу.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//Отлично. Вот твой свиток.
	B_GiveInvItems(self,other,ItSc_Firebolt,1);
	Info_ClearChoices(DIA_Babo_Wurst);
};

func void DIA_Babo_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//Нет, я не сделаю этого.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Слушай, ты что, один из тех людей, что очень щепетильно относятся ко всему, а?
	Info_ClearChoices(DIA_Babo_Wurst);
};


instance DIA_Babo_YouAndAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent = FALSE;
	description = "Что произошло между тобой и Агоном?";
};


func int DIA_Babo_YouAndAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_YouAndAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//Что произошло между тобой и Агоном?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Ох, мы поспорили о том, как нужно ухаживать за огненной крапивой.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Агон поливал их так, что корни бедных растений почти совсем сгнили.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//А когда они сгнили совсем, он обвинил в этом меня.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//Теперь меня постоянно заставляют подметать двор в наказание.
};


instance DIA_Babo_WhyDidAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 4;
	condition = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent = FALSE;
	description = "Зачем Агон сделал это?";
};


func int DIA_Babo_WhyDidAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_WhyDidAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Зачем Агон сделал это?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//Тебе лучше самому спросить его об этом. Я думаю, он просто не выносит, когда кто-то оказывается лучше его.
};


instance DIA_Babo_PlantLore(C_Info)
{
	npc = NOV_612_Babo;
	nr = 5;
	condition = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent = FALSE;
	description = "Похоже, ты хорошо разбираешься в растениях?";
};


func int DIA_Babo_PlantLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_PlantLore_Info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//Похоже, ты хорошо разбираешься в растениях?
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//У нас в семье была делянка, где мы выращивали различные травы, и я научился кое-чему у дедушки.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//Я бы так хотел опять работать в саду.
	MIS_HelpBabo = LOG_Running;
	Log_CreateTopic(Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboGaertner,LOG_Running);
	B_LogEntry(Topic_BaboGaertner,"Бабо предпочел бы пропалывать травы, а не подметать двор.");
};


instance DIA_Babo_Fegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent = FALSE;
	description = "Я должен подметать кельи послушников.";
};


func int DIA_Babo_Fegen_Condition()
{
	if(MIS_ParlanFegen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Babo_Fegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//Я должен подметать кельи послушников.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//Ты взвалил на себя слишком много работы. Знаешь что - я помогу тебе. Тебе ни за что не справиться одному.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//Но мне очень нужен свиток с заклинанием 'Кулак ветра'. Знаешь, мне повезло, и мне было позволено прочесть книгу о нем.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//И теперь, естественно, я хочу испытать это заклинание. Так что если ты мне принесешь этот свиток, я помогу тебе.
	B_LogEntry(Topic_ParlanFegen,"Бабо поможет мне подмести кельи послушников, если я принесу ему свиток с заклинанием 'Кулак ветра'.");
};


instance DIA_Babo_Windfaust(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent = TRUE;
	description = "Насчет свитка...";
};


var int DIA_Babo_Windfaust_permanent;

func int DIA_Babo_Windfaust_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && Npc_KnowsInfo(other,DIA_Babo_Fegen) && (DIA_Babo_Windfaust_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babo_Windfaust_Info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//Насчет свитка...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//У тебя есть свиток 'Кулак ветра' для меня?
	if(B_GiveInvItems(other,self,ItSc_Windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Вот свиток, который ты хотел получить.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//Отлично. Тогда я помогу тебе подметать кельи.
		NOV_Helfer += 1;
		DIA_Babo_Windfaust_permanent = TRUE;
		B_GivePlayerXP(XP_Feger);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		if(MIS_Babo_Training == LOG_SUCCESS)
		{
			B_StartOtherRoutine(Sergio,"START");
		};
		B_LogEntry(Topic_ParlanFegen,"Бабо поможет мне подмести кельи послушников.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Нет, пока нет.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//Ничего, я подожду.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Life(C_Info)
{
	npc = NOV_612_Babo;
	nr = 10;
	condition = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent = TRUE;
	description = "Как жизнь в монастыре?";
};


func int DIA_Babo_Life_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Babo_Life_Info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//Как жизнь в монастыре?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//Не хочу жаловаться, но я никогда не думал, что здесь такие жесткие правила. Если ты нарушаешь правила, тебя наказывают.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//Конечно, многие послушники хотят изучать учения Инноса в библиотеке, чтобы подготовиться стать Избранными.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//Но я думаю, что лучшая подготовка к Испытанию Магией - это тщательно выполнять нашу работу.
	if(!Npc_KnowsInfo(other,DIA_Igaranz_Choosen))
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//Что ты там говорил об Избранных, и что за Испытание?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Поговори с братом Игарацем. Он больше знает об этом.
	};
};


var int Babo_XPgiven;

instance DIA_Babo_HowIsIt(C_Info)
{
	npc = NOV_612_Babo;
	nr = 1;
	condition = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Babo_HowIsIt_Condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Babo_HowIsIt_Info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//Как дела?
	if(MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//(робко) Я благодарю магов за данные мне поручения.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//Мне нравится работать в саду, и я надеюсь, что маги довольны мной, Мастер.
		if(Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP(XP_AmbientKap2);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//(испуганно) Х... х... хорошо, Мастер.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//Я, я усердно работаю и пытаюсь не разочаровать магов.
	};
	B_BaboIsTeacher();
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Babo_Kap3_Hello_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Hello_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//Что ты делаешь здесь?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//(застенчиво) Я пытаюсь выполнить задания, данные мне, так, чтобы маги монастыря остались довольны.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//Я не должен говорить с тобой. Вряд ли это послужит мне на пользу, если заметят, что я говорю с чужаком.
	};
};


instance DIA_Babo_Kap3_KeepTheFaith(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent = FALSE;
	description = "Ты не должен терять веры.";
};


func int DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//Ты не должен терять веры.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//(застигнутый врасплох) Нет... Я хочу сказать, это больше не повторится. Клянусь!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//Мы все проходим через суровые испытания.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Да, Мастер. Я буду всегда помнить это, спасибо.
	B_BaboIsTeacher();
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Babo_Kap3_Unhappy(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent = FALSE;
	description = "Ты не выглядишь особенно веселым.";
};


func int DIA_Babo_Kap3_Unhappy_Condition()
{
	if((Kapitel >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//Ты не выглядишь особенно веселым.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//(застигнутый врасплох) Эээ... я хочу сказать, со мной все в порядке, правда.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Только... Ох, я не хочу жаловаться.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Тогда прекрати хныкать.",DIA_Babo_Kap3_Unhappy_Lament);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Да ладно, мне-то ты можешь сказать.",DIA_Babo_Kap3_Unhappy_TellMe);
};

func void DIA_Babo_Kap3_Unhappy_Lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Тогда прекрати хныкать.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//(испуганно) Я... Я... Я... пожалуйста, не говори магам.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//Я не хочу, чтобы меня опять наказали.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//Я подумаю над этим.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_TellMe()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//Да ладно, мне-то ты можешь сказать.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//А ты... правда не скажешь магам?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Я похож на того, кто сразу бежит докладывать?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//Ну... хорошо. У меня проблемы с одним из послушников. Он шантажирует меня.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//Давай, выкладывай.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Игарац, так зовут этого послушника, нашел мои личные записи.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//Он угрожает передать их магам, если я не буду делать то, что он говорит.
	MIS_BabosDocs = LOG_Running;
	Log_CreateTopic(Topic_BabosDocs,LOG_MISSION);
	Log_SetTopicStatus(Topic_BabosDocs,LOG_Running);
	B_LogEntry(Topic_BabosDocs,"Игарац шантажирует послушника Бабо какими-то документами.");
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Я думаю, что мне не стоит влезать в эти дрязги.",DIA_Babo_Kap3_Unhappy_Privat);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Что ты должен делать для него?",DIA_Babo_Kap3_Unhappy_ShouldDo);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Что это были за записи?",DIA_Babo_Kap3_Unhappy_Documents);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Может быть, я могу помочь тебе?",DIA_Babo_Kap3_Unhappy_CanHelpYou);
};

func void DIA_Babo_Kap3_Unhappy_Privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//Я думаю, что мне не стоит влезать в эти дрязги.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//Я понимаю, тебе не нужны проблемы. Я сам с этим как-нибудь разберусь.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//Я верю, ты справишься.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_ShouldDo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//Что ты должен делать для него?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//Мне так стыдно говорить. Это все... не понравится Инносу.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//Мне даже думать не хочется, что будет, если все... раскроется.
};

func void DIA_Babo_Kap3_Unhappy_Documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//Что это были за записи?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//(неуверенно) Это... никого не касается. Это мое... личное дело.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//Да ладно, говори.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//Они... это... абсолютно нормальные записи. Ничего особенного.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//Я больше не буду спрашивать.
};

func void DIA_Babo_Kap3_Unhappy_CanHelpYou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Может быть, я могу помочь тебе?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//Ты сделаешь это?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//Ну... возможно... это зависит от...
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//(поспешно) Конечно же, я заплачу тебе за это.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//Сколько?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Ну, у меня не так много денег, но я мог бы дать тебе свиток с заклинанием. У меня есть лечебное заклинание.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Я лучше не буду связываться с этим.",DIA_Babo_Kap3_Unhappy_No);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Я посмотрю, что можно сделать.",DIA_Babo_Kap3_Unhappy_Yes);
};

func void DIA_Babo_Kap3_Unhappy_No()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//Я лучше не буду связываться с этим.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//Тогда у меня нет выбора, мне придется выпутываться самому.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_Yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//(счастливо) Правда?! Я знаю, у тебя получится! Я верю!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//Тебе нужно только выяснить, где Игарац держит свои вещи. Затем ты выкрадешь их у него, и все будет в порядке.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Расслабься. Продолжай работать. А я позабочусь об остальном.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};


func void B_GiveBaboDocs()
{
	AI_WaitTillEnd(self,other);
	if(Npc_HasItems(other,ItWr_BabosDocs_MIS))
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItem(other,ItWr_BabosLetter_MIS);
		CreateInvItem(self,ItWr_BabosLetter_MIS);
		AI_PrintScreen("Письмо Бабо отдано",-1,43,FONT_ScreenSmall,2);
	};
	B_ReadFakeItem(self,other,Fakescroll,1);
	MIS_BabosDocs = LOG_SUCCESS;
	if(!Npc_IsDead(Igaraz))
	{
		Igaraz.aivar[AIV_IGNORE_Theft] = FALSE;
	};
	if(!Npc_IsDead(Feger2))
	{
		Feger2.aivar[AIV_IGNORE_Theft] = FALSE;
	};
	if(!Npc_IsDead(Feger3))
	{
		Feger3.aivar[AIV_IGNORE_Theft] = FALSE;
	};
	if(BabosDocsRejected == TRUE)
	{
		B_GivePlayerXP(XP_BabosDocs / 2);
	}
	else
	{
		B_GivePlayerXP(XP_BabosDocs);
	};
};


instance DIA_Babo_Kap3_HaveYourDocs(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent = FALSE;
	description = "Я нашел твои записки.";
};


func int DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if(((MIS_BabosDocs == LOG_Running) && Npc_HasItems(other,ItWr_BabosDocs_MIS)) || (Npc_HasItems(other,ItWr_BabosPinUp_MIS) && Npc_HasItems(other,ItWr_BabosLetter_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//Я нашел твои записки.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//Правда? Спасибо, ты спас меня. Я даже не знаю, как благодарить тебя.
	DIA_Common_YeahJustRelax();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//(нервно) Это действительно мои? Ты уверен? Покажи мне.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Я подержу их пока у себя.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);
	if(BabosDocsOpen == TRUE)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Теперь, учитывая все обстоятельства, цена выросла.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Вот, держи.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//Я подержу их пока у себя.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//(ошеломленно) Что?! Что это все значит? Что ты задумал?
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Просто шучу.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Это мое дело.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
	if(MIS_BabosDocs == LOG_Running)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Игарац и я теперь партнеры.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner);
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Просто шучу.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//(кисло) Ха-ха, но мне что-то не смешно. Где же они?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Здесь.
	B_GiveBaboDocs();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//Я не хотел обидеть тебя, но я просто очень переживаю.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//Все хорошо. Наслаждайся своими записками.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//Это мое дело.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//Эти записи принадлежат мне. Ты не имеешь права забирать их себе.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//Еще увидимся.
	BabosDocsRejected = TRUE;
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");	//Игарац и я теперь партнеры.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");	//(ошеломленно) Что? Ты не можешь поступить со мной так.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");	//А я думаю, что могу. Я придержу у себя эти бумаги, пусть все пока останется так, как есть.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");	//Я должен обговорить финансовую часть с Игарацем.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");	//А ты пока занимайся своими растениями.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");	//Ты свинья. Презренная жадная свинья. Иннос покарает тебя.
	BabosDocsRejected = TRUE;
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,Dialog_Ende,DIA_Babo_Kap3_HaveYourDocs_End);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Придержи язык.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Тебе что, нечем заняться?",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo);
};

func void DIA_Babo_Kap3_HaveYourDocs_End()
{
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Придержи язык.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");	//Я буду вежлив как всегда.
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");	//Тебе что, нечем заняться?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//Я все понимаю, но, поверь мне, ты пожалеешь об этом.
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//Теперь, учитывая все обстоятельства, цена выросла.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//Ты не лучше остальных. Чего ты хочешь?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//А что у тебя есть?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//Я могу дать тебе 121 золотую монету - это все, что у меня есть.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Этого недостаточно.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Договорились.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//Этого недостаточно.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//Но у меня нет больше денег. Если бы я знал об этом раньше, ноги бы моей не было в монастыре.
	BabosDocsRejected = TRUE;
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Договорились.
	B_GiveBaboDocs();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Вот деньги и свиток.
	CreateInvItems(self,ItSc_MediumHeal,1);
	CreateInvItems(self,ItMi_Gold,121);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItMi_Gold,121);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Вот, держи.
	B_GiveBaboDocs();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Да, все на месте.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Ты читал их?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//Это имеет какое-то значение?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Нет, когда они у меня в руках.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Теперь я надеюсь, что смогу опять спать спокойно.
	CreateInvItems(self,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};


instance DIA_Babo_Kap3_HaveYourDocs2(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_HaveYourDocs2_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs2_Info;
	permanent = FALSE;
	description = "Держи.";
};


func int DIA_Babo_Kap3_HaveYourDocs2_Condition()
{
	if(BabosDocsRejected == TRUE)
	{
		if(Npc_HasItems(other,ItWr_BabosDocs_MIS))
		{
			return TRUE;
		};
		if(Npc_HasItems(other,ItWr_BabosPinUp_MIS) && Npc_HasItems(other,ItWr_BabosLetter_MIS))
		{
			return TRUE;
		};
	};
};

func void DIA_Babo_Kap3_HaveYourDocs2_Info()
{
	DIA_Common_TakeIt();
	B_GiveBaboDocs();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Теперь я надеюсь, что смогу опять спать спокойно.
	CreateInvItems(self,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
};


instance DIA_Babo_Kap3_Perm(C_Info)
{
	npc = NOV_612_Babo;
	nr = 39;
	condition = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent = TRUE;
	description = "Ты доволен своей работой?";
};


func int DIA_Babo_Kap3_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Perm_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Ты доволен своей работой?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//(неубедительно) Да, конечно. Моя вера в мудрость и силу Инноса придает мне силы.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//(уклончиво) Я не хочу показаться невежливым, но у меня много дел сегодня.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//Можешь продолжать.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//(облегченно) Спасибо.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//Все хорошо, но мне нужно возвращаться к работе, иначе мне ни за что не закончить ее сегодня.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//Я не хочу опять трудиться до полуночи, чтобы выполнить свою работу и не быть наказанным.
	};
	AI_StopProcessInfos(self);
};

