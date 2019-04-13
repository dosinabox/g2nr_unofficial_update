
instance DIA_Halvor_EXIT(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 999;
	condition = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Halvor_PICKPOCKET(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 900;
	condition = DIA_Halvor_PICKPOCKET_Condition;
	information = DIA_Halvor_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Halvor_PICKPOCKET_Condition()
{
	return C_Beklauen(78,150);
};

func void DIA_Halvor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,Dialog_Back,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Halvor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};

func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Halvor_PICKPOCKET);
};


instance DIA_Halvor_Hallo(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hallo_Condition;
	information = DIA_Halvor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Halvor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Эй, тебе нужна рыба? У меня очень хорошая рыба - с самых глубин моря!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Халвор торгует рыбой в гавани.");
};


instance DIA_Halvor_TRADE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_TRADE_Condition;
	information = DIA_Halvor_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свою рыбу.";
};


func int DIA_Halvor_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Halvor_Hallo) && Wld_IsTime(5,0,20,0) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Покажи мне свою рыбу.
};


instance DIA_Halvor_Night(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Night_Condition;
	information = DIA_Halvor_Night_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Halvor_Night_Condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,ZS_Talk) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Night_Info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Эй, если ты хочешь купить рыбу, заходи ко мне завтра. Хорошо?
};


instance DIA_Addon_Halvor_MissingPeople(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 5;
	condition = DIA_Addon_Halvor_MissingPeople_Condition;
	information = DIA_Addon_Halvor_MissingPeople_Info;
	description = "Ты знаешь что-нибудь о пропавших людях?";
};


func int DIA_Addon_Halvor_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Halvor_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//Ты знаешь что-нибудь о пропавших людях?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Пропавших людях? Это порт, приятель. Такие события здесь не в диковинку.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//Море жестоко. Оно нередко забирает человеческие жизни.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//В крупных портах, таких как Хоринис, капитаны больших кораблей набирают матросов для пополнения команды.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//А если они не находят добровольцев, людей могут затащить на корабль и против их воли. Так они и исчезают.
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,Dialog_Back,DIA_Addon_Halvor_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"Но что это мог быть за корабль?",DIA_Addon_Halvor_MissingPeople_schiff);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"Ты знаешь кого-нибудь, кто пропал?",DIA_Addon_Halvor_MissingPeople_wer);
	Info_AddChoice(DIA_Addon_Halvor_MissingPeople,"А у тебя кто-нибудь пропал?",DIA_Addon_Halvor_MissingPeople_you);
};

func void DIA_Addon_Halvor_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Halvor_MissingPeople);
};

func void DIA_Addon_Halvor_MissingPeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//Ты знаешь кого-нибудь, кто пропал?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//Нет. Попробуй спросить у корабельщиков.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Единственное, что смог мне посоветовать торговец рыбой Халвор - это обратиться к кораблестроителям.");
};

func void DIA_Addon_Halvor_MissingPeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//Но что это мог быть за корабль?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Хороший вопрос. Ты прав, в последнее время корабли в Хоринис не заходят.
};

func void DIA_Addon_Halvor_MissingPeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//А у тебя кто-нибудь пропал?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//У меня? Нет.
};


instance DIA_Halvor_MESSAGE(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_MESSAGE_Condition;
	information = DIA_Halvor_MESSAGE_Info;
	permanent = FALSE;
	description = "Я думаю, этот клочок бумаги имеет отношение к тебе...";
	trade = FALSE;
};


func int DIA_Halvor_MESSAGE_Condition()
{
	if(Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Halvor_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//Я думаю, этот клочок бумаги имеет отношение к тебе...
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//Что?.. Дай посмотрю.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//(в испарине) Э-э... Хорошо, давай поговорим спокойно об этом - э-э... послушай. Я перепродал товары, полученные от бандитов.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//(торопливо) Но нет необходимости сообщать об этом ополчению, правда? Я уверен, мы можем прийти к взаимопониманию, разве нет?
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Ну, попробуй сделать мне предложение.",DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Похоже, тебе светит тюрьма.",DIA_Halvor_MESSAGE_PRISON);
};

func void DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Ну, попробуй сделать мне предложение.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//Хорошо. Послушай меня. Я могу продать тебе не только рыбу.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//Если ты отдашь мне этот клочок бумаги, э-э... и забудешь об этом, ты и я можем стать отличными торговыми партнерами.
	Info_ClearChoices(DIA_Halvor_MESSAGE);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Хорошо, договорились.",DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Похоже, тебе светит тюрьма.",DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice(DIA_Halvor_MESSAGE,"Да ну?! И что это за товары?",DIA_Halvor_MESSAGE_DEAL);
};

func void DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Похоже, тебе светит тюрьма.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//Нет, подожди, ты е можешь поступить так! Ведь я... я... ты же понимаешь... я мелкая рыбешка.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//Тебе стоило подумать об этом раньше. А теперь я собираюсь сообщить о тебе лорду Андрэ.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//Ты пожалеешь об этом.
	Betrayal_Halvor = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//Да ну?! И что это за товары?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//Ну, я мог бы предложить тебе... особенную рыбу, понимаешь? Не простую рыбешку, которая годится только для еды.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//Ты имеешь в виду что-то вроде рыбы, содержащей твое тайное послание?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//Ты все правильно понимаешь. У меня есть несколько таких... рыб.
};

func void DIA_Halvor_MESSAGE_Okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//Хорошо, договорились. Я думаю, мы сохраним все это в тайне.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//Спасибо. Заходи, когда опять будешь неподалеку. Я приготовлю очень интересные вещички для тебя.
	B_GiveInvItems(other,self,ItWr_HalvorMessage,1);
	Npc_RemoveInvItems(self,ItWr_HalvorMessage,1);
	Halvor_Deal = TRUE;
	Diebesgilde_Okay = Diebesgilde_Okay + 1;
	CreateInvItems(self,ItSe_ErzFisch,1);
	CreateInvItems(self,ItSe_GoldFisch,1);
	CreateInvItems(self,ItSe_Ringfisch,1);
	CreateInvItems(self,ItSe_LockpickFisch,1);
	Info_ClearChoices(DIA_Halvor_MESSAGE);
};


instance DIA_Halvor_Zeichen(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Zeichen_Condition;
	information = DIA_Halvor_Zeichen_Info;
	permanent = FALSE;
	description = "(Показать сигнал воров)";
};


func int DIA_Halvor_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//Понимаю. Ты пришел не просто купить рыбу.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//(тихо) Я готов сделать тебе предложение. Если у тебя есть серебряные тарелки или чаши, я возьму их по хорошей цене.
	CreateInvItems(self,ItKE_lockpick,20);
	Log_CreateTopic(Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde,"Халвор купит серебряные тарелки и кубки по очень хорошей цене.");
};


instance DIA_Halvor_Hehlerei(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 2;
	condition = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Hehlerei_Info;
	permanent = TRUE;
	description = "(Продать все тарелки и кубки)";
};


func int DIA_Halvor_Hehlerei_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Halvor_Zeichen) && (Betrayal_Halvor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0;
	if(Halvor_Day != Wld_GetDay())
	{
		if((Npc_HasItems(other,ItMi_SilverPlate) >= 1) || (Npc_HasItems(other,ItMi_SilverCup) >= 1))
		{
			Halvor_Score = (Npc_HasItems(other,ItMi_SilverPlate) * (Value_SilverPlate / 2)) + (Npc_HasItems(other,ItMi_SilverCup) * (Value_SilverCup / 2));
			if(Halvor_Score <= 1000)
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//За твои вещички я дам тебе...
				B_Say_Gold(self,other,Halvor_Score);
				Info_ClearChoices(DIA_Halvor_Hehlerei);
				Info_AddChoice(DIA_Halvor_Hehlerei,"Хорошо. Продано!",DIA_Halvor_Hehlerei_Annehmen);
				Info_AddChoice(DIA_Halvor_Hehlerei,"Я подумаю над этим.",DIA_Halvor_Hehlerei_Ablehnen);
			}
			else
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_06");	//Ты принес слишком много. У меня нет столько золота сразу.
				Info_ClearChoices(DIA_Halvor_Hehlerei);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Заходи, когда у тебя будут серебряные тарелки или чаши.
			Info_ClearChoices(DIA_Halvor_Hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//Ты можешь отдать мне свое серебро завтра. Сегодня слишком рано.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Извини, но сегодня я не готов вести дела. Заходи завтра, хорошо?
	};
};

func void DIA_Halvor_Hehlerei_Annehmen()
{
	var int amount;
	var string concatText;
	amount = Npc_HasItems(other,ItMi_SilverPlate) + Npc_HasItems(other,ItMi_SilverCup);
	concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
	AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItems(other,ItMi_SilverCup,Npc_HasItems(other,ItMi_SilverCup));
	Npc_RemoveInvItems(other,ItMi_SilverPlate,Npc_HasItems(other,ItMi_SilverPlate));
	B_GiveInvItems(self,other,ItMi_Gold,Halvor_Score);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//Хорошо. Продано!
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//Мы заключили несколько хороших сделок сегодня. Лучше не приходи ко мне до завтра, это может вызвать подозрения, понимаешь?
	Halvor_Day = Wld_GetDay();
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};

func void DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices(DIA_Halvor_Hehlerei);
};


instance DIA_Halvor_Crew(C_Info)
{
	npc = VLK_469_Halvor;
	nr = 51;
	condition = DIA_Halvor_Crew_Condition;
	information = DIA_Halvor_Crew_Info;
	permanent = FALSE;
	description = "Я набираю команду.";
};


func int DIA_Halvor_Crew_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Halvor_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Halvor_Crew_Info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//Я набираю команду.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//А как ты планируешь уплыть отсюда?
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,"Это мое дело.",DIA_Halvor_Crew_MyThing);
	Info_AddChoice(DIA_Halvor_Crew,"Здесь есть подходящий корабль.",DIA_Halvor_Crew_StealShip);
};

func void DIA_Halvor_Crew_MyThing()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//Это мое дело.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Как знаешь. Это действительно не мое дело.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew,"Хочешь плыть со мной?",DIA_Halvor_Crew_JoinMe);
	Info_AddChoice(DIA_Halvor_Crew,"Ты можешь помочь мне?",DIA_Halvor_Crew_HelpMe);
};

func void DIA_Halvor_Crew_StealShip()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//Здесь есть подходящий корабль.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Да, точно. Ты это серьезно? Паладины сделают из тебя котлету, если доберутся до тебя.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Поступай как знаешь, но я не собираюсь рисковать своей шкурой.
	Info_ClearChoices(DIA_Halvor_Crew);
	Info_AddChoice(DIA_Halvor_Crew,Dialog_Back,DIA_Halvor_Crew_BACK);
	Info_AddChoice(DIA_Halvor_Crew,"Хочешь плыть со мной?",DIA_Halvor_Crew_JoinMe);
	if(Npc_IsDead(Jack) == FALSE)
	{
		Info_AddChoice(DIA_Halvor_Crew,"Ты можешь помочь мне?",DIA_Halvor_Crew_HelpMe);
	};
};

func void DIA_Halvor_Crew_JoinMe()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Хочешь плыть со мной?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Неет, спасибо. У меня и здесь работы хватает. Кроме того, если честно, я не хочу повстречаться с галерой, полной орков.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//Но я все же желаю тебе удачи.
};

func void DIA_Halvor_Crew_HelpMe()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//Ты можешь помочь мне?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//Я не очень подхожу для этого. Лучше поговори с Джеком, он должен ошиваться где-то здесь, в гавани. Он лучше знает, что тебе нужно для этого путешествия.
};

func void DIA_Halvor_Crew_BACK()
{
	Info_ClearChoices(DIA_Halvor_Crew);
};

