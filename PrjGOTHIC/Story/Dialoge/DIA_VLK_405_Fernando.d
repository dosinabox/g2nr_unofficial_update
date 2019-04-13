
instance DIA_Fernando_EXIT(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 999;
	condition = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Fernando_PICKPOCKET(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 900;
	condition = DIA_Fernando_PICKPOCKET_Condition;
	information = DIA_Fernando_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Красть его кошелек рискованно)";
};


func int DIA_Fernando_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItSe_GoldPocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff)) && (NpcObsessedByDMT_Fernando == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,Dialog_Back,DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fernando_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		B_NpcClearObsessionByDMT(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
};


instance DIA_Fernando_Hello(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int DIA_Fernando_Hello_Condition()
{
	if(NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Не сказать, чтобы очень хорошо. Когда Барьер все еще стоял, времена были получше.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//Заключенные добывали руду в шахтах, а мои корабли доставляли ее на материк.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//А на обратном пути они доставляли пищу и другие товары.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//Но сейчас мы отрезаны от материка, и нам приходится рассчитывать только на фермеров в том, что касается припасов.
};


instance DIA_Fernando_Perm(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 850;
	condition = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent = TRUE;
	description = "И чем ты сейчас зарабатываешь на жизнь?";
};


func int DIA_Fernando_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Perm_Info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//И чем ты сейчас зарабатываешь на жизнь?
	if(Fernando_ImKnast == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
	}
	else if(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//Пока ничем. Но в любом случае, темными делами я больше не занимаюсь. Это точно.
	}
	else if(Npc_KnowsInfo(other,DIA_Fernando_Success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Ничем! Сейчас я живу только за счет накопленного ранее. Но если я не смогу найти источник дохода, скоро для меня настанут тяжелые времена.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//Я разорен. Мне стоило послушать моего отца и держаться подальше от этого горнодобывающего бизнеса.
	};
};


instance DIA_Fernando_Minental(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 2;
	condition = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fernando_Minental_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (MIS_OLDWORLD == LOG_Running) && (Kapitel == 2) && (EnterOW_Kapitel2 == FALSE) && (Fernando_HatsZugegeben == FALSE) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Эй, ты - подожди минутку. Ты ведь направляешься в Долину Рудников, да?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//И?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Я хочу предложить тебе сделку. Ты приносишь мне доклад о том, что там происходит с рудой, а за это я дам тебе...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//...рунный камень.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//...кольцо, которое повысит твои жизненные силы.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Я посмотрю, что можно сделать.
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando,"Торговец Фернандо хочет знать, как обстоят дела с рудой в Долине рудников.");
};


instance DIA_Addon_Fernando_BanditTrader(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Addon_Fernando_BanditTrader_Condition;
	information = DIA_Addon_Fernando_BanditTrader_Info;
	description = "Ты продаешь оружие бандитам.";
};


func int DIA_Addon_Fernando_BanditTrader_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fernando_Hello) && (NpcObsessedByDMT_Fernando == FALSE) && (Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fernando_BanditTrader_Info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//Ты продаешь оружие бандитам.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//(недоуменно) Почему это ты так решил?
	B_LogEntry(TOPIC_Addon_Bandittrader,"Крупный торговец Фернандо признал, что поставлял оружие бандитам.");
	B_GivePlayerXP(XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;
	if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//На списке проданных товаров, который я нашел у бандитов, стоит твоя подпись.
	};
	if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//У бандитов я нашел кольцо гильдии морских торговцев Араксоса. Ты - морской торговец.
		if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//А на мечах, которые были у бандитов, стоят твои инициалы.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//На мечах, которые были у бандитов, стоят твои инициалы.
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//Теперь тебе не отвертеться. Я тебя раскрыл.
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//Так это сделал ТЫ! Ты меня выдал! Я заставлю тебя заплатить за это.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//Сначала тебе придется отсюда выйти, а я думаю, что вряд ли тебя отпустят в ближайшее время.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//(зло) Ничего, мое время еще придет.
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//(умоляюще) Я не хотел этого делать! Поверь мне!.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//(умоляюще) Сначала я продавал им только еду. Дела у меня шли неважно, и это было для меня единственным выходом.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//(умоляюще) Но потом бандиты стали агрессивными и даже угрожали убить меня, если я не продам им оружие.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//(умоляюще) Ты не можешь обвинять меня! Я всего лишь жертва обстоятельств.
		if(Fernando_ImKnast == FALSE)
		{
			Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Сколько ты мне заплатишь, если я тебя отпущу?",DIA_Addon_Fernando_BanditTrader_preis);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"С тобой разберется ополчение.",DIA_Addon_Fernando_BanditTrader_mil);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Я весь дрожу, я весь дрожу!",DIA_Addon_Fernando_BanditTrader_Uptown);
		};
	};
};

func void DIA_Addon_Fernando_BanditTrader_Uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Не пытайся взять меня на жалость. Ты просто отвратительный и жадный торгаш.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//За пригоршню золотых ты душу готов продать.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//Но у меня множество расходов! Если я не буду платить, меня могут попросту пустить на корм рыбам.
};

func void DIA_Addon_Fernando_BanditTrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//С тобой разберется ополчение.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//Ты не можешь так поступить!
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//Еще как могу. Сам увидишь.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//О, Иннос! Я пропал!
	B_NpcClearObsessionByDMT(self);
};

func void DIA_Addon_Fernando_BanditTrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//Сколько ты мне заплатишь, если я тебя отпущу?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//Дела у меня идут неважно. Много я заплатить не смогу.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//Скажем, 200 золотых и ценное кольцо?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//Этого должно хватить. Ну что, ты отдашь мне свои улики?
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Нет, пожалуй, я оставлю их себе.",DIA_Addon_Fernando_BanditTrader_nein);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader,"Ну хорошо, я согласен.",DIA_Addon_Fernando_BanditTrader_ja);
};

func void DIA_Addon_Fernando_BanditTrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Ну хорошо, я согласен.
	B_GivePlayerXP(XP_Ambient);
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem(hero,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem(hero,ItWr_Addon_BanditTrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Хорошо, вот золото.
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//И кольцо. Мы в расчете.
	CreateInvItems(self,ItRi_Prot_Point_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_01,1);
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

func void DIA_Addon_Fernando_BanditTrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//Нет, пожалуй, я оставлю их себе.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Как хочешь. Но предупреждаю: если ты меня выдашь, тебе не поздоровится.
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};


instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = "Я был в Долине Рудников.";
};


func int DIA_Fernando_Success_Condition()
{
	if((NpcObsessedByDMT_Fernando == FALSE) && (Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Fernando_Minental))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Я был в Долине Рудников.
	if(Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP(XP_Ambient);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//И? Как там обстоят дела?
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Шахты истощены, там можно добыть всего каких-нибудь несколько ящиков руды. Вряд ли эта овчинка стоит выделки.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//Этого не может быть! Это означает, что я разорен...
		if(Fernando_HatsZugegeben == FALSE)
		{
			AI_Output(other,self,"DIA_Fernando_Success_15_04");	//Что насчет нашей сделки?
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Ах, да, твое вознаграждение...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Вот, держи этот рунный камень.
				B_GiveInvItems(self,other,ItMi_RuneBlank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Вот твое кольцо.
				B_GiveInvItems(self,other,ItRi_Hp_02,1);
			};
		};
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		Log_SetTopicStatus(TOPIC_Fernando,LOG_OBSOLETE);
		B_LogEntry(TOPIC_Fernando,"Фернандо  больше не нуждается в информации. И денег за нее он мне не заплатит.");
	};
};


instance DIA_Fernando_Obsession(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 30;
	condition = DIA_Fernando_Obsession_Condition;
	information = DIA_Fernando_Obsession_Info;
	description = "Все в порядке?";
};


func int DIA_Fernando_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Fernando == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Fernando_Heilung(C_Info)
{
	npc = VLK_405_Fernando;
	nr = 55;
	condition = DIA_Fernando_Heilung_Condition;
	information = DIA_Fernando_Heilung_Info;
	permanent = TRUE;
	description = "Да ты одержим!";
};


func int DIA_Fernando_Heilung_Condition()
{
	if((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Heilung_Info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//Ты одержим!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Уходи. Уходи немедленно.
	B_NpcClearObsessionByDMT(self);
};

