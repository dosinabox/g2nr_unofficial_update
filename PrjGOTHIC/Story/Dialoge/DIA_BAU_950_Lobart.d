
instance DIA_Lobart_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_EXIT_Condition;
	information = DIA_Lobart_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_STOLENCLOTHS(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_STOLENCLOTHS_Condition;
	information = DIA_Lobart_STOLENCLOTHS_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lobart_STOLENCLOTHS_Condition()
{
	if((Mob_HasItems("CHEST_LOBART",ITAR_Bau_L) == FALSE) && (Lobart_Kleidung_Verkauft == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_STOLENCLOTHS_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroArmor,ITAR_Bau_L) == TRUE)
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");	//Я не могу поверить своим глазам! Этот ублюдок расхаживает в МОЕЙ одежде!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");	//Эй, ты!
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//Когда ты тут был последний раз, из моего сундука пропали вещи!
	};
	if(Npc_KnowsInfo(other,DIA_Lobart_WorkNOW))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");	//Ты мог бы поработать здесь вместо того, чтобы шарить в моем доме, ленивый бездельник!
	};
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");	//Отдай немедленно мою одежду!
	Info_ClearChoices(DIA_Lobart_STOLENCLOTHS);
	Info_AddChoice(DIA_Lobart_STOLENCLOTHS,"Забудь об этом!",DIA_Lobart_STOLENCLOTHS_ForgetIt);
	if(Npc_HasItems(other,ITAR_Bau_L) > 0)
	{
		Info_AddChoice(DIA_Lobart_STOLENCLOTHS,"Ладно, можешь забрать ее назад.",DIA_Lobart_STOLENCLOTHS_HereYouGo);
	}
	else
	{
		Info_AddChoice(DIA_Lobart_STOLENCLOTHS,"У меня ее нет.",DIA_Lobart_STOLENCLOTHS_DontHaveIt);
	};
};

func void DIA_Lobart_STOLENCLOTHS_HereYouGo()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");	//Ладно, можешь забрать ее назад.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");	//Если она тебе нужна, ты можешь ЗАПЛАТИТЬ за нее!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");	//(отрывисто) А теперь иди работай!
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	Info_ClearChoices(DIA_Lobart_STOLENCLOTHS);
};

func void DIA_Lobart_STOLENCLOTHS_DontHaveIt()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");	//У меня ее нет.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");	//Ты уже продал ее, да? (зло) Я проучу тебя, парень!
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};

func void DIA_Lobart_STOLENCLOTHS_ForgetIt()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00");	//Забудь об этом!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01");	//(зло) Я проучу тебя, парень!
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};


instance DIA_Lobart_Hallo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_Hallo_Condition;
	information = DIA_Lobart_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lobart_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//Что ты тут ошиваешься на моей ферме?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//Ты на чьей стороне? На стороне восставших фермеров или на стороне короля?
		Info_ClearChoices(DIA_Lobart_Hallo);
		Info_AddChoice(DIA_Lobart_Hallo,"Я не понимаю...",DIA_Lobart_Hallo_What);
		Info_AddChoice(DIA_Lobart_Hallo,"Я за короля!",DIA_Lobart_Hallo_ForTheKing);
		Info_AddChoice(DIA_Lobart_Hallo,"Я с крестьянами!",DIA_Lobart_Hallo_ForThePeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//Чем могу быть полезен?
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//Я с крестьянами!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//Ха! Этот чертов смутьян Онар сведет нас всех в могилу!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//Как ты думаешь, как долго еще здесь будут паладины?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//После того, что сделал Онар, весь город гудит, как улей.
	Lobart_AgainstKing = TRUE;
	Info_ClearChoices(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//Я за короля!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//(презрительно) 'За короля!' Также говорили и городские стражники, когда забрали половину моих овец.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//Но где же, спрашивается, эти ублюдки, когда нужно защищать нас от бандитов? А где они попрячутся, когда сюда вторгнутся орки?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//Я скажу тебе: в городе, за толстыми городскими стенами.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//Так что оставь меня в покое, вместе со своим королем.
	Lobart_AgainstKing = FALSE;
	Info_ClearChoices(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//Я не понимаю...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//Что?! Не пытайся меня провести, мальчик! Я хочу знать, на чьей ты стороне! Так на чьей же?!
};


instance DIA_Lobart_KLEIDUNG(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_KLEIDUNG_Condition;
	information = DIA_Lobart_KLEIDUNG_Info;
	permanent = FALSE;
	description = "Мне нужна приличная одежда!";
};


func int DIA_Lobart_KLEIDUNG_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_KLEIDUNG_Info()
{
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//Мне нужна приличная одежда!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//Я могу дать тебе приличную крестьянскую рабочую одежду.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//Ты можешь заплатить за нее?
	Log_CreateTopic(TOPIC_Kleidung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Kleidung,LOG_Running);
	B_LogEntry(TOPIC_Kleidung,"Фермер Лобарт готов продать мне рабочую одежду.");
	if(!Npc_KnowsInfo(other,DIA_Lobart_WorkNOW))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//Ты мог бы отработать часть ее стоимости... если ты один из тех, кто ИЩЕТ работу.
		B_LogEntry(TOPIC_Kleidung,"Лобарт может снизить цену за одежду, если я поработаю на его ферме. Чем больше я сделаю, тем дешевле обойдется мне одежда.");
	};
};


instance DIA_Lobart_BuyClothes(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 2;
	condition = DIA_Lobart_BuyClothes_Condition;
	information = DIA_Lobart_BuyClothes_Info;
	permanent = TRUE;
	description = "Сколько стоит эта рабочая одежда?";
};


func int DIA_Lobart_BuyClothes_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG) && (Lobart_Kleidung_Verkauft == FALSE)) || (Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) && (Lobart_Kleidung_gestohlen == FALSE) && (Lobart_Kleidung_Verkauft == FALSE) && (hero.guild == GIL_NONE)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_BuyClothes_Info()
{
	Wert_LobartsRuestung = 80;
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//Сколько стоит эта рабочая одежда?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//Так. Посморим...
	if(Lobart_AgainstKing == TRUE)
	{
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	if(MIS_Lobart_Rueben == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//Ты работал для меня на поле.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	if(MIS_Hilda_PfanneKaufen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//Ты помог моей жене.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	if(MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//Вино говорит, что ты очень помог ему. А это кое-что да значит - обычно он не очень-то ладит с поденными работниками.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	if(MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//Малет говорит, что ты прогнал бандитов. Эти ублюдки доставляли нам много проблем. Спасибо, что избавил нас от них!
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	B_Say_Gold(self,other,Wert_LobartsRuestung);
	if(Wert_LobartsRuestung == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//И дешевле я ее не отдам.
		B_LogEntry(TOPIC_Kleidung,"Но он не продаст е мне меньше, чем за 30 золотых монет.");
	};
	Info_ClearChoices(DIA_Lobart_BuyClothes);
	Info_AddChoice(DIA_Lobart_BuyClothes,"Это все еще слишком дорого для меня.",DIA_Lobart_BuyClothes_NotYet);
	Info_AddChoice(DIA_Lobart_BuyClothes,"Давай тогда сюда эту рабочую одежду (Защита: оружие - 15, стрелы - 15)",DIA_Lobart_BuyClothes_BUY);
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//Давай тогда сюда эту рабочую одежду.
	if(B_GiveInvItems(other,self,ItMi_Gold,Wert_LobartsRuestung))
	{
		if(Npc_HasItems(self,ITAR_Bau_L) > 0)
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//Хорошо, мой мальчик. Превыше всего я ценю честность. Вот, держи!
			B_GiveInvItems(self,other,ITAR_Bau_L,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");	//В моем доме есть сундук, где ты найдешь постиранные вещи.
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");	//Но даже не думай взять что-нибудь там без разрешения!
		};
		Lobart_Kleidung_Verkauft = TRUE;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
		B_CheckLog();
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//У тебя недостаточно золота!
	};
	Info_ClearChoices(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//Это все еще слишком дорого для меня.
	AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");	//Как знаешь...
	Info_ClearChoices(DIA_Lobart_BuyClothes);
};


instance DIA_Lobart_AufstandInfo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_AufstandInfo_Condition;
	information = DIA_Lobart_AufstandInfo_Info;
	permanent = FALSE;
	description = "Как идут здесь дела?";
};


func int DIA_Lobart_AufstandInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_Hallo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_AufstandInfo_Info()
{
	AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");	//Как идут здесь дела?
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//Ты не знаешь как здесь дела? Мальчик, ты вообще откуда свалился? Мы на пороге гражданской войны!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//До последнего времени фермеры считали долю, отдаваемую городу, вполне справедливой.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//Но с тех пор, как в Хоринис пришли паладины, городская стража наведывается к нам все чаще и чаще - они так скоро заберут все, что у нас есть.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//Если так будет продолжаться и дальше, у нас ничего не останется для самих себя.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//Некоторые фермеры стали бунтовать! Онар был первым из них!
};


instance DIA_Lobart_OnarStory(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_OnarStory_Condition;
	information = DIA_Lobart_OnarStory_Info;
	permanent = FALSE;
	description = "Расскажи мне подробнее об этом Онаре...";
};


func int DIA_Lobart_OnarStory_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_OnarStory_Info()
{
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//Расскажи мне подробнее об этом Онаре...
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//Ты ведь наемник, разве нет? Что такого я могу рассказать тебе о твоем боссе, что ты не знаешь?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//Онар - самый крупный фермер в этой местности. Он порвал отношения с городом.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//Говорят, он нанял наемников, чтобы те не пускали на его земли городскую стражу!
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//Не могу винить его за это.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//Как бы то ни было, больше ни один королевский солдат не осмеливается ступить на его землю.
	};
};


instance DIA_Lobart_SldInfo(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_SldInfo_Condition;
	information = DIA_Lobart_SldInfo_Info;
	permanent = FALSE;
	description = "А кто эти наемники, которых нанял Онар?";
};


func int DIA_Lobart_SldInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_OnarStory) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_SldInfo_Info()
{
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//А кто эти наемники, которых нанял Онар?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//Я мало что знаю об этих парнях. Предположительно, большинство из них - бывшие каторжники из колонии.
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//(презрительно) И чего, спрашивается, от них можно ожидать...
};


instance DIA_Lobart_WhichSide(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_WhichSide_Condition;
	information = DIA_Lobart_WhichSide_Info;
	permanent = FALSE;
	description = "А что насчет тебя? Ты-то на чьей стороне? Крестьян или короля?";
};


func int DIA_Lobart_WhichSide_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_WhichSide_Info()
{
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//А что насчет тебя? Ты-то на чьей стороне? Крестьян или короля?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//Я слишком близок к городу, чтобы у меня была возможность выбирать.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//Но я даже рад этому. Я бы все равно не знал, что решить.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//Король пьет нашу кровь, а Онар направляет своих наемников против всех, кто не хочет присоединиться к нему.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//Вот почему большинство фермеров все еще не определились, но рано или поздно им ПРИДЕТСЯ выбрать одну сторону или другую.
	};
};


instance DIA_Lobart_WorkNOW(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_WorkNOW_Condition;
	information = DIA_Lobart_WorkNOW_Info;
	permanent = FALSE;
	description = "Я ищу работу.";
};


func int DIA_Lobart_WorkNOW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_AufstandInfo) || Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) || Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG))
	{
		if(Kapitel < 3)
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_WorkNOW_Info()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//Я ищу работу.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//Мне не нужен еще один постоянный работник. Но я могу предложить тебе поденную работу.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//Я хочу сказать, ты можешь помочь на поле. Также здесь еще наверняка найдется кое-какая работенка для тебя.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//Я могу заплатить тебе золотом. Или дать тебе приличную одежду.
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//Эта одежда стоит довольно дорого. Я не могу отдать тебе ее просто так, но я могу продать тебе ее дешевле, если ты поработаешь на меня.
		Log_CreateTopic(TOPIC_Kleidung,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Kleidung,LOG_Running);
		B_LogEntry(TOPIC_Kleidung,"Фермер Лобарт готов продать мне рабочую одежду. Он может снизить цену за одежду, если я поработаю на его ферме. Чем больше я сделаю, тем дешевле обойдется мне одежда.");
		if((Npc_HasEquippedArmor(other) == FALSE) || (Lobart_Kleidung_Verkauft == TRUE))
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//Судя по тому, как ты выглядишь, я бы сказал: бери одежду.
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//Но у тебя уже есть одежда, так что ты, вероятно, захочешь золото.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//Работа следующая - небольшое поле репы за амбаром нужно собрать.
	Info_ClearChoices(DIA_Lobart_WorkNOW);
	Info_AddChoice(DIA_Lobart_WorkNOW,"Я должен дергать репу? Ты, должно быть, шутишь!",DIA_Lobart_WorkNOW_WannaFoolMe);
	Info_AddChoice(DIA_Lobart_WorkNOW,"Хорошо...",DIA_Lobart_WorkNOW_Ok);
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//Хорошо...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//Тогда поторопись, пока я не передумал.
	};
	Log_CreateTopic(TOPIC_Rueben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben,LOG_Running);
	B_LogEntry(TOPIC_Rueben,"Фермер Лобарт хочет, чтобы я собрал репу на поле. За это он заплатит мне золотом или продаст мне одежду по значительно сниженной цене.");
	MIS_Lobart_Rueben = LOG_Running;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//Я должен дергать репу? Ты, должно быть, шутишь!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//Настоящая мужская работа не для 'утонченного джентльмена', да?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//Топай на поле или убирайся с моей фермы!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//Сейчас у меня нет другой работы для тебя.
	};
	Log_CreateTopic(TOPIC_Rueben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben,LOG_Running);
	B_LogEntry(TOPIC_Rueben,"Фермер Лобарт хочет, чтобы я собрал репу на поле. За это он продаст мне одежду по значительно сниженной цене.");
	MIS_Lobart_Rueben = LOG_Running;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};


instance DIA_Lobart_RuebenRunning(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_RuebenRunning_Condition;
	information = DIA_Lobart_RuebenRunning_Info;
	permanent = TRUE;
	description = "Вот твоя репа!";
};


func int DIA_Lobart_RuebenRunning_Condition()
{
	if((MIS_Lobart_Rueben == LOG_Running) && (Npc_HasItems(other,ItPl_Beet) >= 1) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_RuebenRunning_Info()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//Вот твоя репа!
	if(Npc_HasItems(other,ItPl_Beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//Да, похоже, ты не такой уж бездельник, как кажешься.
		};
		if(Npc_IsDead(Hilda) == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//Отнеси ее моей жене в дом и скажи ей, чтобы она приготовила ее.
			MIS_Lobart_RuebenToHilda = LOG_Running;
			Log_CreateTopic(TOPIC_Ruebenbringen,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ruebenbringen,LOG_Running);
			B_LogEntry(TOPIC_Ruebenbringen,"Я должен отнести собранную репу жене Лобарта, находящейся в доме.");
		};
		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP(XP_LobartHolRueben);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//Что насчет моей платы?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//Я могу дат тебе 5 золотых монет.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//...или продать тебе одежду дешевле. Что ты выбираешь?
		};
		Info_ClearChoices(DIA_Lobart_RuebenRunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(DIA_Lobart_RuebenRunning,"Лучше продай одежду дешевле!",DIA_Lobart_RuebenRunning_Billiger);
		};
		Info_AddChoice(DIA_Lobart_RuebenRunning,"Дай мне 5 золотых монет!",DIA_Lobart_RuebenRunning_Gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//Но ты не собрал и двадцати!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//Ты что, съел остальное?! Надеюсь, мой мальчик, что все же нет, иначе тебе придется забыть о своем жаловании!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//Возвращайся на поле и принеси больше! Работай или я покажу тебе, где раки зимуют!
		};
		AI_StopProcessInfos(self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//Дай мне 5 золотых монет!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//Держи.
	B_GiveInvItems(self,other,ItMi_Gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//Только не пропей их все разом.
	};
	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};

func void DIA_Lobart_RuebenRunning_Billiger()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//Лучше продай одежду дешевле!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//Хорошо! Я отдам тебе ее на 10 золотых дешевле.
	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};


instance DIA_Lobart_MoreWork(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 1;
	condition = DIA_Lobart_MoreWork_Condition;
	information = DIA_Lobart_MoreWork_Info;
	permanent = TRUE;
	description = "У тебя есть еще какая-нибудь работа для меня?";
};


func int DIA_Lobart_MoreWork_Condition()
{
	if(((MIS_Lobart_Rueben == LOG_Running) || (MIS_Lobart_Rueben == LOG_SUCCESS)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_MoreWork_Info()
{
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//У тебя есть еще какая-нибудь работа для меня?
	if(MIS_Lobart_Rueben == LOG_Running)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//Сначала собери репу с поля. А там,посмотрим.
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//Нет, но ты можешь спросить у моей жены или парней на поле. Возможно, им нужна помощь.
	};
};


instance DIA_Lobart_ANDREHELPLOBART(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_ANDREHELPLOBART_Condition;
	information = DIA_Lobart_ANDREHELPLOBART_Info;
	description = "Меня направил к тебе Андрэ.";
};


func int DIA_Lobart_ANDREHELPLOBART_Condition()
{
	if(MIS_AndreHelpLobart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lobart_ANDREHELPLOBART_Info()
{
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//Меня направил к тебе Андрэ. Я могу чем-нибудь помочь тебе?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//Да, конечно. Меня уже тошнит от этих проклятых полевых хищников.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//Прикончи их всех. Меня не волнует, как!
	Log_AddEntry(TOPIC_BecomeMIL,"Поля Лобарта наводнены полевыми хищниками. Он хочет, чтобы я прогнал их.");
	MIS_LobartKillBugs = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_BUGDEAD(C_Info)
{
	npc = BAU_950_Lobart;
	condition = DIA_Lobart_BUGDEAD_Condition;
	information = DIA_Lobart_BUGDEAD_Info;
	permanent = TRUE;
	description = "Я разделался с этими тварями!";
};


var int DIA_Lobart_BUGDEAD_noPerm;

func int DIA_Lobart_BUGDEAD_Condition()
{
	if((MIS_LobartKillBugs == LOG_Running) && (DIA_Lobart_BUGDEAD_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_BUGDEAD_Info()
{
	if(Npc_IsDead(Lobarts_Giant_Bug1) && Npc_IsDead(Lobarts_Giant_Bug2) && Npc_IsDead(Lobarts_Giant_Bug3) && Npc_IsDead(Lobarts_Giant_Bug4) && Npc_IsDead(Lobarts_Giant_Bug5) && Npc_IsDead(Lobarts_Giant_Bug6) && Npc_IsDead(Lobarts_Giant_Bug7))
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//Я разделался с этими тварями!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//Отлично. Ты не такой уж плохой ликвидатор. Я порекомендую тебя соседям. Вот, держи заработанное.
		B_StartOtherRoutine(Vino,"Start");
		B_StartOtherRoutine(LobartsBauer1,"Start");
		B_StartOtherRoutine(LobartsBauer2,"Start");
		CreateInvItems(self,ItMi_Gold,20);
		B_GiveInvItems(self,other,ItMi_Gold,20);
		MIS_LobartKillBugs = LOG_SUCCESS;
		MIS_AndreHelpLobart = LOG_SUCCESS;
		Log_AddEntry(TOPIC_BecomeMIL,"Поля Лобарта очищены от полевых хищников. Я уничтожил их всех.");
		DIA_Lobart_BUGDEAD_noPerm = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//Я думаю, я разделался со всеми тварями!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//Не пытайся надуть меня. Я все еще вижу их. Либо ты убьешь этих тварей, либо можешь забыть о деньгах.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lobart_KAP3_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP3_EXIT_Condition;
	information = DIA_Lobart_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_DMT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 30;
	condition = DIA_Lobart_DMT_Condition;
	information = DIA_Lobart_DMT_Info;
	description = "Как твоя ферма?";
};


func int DIA_Lobart_DMT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_DMT_Info()
{
	AI_Output(other,self,"DIA_Lobart_DMT_15_00");	//Как твоя ферма?
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//Это все невыносимо.
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//Неожиданно появились эти парни в черных рясах и расположились на дороге и на моей ферме.
	Info_ClearChoices(DIA_Lobart_DMT);
	Info_AddChoice(DIA_Lobart_DMT,Dialog_Ende,DIA_Lobart_DMT_BACK);
	if((hero.guild == GIL_KDF) && (Vino_isAlive_Kap3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//Они долго беседовали о чем-то с Вино, а затем скрылись вместе с ним.
		if(NpcObsessedByDMT_Vino == FALSE)
		{
			Info_AddChoice(DIA_Lobart_DMT,"Куда они потащили Вино?",DIA_Lobart_DMT_VinoWohin);
		};
		Info_AddChoice(DIA_Lobart_DMT,"Какие у них дела с Вино?",DIA_Lobart_DMT_VinoWas);
	};
	if((Npc_IsDead(Hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//Вскоре после этого моя жена опять тяжело заболела. Она почти не встает с постели. С ней часто бывает такое.
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//Все пошло наперекосяк!
	if((MIS_HealHilda != LOG_SUCCESS) && (Npc_IsDead(Hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		Info_AddChoice(DIA_Lobart_DMT,"Почему ты не отведешь жену к лекарю?",DIA_Lobart_DMT_FrauHeilen);
	};
	Info_AddChoice(DIA_Lobart_DMT,"Почему ты ничего е сделаешь с этими людьми в черном?",DIA_Lobart_DMT_hof);
	Info_AddChoice(DIA_Lobart_DMT,"Ты говорил с людьми в черном?",DIA_Lobart_DMT_spokeToThem);
};

func void DIA_Lobart_DMT_FrauHeilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//Почему ты не отведешь жену к лекарю?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//Мы должны бы сходить в город к Ватрасу, но я с места не сойду, пока на моей ферме царит такой хаос.
	Log_CreateTopic(TOPIC_HealHilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda,LOG_Running);
	B_LogEntry(TOPIC_HealHilda,"Жена Лобарта Хильда больна, но у Ватраса есть лекарство, которое может вылечить ее.");
	MIS_HealHilda = LOG_Running;
};

func void DIA_Lobart_DMT_BACK()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Lobart_DMT_spokeToThem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//Ты говорил с людьми в черном?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//Конечно. Но они не хотят ничего слушать.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//Я думаю, они кого-то ищут.
};

func void DIA_Lobart_DMT_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//Почему ты ничего е сделаешь с этими людьми в черном?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//Я бы очень хотел. Но я видел, как они заживо сожгли одного горожанина. Нет уж, спасибо.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//Не хочется что-то рисковать жизнью!
};

func void DIA_Lobart_DMT_VinoWas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//Какие у них дела с Вино?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//Они не сказали. Они просто увели его с собой.
};

func void DIA_Lobart_DMT_VinoWohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//Куда они потащили Вино?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//Они пошли вверх, на этот холм.
};


instance DIA_Lobart_VINOTOT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 32;
	condition = DIA_Lobart_VINOTOT_Condition;
	information = DIA_Lobart_VINOTOT_Info;
	description = "Вино не вернется.";
};


func int DIA_Lobart_VINOTOT_Condition()
{
	if((Npc_IsDead(Vino) || (NpcObsessedByDMT_Vino == TRUE)) && Npc_KnowsInfo(other,DIA_Lobart_DMT) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lobart_VINOTOT_Info()
{
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//Вино не вернется.
	if(Npc_IsDead(Vino))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//Он мертв.
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//Они свели его с ума.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//О, Иннос. Надеюсь, весь этот кошмар скоро закончится.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lobart_PERM(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 80;
	condition = DIA_Lobart_PERM_Condition;
	information = DIA_Lobart_PERM_Info;
	permanent = TRUE;
	description = "Береги свою ферму!";
};


func int DIA_Lobart_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lobart_DMT) && (Kapitel >= 3) && (Npc_IsDead(OrcWarrior_Lobart1) && Npc_IsDead(OrcWarrior_Lobart2) && Npc_IsDead(OrcWarrior_Lobart3) && Npc_IsDead(OrcWarrior_Lobart4) && Npc_IsDead(OrcWarrior_Lobart5) && Npc_IsDead(OrcWarrior_Lobart6)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_PERM_Info()
{
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//Береги свою ферму!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//Я попытаюсь.
};


instance DIA_Lobart_KAP4_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP4_EXIT_Condition;
	information = DIA_Lobart_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_ORKPROBLEM(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 41;
	condition = DIA_Lobart_ORKPROBLEM_Condition;
	information = DIA_Lobart_ORKPROBLEM_Info;
	description = "У тебя проблемы с орками.";
};


func int DIA_Lobart_ORKPROBLEM_Condition()
{
	if(((Npc_IsDead(OrcWarrior_Lobart1) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart2) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart3) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart4) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart5) == FALSE) || (Npc_IsDead(OrcWarrior_Lobart6) == FALSE)) && (Kapitel >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,DIA_Lobart_DMT))
	{
		return TRUE;
	};
};

func void DIA_Lobart_ORKPROBLEM_Info()
{
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//У тебя проблемы с орками.
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//(зло) Черт. Ну когда-нибудь все это кончится?!
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//Если так будет продолжаться, моя ферма не будет стоить и 3-х золотых монет.
	Log_CreateTopic(TOPIC_LobartsOrKProblem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrKProblem,LOG_Running);
	B_LogEntry(TOPIC_LobartsOrKProblem,"На ферме Лобарта поселились орки. Он хочет, чтобы я избавил его от них.");
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_ORKSWEG(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 42;
	condition = DIA_Lobart_ORKSWEG_Condition;
	information = DIA_Lobart_ORKSWEG_Info;
	description = "Я избавил твои земли от орков.";
};


func int DIA_Lobart_ORKSWEG_Condition()
{
	if((Npc_IsDead(OrcWarrior_Lobart1) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart2) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart3) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart4) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart5) == TRUE) && (Npc_IsDead(OrcWarrior_Lobart6) == TRUE) && (Kapitel >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_ORKSWEG_Info()
{
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//Я избавил твои земли от орков.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//Никому не позволю говорить, что паладины ничего не делают для нас, простых фермеров.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//Слава Инносу. Я не могу дать тебе за это много, но я надеюсь, ты оценишь мой жест благодарности.
	B_StartOtherRoutine(Vino,"Start");
	B_StartOtherRoutine(LobartsBauer1,"Start");
	B_StartOtherRoutine(LobartsBauer2,"Start");
	TOPIC_END_LobartsOrKProblem = TRUE;
	B_GivePlayerXP(XP_KilledLobartOrks);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
};


instance DIA_Lobart_KAP5_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP5_EXIT_Condition;
	information = DIA_Lobart_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_KAP6_EXIT(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 999;
	condition = DIA_Lobart_KAP6_EXIT_Condition;
	information = DIA_Lobart_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lobart_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lobart_PICKPOCKET(C_Info)
{
	npc = BAU_950_Lobart;
	nr = 900;
	condition = DIA_Lobart_PICKPOCKET_Condition;
	information = DIA_Lobart_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Lobart_PICKPOCKET_Condition()
{
	return C_Beklauen(65,80);
};

func void DIA_Lobart_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
	Info_AddChoice(DIA_Lobart_PICKPOCKET,Dialog_Back,DIA_Lobart_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lobart_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lobart_PICKPOCKET_DoIt);
};

func void DIA_Lobart_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
};

func void DIA_Lobart_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
};

