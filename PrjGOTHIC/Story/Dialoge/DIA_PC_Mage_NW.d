
instance DIA_MiltenNW_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_EXIT_Condition;
	information = DIA_MiltenNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP3_EXIT_Condition;
	information = DIA_MiltenNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_Hello(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_Hello_Condition;
	information = DIA_MiltenNW_KAP3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenNW_KAP3_Hello_Condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Hello_Info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(не веря) Я не могу поверить в это. Ты действительно стал паладином?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//Похоже на то.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(в эйфории) Если такие как ты становятся паладинами, то прихвостням Белиара нужно держать ухо востро.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//Какая-то горстка орков для тебя не проблема.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//Проблема не только в орках.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//Я знаю, но все равно хорошо, что ты на нашей стороне.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//Ну да.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//Что ты делаешь здесь, в монастыре? Дай я угадаю. Ты хочешь быть посвященным в искусство магии.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//Возможно.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//Я знал это - лучше всего тебе поговорить с Мардуком, он отвечает за вас, паладинов. Ты найдешь его перед часовней.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//Я вижу, что слухи оказались правдой.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//Какие слухи?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//Что ты присоединился к охотникам за драконами.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//Ну, ты никогда не был человеком церкви. Тем не менее, ты сражаешься за наше общее дело, и только это имеет значение.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//Это все?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//Я рад, конечно, и судя по тому, как ты выглядишь, все орки должны бояться тебя.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//Дело не только в орках.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//Я знаю, но, тем не менее, они доставляют проблемы. А ты важная птица.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//Ты победил Спящего. Нам всем однажды может понадобиться твоя помощь.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//Ох, ладно.
	};
};


instance DIA_MiltenNW_Monastery(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_Monastery_Condition;
	information = DIA_MiltenNW_Monastery_Info;
	permanent = FALSE;
	description = "Как ты смог добраться до монастыря так быстро?";
};


func int DIA_MiltenNW_Monastery_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Monastery_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//Как ты смог добраться до монастыря так быстро?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//Откуда такой вопрос? Я проскользнул через Проход и направился прямо в монастырь.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//Должен признать, что это было непросто - уйти от всех монстров, что поселились по эту сторону от долины, но проблем оказалось все же меньше, чем я ожидал.
};


instance DIA_MiltenNW_FourFriends(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_FourFriends_Condition;
	information = DIA_MiltenNW_FourFriends_Info;
	permanent = FALSE;
	description = "Ты знаешь, где остальные?";
};


func int DIA_MiltenNW_FourFriends_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_FourFriends_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//Ты знаешь, где остальные?
	if(Npc_IsDead(PC_Fighter_NW_vor_DJG) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Горн, похоже, ничуть не изменился после заключения в тюрьме Гаронда.
		if(MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//Как ему удалось выбраться?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//Мне пришлось солгать Гаронду, так что он снял все обвинения.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//Но это только между нами, понятно?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//В любом случае, он хотел отправиться к Ли и посмотреть, что происходит на ферме.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//После голодания в темнице, он, вероятно, сейчас пытается восполнить потерю в весе и испытывает на прочность кладовку наемников.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Горн не виноват.
	};
	if(Npc_IsDead(PC_Thief_NW) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Диего бормотал что-то о расплате. Но я понятия не имею, что он хотел сказать этим.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//Но я подозреваю, что он сейчас в городе. Ты знаешь его - он всегда там, где можно поживиться.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Диего выкупил Горна - похоже, что Барьер изменил и его.
	};
};


instance DIA_MiltenNW_KAP3_Entry(C_Info)
{
	npc = PC_Mage_NW;
	nr = 32;
	condition = DIA_MiltenNW_KAP3_Entry_Condition;
	information = DIA_MiltenNW_KAP3_Entry_Info;
	permanent = TRUE;
	description = "Мне нужно попасть в монастырь. Это срочно!";
};


func int DIA_MiltenNW_KAP3_Entry_Condition()
{
	if((Kapitel == 3) && (hero.guild != GIL_KDF) && (MiltenNW_GivesMonasteryKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Entry_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//Мне нужно попасть в монастырь. Это срочно!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//Да, конечно. Вот ключ.
		CreateInvItems(self,ItKe_Innos_MIS,1);
		B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//Я не могу пустить тебя в монастырь. У меня будут проблемы с Высшим Советом.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Без разрешения верховных магов, я никого не могу пустить в монастырь.
		Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,Dialog_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"Но это важно!",DIA_MiltenNW_KAP3_Entry_Important);
		if(Npc_HasItems(other,ItWr_PermissionToWearInnosEye_MIS) >= 1)
		{
			Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"У меня есть письмо от лорда Хагена.",DIA_MiltenNW_KAP3_Entry_Permit);
		};
	};
};

func void DIA_MiltenNW_KAP3_Entry_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//Но это важно!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//Это не поможет. Пирокар оторвет мне голову за это.
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//У меня есть письмо от лорда Хагена.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Покажи.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(колеблясь) Хорошо. Вот ключ от монастыря. Ты найдешь Пирокара в церкви.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	MiltenNW_GivesMonasteryKey = TRUE;
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};


instance DIA_MiltenNW_KAP3_NovizenChase(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information = DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent = FALSE;
	description = "Ты знаешь, где Педро?";
};


func int DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_NovizenChase_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//Ты знаешь, где Педро?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//Ты думаешь, я стоял бы здесь если бы я знал, где скрывается этот предатель?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//Он должен заплатить за то, что сделал. Я надеюсь, нам удастся вернуть Глаз.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//Ты должен помочь нам. Найди его и принеси назад Глаз Инноса.
};


instance DIA_MiltenNW_KAP3_Perm(C_Info)
{
	npc = PC_Mage_NW;
	nr = 39;
	condition = DIA_MiltenNW_KAP3_Perm_Condition;
	information = DIA_MiltenNW_KAP3_Perm_Info;
	permanent = FALSE;
	description = "Ты знаешь, что-нибудь о людях в черных рясах?";
};


func int DIA_MiltenNW_KAP3_Perm_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//Ты знаешь, что-нибудь о людях в черных рясах?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//Нет, но у меня плохое предчувствие насчет них.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Будь осторожен, если наткнешься на них.
};


instance DIA_MiltenNW_KAP4_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP4_EXIT_Condition;
	information = DIA_MiltenNW_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP4_PERM(C_Info)
{
	npc = PC_Mage_NW;
	nr = 49;
	condition = DIA_MiltenNW_KAP4_PERM_Condition;
	information = DIA_MiltenNW_KAP4_PERM_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_MiltenNW_KAP4_PERM_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_PERM_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Есть новости?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//Это я должен тебя спрашивать. Мы все здесь очень обеспокоены.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//Высший Совет пытается предугадать следующий ход врага.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//Что-нибудь еще?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//Последнее время все больше сообщений о нападении орков, даже за пределами Долины Рудников.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//Мне это все не нравится - я не думаю, что у нас осталось много времени.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//Фермер сообщил о появлении чешуйчатых существ у его фермы.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//Я не знаю, что все это значит, но я думаю, что враг что-то задумал.
	}
	else if(MIS_FindTheObesessed == LOG_Running)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//Мы получаем все больше сообщений об одержимых людях. Враг стал силен, значительно сильнее, чем я ожидал.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//Нет, ситуация все еще очень серьезная. Все, что нам остается, - это верить в Инноса.
	};
};


instance DIA_MiltenNW_KAP5_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP5_EXIT_Condition;
	information = DIA_MiltenNW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_AllDragonsDead(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_MiltenNW_AllDragonsDead_Condition;
	information = DIA_MiltenNW_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Я убил всех драконов.";
};


func int DIA_MiltenNW_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//Я убил всех драконов.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//Правда? Значит, есть еще проблеск надежды на горизонте. Теперь все, что нам остается, - это отрубить голову Злу.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//Если ты действительно сделал это, мы обязательно победим в этой войне.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Кому, мне?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//Тебе, конечно же. Кому же еще?
	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//Мы должны выступать как можно скорее, иначе может стать слишком поздно.
	};
};


instance DIA_MiltenNW_SCWasInLib(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_SCWasInLib_Condition;
	information = DIA_MiltenNW_SCWasInLib_Info;
	important = TRUE;
};


func int DIA_MiltenNW_SCWasInLib_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_SCWasInLib_Info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//Эй, я слышал, ты провел много времени в монастырском подвале. Что ты нашел там?
};


instance DIA_MiltenNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_KnowWhereEnemy_Condition;
	information = DIA_MiltenNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я знаю, где скрывается враг.";
};


func int DIA_MiltenNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (MiltenNW_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};


var int SCToldMiltenHeKnowWhereEnemy;

func void DIA_MiltenNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//Я знаю, где скрывается враг. На небольшом острове, недалеко отсюда.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//Это наш шанс. Мы должны отправляться туда немедленно и уничтожить зло раз и навсегда.
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	if(Npc_IsDead(DiegoNW) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//Ты говорил с Диего? Я думаю, он согласится присоединиться к тебе.
		B_LogEntry(Topic_Crew,"Диего может оказаться полезным. Он никогда подолгу не задерживается на одном месте.");
	};
	if(Npc_IsDead(GornNW_nach_DJG) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//А что насчет Горна? Поговори с ним. Я слышал, он вернулся из Долины Рудников.
		B_LogEntry(Topic_Crew,"Горн, определенно, может оказаться полезным. Никогда не помешает иметь на своей стороне такого закаленного бойца. Возможно, он сможет тренировать меня.");
	};
	if(Npc_IsDead(Lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//И не забудь Лестера. Если ты не вытащишь его из долины, он сгниет там.
		B_LogEntry(Topic_Crew,"Если я не возьму Лестера с собой, ему никогда не выбраться из этой долины.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//Я также вижу свою роль во всем этом. Я могу повысить твою ману и помочь в создании рун. Когда мы приступим?
	B_LogEntry(Topic_Crew,"Если Милтен отправится в путь со мной, он может научить меня создавать руны и повысить мою ману.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Не так быстро, у меня уже достаточно людей.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//Ты знаешь, я всегда готов пойти с тобой. Если передумаешь, только скажи.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//Удачи, да не оставит тебя Иннос без своей защиты.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"Сейчас я не могу найти тебе место.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"Добро пожаловать на борт!",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_MiltenNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//Добро пожаловать на борт!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//Встретимся в гавани. Жди меня там.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//Хорошо. Я буду там, когда ты будешь готов.
	self.flags = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	B_GivePlayerXP(XP_Crewmember_Success);
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};

func void DIA_MiltenNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//Сейчас я не могу найти тебе место.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//Ты знаешь, что я готов идти с тобой до конца. Если передумаешь, только скажи.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};


instance DIA_MiltenNW_WhereCaptain(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_WhereCaptain_Condition;
	information = DIA_MiltenNW_WhereCaptain_Info;
	description = "Где мне найти капитана?";
};


func int DIA_MiltenNW_WhereCaptain_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (SCToldMiltenHeKnowWhereEnemy == TRUE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_WhereCaptain_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Где мне найти капитана?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Спроси Йоргена. Он ведь моряк. Он, должно быть, все еще в монастыре.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//Но если он не сможет помочь, попробуй поспрашивать на фермах или в городе, может быть, найдется человек, способный управлять твоим кораблем.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//Лучше всего поговорить с Ли или поспрашивать в гавани Хориниса. Больше ничего сейчас мне в голову не приходит.
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Возможно, стоит взять с собой Йоргена в качестве капитана. Он все еще должен быть в монастыре. Хотя, кроме него есть и другие кандидаты на фермах и в городе. Возможно, мне стоит поговорить с Ли или поспрашивать в гавани.");
};


instance DIA_MiltenNW_LeaveMyShip(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_LeaveMyShip_Condition;
	information = DIA_MiltenNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я не могу взять тебя с собой.";
};


func int DIA_MiltenNW_LeaveMyShip_Condition()
{
	if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//Я не могу взять тебя с собой.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//Ты лучше знаешь, кто тебе нужен. Если передумаешь, я буду ждать тебя в монастыре.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MiltenNW_StillNeedYou(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_StillNeedYou_Condition;
	information = DIA_MiltenNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Ты нужен мне.";
};


func int DIA_MiltenNW_StillNeedYou_Condition()
{
	if(((MiltenNW_IsOnBoard == LOG_OBSOLETE) || (MiltenNW_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//Ты нужен мне.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Твое решение делает мне честь. Вперед, мы не можем терять времени!
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//Я отправляюсь в порт. Встретимся там.
	self.flags = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_Teach(C_Info)
{
	npc = PC_Mage_NW;
	nr = 90;
	condition = DIA_MiltenNW_Teach_Condition;
	information = DIA_MiltenNW_Teach_Info;
	permanent = TRUE;
	description = "Я хочу изучить новые заклинания.";
};


func int DIA_MiltenNW_Teach_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Teach_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//Я хочу изучить кое-какие заклинания.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenNW_Teach);
		Info_AddChoice(DIA_MiltenNW_Teach,Dialog_Back,DIA_MiltenNW_Teach_BACK);
		if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_MiltenNW_Teach_Windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenNW_Teach_Feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//Ты все еще не достиг второго круга магии. Я ничему не могу научить тебя.
	};
};

func void DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_Teach);
};

func void DIA_MiltenNW_Teach_Windfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};


instance DIA_MiltenNW_Mana(C_Info)
{
	npc = PC_Mage_NW;
	nr = 100;
	condition = DIA_MiltenNW_Mana_Condition;
	information = DIA_MiltenNW_Mana_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int DIA_MiltenNW_Mana_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//Я хочу повысить свои магические способности.
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Твоя магическая энергия велика. Слишком велика, чтобы я мог увеличить ее.
	};
	Info_ClearChoices(DIA_MiltenNW_Mana);
};

func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};


instance DIA_Mage_NW_PICKPOCKET(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_Mage_NW_PICKPOCKET_Condition;
	information = DIA_Mage_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Mage_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(56,75);
};

func void DIA_Mage_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,Dialog_Back,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

