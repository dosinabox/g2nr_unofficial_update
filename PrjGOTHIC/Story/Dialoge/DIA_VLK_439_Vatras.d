
var int Vatras_LaresExit;
//var int Vatras_MORE;

func int C_Vatras_Away()
{
	if(MIS_RitualInnosEyeRepair == LOG_Running)
	{
		return TRUE;
	};
	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Vatras_ListenersControl()
{
	var string pos;
	if(C_Vatras_Away())
	{
		pos = "VATRASAWAY";
	}
	else
	{
		pos = "START";
	};
	if(Vatras_Listeners_ReadyToGo == TRUE)
	{
		B_StartOtherRoutine(VLK_421_Valentino,pos);
		B_StartOtherRoutine(VLK_426_Buergerin,pos);
		B_StartOtherRoutine(VLK_428_Buergerin,pos);
		B_StartOtherRoutine(VLK_450_Buerger,pos);
		B_StartOtherRoutine(VLK_454_Buerger,pos);
		B_StartOtherRoutine(VLK_455_Buerger,pos);
		Vatras_Listeners_ReadyToGo = FALSE;
	};
};

instance DIA_Addon_Vatras_KillerWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_KillerWarning_Condition;
	information = DIA_Addon_Vatras_KillerWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_KillerWarning_Condition()
{
	if((Kapitel >= 5) && (MadKillerCount >= 3) && (MadKillerCount < 7) && (VatrasPissedOffForever == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_KillerWarning_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Я слышал про тебя.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//Говорят, что ты замешан в убийстве невинных людей.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Если это так, то я должен предупредить тебя, сынок.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Не стоит нарушать баланс сил, ибо в противном случае тебе придется столкнуться с последствиями своих поступков.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Чем я могу помочь тебе?
};


instance DIA_Addon_Vatras_LastWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_LastWarning_Condition;
	information = DIA_Addon_Vatras_LastWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_LastWarning_Condition()
{
	if((Kapitel >= 5) && (MadKillerCount >= 7) && (VatrasPissedOffForever == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_LastWarning_Info()
{
	B_LastWarningVatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//Что ты можешь сказать в свое оправдание?
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Отвали.",DIA_Addon_Vatras_LastWarning_Arsch);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Мне очень жаль. Я не понимал, что делаю.",DIA_Addon_Vatras_LastWarning_Reue);
};

func void DIA_Addon_Vatras_LastWarning_Arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Отвали.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Я не слышу в твоих словах ни тени раскаяния.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Ты не оставляешь мне другого выбора.
	if(C_Vatras_Away())
	{
		Vatras_Listeners_ReadyToGo = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff();
};

func void DIA_Addon_Vatras_LastWarning_Reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Мне очень жаль. Я не понимал, что делаю.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//Я буду молиться за тебя и просить богов, чтобы они вернули тебе рассудок.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Горе тебе, если я услышу хотя бы об одном убийстве, к которому ты приложил руку.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};


instance DIA_Addon_Vatras_PissedOff(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_PissedOff_Condition;
	information = DIA_Addon_Vatras_PissedOff_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_PissedOff_Condition()
{
	if((MadKillerCount > VatrasMadKillerCount) && Npc_KnowsInfo(other,DIA_Addon_Vatras_LastWarning) && (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PissedOff_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Твои слова так же лживы, как и твои деяния.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Ты никак не хочешь прекращать бездумные убийства.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Ты не оставляешь мне другого выбора...
	if(C_Vatras_Away())
	{
		Vatras_Listeners_ReadyToGo = TRUE;
	};
	B_VatrasPissedOff();
};


instance DIA_Vatras_EXIT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 999;
	condition = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (Vatras_LaresExit == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Подожди!
		if(Vatras_GehZuLares == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Если увидишь Лареса...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Я хочу, чтобы ты оказал мне небольшую услугу.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//Отправляйся в порт. Там ты найдешь человека по имени Ларес.
			Vatras_GehZuLares = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Передай ему этот орнамент и скажи, что его нужно вернуть. Он знает, что делать.
		CreateInvItems(self,ItMi_Ornament_Addon_Vatras,1);
		B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
		Vatras_LaresExit = TRUE;
	};
	B_PlayerEnteredCity();
	AI_StopProcessInfos(self);
	B_Vatras_ListenersControl();
//	Vatras_MORE = FALSE;
};


instance DIA_Vatras_PICKPOCKET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 900;
	condition = DIA_Vatras_PICKPOCKET_Condition;
	information = DIA_Vatras_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Vatras_PICKPOCKET_Condition()
{
	return C_Beklauen(91,250);
};

func void DIA_Vatras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,Dialog_Back,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vatras_PICKPOCKET_DoIt);
};

func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};


instance DIA_Vatras_GREET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_GREET_Condition;
	information = DIA_Vatras_GREET_Info;
	important = TRUE;
};


func int DIA_Vatras_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Да пребудет с тобой Аданос.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Кто ты?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Я Ватрас, слуга Аданоса, стража равновесия божественного и земного.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Что я могу сделать для тебя?
};


instance DIA_Addon_Vatras_Cavalorn(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Cavalorn_Condition;
	information = DIA_Addon_Vatras_Cavalorn_Info;
	description = "У меня для тебя письмо.";
};


func int DIA_Addon_Vatras_Cavalorn_Condition()
{
	if((Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon_Sealed) && (MIS_Addon_Cavalorn_Letter2Vatras == LOG_Running)) || Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Cavalorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//У меня для тебя письмо.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//Для меня?
	if(SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
		Npc_RemoveInvItem(self,ItWr_SaturasFirstMessage_Addon_Sealed);
		CreateInvItems(self,ItWr_SaturasFirstMessage_Addon,1);
	}
	else
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras / 4);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Да, но... оно вскрыто. Я надеюсь, оно не попало в чужие руки?
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Да. Это очень важное известие.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Интересно, как к тебе попало это письмо?
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Я забрал его у бандитов.",DIA_Addon_Vatras_Cavalorn_Bandit);
	if(MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Я получил его у Кавалорна, охотника.",DIA_Addon_Vatras_Cavalorn_Cavalorn);
	};
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};

func void DIA_Addon_Vatras_Cavalorn_Bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Я забрал его у бандитов.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(обеспокоено) О Аданос! Это плохо. Это очень плохо.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Если то, что ты говоришь правда, то у нас огромная проблема.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Я должен как можно скорее разобраться с этим.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};

func void DIA_Addon_Vatras_Cavalorn_Cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Я получил его у Кавалорна, охотника.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(с удивлением) Кавалорн? А где он?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//Он просил передать тебе, что не успевает и сразу направился к месту встречи. Что бы это ни значило.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Я смотрю, ты завоевал доверие Кавалорна. Это говорит в твою пользу.
	B_GivePlayerXP(XP_Addon_CavalornTrust);
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};


var int Vatras_Why;

instance DIA_Addon_Vatras_CavalornSentMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_CavalornSentMe_Condition;
	information = DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent = FALSE;
	description = "Меня прислал к тебе Кавалорн!";
};


func int DIA_Addon_Vatras_CavalornSentMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring) && (Vatras_Why == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CavalornSentMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Меня прислал к тебе Кавалорн!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//И что же он тебе сказал?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//Он сказал, что ты ищешь верных людей.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(улыбается) Ага... Значит, ты хочешь присоединиться к нам, сынок?
};


var int Vatras_ToldAboutDuty;
var int Vatras_ToldAboutOtherKDW;
var int Vatras_ToldAboutUnexplored;

instance DIA_Addon_Vatras_TellMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_TellMe_Condition;
	information = DIA_Addon_Vatras_TellMe_Info;
	permanent = TRUE;
	description = "Расскажи мне о Кольце Воды.";
};


func int DIA_Addon_Vatras_TellMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_TellMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Расскажи мне о Кольце Воды.
	if(!Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//(выжидающе) И зачем мне это делать?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Так как ты пока не являешься членом нашего сообщества, я не смогу рассказать тебе ВСЕ.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//Но я расскажу тебе то, что тебе можно услышать.
		Info_ClearChoices(DIA_Addon_Vatras_TellMe);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,Dialog_Back,DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Чем именно вы занимаетесь?",DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"А где остальные маги Воды?",DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Кто является членом Кольца Воды?",DIA_Addon_Vatras_TellMe_WerNoch);
	};
};

func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_TellMe);
};

func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Чем именно вы занимаетесь?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Мы стоим на пути порядка Инноса и хаоса Белиара.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Если одна из сторон одержит верх, то это будет означать либо полный хаос, либо окончательную потерю свободы.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//Поэтому мы поддерживаем баланс двух сил. Благодаря нам существует все живое.
	Vatras_ToldAboutDuty = TRUE;
};

func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//А где остальные маги Воды?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Они исследуют постройки древней цивилизации к северо-востоку от Хориниса.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Мы подозреваем, что в этих руинах может скрываться проход к той части острова, которая еще не отмечена на карте.
	if(Vatras_ToldAboutOtherKDW == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"Маги Воды исследуют руины построек древней культуры, которые находятся на северо-востоке от Хориниса. Возможно, там находится проход в неисследованную часть острова.");
	};
	Vatras_ToldAboutOtherKDW = TRUE;
	Info_AddChoice(DIA_Addon_Vatras_TellMe,"Расскажи мне об этом.",DIA_Addon_Vatras_TellMe_Unexplored);
};

func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//Расскажи мне об этом.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Если хочешь присоединиться к экспедиции, я могу передать с тобой письмо, которое ты отнесешь Сатурасу.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Ты можешь пойти с ними только в том случае, если ты будешь одним из нас.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Безусловно.
	if(Vatras_ToldAboutUnexplored == FALSE)
	{
		B_LogEntry(TOPIC_Addon_KDW,"Прежде чем допустить меня до участия в экспедиции, Ватрас требует, чтобы я присоединился к Кольцу Воды.");
	};
	Vatras_ToldAboutUnexplored = TRUE;
};

func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Кто является членом Кольца Воды?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//Пока ты не вступишь в наше братство, я не могу сообщать тебе подробности.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Но ты наверняка уже встречался с ними.
};


instance DIA_Addon_Vatras_Bandittrader(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Bandittrader_Condition;
	information = DIA_Addon_Vatras_Bandittrader_Info;
	description = "И что это значит для меня?";
};


func int DIA_Addon_Vatras_Bandittrader_Condition()
{
	if((Vatras_ToldAboutDuty == TRUE) || (SC_IsRanger == TRUE))
	{
		return TRUE;
	};
};


func void DIA_Addon_Vatras_Bandittrader_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//(хмуро) И что это значит для меня?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Падение Барьера стало причиной возникновения многих опасностей.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Бандиты, наверное, самая очевидная из них.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//И дело не только в том, что теперь нельзя путешествовать в безопасности...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//В городе есть кто-то, кто помогает бандитам!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Мы узнали, что бандиты получают регулярные поставки от торговца оружием в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Сейчас мы пытаемся всеми силами помешать этому.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Если что-нибудь узнаешь об этом, дай мне знать.
	MIS_Vatras_FindTheBanditTrader = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntries(TOPIC_Addon_Bandittrader,"Некий торговец из Хориниса поставляет бандитам оружие. Ватрас хочет, чтобы я вывел его на чистую воду.");
	B_LogNextEntry(TOPIC_Addon_RingOfWater,"Кольцо Воды занимается проблемой бандитов в Хоринисе.");
};


instance DIA_Addon_Vatras_WannaBeRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_WannaBeRanger_Condition;
	information = DIA_Addon_Vatras_WannaBeRanger_Info;
	description = "Я хочу присоединиться к братству Кольца Воды!";
};


func int DIA_Addon_Vatras_WannaBeRanger_Condition()
{
	if(SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WannaBeRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Я хочу присоединиться к братству Кольца Воды!
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Правда? Значит, ты уже выполнил первое требование.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//Что ты хочешь этим сказать?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//Должно быть, среди нас есть кто-то, кто доверяет тебе. В противном случае ты бы просто ничего не узнал.
	};
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Хорошо, давай подытожим:
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Ты бывший заключенный...
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... которому сказал некромант Ксардас...
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... о том, что пришли драконы, чтобы завоевать страну.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//И ты пришел, чтобы сообщить это паладинам...
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Это все звучит довольно фантастически, но я не думаю, что ты солгал мне.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Поэтому я вынужден предположить, что твои мотивы благородны.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//Я хочу дать тебе шанс присоединиться к Кольцу Воды.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Но я совсем ничего не знаю про тебя...
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Что ты хочешь знать?
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Ну, ты можешь рассказать мне, откуда ты пришел и зачем ты пришел в этот город.
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//У меня важное сообщение для главы паладинов.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Что за сообщение?
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Пока мы разговариваем, собирается огромная армия, ведомая драконами.",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Скоро произойдут ужасные вещи!",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void B_Vatras_First_Truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Пока мы разговариваем, собирается огромная армия, ведомая драконами. Эта армия намеревается завоевать нашу страну.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Если это действительно правда, баланс на земле будет нарушен. Кто сказал тебе это?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(задумчиво) Драконы? Ты говоришь о существах, которые до последнего времени упоминались только в легендах. Откуда ты знаешь это?
	};
	Vatras_First = TRUE;
	if(Npc_KnowsInfo(other,DIA_Lothar_Dragons) && Wld_IsTime(5,5,20,10))
	{
		Player_TalkedAboutDragonsToSomeone = TRUE;
	};
};

func void B_Vatras_First_Lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Скоро произойдут ужасные вещи!
	if(Vatras_First == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(сердито) Ага. И кто сказал тебе это?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Ужасные вещи, хм... откуда ты знаешь это?
	};
	Vatras_First = 2;
};

func void B_Vatras_Second_Truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Мне сказал об этом маг Ксардас. Он послал меня предупредить паладинов.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Я знаю этого человека как мудрого и могущественного мастера магии. А ты откуда пришел?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Некромант... Так он жив... (задумчиво) И он послал тебя? А кто же ты тогда такой?
	};
	Vatras_Second = TRUE;
};

func void B_Vatras_Second_Lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Ох, я где-то слышал об этом...
	if(Vatras_Second == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(раздраженно) Ты хотя бы помнишь, откуда ты пришел?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Ага. И поэтому ты поделал весь этот долгий путь. Кто ты такой вообще?
	};
	Vatras_Second = 2;
};

func void B_Vatras_Third_Truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Я бывший заключенный колонии Хориниса.
	Vatras_Third = TRUE;
};

func void B_Vatras_Third_Lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Я искатель приключений с юга...
	Vatras_Third = FALSE;
};

func void B_Vatras_REPEAT()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Хорошо, давай подытожим:
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Ты бывший заключенный...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Ты искатель приключений с юга...
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... которому сказал некромант Ксардас...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//... который слышал слухи...
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... о том, что пришли драконы, чтобы завоевать страну.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//... что скоро произойдут ужасные вещи.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//И ты пришел, чтобы сообщить это паладинам...
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Это все звучит довольно фантастически, но я не думаю, что ты солгал мне.
	};
};

func void B_Vatras_PLEASEDONTLIE()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Мне кажется, что ты не все говоришь мне.
	AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Если ты опасаешься, что я расскажу кому-нибудь о том, что ты поведаешь мне, то позволь мне уверить тебя.
	AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Я поклялся хранить все секреты, которые доверяют мне, как свои собственные.
	if(Wld_IsTime(5,5,20,10))
	{
		AI_Output(other,self,"DIA_Vatras_Add_15_03");	//А что насчет людей, стоящих здесь?
		AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Они понимают только половину того, что я ПРОПОВЕДУЮ им. Так что не беспокойся.
	};
	AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Начнем с начала. Что это за сообщение?
};

func void B_Vatras_INFLUENCE_REPEAT()
{
	B_Vatras_REPEAT();
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Поэтому я вынужден предположить, что твои мотивы благородны.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//Я хочу дать тебе шанс присоединиться к Кольцу Воды.
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	}
	else
	{
		B_Vatras_PLEASEDONTLIE();
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Пока мы разговариваем, собирается огромная армия, ведомая драконами.",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Скоро произойдут ужасные вещи!",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	B_Vatras_First_Truth();
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Ох, я где-то слышал об этом...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Мне сказал об этом маг Ксардас. Он послал меня предупредить паладинов.",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	B_Vatras_First_Lie();
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Ох, я где-то слышал об этом...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Мне сказал об этом маг Ксардас. Он послал меня предупредить паладинов.",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	B_Vatras_Second_Truth();
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Я искатель приключений с юга...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Я бывший заключенный колонии Хориниса.",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	B_Vatras_Second_Lie();
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Я искатель приключений с юга...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Я бывший заключенный колонии Хориниса.",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	B_Vatras_Third_Truth();
	B_Vatras_INFLUENCE_REPEAT();
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	B_Vatras_Third_Lie();
	B_Vatras_INFLUENCE_REPEAT();
};

instance DIA_Addon_Vatras_HowToJoin(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_HowToJoin_Condition;
	information = DIA_Addon_Vatras_HowToJoin_Info;
	description = "Что я должен делать?";
};


func int DIA_Addon_Vatras_HowToJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_HowToJoin_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Что я должен делать?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Ты должен понимать, какую ответственность берешь на себя, вступая в наше общество.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Мы не принимаем кого попало.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Если хочешь присоединиться к обществу, ты должен доказать, что готов действовать как один из нас.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//Что это значит?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Перед тем, как новый воин вступит в наши ряды, он должен совершить во благо Кольца великое деяние.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//И только после этого мы решаем, можно ли доверить ему великое дело по сохранению баланса сил на этом острове.
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"И что же мне нужно сделать, чтобы убедить тебя?",DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Я освободил многих людей. Барьера больше нет.",DIA_Addon_Vatras_HowToJoin_FreedMen);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Я уничтожил Спящего. Мне кажется, это достаточно великое деяние.",DIA_Addon_Vatras_HowToJoin_Sleeper);
};

func void DIA_Addon_Vatras_HowToJoin_Sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Я уничтожил Спящего. Мне кажется, это достаточно великое деяние.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//В последнее время я слышал много невероятных историй.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//Включая историю про уничтожение зверя, которого называют Спящим.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Я не слышал, чтобы это было совершено одним человеком, хотя в твоих глазах нет лжи.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Меня это немного смущает, но мои чувства иногда играют со мной злые шутки.
};

func void DIA_Addon_Vatras_HowToJoin_FreedMen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Я освободил многих людей. Барьера больше нет.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//Даже если это ДЕЙСТВИТЕЛЬНО твоя работа...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Великое событие в Долине Рудников стало причиной освобождения не только магов Воды, но и многих заключенных.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Преступники со всей страны рыщут в окрестностях Хориниса, угрожая местному населению.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Бандиты уже захватили огромные территории земель за пределами города. Теперь практически невозможно выйти за пределы города и вернуться обратно целым и невредимым.
};

func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//И что же мне нужно сделать, чтобы убедить тебя?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//Хоринис столкнулся с великой загадкой.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Число людей, пропавших без вести, увеличивается с каждой минутой.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Если сумеешь объяснить мне причину их исчезновения, то займешь достойное место среди нас.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Ватрас примет меня в Кольцо Воды только в том случае, если я найду пропавших людей.");
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_Running;
	SC_HearedAboutMissingPeople = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Однако...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Что еще?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//... сначала ты должен доставить сообщение паладинам.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Это дело первостепенной важности!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Поговори с лордом Хагеном.
	Player_KnowsLordHagen = TRUE;
	B_LogEntry(TOPIC_Addon_RingOfWater,"Ватрас хочет, чтобы я передал лорду Хагену важное сообщение.");
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
};


instance DIA_Addon_Vatras_GuildBypass(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Condition;
	information = DIA_Addon_Vatras_GuildBypass_Info;
	description = "Но лорд Хаген не станет меня принимать!";
};


func int DIA_Addon_Vatras_GuildBypass_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && ((other.guild == GIL_NONE) || (other.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Но лорд Хаген не станет меня принимать!
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Поговори с Пирокаром, он объяснит все, что тебе нужно знать.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Нет, примет, можешь не сомневаться. При условии, что сначала ты станешь членом влиятельного общества.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//У Кольца свои связи.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Мы поможем тебе передать сообщение как можно скорее.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//Ты должен поговорить с Ларесом, ему я доверяю. Он поможет тебе.
		B_LogEntry(TOPIC_Addon_RingOfWater,"Чтобы встретиться с лордом Хагеном, я должен вступить в одно из влиятельных сообществ Хориниса.");
		Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
		Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Так и сделаем.",DIA_Addon_Vatras_GuildBypass_BACK);
		Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"В какое сообщество я должен вступить?",DIA_Addon_Vatras_GuildBypass_WhichGuild);
	};
};

func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Так и сделаем.
	Vatras_GehZuLares = TRUE;
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
};

func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//В какое сообщество я должен вступить?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Есть только три сообщества, которые обладают достаточной властью.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//А именно: городское ополчение, монастырь магов Огня и отряд наемников на ферме землевладельца.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Выбор за тобой, сын мой.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Ларес поможет тебе принять это непростое решение. Поговори с ним.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Я могу присоединиться к городскому ОПОЛЧЕНИЮ, МАГАМ ОГНЯ в монастыре или НАЕМНИКАМ, живущим на ферме крупного землевладельца.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Так и сделаем.",DIA_Addon_Vatras_GuildBypass_BACK);
};


instance DIA_Addon_Vatras_NowRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_NowRanger_Condition;
	information = DIA_Addon_Vatras_NowRanger_Info;
	permanent = TRUE;
	description = "Я готов вступить в общество Кольца Воды!";
};


func int DIA_Addon_Vatras_NowRanger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (SC_IsRanger == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_NowRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Я готов вступить в общество Кольца Воды!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Значит, ты доставил сообщение лорду Хагену?
	if(Kapitel >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Да.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Но он отправил меня в Долину Рудников, чтобы я добыл ему доказательства своих слов!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//ТЕБЕ решать, что делать дальше.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Мне было важно, чтобы он получил сообщение. Теперь ему решать, действовать самому или ждать твоих доказательств.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Если ты заинтересован...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Хорошо.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Ты доказал, что нужен нам. Ты станешь одним из нас и будешь служить на благо Аданоса.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//Я вручаю тебе это кольцо. Пусть оно поможет тебе найти твоих собратьев и вместе с ними хранить баланс сил в этом мире.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Ты первый маг Огня среди нас. Я очень рад этому факту.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Да хранит тебя Аданос. А теперь иди и познакомься со своими братьями.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//Они будут ждать тебя в таверне 'Мертвая гарпия'. Братья готовы принять тебя в наше общество.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//Ты наверняка знаешь эту таверну. Она находится по пути к ферме Онара.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Не забудь надеть кольцо, чтобы братья узнали тебя.
		B_LogEntry(TOPIC_Addon_RingOfWater,"Я стал членом Кольца Воды. Мои новые братья ждут меня в таверне 'Мертвая гарпия'.");
		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
		B_GivePlayerXP(XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Нет. Пока нет.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//В таком случае поспеши. Отправляйся к нему. Это сообщение очень важное!
	};
};


instance DIA_Addon_Vatras_CloseMeeting(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_CloseMeeting_Condition;
	information = DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Братья Кольца послали меня к тебе.";
};


func int DIA_Addon_Vatras_CloseMeeting_Condition()
{
	if(Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CloseMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Братья Кольца послали меня к тебе.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Хорошо! Я ждал тебя!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Я отправлю тебя через портал, чтобы ты присоединился к остальным магам Воды.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Ты должен выследить бывшего рудного барона Ворона и узнать, с какой целью он похищает жителей города.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//А мы останемся здесь и попытаемся разобраться с бандитами.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Передай это письмо Сатурасу. Отныне он будет давать тебе задания.
	if((MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS) && (Kapitel < 3))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Ларес отведет тебя к нему, если он еще не получил орнамент.
	};
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
	B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Да пребудет с тобой Аданос.
	B_LogEntry(TOPIC_Addon_KDW,"Ватрас дал мне письмо для Сатураса. Я должен присоединиться к магам Воды и пройти через портал в неизвестную часть Хориниса, чтобы найти бывшего рудного барона Ворона.");
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	B_LogEntry(TOPIC_Addon_Sklaven,"Я должен узнать, с какой целью Ворон похищает жителей Хориниса.");
	RangerMeetingRunning = LOG_SUCCESS;
	B_SchlussMitRangerMeeting();
	B_GivePlayerXP(XP_AmbientKap3);
	SC_KnowsPortal = TRUE;
};


var int missingpeopleinfo[20];

instance DIA_Addon_Vatras_MissingPeople(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_MissingPeople_Condition;
	information = DIA_Addon_Vatras_MissingPeople_Info;
	permanent = TRUE;
	description = "Насчет людей, пропавших без вести...";
};


func int DIA_Addon_Vatras_MissingPeople_Condition()
{
	if(MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running)
	{
		return TRUE;
	};
};


var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;

func void DIA_Addon_Vatras_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//Насчет людей, пропавших без вести...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Да?
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,Dialog_Back,DIA_Addon_Vatras_MissingPeople_BACK);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Позволь рассказать тебе то, что я знаю...",DIA_Addon_Vatras_MissingPeople_Report);
	if(SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Я знаю, где находятся пропавшие люди.",DIA_Addon_Vatras_MissingPeople_Success);
	};
	if((DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Где мне их искать?",DIA_Addon_Vatras_MissingPeople_Wo);
	};
};

func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
};

func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Где мне их искать?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//Большинство людей исчезли у гавани. Тебе следует начинать свои поиски именно там.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Большинство из людей пропало в окрестностях порта. Лучше всего начать поиски именно там.");
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};

func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Позволь рассказать тебе то, что я знаю...
	if(((MIS_Akil_BringMissPeopleBack != FALSE) || (MIS_Bengar_BringMissPeopleBack != FALSE)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Фермеры тоже потеряли своих близких.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Я узнал, что ответственность за эти исчезновения лежит на бандитах.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Элврих, ученик мастера Торбена, рассказал мне, что бандиты вывозят похищенных людей по морю.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//С этим как-то связаны пираты. Я пока не до конца понял их роль в этом мероприятии.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Я спас Элвриха от бандитов.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//Бандиты захватили девушку по имени Люсия.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if(((MIS_LuciasLetter == LOG_Running) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Люсия, девушка, похищенная бандитами, решила присоединиться к ним.
		if(MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//По всей видимости, она присоединилась к ним по доброй воле.
		};
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Главаря бандитов зовут Декстер. Он несет ответственность за все эти похищения.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Я познакомился с Декстером на каторге. Тогда он работал на торговца рудой Гомеза.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//Он наверняка узнает тебя. Будь осторожен.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(Vatras_MissingPeopleReports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Мне кажется, ты на верном пути. Продолжай.
		XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
		B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Что ты узнал?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Пока ничего важного.
	};
};

func void DIA_Addon_Vatras_MissingPeople_Success()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//Я знаю, где находятся пропавшие люди.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Что ты узнал?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Человек по прозвищу Ворон спрятал их в удаленной части Хориниса.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//Почему ты так уверен в этом?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//Я читал его приказы. На него работают местные бандиты.
	if(Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Вот.
		B_GiveInvItems(other,self,ItWr_RavensKidnapperMission_Addon,1);
		B_UseFakeScroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Отличная работа. Я боялся, что мы никогда не узнаем ответа на эту загадку.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	MIS_Steckbriefe = LOG_SUCCESS;
	Vatras_MissingPeopleReports = 0;
	if(((MIS_Akil_BringMissPeopleBack != FALSE) || (MIS_Bengar_BringMissPeopleBack != FALSE)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
	XP_Vatras_MissingPeopleReports += XP_Addon_Vatras_WhereAreMissingPeople;
	B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
};


instance DIA_Addon_Vatras_Free(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Free_Condition;
	information = DIA_Addon_Vatras_Free_Info;
	permanent = FALSE;
	description = "Пропавшие люди вернулись в свои дома.";
};


func int DIA_Addon_Vatras_Free_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Free_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Пропавшие люди вернулись в свои дома.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Хорошая работа, сын мой.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Но ты должен продолжать свой путь. Да благословит тебя Аданос.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//(молится) Аданос, благослови этого воина. Освети его путь и даруй ему силу противостоять любым опасностям.
	B_RaiseAttribute(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_Addon_Vatras_Waffen(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Waffen_Condition;
	information = DIA_Addon_Vatras_Waffen_Info;
	permanent = TRUE;
	description = "Насчет этого торговца оружием...";
};


func int DIA_Addon_Vatras_Waffen_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Waffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//Насчет этого торговца оружием...
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
	Info_AddChoice(DIA_Addon_Vatras_Waffen,Dialog_Back,DIA_Addon_Vatras_Waffen_BACK);
	if((Fernando_ImKnast == TRUE) || (Fernando_HatsZugegeben == TRUE))
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Я знаю торговца, который продает оружие бандитам!",DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Как много ты знаешь про этого торговца?",DIA_Addon_Vatras_Waffen_ToMartin);
	};
};

func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
};

func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Как много ты знаешь про этого торговца?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Спроси Мартина, интенданта паладинов. Он сможет рассказать тебе больше.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Он должен вывести торговца оружием на чистую воду.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Ты найдешь Мартина в портовом районе. Когда увидишь кучу ящиков и множество паладинов, то знай: Мартин неподалеку.
	if(Vatras_ToMartin == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Интендант паладинов Мартин также занимается проблемой с поставщиком оружия. Я могу найти его в гавани, где паладины хранят свои запасы.");
	};
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Я знаю торговца, который продает оружие бандитам!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Его зовут Фернандо.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Отлично. Мартин предпринял необходимые меры, чтобы остановить его?
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Да. Мартин проследит за тем, чтобы он нескоро вышел из тюрьмы.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Хорошая работа, сын мой.
		if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (SC_IsRanger == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(с надеждой) А теперь вы примете меня в Кольцо Воды?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(улыбается) Мы не об ЭТОМ договаривались, и ты это знаешь.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Да осветит твой путь Аданос.
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Пока нет.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Тогда поспеши и как можно скорее отправляйся к нему. Это безобразие необходимо немедленно остановить.
		Vatras_ToMartin = TRUE;
	};
};


instance DIA_Addon_Vatras_WISP(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_WISP_Condition;
	information = DIA_Addon_Vatras_WISP_Info;
	description = "Ты можешь помочь мне в моих поисках?";
};


func int DIA_Addon_Vatras_WISP_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader != FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WISP_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Ты можешь помочь мне в моих поисках?
	if((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (MIS_Vatras_FindTheBanditTrader == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Ты очень настойчивый юноша. Но я действительно могу кое-что тебе дать, чтобы облегчить тебе задачу.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//Я дам тебе этот амулет. Тебе он пригодится.
	CreateInvItems(self,ItAm_Addon_WispDetector,1);
	B_GiveInvItems(self,other,ItAm_Addon_WispDetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//Это амулет ищущего огонька.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Очень редкая вещь. Ищущий огонек, который живет в этом амулете, обладает особыми свойствами.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Он будет помогать тебе искать предметы, которые без него ты мог бы и не найти.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Чтобы вызвать огонька, просто надень амулет.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Если огонек потеряет свою силу или потеряется, сними амулет и надень его снова, и огонек вернется.
	B_LogEntry(TOPIC_Addon_Bandittrader,"Ватрас дал мне амулет ищущего блуждающего огонька, который поможет мне в поисках торговца оружием.");
	Log_CreateTopic(TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned);
	B_LogEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//Ищущий огонек поможет тебе искать оружие.
	if((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (MIS_Vatras_FindTheBanditTrader == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//С его помощью ты сможешь узнать, какими путями оружие попадает к бандитам.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Храни его, и он никогда не подведет тебя.
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"Спасибо! Я обязательно воспользуюсь им.",DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"А что еще может делать ищущий огонек?",DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"Ищущий огонек в амулете?",DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;
};

func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//Спасибо! Я обязательно воспользуюсь им.
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
};

func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//А что еще может делать ищущий огонек?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//Что еще, кроме поиска оружия? Больше ничего, если только ты его не научишь.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//Мне кажется, Риордиан знает, как обучать эти штуки. Он один из нас, и в данный момент он путешествует вместе с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//Возможно, он сможет рассказать тебе больше.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"Мой блуждающий огонек может искать не только оружие ближнего боя. Научить его искать другие предметы может маг Воды Риордиан.");
	};
};

func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//Ищущий огонек в амулете?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Ищущие огоньки - это удивительные существа. Они полностью состоят из магической энергии.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//Они связаны с магической рудой этого мира. Она дает им силу.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Меня не удивляет, что ты никогда не слышал о них. Они являются только людям, у которых при себе есть их родная руда.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Ищущие огоньки были насильно изгнаны со своих земель.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//Мы никак не можем помочь этим несчастным созданиям. Тебе лучше держаться от них подальше.
};


instance DIA_Addon_Vatras_Stoneplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_Stoneplate_Condition;
	information = DIA_Addon_Vatras_Stoneplate_Info;
	description = "У меня с собой есть каменная табличка. Не мог бы ты мне рассказать о ней что-нибудь?";
};


func int DIA_Addon_Vatras_Stoneplate_Condition()
{
	if(C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//У меня с собой есть каменная табличка. Не мог бы ты мне рассказать о ней что-нибудь?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//Это артефакт древней культуры, которую мы давно исследуем.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Существует несколько разновидностей таких табличек. В некоторых из них содержится информация по истории древних народов.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//Меня интересуют именно они. Принеси мне все, какие сможешь найти.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Тебя будет ждать достойная награда.
	if(TOPIC_End_Stoneplates == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	};
	if(Erol_AskedKDW == FALSE)
	{
		B_LogEntries(TOPIC_Addon_Stoneplates,LogText_Addon_VatrasTrade);
		if(CurrentLevel != DRAGONISLAND_ZEN)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogNextEntry(TOPIC_CityTrader,LogText_Addon_VatrasTrade);
		}
		else
		{
			B_LogNextEntry(TOPIC_MyCrew,"Ватраса интересуют странные каменные таблички.");
		};
	}
	else
	{
		B_LogEntry(TOPIC_Addon_Stoneplates,LogText_Addon_VatrasTrade);
	};
};


instance DIA_Addon_Vatras_SellStonplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_SellStonplate_Condition;
	information = DIA_Addon_Vatras_SellStonplate_Info;
	permanent = TRUE;
	description = "Я принес тебе еще таблички...";
};


func int DIA_Addon_Vatras_SellStonplate_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Vatras_Stoneplate) || Npc_KnowsInfo(other,DIA_Addon_Vatras_DI_Stoneplate)) && Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_SellStonplate_Info()
{
	var int anzahl;
	anzahl = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);
	TotalStoneplatesForVatras += anzahl;
	AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//Я принес тебе еще таблички...
	if((TotalStoneplatesForVatras > 25) && (MIS_Addon_Erol_BanditStuff == LOG_Running) && (CurrentLevel != DRAGONISLAND_ZEN))
	{
		MIS_Addon_Erol_BanditStuff = LOG_FAILED;
		B_CheckLog();
	};
	B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,anzahl);
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//Отлично!
	if(anzahl >= 10)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//За это я повышу твои магические способности!
		B_RaiseAttribute(other,ATR_MANA_MAX,anzahl);
	}
	else if(anzahl >= 5)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Вот, возьми в награду несколько магических свитков...
		if(!Npc_HasItems(other,ItRu_InstantFireball))
		{
			CreateInvItems(self,ItSc_InstantFireball,anzahl);
			B_GiveInvItems(self,other,ItSc_InstantFireball,anzahl);
		}
		else if(!Npc_HasItems(other,ItRu_Icelance))
		{
			CreateInvItems(self,ItSc_Icelance,anzahl);
			B_GiveInvItems(self,other,ItSc_Icelance,anzahl);
		}
		else
		{
			CreateInvItems(self,ItSc_SumSkel,anzahl);
			B_GiveInvItems(self,other,ItSc_SumSkel,anzahl);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Вот, возьми в награду несколько зелий...
		CreateInvItems(self,ItPo_Health_03,anzahl + 1);
		B_GiveInvItems(self,other,ItPo_Health_03,anzahl + 1);
	};
	Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
	B_GivePlayerXP(XP_Addon_VatrasStonplate * anzahl);
};


var int Vatras_SentToDaron;

instance DIA_Addon_Vatras_GuildHelp(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_GuildHelp_Condition;
	information = DIA_Addon_Vatras_GuildHelp_Info;
	description = "Ларес сказал, что ты можешь помочь мне попасть в монастырь магов Огня.";
};


func int DIA_Addon_Vatras_GuildHelp_Condition()
{
	if((RangerHelp_gildeKDF == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Ларес сказал, что ты можешь помочь мне попасть в монастырь магов Огня.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//Это твой выбор? Идти по пути Огня?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Да. Я хочу стать магом Огня.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//Насколько мне известно, они с радостью принимают послушников. Так зачем тебе нужна моя помощь?
	if(Npc_KnowsInfo(other,DIA_Pedro_TEMPEL))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Послушник перед воротам монастыря требует, чтобы я заплатил за вход. Он требует овцу и золото.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Ларес упомянул, что они требуют плату за вход в монастырь.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//Я не смогу провести тебя в монастырь. Я все-таки маг Воды, знаешь ли. Но я очень хорошо знаю мага Огня Дарона.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Большую часть времени он проводит на рыночной площади, собирая пожертвования.
	Vatras_SentToDaron = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//Но я слышал, что иногда он отлучается из города.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Он рассказал мне о статуэтке, которую у него украли.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Эта вещица очень много значит для него. Если ты сумеешь вернуть статуэтку, он обязательно проведет тебя в монастырь.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Помни, что даже если ты вступишь в Круг Огня, ты все еще сможешь присоединиться к нам.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Если, конечно, докажешь свою полезность.
	MIS_Addon_Vatras_Go2Daron = LOG_Running;
//	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
//	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Маг Огня Дарон поможет мне попасть в монастырь, если я найду его похищенную статуэтку.");
};


/*instance DIA_Vatras_MORE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 998;
	condition = DIA_Vatras_MORE_Condition;
	information = DIA_Vatras_MORE_Info;
	permanent = TRUE;
	description = "(еще)";
};


func int DIA_Vatras_MORE_Condition()
{
	if(Vatras_MORE == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_MORE_Info()
{
	Vatras_MORE = TRUE;
};*/

func void B_Vatras_Segen()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Blessing == FALSE))
	{
		B_LogEntry(TOPIC_Thorben,"Маг Воды Ватрас благословил меня.");
	};
	Vatras_Segen += 1;
	if((MadKillerCount > 0) && (VatrasMadKillerCount == 0) && (Vatras_Segen > 9))
	{
		MadKillerCount -= 1;
		Vatras_Segen = 0;
	};
	Snd_Play("LevelUp");
	Vatras_Blessing = TRUE;
};

func void B_Vatras_NoMoreBlessing()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_13");	//Я дал тебе два шанса сказать мне правду, но ты, по-видимому, не хочешь этого. Я не дам тебе моего благословения.
	AI_StopProcessInfos(self);
};

func void B_Vatras_Blessing()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Ступай с благословением Аданоса, сын мой!
	B_GivePlayerXP(XP_VatrasTruth);
	B_Vatras_Segen();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
};

instance DIA_Vatras_INFLUENCE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 92;
	condition = DIA_Vatras_INFLUENCE_Condition;
	information = DIA_Vatras_INFLUENCE_Info;
	permanent = TRUE;
	description = "Я прошу твоего благословения.";
};


func int DIA_Vatras_INFLUENCE_Condition()
{
//	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (Vatras_MORE == TRUE))
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (Vatras_Blessing == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Я прошу твоего благословения.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		B_Vatras_Blessing();
	}
	else if(Vatras_Chance == TRUE)
	{
		B_Vatras_NoMoreBlessing();
	}
	else 
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Почему я должен дать тебе мое благословение, чужеземец?
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Я хочу стать учеником одного из мастеров в нижней части города.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_03");	//Я могу дать тебе благословение, чужеземец, но я ничего не знаю о тебе. Расскажи мне о себе.
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Что ты хочешь знать?
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Ну, ты можешь рассказать мне, откуда ты пришел и зачем ты пришел в этот город.
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//У меня важное сообщение для главы паладинов.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Что за сообщение?
		Info_ClearChoices(DIA_Vatras_INFLUENCE);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"Пока мы разговариваем, собирается огромная армия, ведомая драконами.",DIA_Vatras_BLESSING_FIRST_TRUTH);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"Скоро произойдут ужасные вещи!",DIA_Vatras_BLESSING_FIRST_LIE);
	};
};


func void B_Vatras_BLESSING_REPEAT()
{
	B_Vatras_REPEAT();
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_REPEAT_15_00");	//Так ты дашь мне свое благословение?
		B_Vatras_Blessing();
	}
	else if(Vatras_Chance == FALSE)
	{
		B_Vatras_PLEASEDONTLIE();
		Vatras_Chance = TRUE;
		Info_ClearChoices(DIA_Vatras_INFLUENCE);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"Пока мы разговариваем, собирается огромная армия, ведомая драконами.",DIA_Vatras_BLESSING_FIRST_TRUTH);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"Скоро произойдут ужасные вещи!",DIA_Vatras_BLESSING_FIRST_LIE);
	}
	else
	{
		B_Vatras_NoMoreBlessing();
	};
};

func void DIA_Vatras_BLESSING_FIRST_TRUTH()
{
	B_Vatras_First_Truth();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Ох, я где-то слышал об этом...",DIA_Vatras_BLESSING_SECOND_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Мне сказал об этом маг Ксардас. Он послал меня предупредить паладинов.",DIA_Vatras_BLESSING_SECOND_TRUTH);
};

func void DIA_Vatras_BLESSING_FIRST_LIE()
{
	B_Vatras_First_Lie();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Ох, я где-то слышал об этом...",DIA_Vatras_BLESSING_SECOND_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Мне сказал об этом маг Ксардас. Он послал меня предупредить паладинов.",DIA_Vatras_BLESSING_SECOND_TRUTH);
};

func void DIA_Vatras_BLESSING_SECOND_TRUTH()
{
	B_Vatras_Second_Truth();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Я искатель приключений с юга...",DIA_Vatras_BLESSING_THIRD_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Я бывший заключенный колонии Хориниса.",DIA_Vatras_BLESSING_THIRD_TRUTH);
};

func void DIA_Vatras_BLESSING_SECOND_LIE()
{
	B_Vatras_Second_Lie();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Я искатель приключений с юга...",DIA_Vatras_BLESSING_THIRD_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"Я бывший заключенный колонии Хориниса.",DIA_Vatras_BLESSING_THIRD_TRUTH);
};

func void DIA_Vatras_BLESSING_THIRD_TRUTH()
{
	B_Vatras_Third_Truth();
	B_Vatras_BLESSING_REPEAT();
};

func void DIA_Vatras_BLESSING_THIRD_LIE()
{
	B_Vatras_Third_Lie();
	B_Vatras_BLESSING_REPEAT();
};

instance DIA_Vatras_WoKdF(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 93;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = "Где мне найти жреца Инноса?";
};


func int DIA_Vatras_WoKdF_Condition()
{
//	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Segen > 0) && (Vatras_SentToDaron == FALSE) && !Npc_KnowsInfo(other,DIA_Daron_Hallo) && (Vatras_MORE == TRUE))
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Blessing == TRUE) && (Vatras_SentToDaron == FALSE) && (GotInnosBlessingForThorben == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Где мне найти жреца Инноса?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Попробуй поискать его на рыночной площади. Ты найдешь там представителя монастыря.
};


var int Vatras_Spende;
var int Vatras_Spende_Day;
var int Vatras_Spende_Day_First;

instance DIA_Vatras_Spende(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 94;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = "Я хочу сделать пожертвование Аданосу!";
};


func int DIA_Vatras_Spende_Condition()
{
//	if(Vatras_MORE == TRUE)
//	if((Vatras_MORE == TRUE) && (Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	if(((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE)) || (Vatras_Chance == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_Spende_Info()
{
	if((Vatras_Spende_Day_First == TRUE) && (Vatras_Spende_Day < Wld_GetDay()))
	{
		Vatras_Spende = 0;
	};
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Я хочу сделать пожертвование Аданосу!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Пожертвование церкви Аданоса снимет часть грехов, которые ты мог совершить, сын мой.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Сколько ты можешь пожертвовать?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende,"Мне сейчас нечем поделиться...",DIA_Vatras_Spende_BACK);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende,"У меня есть 50 золотых монет...",DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende,"У меня есть 100 золотых монет...",DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Мне сейчас нечем поделиться...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Это не проблема, ты можешь выразить свои добрые намерения позже, сын мой.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void B_Vatras_Spende_Check()
{
	if(Vatras_Spende < 100)
	{
		AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Я благодарю тебя от имени Аданоса, сын мой. Твое золото будет роздано нуждающимся.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Я благословляю тебя от имени Аданоса за этот великодушный дар!
		AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Да будет путь, по которому ты идешь, благословлен Аданосом!
		B_Vatras_Segen();
		Vatras_Spende = 0;
	};
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//У меня есть 50 золотых монет...
	B_GiveInvItems(other,self,ItMi_Gold,50);
	if(Vatras_Spende_Day == 0)
	{
		Vatras_Spende += 50;
		Vatras_Spende_Day_First = TRUE;
	}
	else if(Vatras_Spende_Day >= Wld_GetDay())
	{
		Vatras_Spende += 50;
	};
	Vatras_Spende_Day = B_GetDayPlus();
	B_Vatras_Spende_Check();
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//У меня есть 100 золотых монет...
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Vatras_Spende += 100;
	B_Vatras_Spende_Check();
};


instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 95;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь из области магии?";
};


func int DIA_Vatras_CanTeach_Condition()
{
	/*if(Vatras_MORE == TRUE)
	{
		return TRUE;
	};*/
	return TRUE;
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Ты можешь научить меня чему-нибудь из области магии?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Только Избранным Инноса и Избранным Аданоса позволено пользоваться магией рун.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Но обычные смертные также могут пользоваться магией при помощи свитков.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Я могу показать тебе, как направлять и усиливать свои магические способности.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Маг Воды Ватрас может помочь мне повысить мои магические способности.");
};


instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int DIA_Vatras_Teach_Condition()
{
//	if((Vatras_TeachMANA == TRUE) && (Vatras_MORE == TRUE))
	if(Vatras_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Я хочу повысить мои магические способности.
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_BACK()
{
//	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	if(other.aivar[REAL_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Твоя магическая энергия стала слишком велика, чтобы я мог еще повысить ее.
	};
	Info_ClearChoices(DIA_Vatras_Teach);
};

func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};


instance DIA_Vatras_GODS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 98;
	condition = DIA_Vatras_GODS_Condition;
	information = DIA_Vatras_GODS_Info;
	permanent = TRUE;
	description = "Расскажи мне о богах.";
};


func int DIA_Vatras_GODS_Condition()
{
	/*if(Vatras_MORE == TRUE)
	{
		return TRUE;
	};*/
	return TRUE;
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Расскажи мне о богах.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Что именно ты хочешь знать?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Инносе.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Аданосе.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне о Белиаре.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Расскажи мне об Инносе.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Хорошо. (проповедует) Иннос - первый и величайший из богов. Он создал солнце и мир.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Он повелевает светом и огнем - его даром человечеству. Он суть закон и правосудие.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Его жрецы - маги Огня, а паладины - его воины.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Инносе.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Аданосе.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне о Белиаре.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Расскажи мне об Аданосе.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Аданос - бог центра. Он - весы правосудия, страж равновесия между Инносом и Белиаром.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Он повелевает силой изменения. Его дар - вода во всех океанах, реках и озерах.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Его жрецы - маги Воды. Я тоже слуга и жрец Аданоса.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Инносе.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Аданосе.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне о Белиаре.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Расскажи мне о Белиаре.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Белиар - это темный бог смерти, разрушения и всего неестественного.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Он ведет вечную битву с Инносом, но Аданос стоит на страже баланса между этими двумя.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Только немногие люди следуют зову Белиара, однако он дарует огромную силу своим слугам.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Инносе.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне об Аданосе.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Расскажи мне о Белиаре.",DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "Ты можешь вылечить меня?";
};


func int DIA_Vatras_HEAL_Condition()
{
	/*if(Vatras_MORE == TRUE)
	{
		return TRUE;
	};*/
	return TRUE;
};

func void DIA_Vatras_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Ты можешь вылечить меня?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(благочестиво) Аданос, благослови это тело. Освободи его от ран и вдохни в него силу новой жизни.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Сейчас ты не нуждаешься в магии исцеления.
	};
};


instance DIA_Vatras_MISSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MISSION_Condition;
	information = DIA_Vatras_MISSION_Info;
	important = TRUE;
};


func int DIA_Vatras_MISSION_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 2) && !Npc_IsDead(Isgaroth) && Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//У меня есть сообщение для мастера Исгарота. Он охраняет часовню перед монастырем.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Если ты выполнишь это задание для меня, ты можешь выбрать вознаграждение.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Пока нет!",DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"Я сделаю это.",DIA_Vatras_MISSION_YES);
};

func void B_SayVatrasGo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Хорошо. Так иди же к мастеру Исгароту.
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Я сделаю это.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Хорошо, тогда доставь это сообщение и выбери один из этих свитков с заклинаниями.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//А когда ты доставишь сообщение, я вознагражу тебя соответствующим образом.
	B_GiveInvItems(self,other,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft,"Ватрас дал мне записку для мастера Исгарота. Он находится в часовне неподалеку от монастыря.");
	Info_ClearChoices(DIA_Vatras_MISSION);
/*	Info_AddChoice(DIA_Vatras_MISSION,"Я возьму заклинание света.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"Я выбираю лечебное заклинание.",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"Дай мне 'Ледяную стрелу'.",DIA_Vatras_MISSION_ICE);*/
	Info_AddChoice(DIA_Vatras_MISSION,"(выбрать свиток света)",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"(выбрать свиток лечения легких ранений)",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"(выбрать свиток ледяной стрелы)",DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Пока нет!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//Нет проблем. Я отправлю кого-нибудь другого.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Я выбираю лечебное заклинание.
	B_SayVatrasGo();
	B_GiveInvItems(self,other,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Дай мне 'Ледяную стрелу'.
	B_SayVatrasGo();
	B_GiveInvItems(self,other,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Я возьму заклинание света.
	B_SayVatrasGo();
	B_GiveInvItems(self,other,ItSc_Light,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};


instance DIA_Vatras_MESSAGE_SUCCESS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information = DIA_Vatras_MESSAGE_SUCCESS_Info;
	description = "Я доставил твое сообщение.";
};


func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Vatras_Return == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Я доставил твое сообщение.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Прими мою благодарность. И свою награду.
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"(выбрать царский щавель)",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"(выбрать кольцо мастерства)",DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"(выбрать кусок руды)",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00_Plant_Add");	//Я возьму царский щавель.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Я возьму кольцо.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(self,other,ItRi_Dex_01,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00_Ore_Add");	//Я возьму руду.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(self,other,ItMi_Nugget,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};


const int kurz = 0;
const int lang = 1;
var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg(var int dauer)
{
	if(Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Послушайте меня, люди! Я нужен в другом месте.
		if(dauer == kurz)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Это не займет много времени. А когда я вернусь, я расскажу вам окончание этой истории.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Я не знаю, вернусь ли я. Если же вы хотите знать окончание, прочтите эту историю в писаниях.
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Да пребудет с вами Аданос!
		Vatras_Listeners_ReadyToGo = TRUE;
		B_TurnToNpc(self,other);
	};
};


instance DIA_Addon_Vatras_AbloesePre(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AbloesePre_Condition;
	information = DIA_Addon_Vatras_AbloesePre_Info;
	description = "У меня сложности в связи с Глазом Инноса. Я хотел попросить о помощи.";
};


func int DIA_Addon_Vatras_AbloesePre_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == FALSE))
	{
		if((RavenIsDead == FALSE) && (AddonDisabled == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Vatras_AbloesePre_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//У меня сложности в связи с Глазом Инноса. Я хотел попросить о помощи.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//И из-за твоей проблемы мне придется покинуть город?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//Я не знаю, возможно.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//Я уже много дней жду, чтобы меня сменили. Остальные маги Воды должны были уже вернуться в Хоринис.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Если ты сделаешь так, чтобы хотя бы один из них сменил меня, я смогу помочь тебе.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Ватрас не может помочь мне решить проблему с 'Глазом Инноса' пока не найдется еще одного мага Воды, готового заменить его в городе.");
};


instance DIA_Addon_Vatras_AddonSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AddonSolved_Condition;
	information = DIA_Addon_Vatras_AddonSolved_Info;
	description = "Я нашел тебе смену.";
};


func int DIA_Addon_Vatras_AddonSolved_Condition()
{
	if(RavenIsDead == TRUE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
		{
			DIA_Addon_Vatras_AddonSolved.description = "Я нашел тебе смену.";
		}
		else
		{
			DIA_Addon_Vatras_AddonSolved.description = "Я вернулся.";
		};
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AddonSolved_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//Я нашел тебе смену.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//Я вернулся.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//Как обстоит дело с проблемой в северо-восточных горах?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//Нормально. Ворон мертв, угроза устранена.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//Это очень хорошая новость. Будем надеяться, что ничего страшного больше не случится.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//ТЕПЕРЬ я могу помочь тебе.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//Кажется, дело касается Глаза Инноса, не так ли?
	};
	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
};


instance DIA_Vatras_INNOSEYEKAPUTT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information = DIA_Vatras_INNOSEYEKAPUTT_Info;
	description = "Глаз Инноса поврежден.";
};


func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3))
	{
		if((VatrasCanLeaveTown_Kap3 == TRUE) || (AddonDisabled == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Глаз Инноса поврежден.
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Меня прислал Пирокар.
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Меня прислал Ксардас.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Я знаю. Я уже узнал об этом от одного очень огорченного послушника.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Ищущие использовали Круг Солнца магов Огня, чтобы уничтожить Глаз.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//Я бы назвал это вынужденным шагом врага.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"В этом городе новости распространяются быстро.",DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Почему Пирокар послал меня именно к тебе?",DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Что теперь будет с Глазом?",DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Что теперь будет с Глазом?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Мы должны восстановить его. Но это, боюсь, будет непростой задачей.
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis))
	{
		if(MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Оправа разбита на две части. Искусный кузнец должен быть способен починить ее.
			AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Но проблема не в этом. Меня больше волнует драгоценный камень.
		};
		AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Он тускл и безжизненен. Враг, похоже, хорошо знал, как ослабить его.
		if(!Npc_KnowsInfo(other,DIA_Bennet_GiveInnosEye))
		{
			Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Где мне найти кузнеца, способного починить оправу Глаза?",DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
		};
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Как можно восстановить силу камня?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
	}
	else
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"И что нам делать дальше?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis))
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Как можно восстановить силу камня?
	}
	else
	{
		AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//И что нам делать дальше?
	};
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Я вижу только один способ. Союз трех правящих божеств должен дать желаемый эффект.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Хорошо подготовленный ритуал обращения в месте уничтожения камня вернет ему его огонь.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Однако проблема состоит в том, что ты должен привести в это место земных представителей каждого из этих троих богов.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Кроме того, для этого ритуала необходимо много болотной травы. Я думаю, необходимо не менее трех растений.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Кто может быть этими тремя земными представителями богов?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Где мне найти болотную траву?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Где мне найти болотную траву?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Я слышал о старой шаманке Сагитте, живущей в лесу. Предположительно, она продает такие травы.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Но также ты можешь попытать счастья в местной гавани.
	if(!Npc_IsDead(Sagitta) && (Npc_HasItems(Sagitta,ItPl_SwampHerb) < 3))
	{
		CreateInvItems(Sagitta,ItPl_SwampHerb,3);
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Кто может быть этими тремя земными представителями богов?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Я буду представлять бога Аданоса лично.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Пирокар, высший маг Огня, был бы подходящей кандидатурой на представителя бога Инноса.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Но для Белиара мне не приходит в голову подходящий кандидат. Это должен быть кто-то, кто владеет черной магией.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Черной магией? А что насчет Ксардаса?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Черной магией? А что насчет Ксардаса?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Точно. Это может сработать.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Но я задаю себе вопрос - как ты приведешь нас троих в одно место.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Представляю выражение лица Пирокара, когда он услышит, что должен работать рука об руку с Ксардасом.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Я должен идти.",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Где мне найти кузнеца, способного починить оправу Глаза?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Поспрашивай вокруг о том, кто может ремонтировать драгоценности.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Почему Пирокар послал меня именно к тебе?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Я подозревал, что рано или поздно что-то подобное должно было случиться.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Пирокар всегда считал себя таким неуязвимым и непревзойденным, что это почти граничило с беспечностью.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Так, его меры предосторожности по защите Глаза были тоже беспечными.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Я просто думаю, что он подсознательно полагается на способности, которые Аданос даровал мне.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Невыносимо думать, что могло бы произойти, если бы я сейчас был недоступен.
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//В этом городе новости распространяются быстро.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Это, конечно, хорошо, но враг тоже не будет спать.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Я должен идти.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Я тоже должен отправляться в путь, чтобы подготовить церемонию в Круге Солнца.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Пошли Ксардаса и Пирокара туда. И не забудь принести болотную траву. Я полагаюсь на тебя.
	B_LogEntry(TOPIC_INNOSEYE,"Ватрас хочет провести ритуал в Круге Солнца, чтобы восстановить Глаз. Я должен убедить Ксардаса и Пирокара принять в нем участие. Также, я должен найти кузнеца, который может починить поврежденную оправу амулета.");
	MIS_RitualInnosEyeRepair = LOG_Running;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	B_Vatras_GeheWeg(kurz);
	if(!Npc_IsDead(DMT_1202))
	{
		DMT_1202.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1202,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1204))
	{
		DMT_1204.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1204,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1206))
	{
		DMT_1206.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1206,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1207))
	{
		DMT_1207.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1207,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1209))
	{
		DMT_1209.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1209,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1210))
	{
		DMT_1210.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1210,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1211))
	{
		DMT_1211.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1211,"AfterRitual");
	};
};


instance DIA_Vatras_RitualInnosEyeRepair(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_RitualInnosEyeRepair_Condition;
	information = DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent = TRUE;
	description = "Как обстоят дела с Глазом Инноса?";
};


func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Как обстоят дела с Глазом Инноса?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Помни: только ритуал обращения в Круге Солнца вместе с Ксардасом и Пирокаром восстановит Глаз.
	if(RitualInnosEyeRuns != LOG_Running)
	{
		AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//И не забудь принести Глаз с отремонтированной оправой.
	};
};


instance DIA_Vatras_BEGINN(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = "Я сделал все, как ты сказал мне. Вот починенный Глаз.";
};


func int DIA_Vatras_BEGINN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Я сделал все, как ты сказал мне. Вот починенный Глаз.
	B_GiveInvItems(other,self,ItMi_InnosEye_Broken_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Broken_Mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Да, теперь все готово для проведения ритуала.
	if(Npc_HasItems(other,ItPl_SwampHerb) >= 3)
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//Что насчет болотной травы?
		B_GivePlayerXP(XP_RitualInnosEyeRuns + XP_AmbientKap3);
	}
	else
	{
		B_GivePlayerXP(XP_RitualInnosEyeRuns);
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ах, да. Ты принес три стебля болотной травы?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Гм. Да. Вот три растения.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Превосходно.
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Нет, боже мой, нет!
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Хорошо. Тогда нам придется обойтись без нее.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Ты хорошо поработал, но теперь отойди в сторону, чтобы мы могли начать церемонию. Да объединятся наши души!
	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN,Dialog_Ende,DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self);
//	Vatras_MORE = FALSE;
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance DIA_Vatras_AUGEGEHEILT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_AUGEGEHEILT_Condition;
	information = DIA_Vatras_AUGEGEHEILT_Info;
	important = TRUE;
};


func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if((Kapitel == 3) && (RitualInnosEyeRuns == LOG_Running) && !Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Мы закончили. Нам удалось разрушить план врага и восстановить Глаз.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Пусть Пирокар объяснит тебе, как пользоваться его силой.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Надеюсь, я еще увижу тебя, когда ты выполнишь свою миссию. Прощай.
	B_LogEntry(TOPIC_INNOSEYE,"Глаз был восстановлен. Пирокар отдает его мне, и начинается охота на драконов.");
	AI_StopProcessInfos(self);
//	Vatras_MORE = FALSE;
	Vatras_Listeners_ReadyToGo = TRUE;
	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;
	B_StartOtherRoutine(Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas,"RitualInnosEyeRepair");
	B_Vatras_ListenersControl();
};


instance DIA_Vatras_PERMKAP3(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_PERMKAP3_Condition;
	information = DIA_Vatras_PERMKAP3_Info;
	description = "Спасибо, что помог восстановить Глаз Инноса.";
};


func int DIA_Vatras_PERMKAP3_Condition()
{
	if(MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Спасибо, что помог восстановить Глаз Инноса.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Оставь пустые слова благодарности. Самое тяжелое еще ждет тебя впереди.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Поговори с Пирокаром, он объяснит все, что тебе нужно знать.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Надеюсь увидеть тебя опять целым и невредимым, сын мой.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = "Жена Лобарта, Хильда, больна.";
};


func int DIA_Vatras_HILDAKRANK_Condition()
{
	if((MIS_HealHilda == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_GREET))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Жена Лобарта, Хильда, больна.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Что? Опять? Эта добрая женщина должна больше заботиться о себе.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Еще одна тяжелая зима, и ее с нами больше не будет. Хорошо, я дам ей лекарство, которое облегчит лихорадку.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Ох, знаешь, раз все равно ты здесь, ты мог бы занести ей его.
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = "Я ощущаю внутреннюю тревогу.";
};


func int DIA_Vatras_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Я ощущаю внутреннюю тревогу.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Да, и выглядишь ты бледно. Ты слишком долго подвергался воздействию черного взгляда Ищущих.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Все, что я могу - это вылечить твое тело, но только монастырь может очистить твою душу. Поговори с Пирокаром. Он поможет тебе.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = "Драконы больше не будут сеять хаос.";
};


func int DIA_Vatras_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Драконы больше не будут сеять хаос.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Я знал, что ты вернешься в добром здравии. Однако самое суровое испытание еще ждет тебя впереди.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Я знаю.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Тогда найди себе снаряжение получше и приходи ко мне, если тебе нужна помощь. И всегда носи с собой Глаз Инноса, слышишь? Аданос благословляет тебя.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я знаю, где находится наш враг.";
};


func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Vatras_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Я знаю, где находится наш враг.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Тогда не будем терять времени и найдем его в его логове, пока он сам не пришел к нам.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Ты хочешь сопровождать меня?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Я много думал об этом. Да, я никогда не был так уверен в своем выборе, мой друг.
	if(SCToldVatrasHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"Как это ни странно, Ватрас предложил мне сопровождать меня в моем путешествии. Человек, обладающий его навыками и опытом, может оказаться очень полезным для меня.");
		SCToldVatrasHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//В моем списке и так уже слишком много народа. Боюсь, там не найдется места для тебя.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Так освободи место. Я тебе понадоблюсь.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Мне нужно еще подумать об этом.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Я сочту за честь, что ты будешь на моей стороне. Встретимся в гавани.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Я сочту за честь, что ты будешь на моей стороне. Встретимся в гавани.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Только не трать время понапрасну. Помни, друг мой, враг не дремлет.
	B_Vatras_GeheWeg(lang);
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
	Info_AddChoice(DIA_Vatras_KnowWhereEnemy,Dialog_Ende,DIA_Vatras_JoinShip);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Мне нужно еще подумать об этом.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Как знаешь. Возвращайся ко мне, если передумаешь.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

var int Vatras_JoinShip_Once;

func void DIA_Vatras_JoinShip()
{
	B_JoinShip(self);
	if(Vatras_JoinShip_Once == FALSE)
	{
		B_Vatras_ListenersControl();
		Vatras_JoinShip_Once = TRUE;
	};
};

instance DIA_Vatras_LeaveMyShip(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_LeaveMyShip_Condition;
	information = DIA_Vatras_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Тебе лучше остаться здесь. Ты нужен городу.";
};


func int DIA_Vatras_LeaveMyShip_Condition()
{
	if((Vatras_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Тебе лучше остаться здесь. Ты нужен городу.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Возможно, ты прав. И все же я готов сопровождать тебя, если ты этого захочешь. Ты знаешь это.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_Vatras_StillNeedYou(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_StillNeedYou_Condition;
	information = DIA_Vatras_StillNeedYou_Info;
	permanent = TRUE;
	description = "Поплывем вместе на вражеский остров.";
};


func int DIA_Vatras_StillNeedYou_Condition()
{
	if(((Vatras_IsOnBoard == LOG_OBSOLETE) || (Vatras_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Поплывем вместе на вражеский остров.
	if(Vatras_WasOnBoard == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Мудрое решение. Надеюсь, ты больше его не переменишь.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Только не трать время понапрасну. Помни, друг мой, враг не дремлет.
	};
	B_Vatras_GeheWeg(lang);
	if(Vatras_JoinShip_Once == FALSE)
	{
		Info_ClearChoices(DIA_Vatras_StillNeedYou);
		Info_AddChoice(DIA_Vatras_StillNeedYou,Dialog_Ende,DIA_Vatras_JoinShip);
	}
	else
	{
		B_JoinShip(self);
	};
};


instance DIA_Addon_Vatras_PISSOFFFOREVVER(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information = DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition()
{
	if((VatrasPissedOffForever == TRUE) && (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info()
{
	B_VatrasPissedOff();
//	AI_StopProcessInfos(self);
//	Vatras_MORE = FALSE;
};

