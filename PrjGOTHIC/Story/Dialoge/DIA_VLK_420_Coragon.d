
instance DIA_Coragon_EXIT(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 999;
	condition = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Coragon_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Coragon_HALLO(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_HALLO_Condition;
	information = DIA_Coragon_HALLO_Info;
	permanent = FALSE;
	description = "Могу я выпить здесь?";
};


func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Могу я выпить здесь?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//Если у тебя есть деньги, ты здесь можешь даже поесть.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Я могу покупать еду и питье у трактирщика Корагона.");
};


instance DIA_Coragon_Trade(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_Trade_Condition;
	information = DIA_Coragon_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Coragon_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Trade_Info()
{
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Coragon_WhatsUp(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_WhatsUp_Condition;
	information = DIA_Coragon_WhatsUp_Info;
	permanent = FALSE;
	description = "Как идут дела?";
};


func int DIA_Coragon_WhatsUp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_WhatsUp_Info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//А, не спрашивай. На висельной площади по приказу лорда Андрэ раздают бесплатное пиво.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Ко мне практически никто не заходит. Ну, кроме этих богачей из верхнего квартала.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//А что с ними не так?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//(смеется) Некоторые из этих франтов ужасно действуют на нервы.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Взять хотя бы Валентино. Я его просто не переношу.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//Но клиентов мне выбирать не приходится. Сейчас мне дорога каждая монетка.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//Все, что мне удалось скопить, у меня украли вместе с моим серебром.
};


instance DIA_Addon_Coragon_MissingPeople(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Addon_Coragon_MissingPeople_Condition;
	information = DIA_Addon_Coragon_MissingPeople_Info;
	description = "Что ты знаешь о пропавших людях?";
};


func int DIA_Addon_Coragon_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Coragon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//Что ты знаешь о пропавших людях?
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//Я слышал, что многие из них пропали в районе порта. Неудивительно, если учитывать, что там творится.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//Пропал даже ученик плотника Торбена из нижней части города.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//Хакон, один из рыночных торговцев, рассказал мне очень странную историю.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//Он говорил, что каждый день он встречал одного парня, а потом тот словно исчез с лица земли. Хакон даже обратился в ополчение.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//Горожане начинают паниковать. Не понимаю, почему это происходит. Думаю, все это чепуха.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//Жизнь в Хоринисе непростая, но за воротами еще опаснее.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Те, кто не остается в городе, рано или поздно попадет в руки к бандитам или в зубы к диким животным. Все просто.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Хакон, торговец на рыночной площади, и плотник Торбен знают что-то о пропавших людях.");
};


instance DIA_Coragon_Bestohlen(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 4;
	condition = DIA_Coragon_Bestohlen_Condition;
	information = DIA_Coragon_Bestohlen_Info;
	permanent = FALSE;
	description = "Тебя ограбили?";
};


func int DIA_Coragon_Bestohlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Bestohlen_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//Тебя ограбили?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//Да, некоторое время назад. Тем вечером было довольно людно, и я только и делал, что разносил пиво.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//От стойки я надолго не отлучался, но этим подонкам хватило и небольшого времени.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//Я рассказал о краже ополчению, но они, конечно же, никого не нашли. Эти лентяи предпочитают накачиваться бесплатным пивом.
	MIS_Coragon_Silber = LOG_Running;
};


var int Coragon_Bier;

func void B_Coragon_Bier()
{
	Coragon_Bier += 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//Вот, возьми это в качестве награды.
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);
	if(Coragon_Bier < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//Мое особое пиво. Один бочонок остался.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//Буквально последние капли!
	};
};


instance DIA_Coragon_BringSilber(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Coragon_BringSilber_Condition;
	information = DIA_Coragon_BringSilber_Info;
	permanent = FALSE;
	description = "Я принес твое серебро.";
};


func int DIA_Coragon_BringSilber_Condition()
{
	if((MIS_Coragon_Silber == LOG_Running) && (Npc_HasItems(other,ItMi_CoragonsSilber) >= 8))
	{
		return TRUE;
	};
};

func void DIA_Coragon_BringSilber_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//Я принес твое серебро.
	B_GiveInvItems(other,self,ItMi_CoragonsSilber,8);
	Npc_RemoveInvItems(self,ItMi_CoragonsSilber,8);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Правда?
	B_Coragon_Bier();
	MIS_Coragon_Silber = LOG_SUCCESS;
	B_GivePlayerXP(XP_CoragonsSilber);
};


instance DIA_Coragon_Schuldenbuch(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 6;
	condition = DIA_Coragon_Schuldenbuch_Condition;
	information = DIA_Coragon_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Посмотри, что у меня есть...";
};


func int DIA_Coragon_Schuldenbuch_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) && (SchuldBuchNamesKnown == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Schuldenbuch_Info()
{
	DIA_Common_LookWhatIGot();
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Хм-м... (удивленно) Но это же гроссбух Лемара!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//Что ты с ним собираешься делать?
};


instance DIA_Coragon_GiveBook(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 7;
	condition = DIA_Coragon_GiveBook_Condition;
	information = DIA_Coragon_GiveBook_Info;
	permanent = FALSE;
	description = "Вот твоя книга.";
};


func int DIA_Coragon_GiveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_Schuldenbuch) && Npc_HasItems(other,ItWr_Schuldenbuch))
	{
		return TRUE;
	};
};

func void DIA_Coragon_GiveBook_Info()
{
	DIA_Common_HereIsYourBook();
	if(ClassicLehmarBook == FALSE)
	{
		AI_PrintScreen("Долговая книга отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItWr_Schuldenbuch);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	};
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//Спасибо! Ты спас меня. Лемар может быть очень неприятным человеком.
	B_Coragon_Bier();
	B_GivePlayerXP(XP_Schuldenbuch);
};


instance DIA_Coragon_ToOV(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 9;
	condition = DIA_Coragon_ToOV_Condition;
	information = DIA_Coragon_ToOV_Info;
	permanent = FALSE;
	description = "Как мне попасть в верхний квартал?";
};


func int DIA_Coragon_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) && (other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_ToOV_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//Как мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//Ты должен стать гражданином города. Найди себе работу!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Лучше всего наймись к одному из ремесленников из нижней части города. Тогда ты станешь гражданином.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//А если этого будет недостаточно, отправляйся в казармы и поговори с лордом Андрэ.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//Возможно, он примет тебя в ряды ополчения. Это откроет тебе путь в верхний квартал.
};


instance DIA_Coragon_Valentino(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 8;
	condition = DIA_Coragon_Valentino_Condition;
	information = DIA_Coragon_Valentino_Info;
	permanent = FALSE;
	description = "А что там насчет Валентино?";
};


func int DIA_Coragon_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Valentino_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//А что там насчет Валентино?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//Он богат до неприличия, и ему не приходится работать. И он рассказывает об этом всем подряд.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Хочешь ты его слушать или нет.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//Он пьет как конь и всегда остается до самого утра. А потом, шатаясь, отправляется домой, в верхний квартал.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//Так происходит каждый день.
};


instance DIA_Coragon_News(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 1;
	condition = DIA_Coragon_News_Condition;
	information = DIA_Coragon_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Coragon_News_Condition()
{
	if(!Npc_IsDead(Valentino) && (Valentino_Day < Wld_GetDay()))
	{
		if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Coragon_News_Info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Прошлой ночью Валентино не смог расплатиться по счету.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//Только что он разорялся о том, как много у него денег.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//И тут он запускает руку в карман, делает глупое лицо и говорит, что его обокрали...
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//И? Что ты сделал?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//Я? Задал ему хорошую трепку, что же еще?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//Он болтал что-то о том, что его обокрали и что он заплатит мне потом. Ха, как же!
	B_RemoveEveryInvItem(Valentino,ItMi_Gold);
};


instance DIA_Coragon_Ring(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = DIA_Coragon_Ring_Condition;
	information = DIA_Coragon_Ring_Info;
	permanent = FALSE;
	description = "Вот - возьми это кольцо.";
};


func int DIA_Coragon_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_News) && Npc_HasItems(other,ItRi_Prot_Edge_01_Valentino))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Ring_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Вот - возьми это кольцо.
	B_GiveInvItems(other,self,ItRi_Prot_Edge_01_Valentino,1);
	Npc_RemoveInvItems(self,ItRi_Prot_Edge_01_Valentino,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//Что? Не понимаю...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//Оно принадлежало Валентино.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//Ты можешь передать его следующему, кто отдубасит его...
	B_GivePlayerXP(300);
};

instance DIA_Coragon_PICKPOCKET_Book(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 700;
	condition = DIA_Coragon_PICKPOCKET_Book_Condition;
	information = DIA_Coragon_PICKPOCKET_Book_Info;
	permanent = TRUE;
	description = "(украсть долговую книгу будет довольно просто)";
};


func int DIA_Coragon_PICKPOCKET_Book_Condition()
{
	if((ClassicLehmarBook == FALSE) && (SchuldBuch_Stolen_Coragon == FALSE) && Npc_KnowsInfo(other,DIA_Coragon_GiveBook) && Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 30))
	{
		return TRUE;
	};
};

func void DIA_Coragon_PICKPOCKET_Book_Info()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET_Book);
	Info_AddChoice(DIA_Coragon_PICKPOCKET_Book,Dialog_Back,DIA_Coragon_PICKPOCKET_Book_BACK);
	Info_AddChoice(DIA_Coragon_PICKPOCKET_Book,DIALOG_PICKPOCKET,DIA_Coragon_PICKPOCKET_Book_DoIt);
};

func void DIA_Coragon_PICKPOCKET_Book_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItem(other,ItWr_Schuldenbuch);
		AI_PrintScreen("Долговая книга получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		B_GiveThiefXP();
		B_LogEntry(TOPIC_PickPocket,ConcatStrings("Корагон",ConcatStrings(PRINT_PickPocketSuccess,"Долговая книга.")));
		SchuldBuch_Stolen_Coragon = TRUE;
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(TOPIC_PickPocket,ConcatStrings("Корагон",PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Coragon_PICKPOCKET_Book);
};

func void DIA_Coragon_PICKPOCKET_Book_BACK()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET_Book);
};

