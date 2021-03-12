
instance DIA_Addon_Greg_EXIT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 999;
	condition = DIA_Addon_Greg_EXIT_Condition;
	information = DIA_Addon_Greg_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_PICKPOCKET(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 900;
	condition = DIA_Addon_Greg_PICKPOCKET_Condition;
	information = DIA_Addon_Greg_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Addon_Greg_PICKPOCKET_Condition()
{
	return C_Beklauen(111,666);
};

func void DIA_Addon_Greg_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,Dialog_Back,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};


func int C_NorthBeachMonstersDead()
{
	if(!Npc_IsDead(BeachLurker1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachLurker2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachLurker3))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachWaran1))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachWaran2))
	{
		return FALSE;
	};
	if(!Npc_IsDead(BeachShadowbeast1))
	{
		return FALSE;
	};
	return TRUE;
};

instance DIA_Addon_Greg_ImNew(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_ImNew_Condition;
	information = DIA_Addon_Greg_ImNew_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(угрожающе) Эй, ты! Что ты делаешь в моей хижине?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//Я...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(в ярости) Стоит уехать на несколько дней, и вот уже каждый проходимец норовит похозяйничать в моем жилище!
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Какого черта, что здесь происходит?!
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//Частокол еще не закончен! Каньон просто кишит зверьем, а все только и делают, что слоняются вокруг!
	if(!Npc_IsDead(Francis) && (Npc_GetDistToWP(Francis,"ADW_PIRATECAMP_HUT4_01") <= 1000))
	{
		AI_TurnToNPC(self,Francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(кричит) И это все, что ты сделал, Фрэнсис?
		if(C_BodyStateContains(Francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(кричит) Немедленно слезь с моей скамейки!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//А ТЫ? Что ТЫ сделал?
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew,"Пока не так много.",DIA_Addon_Greg_ImNew_nich);
	if((C_NorthBeachMonstersDead() && (MIS_Addon_MorganLurker != FALSE)) || C_TowerBanditsDead())
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew,"Я работал.",DIA_Addon_Greg_ImNew_turm);
	};
};

func void B_UseRakeBilanz()
{
	if((MIS_Addon_Greg_RakeCave == LOG_Running) || (MIS_Addon_Greg_RakeCave == LOG_FAILED) || (Greg_NoHelpInNW_Cave == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//И не думай, что я забыл, что ты мой должник.
		if((MIS_Addon_Greg_BringMeToTheCity == LOG_Running) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
		{
			AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//Второй раз ты отказываешься выполнить мою просьбу.
			Greg_NoHelpInNW = TRUE;
		};
		if(Greg_SuchWeiter == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//В различных местах Хориниса я зарыл несколько сотен золотых монет.
			AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//Ты их прикарманил, не так ли?
			AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//Я заставлю тебя отработать все до последнего медяка.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Я покажу тебе, что значит вкалывать по-черному.
	};
	if(!Npc_IsDead(Francis))
	{
		Npc_ExchangeRoutine(Francis,"GREGISBACK");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis_ausgeschissen = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Пока не так много.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//Неважно. Я что-нибудь подберу тебе, дружище.
	B_UseRakeBilanz();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Я работал.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Правда? И что?
	if(C_TowerBanditsDead())
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Я разобрался с бандитами из башни.
	};
	if(C_NorthBeachMonstersDead() && (MIS_Addon_MorganLurker != FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//На побережье к северу больше нет диких зверей.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Ну что ж. Полагаю, хорошее начало.
	B_UseRakeBilanz();
};


func int C_PiratesAvailableToFollow()
{
	if(!Npc_IsDead(Brandon) || !Npc_IsDead(Matt) || !Npc_IsDead(AlligatorJack) || !Npc_IsDead(Skip) || !Npc_IsDead(RoastPirate) || !Npc_IsDead(BenchPirate))
	{
		return TRUE;
	};
	return FALSE;
};

var int GregHints_Followers;
var int GregHints_Razors;

func void B_GregHints_Followers()
{
	if(GregHints_Followers == FALSE)
	{
		B_LogEntry(TOPIC_Addon_ClearCanyon,"Грег сказал, что я могу взять с собой нескольких ребят.");
		GregHints_Followers = TRUE;
	};
};

func void B_GregHints_Razors()
{
	if(GregHints_Razors == FALSE)
	{
		B_LogEntry(TOPIC_Addon_ClearCanyon,"Охотиться я должен на бритвозубов.");
		GregHints_Razors = TRUE;
	};
};

instance DIA_Addon_Greg_JoinPirates(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_JoinPirates_Condition;
	information = DIA_Addon_Greg_JoinPirates_Info;
	permanent = FALSE;
	description = "Что нужно сделать?";
};


func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Что нужно сделать?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//Прежде всего необходимо разобраться с делами здесь.
	if(!Npc_IsDead(Morgan))
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Эта ленивая свинья Морган будет пилить древесину.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//А ты займешься работой Моргана и очистишь каньон от этих проклятых зверей.
	MIS_Addon_Greg_ClearCanyon = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon,LOG_Running);
	if(Greg_NoHelpInNW == FALSE)
	{
		B_LogEntry(TOPIC_Addon_ClearCanyon,"Грег хочет, чтобы я взял на себя работу Моргана и очистил каньон от зверей.");
	}
	else
	{
		B_LogEntry(TOPIC_Addon_ClearCanyon,"Грег хочет, чтобы я взял на себя работу Моргана и очистил каньон от зверей. Похоже, он все еще злится на меня за то, что я не помог ему в Хоринисе.");
	};
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"В таком случае мне пора.",DIA_Addon_Greg_JoinPirates_Leave);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Я что, должен делать это в одиночку?",DIA_Addon_Greg_JoinPirates_Compadres);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"Что это за звери?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//В таком случае мне пора.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//И еще кое-что. Теперь ты один из нас.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Поэтому сначала найди себе нормальную одежду охотника.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//Вот, надень это. Надеюсь, тебе это снаряжение придется впору.
	if(Greg_NoHelpInNW == FALSE)
	{
		B_GiveArmor(ITAR_PIR_M_Addon);
	}
	else
	{
		B_GiveArmor(ITAR_PIR_L_Addon);
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//И не мешкай, скорее принимайся за дело!
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//Я что, должен делать это в одиночку?
	if(C_PiratesAvailableToFollow())
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Можешь захватить с собой парней.
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//Пусть отрабатывают свою зарплату.
		B_GregHints_Followers();
	}
	else
	{
		DIA_Common_01_AreYouTryingToPissMeOff();
	};
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//Что это за звери?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//Бритвозубы в каньоне все ближе подбираются к нашему лагерю.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Я не собираюсь ждать, пока они сожрут кого-нибудь из моих людей.
	B_GregHints_Razors();
};


instance DIA_Addon_Greg_AboutCanyon(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_AboutCanyon_Condition;
	information = DIA_Addon_Greg_AboutCanyon_Info;
	permanent = TRUE;
	description = "Насчет каньона...";
};


func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//Насчет каньона...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Да, что там?
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if(!C_AllCanyonRazorDead())
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Пока ничего важного.",DIA_Addon_Greg_AboutCanyon_Back);
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Мне кто-нибудь может помочь?",DIA_Addon_Greg_AboutCanyon_Compadres);
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"А что это за звери, которых я должен убить?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"Я уничтожил всех бритвозубов.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	DIA_Common_NothingImportantYet();
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Мне кто-нибудь может помочь?
	if(C_PiratesAvailableToFollow())
	{
		AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//Захвати с собой пару ребят.
		AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//Они все равно болтаются без дела.
		B_GregHints_Followers();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07_add");	//Не так уж это и сложно!
	};
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//А что это за звери, которых я должен убить?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Избавься от бритвозубов! Другие существа не опасны.
	B_GregHints_Razors();
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Я уничтожил всех бритвозубов.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Хорошо. Похоже, от тебя есть польза.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"Грег был впечатлен, когда я сообщил ему, что убил всех бритвозубов в каньоне.");
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_Addon_ClearCanyon);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};


instance DIA_Addon_Greg_BanditArmor(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditArmor_Condition;
	information = DIA_Addon_Greg_BanditArmor_Info;
	permanent = TRUE;
	description = "Мне нужны бандитские доспехи.";
};


func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if((MIS_Greg_ScoutBandits == FALSE) && !C_SCHasBDTArmor())
	{
		return TRUE;
	};
};

var int Greg_BanditArmor_Once;

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Мне нужны бандитские доспехи.
	if(MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Сначала покажи, на что ты способен. После этого поговорим.
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Сначала ты должен убить всех бритвозубов!
		};
		if(Greg_BanditArmor_Once == FALSE)
		{
			B_LogEntry(TOPIC_Addon_BDTRuestung,"Грег хочет, чтобы я помог ему навести порядок в лагере. После этого я смогу поговорить с ним о доспехах.");
			Greg_BanditArmor_Once = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//А ты молодец!
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Следить за бандитами должен был Бонес. Для него и предназначались эти доспехи.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Но, быть может, для этой работы больше подойдет ТВОЯ кандидатура.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//Возможно, у тебя даже получится выбраться оттуда живым.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Поговори с Бонесом, чтобы он дал тебе броню. Потом надевай ее и отправляйся в лагерь бандитов.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Я хочу узнать, почему эти ублюдки приперлись в нашу долину.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Будет сделано, капитан!
		B_LogEntries(TOPIC_Addon_BDTRuestung,"Я разобрался с бритвозубами для Грега и теперь могу забрать доспехи у Бонеса.");
		Log_CreateTopic(TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits,LOG_Running);
		B_LogNextEntry(TOPIC_Addon_ScoutBandits,"Я должен узнать, для чего бандиты пришли в долину, и сообщить Грегу.");
		MIS_Greg_ScoutBandits = LOG_Running;
	};
};


instance DIA_Addon_Greg_Auftraege2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Auftraege2_Condition;
	information = DIA_Addon_Greg_Auftraege2_Info;
	description = "Есть для меня еще работа?";
};


func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if((MIS_Greg_ScoutBandits != FALSE) && (!C_TowerBanditsDead() || !C_NorthBeachMonstersDead()))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Есть для меня еще работа?
	if(!C_NorthBeachMonstersDead())
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Северное побережье все еще населяют звери.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Похоже, Морган ничего не сделал.
		Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
		B_LogEntry(TOPIC_Addon_MorganBeach,"Грег хочет, чтобы я очистил кишащий монстрами пляж.");
		MIS_Addon_MorganLurker = LOG_Running;
	};
	if(!C_TowerBanditsDead())
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//В южной башне все еще есть бандиты.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//Фрэнсис должен был уже давно с ними разобраться, но ничего не сделал.
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower,"Грег попросил меня разобраться с бандитами, занявшими башню к югу от лагеря.");
		MIS_Henry_FreeBDTTower = LOG_Running;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Думаю, ты можешь этим заняться.
};


instance DIA_Addon_Greg_Sauber2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Sauber2_Condition;
	information = DIA_Addon_Greg_Sauber2_Info;
	description = "На северном побережье теперь безопасно.";
};


func int DIA_Addon_Greg_Sauber2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && C_NorthBeachMonstersDead())
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//На северном побережье теперь безопасно.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Отлично. Держи свою награду.
	if(Greg_NoHelpInNW == FALSE)
	{
		CreateInvItems(self,ItMi_Gold,200);
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else
	{
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};
	B_LogEntry(TOPIC_Addon_MorganBeach,"Я доложил Грегу, что пляж на севере очищен от монстров.");
	MIS_Addon_MorganLurker = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
};


instance DIA_Addon_Greg_BanditPlatt2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditPlatt2_Condition;
	information = DIA_Addon_Greg_BanditPlatt2_Info;
	description = "Бандиты в башне уничтожены.";
};


func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2) && C_TowerBanditsDead())
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Бандиты в башне уничтожены.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Прекрасно. Хорошая работа. Вот твоя награда.
	if(Greg_NoHelpInNW == FALSE)
	{
		CreateInvItems(self,ItMi_Gold,200);
		B_GiveInvItems(self,other,ItMi_Gold,200);
		B_LogEntry(TOPIC_Addon_BanditsTower,"Бандиты из башни мертвы. Грег очень доволен.");
	}
	else
	{
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		B_LogEntry(TOPIC_Addon_BanditsTower,"Бандиты из башни мертвы.");
	};
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
};


instance DIA_Addon_Greg_BanditGoldmine(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditGoldmine_Condition;
	information = DIA_Addon_Greg_BanditGoldmine_Info;
	permanent = TRUE;
	description = "Бандиты нашли шахту с золотом.";
};


func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if((SC_KnowsRavensGoldmine == TRUE) && (MIS_Greg_ScoutBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Бандиты нашли шахту с золотом.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//Я так и знал! Вот почему они приперлись сюда.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Никто не захочет жить в этой дыре.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Хорошая работа. Вот, держи, у меня для тебя награда.
	B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	B_LogEntry(TOPIC_Addon_ScoutBandits,"Я рассказал Грегу о золотой шахте.");
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};


instance DIA_Addon_Greg_WhoAreYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_WhoAreYou_Condition;
	information = DIA_Addon_Greg_WhoAreYou_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Addon_Greg_WhoAreYou_Condition()
{
//	if((PlayerTalkedToGregNW == FALSE) && (SC_MeetsGregTime == FALSE))
	if(PlayerTalkedToGregNW == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Я Грег, предводитель этой ленивой своры.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//Тебя устраивает такой ответ?
};


instance DIA_Addon_Greg_NiceToSeeYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_NiceToSeeYou_Condition;
	information = DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent = FALSE;
	description = "А как ты сюда попал?";
};


func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if(PlayerTalkedToGregNW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//А как ты сюда попал?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Не ожидал увидеть меня здесь, да?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//Давай сразу расставим точки над 'i'. Я Грег, и это мой лагерь.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//Тебя устраивает такой ответ?
};


instance DIA_Addon_Greg_Story(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 99;
	condition = DIA_Addon_Greg_Story_Condition;
	information = DIA_Addon_Greg_Story_Info;
	permanent = TRUE;
	description = "Я хотел бы знать еще кое-что.";
};


func int DIA_Addon_Greg_Story_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou) || Npc_KnowsInfo(other,DIA_Addon_Greg_NiceToSeeYou)) && (MIS_Greg_ScoutBandits != FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Я хотел бы знать еще кое-что.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Что именно?
	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story,Dialog_Back,DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story,"Как ты сюда попал?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story,"А где твой корабль?",DIA_Addon_Greg_Story_Ship);
	if(RavenIsDead == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story,"Что ты знаешь о Вороне?",DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Как ты сюда попал?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Я обнаружил вход в тоннель возле древней пирамиды, которую охраняли несколько магов.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Мне удалось незаметно проскользнуть мимо этих слепцов.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Сначала я принял это место за древний склеп и решил проверить, чем там можно поживиться.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//Представь мое удивление, когда я оказался в этой чудесной долине.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//И это произошло как раз в тот момент, когда я уже решил, что весь остаток жизни мне придется скрываться от ополчения.
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//А где твой корабль?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//(с сарказмом) Я чертовски удачливый человек. Уже несколько месяцев сюда не приплывали корабли.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Несколько месяцев! И первый корабль, который мне после этого встречается, оказывается боевым кораблем, принадлежащим королю.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Он был битком набит паладинами.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//Да уж, не повезло тебе.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//Вот именно. Они тут же потопили нас. Я единственный, кто добрался до берега.
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Что ты знаешь о Вороне?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//Он торговал рудой. Довольно крупная шишка в колонии.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Я не имею ни малейшего представления, где он может быть сейчас и почему люди все еще следуют за ним.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Но он явно что-то замышляет. Он-то уж точно не будет отсиживаться в укромном месте.
};


instance DIA_Addon_Greg_RavenDead(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_RavenDead_Condition;
	information = DIA_Addon_Greg_RavenDead_Info;
	description = "С Вороном покончено...";
};


func int DIA_Addon_Greg_RavenDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//С Вороном покончено...
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//Чтоб меня... Не ожидал я этого... Застал его врасплох, да?
	if((Greg_NoHelpInNW == FALSE) && (Greg_NoHelpInNW_Cave == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Ну, на мой взгляд, это стоит пятиста золотых монет.
		CreateInvItems(self,ItMi_Gold,500);
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//А ты смелый. Продолжай в том же духе.
	B_GivePlayerXP(XP_Addon_GregRavenLohn);
	if(MIS_Henry_HolOwen == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Owen,"PostStart");
	};
};

instance DIA_Addon_Greg_ItemsInADW(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 800;
	condition = DIA_Addon_Greg_ItemsInADW_Condition;
	information = DIA_Addon_Greg_ItemsInADW_Info;
	description = "Вот твои вещи.";
};


func int DIA_Addon_Greg_ItemsInADW_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE))
	{
		if((Npc_HasItems(other,ItSe_GoldPocket100) || (Npc_HasItems(other,ItMi_Gold) >= 100)) && Npc_HasItems(other,ItMi_GoldChalice) && Npc_HasItems(other,ItMi_GregsSilverPlate) && Npc_HasItems(other,ItAm_Addon_Greg))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_ItemsInADW_Info()
{
	B_GiveGregItems();
	B_GivePlayerXP(XP_Addon_Greg_RakeCave / 3);
};

instance DIA_Addon_Greg_BeMyCap(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 850;
	condition = DIA_Addon_Greg_BeMyCap_Condition;
	information = DIA_Addon_Greg_BeMyCap_Info;
	description = "Может быть, я смогу предложить тебе работу капитана.";
};


func int DIA_Addon_Greg_BeMyCap_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (SCGotCaptain == FALSE))
	{
		if((PlayerTalkedToGregNW == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_BeMyCap_Info()
{
	DIA_Common_MaybeICanOfferYouCaptainJob();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//Что это за бред?
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//Я знаю, где нужно искать Чертоги Ирдората.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//Э-э, тебе даже не стоит пытаться туда попасть.
	DIA_Common_SoWhatYouSay();
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//Неплохо для сухопутной крысы.
	B_LogEntry(Topic_Captain,"Грега не заинтересовало мое предложение.");
	AI_StopProcessInfos(self);
};

