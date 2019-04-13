
instance DIA_Jora_EXIT(C_Info)
{
	npc = VLK_408_Jora;
	nr = 999;
	condition = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent = TRUE;
	description = "Мне нужно идти!";
};


func int DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jora_EXIT_Info()
{
	if(((Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS)) && (Jora_Gold == LOG_Running))
	{
		AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//Эй! Как насчет моих денег?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jora_Sperre(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_Sperre_Condition;
	information = DIA_Jora_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Jora_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jora_Sperre_Info()
{
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//Ты каторжник из колонии. Я ничего не буду тебе продавать!
	AI_StopProcessInfos(self);
};


instance DIA_Jora_WAREZ(C_Info)
{
	npc = VLK_408_Jora;
	nr = 700;
	condition = DIA_Jora_WAREZ_Condition;
	information = DIA_Jora_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Jora_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Jora_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//Покажи мне свои товары.
};


instance DIA_Jora_GREET(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_GREET_Condition;
	information = DIA_Jora_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jora_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jora_GREET_Info()
{
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//Да пребудет с тобой Иннос, чужеземец. Если тебе что-то нужно для твоих странствий, ты обратился по адресу.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//Но я предупреждаю тебя: если ты хочешь взять что-нибудь, не заплатив, я позову стражу!
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//Минутку. Я что, похож на вора?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//(презрительно) Ха! Ты будешь не первым, кто что-нибудь спер у меня сегодня.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Джора торгует различным оружием на рыночной площади.");
};


instance DIA_Jora_Bestohlen(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_Bestohlen_Condition;
	information = DIA_Jora_Bestohlen_Info;
	permanent = FALSE;
	description = "Кто-то обокрал тебя?";
};


func int DIA_Jora_Bestohlen_Condition()
{
	return TRUE;
};

func void DIA_Jora_Bestohlen_Info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//Кто-то обокрал тебя?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//Я не могу доказать это. Этот парень был чертовски хитер. Представился как Ренгару - если это действительно его имя.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//Он уже несколько дней ошивается на рыночной площади.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//А каждый вечер он зависает у пивной бочки вниз по улице. Готов поклясться, этот ублюдок пропивает МОИ деньги!
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//Я отвернулся всего на мгновение, и мой кошелек пропал!
};

func void B_Jora_GoldForClue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//Послушай - если ты вернешь золото, украденное этим Ренгару, я расскажу тебе кое-что.
};


instance DIA_Jora_HolDeinGold(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_HolDeinGold_Condition;
	information = DIA_Jora_HolDeinGold_Info;
	permanent = FALSE;
	description = "Я мог бы вернуть тебе это золото.";
};


func int DIA_Jora_HolDeinGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};

func void DIA_Jora_HolDeinGold_Info()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//Я мог бы вернуть тебе это золото.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//(недоверчиво) Да? А зачем тебе это?
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Я хочу получить часть золота в качестве вознаграждения!",DIA_Jora_HolDeinGold_WillBelohnung);
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		Info_AddChoice(DIA_Jora_HolDeinGold,"Я ищу подходы к гильдии воров!",DIA_Jora_HolDeinGold_GHDG);
	};
	if((other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		Info_AddChoice(DIA_Jora_HolDeinGold,"Как сказать... ну, ты мог бы, например, помочь мне попасть в верхний квартал?",DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//Как сказать... ну, ты мог бы, например, помочь мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//(смеется) Ты обратился не по адресу. Я нездешний, как и большинство торговцев на этой площади.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//Если ты хочешь попасть в верхний квартал, поговори с местными торговцами в нижней части города.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//Я ищу подходы к гильдии воров!
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//Тут я мог бы помочь тебе.
	B_Jora_GoldForClue();
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Я попробую.",DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Сколько золота было в этом кошельке?",DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Почему ты не позвал стражу?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//Я хочу получить часть золота в качестве вознаграждения!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//Сначала верни мне мой кошелек. А там уж поговорим о твоем вознаграждении!
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Я попробую.",DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Сколько золота было в этом кошельке?",DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice(DIA_Jora_HolDeinGold,"Почему ты не позвал стражу?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//Почему ты не позвал стражу?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//Стража реагирует, только если вор пойман с поличным.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//А когда я заметил, что мой кошелек пропал, его и след простыл!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//Сколько золота было в этом кошельке?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 золотых - это солидная сумма по нынешним временам.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//Будь осторожен! Если ты просто вырубишь этого ублюдка, на тебя самого набросится стража.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//Последнее время обстановка здесь значительно обострилась. С тех пор, как паладины прибыли в город, стража набрасывается на всех, кто вступает в драку.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//Так что придумай что-нибудь...
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//Попробую.
	Jora_Dieb = LOG_Running;
	Jora_Gold = LOG_Running;
	Log_CreateTopic(TOPIC_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JoraDieb,LOG_Running);
	Log_CreateTopic(TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Jora,LOG_Running);
	B_LogEntry(TOPIC_Jora,"Парень по имени Ренгару ограбил торговца Джору. Он весь день околачивается на рынке.");
	B_LogEntry(TOPIC_Jora,"Я должен вернуть украденное золото Джоры.");
	B_LogEntry(TOPIC_JoraDieb,"Ренгару ограбил торговца Джору. Если я поймаю его, мне за это полагается награда.");
	Info_ClearChoices(DIA_Jora_HolDeinGold);
};


instance DIA_Jora_WegenDieb(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_WegenDieb_Condition;
	information = DIA_Jora_WegenDieb_Info;
	permanent = TRUE;
	description = "Насчет вора...";
};


func int DIA_Jora_WegenDieb_Condition()
{
	if(Jora_Dieb == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jora_WegenDieb_Info()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//Насчет вора...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//Да, как продвигается дело? Ты поймал его? И что более важно, ты забрал у него мое золото?
	Info_ClearChoices(DIA_Jora_WegenDieb);
	if(Npc_IsDead(Rengaru))
	{
		Info_AddChoice(DIA_Jora_WegenDieb,"Ну, с ним произошел несчастный случай.",DIA_Jora_WegenDieb_Tot);
	}
	else if(Rengaru_InKnast == TRUE)
	{
		Info_AddChoice(DIA_Jora_WegenDieb,"Да, я поймал его.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if(Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice(DIA_Jora_WegenDieb,"Он сбежал от меня.",DIA_Jora_WegenDieb_Entkommen);
	};
	Info_AddChoice(DIA_Jora_WegenDieb,"Я все еще работаю над этим!",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//Я все еще работаю над этим!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//Не забудь принести мне это золото назад!
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//Он сбежал от меня.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//А мое золото? Он унес его с собой?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//Да, я поймал его. Пусть немного посидит за решеткой, подумает...
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//А что насчет моего золота?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//Ну, с ним произошел несчастный случай.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//Ну, хотя бы он теперь не сможет никого обокрасть! Правосудие Инноса свершилось!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//Где мое золото?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices(DIA_Jora_WegenDieb);
};


instance DIA_Jora_BringGold(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_BringGold_Condition;
	information = DIA_Jora_BringGold_Info;
	permanent = TRUE;
	description = "Вот 50 золотых, что он украл у тебя.";
};


func int DIA_Jora_BringGold_Condition()
{
	if(((Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS)) && (Jora_Gold == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jora_BringGold_Info()
{
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//Вот 50 золотых, что он украл у тебя.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//Хвала Инносу! Есть еще правосудие в этом городе.
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//Эй, здесь не все 50 золотых! Ты что, тоже пытаешься меня обокрасть?
	};
};


var int Jora_GhdgHinweis;

instance DIA_Jora_GHDgInfo(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_GHDgInfo_Condition;
	information = DIA_Jora_GHDgInfo_Info;
	permanent = TRUE;
	description = "Что ты знаешь о гильдии воров?";
};


func int DIA_Jora_GHDgInfo_Condition()
{
	if((MIS_Andre_GuildOfThieves == LOG_Running) && Npc_KnowsInfo(other,DIA_Jora_Bestohlen) && (Jora_GhdgHinweis == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jora_GHDgInfo_Info()
{
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//Что ты знаешь о гильдии воров?
	if(Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//Хорошо - я скажу - но ты ничего не слышал от меня, если что, понятно?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//В портовом кабаке постоянно ошиваются какие-то темные личности.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//Готов поклясться, что бармен что-то знает об этом...
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//Если ты хочешь выследить этих воров, тебе стоит поговорить с НИМ.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//Ты можешь притвориться, что ищешь какую-нибудь темную работенку, например. Может, он купится на это.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//Но будь осторожен. С этими людьми лучше не шутить.
		Jora_GhdgHinweis = TRUE;
	};
};


instance DIA_Jora_Belohnung(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_Belohnung_Condition;
	information = DIA_Jora_Belohnung_Info;
	permanent = FALSE;
	description = "Я хочу получить часть золота в качестве вознаграждения!";
};


func int DIA_Jora_Belohnung_Condition()
{
	if(Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Jora_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//Я хочу получить часть золота в качестве вознаграждения!
	if(Jora_GhdgHinweis == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//Но я уже дал тебе ценный совет.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//Этого должно хватить в качестве вознаграждения.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//А сели тебе нужно золото, то выслеживай воров и получай награду за их голову у лорда Андрэ.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//А теперь извини, меня ждут клиенты...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jora_AlriksSchwert(C_Info)
{
	npc = VLK_408_Jora;
	nr = 1;
	condition = DIA_Jora_AlriksSchwert_Condition;
	information = DIA_Jora_AlriksSchwert_Info;
	permanent = FALSE;
	description = "Альрик говорит, что у тебя его меч...";
};


func int DIA_Jora_AlriksSchwert_Condition()
{
	if(MIS_Alrik_Sword == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Jora_AlriksSchwert_Info()
{
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//Альрик говорит, что у тебя его меч...
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//Ты имеешь в виду этого оборванца, что продал мне свое оружие за несколько факелов и кусок мяса?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//Да, это он.
	if(Npc_HasItems(self,ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//Его меч все еще у меня.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//Сколько ты хочешь за него?
		if(Jora_Gold == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//Ну - для тебя...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//А, ладно! Забирай его так. Ведь ты помог мне вернуть мое золото...
			B_GiveInvItems(self,other,ItMw_AlriksSword_Mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//Ну - только для тебя - 50 золотых монет.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//(раздраженно) У меня его больше нет! Черт его знает, кому я его продал!
	};
};


instance DIA_Jora_BUYAlriksSchwert(C_Info)
{
	npc = VLK_408_Jora;
	nr = 2;
	condition = DIA_Jora_BUYAlriksSchwert_Condition;
	information = DIA_Jora_BUYAlriksSchwert_Info;
	permanent = TRUE;
	description = "Вот 50 золотых монет. Давай мне меч Альрика.";
};


func int DIA_Jora_BUYAlriksSchwert_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jora_AlriksSchwert) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) > 0))
	{
		return TRUE;
	};
};

func void DIA_Jora_BUYAlriksSchwert_Info()
{
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//Вот 50 золотых монет. Давай мне меч Альрика.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//Вот, держи - (ухмыляется) это выгодная сделка.
		B_GiveInvItems(self,other,ItMw_AlriksSword_Mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//У тебя недостаточно золота. Но не волнуйся - я попридержу пока этот меч. Заходи позже, если хочешь...
	};
};


instance DIA_Jora_PICKPOCKET(C_Info)
{
	npc = VLK_408_Jora;
	nr = 900;
	condition = DIA_Jora_PICKPOCKET_Condition;
	information = DIA_Jora_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Jora_PICKPOCKET_Condition()
{
	return C_Beklauen(31,45);
};

func void DIA_Jora_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
	Info_AddChoice(DIA_Jora_PICKPOCKET,Dialog_Back,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jora_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
};

func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
};

