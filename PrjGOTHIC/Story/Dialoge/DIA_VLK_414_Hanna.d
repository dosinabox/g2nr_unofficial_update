
instance DIA_Hanna_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_EXIT_Condition;
	information = DIA_Hanna_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Hanna_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hanna_Hello(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Hello_Condition;
	information = DIA_Hanna_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hanna_Hello_Condition()
{
	if(Andre_FoundThieves_KilledByMilitia == TRUE)
	{
		return FALSE;
	};
	if(Andre_FoundThieves_Reported == TRUE)
	{
		if(Andre_FoundThieves_Reported_Day <= (Wld_GetDay() - 2))
		{
			if(!Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez))
			{
				return FALSE;
			};
		};
	};
	if(Hanna_ThievesIsDead == TRUE)
	{
		if(Hanna_ThievesIsDead_Day <= (Wld_GetDay() - 2))
		{
			if(Npc_KnowsInfo(other,DIA_Hanna_AusKeller) || Npc_KnowsInfo(other,DIA_Hanna_Blubb) || Npc_KnowsInfo(other,DIA_Hanna_Blubb2))
			{
				return FALSE;
			};
		};
	};
	if(Npc_HasItems(other,ItKe_ThiefGuildKey_Hotel_MIS) || (Knows_SecretSign == TRUE))
	{
		return FALSE;
	};
	return TRUE;
};

func void DIA_Hanna_Hello_Info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//Ага, клиент - что я могу сделать для тебя?
};


instance DIA_Hanna_Room(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_Room_Condition;
	information = DIA_Hanna_Room_Info;
	permanent = FALSE;
	description = "Я хочу снять комнату.";
};


func int DIA_Hanna_Room_Condition()
{
	if(Andre_FoundThieves_KilledByMilitia == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Hanna_Room_Info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//Я хочу снять комнату.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//Ты обратился как раз по адресу.
	if(Npc_KnowsInfo(other,DIA_Lothar_Schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//Один из паладинов сказал мне, что я могу провести ночь здесь бесплатно...
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//Сколько стоит комната на ночь?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//Эта услуга абсолютно бесплатна.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//Паладины оплачивают ночлег всех путешественников.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//То есть, я могу остановиться здесь на ночь бесплатно?!
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Да, да.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//Просто поднимись вверх по лестнице.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//Пара коек там еще свободна.
};


instance DIA_Hanna_WhyPay(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 3;
	condition = DIA_Hanna_WhyPay_Condition;
	information = DIA_Hanna_WhyPay_Info;
	permanent = FALSE;
	description = "А почему паладины платят за все?";
};


func int DIA_Hanna_WhyPay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WhyPay_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//А почему паладины платят за все?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//Я не знаю точно, с чем это связано.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//С одной стороны, я думаю, они хотят, чтобы нищие не ошивались ночью на улицах. Так безопаснее для всех.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//Ну, а с другой стороны, они хотят завоевать расположение странствующих торговцев.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//Сейчас, когда фермеры подняли восстание, нам остается полагаться только на торговцев в вопросах обеспечения города продовольствием.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//Кроме того, я думаю, они хотят поднять немного моральный дух в городе.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//Лорд Андрэ даже приказал раздавать бесплатное пиво на площади Правосудия.
};


instance DIA_Hanna_WerHier(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 4;
	condition = DIA_Hanna_WerHier_Condition;
	information = DIA_Hanna_WerHier_Info;
	permanent = TRUE;
	description = "Кто здесь живет сейчас?";
};


func int DIA_Hanna_WerHier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WerHier_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//Кто здесь живет сейчас?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//В основном странствующие торговцы с рынка.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Ага.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//Даже не думай, чтобы пошарить в их пожитках! Мне не нужны здесь проблемы!
};


instance DIA_Hanna_City(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 5;
	condition = DIA_Hanna_City_Condition;
	information = DIA_Hanna_City_Info;
	permanent = TRUE;
	description = "Несколько вопросов о городе...";
};


func int DIA_Hanna_City_Condition()
{
	if(Andre_FoundThieves_KilledByMilitia == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Hanna_City_Info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//Несколько вопросов о городе...
	Info_ClearChoices(DIA_Hanna_City);
	Info_AddChoice(DIA_Hanna_City,Dialog_Back,DIA_Hanna_City_Back);
	Info_AddChoice(DIA_Hanna_City,"Где я могу купить что-нибудь здесь?",DIA_Hanna_City_Buy);
	Info_AddChoice(DIA_Hanna_City,"Расскажи мне о городе.",DIA_Hanna_City_City);
};

func void DIA_Hanna_City_Back()
{
	Info_ClearChoices(DIA_Hanna_City);
};

func void DIA_Hanna_City_Buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//Где я могу купить что-нибудь здесь?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//Рынок находится прямо перед парадным входом в отель. Я думаю, ты найдешь там все, что тебе нужно.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//Также есть несколько лавок ремесленников в другой части города. Большинство из них находятся неподалеку от городских ворот.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//Также в порту ты найдешь торговца рыбой. Его лавка смотрит прямо на гавань.
};

func void DIA_Hanna_City_City()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//Расскажи мне о городе.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//Хоринис - один из самых богатых городов королевства, даже несмотря на то, что сейчас он совсем не кажется таким.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//Но с тех пор, как началась война с орками, всяческая торговля практически умерла. Король реквизировал весь торговый флот для нужд армии,
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//и теперь в наш порт корабли практически не заходят. Поэтому поставки товаров очень ограничены, и многие горожане очень обеспокоены этим.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//Никто не знает, что принесет нам будущее. Нам ничего не остается, кроме как ждать и надеяться на лучшее. Вряд ли в наших силах хоть что-то изменить.
};


instance DIA_Hanna_Kap3_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_Kap3_EXIT_Condition;
	information = DIA_Hanna_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Hanna_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Hanna_PriceForLetter;

instance DIA_Hanna_AnyNews(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_AnyNews_Condition;
	information = DIA_Hanna_AnyNews_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Hanna_AnyNews_Condition()
{
	if((Kapitel >= 3) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//Мне почему-то кажется, что тебя не особо-то волнуют проблемы других людей.
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ты ошибаешься.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ну, как сказать...",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ну, в общем, да.",DIA_Hanna_AnyNews_No);
};

func void DIA_Hanna_AnyNews_No()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//Ну, в общем, да.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//Ну, значит я права. Сейчас все думают только о себе. Так что тебе нужно?
	MIS_HannaRetrieveLetter = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//Ну, как сказать, э...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//Это зависит от того, сколько на этом можно заработать, ты хочешь сказать?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//Я не люблю таких, как ты.
	MIS_HannaRetrieveLetter = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//Ты ошибаешься.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//Ох, понимаешь какое дело... Я разбирала недавно у себя всякий хлам и продала пачку старых карт Ибрагиму, картографу в гавани.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//Но потом я заметила, что у меня не хватает одного документа.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//Я думаю, он мог случайно оказаться в стопке этих карт.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//Ты не мог бы вернуть его мне?
	MIS_HannaRetrieveLetter = LOG_Running;
	Log_CreateTopic(TOPIC_HannaRetrieveLetter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter,LOG_Running);
	B_LogEntry(TOPIC_HannaRetrieveLetter,"У Ханны пропал документ. Похоже, он пропал в гавани, там, где живет картограф Ибрагим.");
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"Я тебе не мальчик на побегушках.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice(DIA_Hanna_AnyNews,"Что я за это получу?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice(DIA_Hanna_AnyNews,"Я попробую.",DIA_Hanna_AnyNews_Yes_WillSee);
};

func void DIA_Hanna_AnyNews_Yes_Footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//Я тебе не мальчик на побегушках.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//Понимаю - проблемы простой женщины слишком ничтожны для тебя. Значит, мне придется заняться этим самой.
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//Что я за это получу?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//Ага, я знала - ты не лучше, чем весь этот остальной портовый сброд.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//Так что ты хочешь получить от бедной женщины?
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ладно, забудь.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice(DIA_Hanna_AnyNews,"Ну, ты могла бы быть немного поласковее со мной... Как женщина...",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice(DIA_Hanna_AnyNews,"Золото.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

func void DIA_Hanna_AnyNews_Yes_Reward_OK()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//Ладно, забудь.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//Ну, хоть остатки совести у тебя еще есть. Если ты принесешь мне этот документ, я дам тебе 75 золотых.
	Hanna_PriceForLetter = 75;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward_BeNice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//Ну, ты могла бы быть немного поласковее со мной... Как женщина...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//Ну, ты хам! Я... убирайся отсюда! Неотесанный мужлан!
	MIS_HannaRetrieveLetter = LOG_FAILED;
	B_CheckLog();
	AI_StopProcessInfos(self);
};

func void DIA_Hanna_AnyNews_Yes_Reward_Gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Золото.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//Тебе нужен этот презренный металл? Ладно - я оцениваю этот документ в 50 золотых.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//Если ты сможешь вернуть мне этот документ, я дам тебе 50 золотых монет.
	Hanna_PriceForLetter = 50;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_WillSee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//Я попробую.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//Ты такой любезный. Я желаю тебе удачи!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//Если ты принесешь мне эту бумагу, тебя ждет награда.
	Hanna_PriceForLetter = 200;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};


instance DIA_Hanna_ThisLetter(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_ThisLetter_Condition;
	information = DIA_Hanna_ThisLetter_Info;
	permanent = FALSE;
	description = "Ты этот документ имела в виду?";
};


func int DIA_Hanna_ThisLetter_Condition()
{
	if((MIS_HannaRetrieveLetter == LOG_Running) && Npc_HasItems(other,ItWr_ShatteredGolem_MIS) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_ThisLetter_Info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//Ты этот документ имела в виду?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//Да, именно его. Спасибо.
	B_GiveInvItems(other,self,ItWr_ShatteredGolem_MIS,1);
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//Как насчет моей награды?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//Не так быстро. Вот твои деньги.
	CreateInvItems(self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems(self,other,ItMi_Gold,Hanna_PriceForLetter);
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP(XP_HannaRetrieveLetter);
};


instance DIA_Hanna_PICKPOCKET(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 900;
	condition = DIA_Hanna_PICKPOCKET_Condition;
	information = DIA_Hanna_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Hanna_PICKPOCKET_Condition()
{
	return C_Beklauen(45,25);
};

func void DIA_Hanna_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,Dialog_Back,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};


instance DIA_Hanna_AusKeller(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 11;
	condition = DIA_Hanna_AusKeller_Condition;
	information = DIA_Hanna_AusKeller_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hanna_AusKeller_Condition()
{
	if(Andre_FoundThieves_KilledByMilitia == TRUE)
	{
		return FALSE;
	};
	if(Andre_FoundThieves_Reported == TRUE)
	{
		if(Andre_FoundThieves_Reported_Day <= (Wld_GetDay() - 2))
		{
			if(!Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez))
			{
				return FALSE;
			};
		};
	};
	if(Hanna_ThievesIsDead == TRUE)
	{
		if(Hanna_ThievesIsDead_Day <= (Wld_GetDay() - 2))
		{
			if(Npc_KnowsInfo(other,DIA_Hanna_AusKeller) || Npc_KnowsInfo(other,DIA_Hanna_Blubb) || Npc_KnowsInfo(other,DIA_Hanna_Blubb2))
			{
				return FALSE;
			};
		};
	};
	if(Npc_HasItems(other,ItKe_ThiefGuildKey_Hotel_MIS) || (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_AusKeller_Info()
{
	if(Knows_SecretSign == TRUE)
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//(недоверчиво) Посмотри на себя! Ты откуда такой взялся? А?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//(смущенно) Я...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//(смеется) Я знаю!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//(заговорщицки) Не говори мне. Я все знаю.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//Даже и не думай украсть что-нибудь здесь, понял?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//Мы не можем себе позволить привлекать внимание к отелю.
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//Откуда... ты пришел?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//Я нашел кое-что интересное в твоем подвале...
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//Что ты делал в моем подвале?!
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//Ты прекрасно знаешь это!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//(холодно) Я не знаю, о чем ты говоришь...
	};
	if(Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
	{
		Hanna_ThievesIsDead = TRUE;
		Hanna_ThievesIsDead_Day = Wld_GetDay();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Hanna_Schuldenbuch(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Schuldenbuch_Condition;
	information = DIA_Hanna_Schuldenbuch_Info;
	permanent = FALSE;
	description = "Посмотри, какая у меня есть книга!";
};


func int DIA_Hanna_Schuldenbuch_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) && (SchuldBuchNamesKnown == TRUE) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//Посмотри, какая у меня есть книга!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//Гроссбух Лемара. Как тебе это удалось?
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//Ну...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//То, что Лемар лишился своего гроссбуха - это хорошо. Но лучше, если он будет у меня...
};


instance DIA_Hanna_GiveSchuldenbuch(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_GiveSchuldenbuch_Condition;
	information = DIA_Hanna_GiveSchuldenbuch_Info;
	permanent = FALSE;
	description = "Вот - возьми эту книгу.";
};


func int DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Schuldenbuch) && Npc_HasItems(other,ItWr_Schuldenbuch) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_GiveSchuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//Вот - возьми эту книгу.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//Спасибо.
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//Возьми это в качестве награды.
	B_GiveInvItems(self,other,ItSe_HannasBeutel,1);
	B_GivePlayerXP(XP_Schuldenbuch);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//Что это такое ты дала мне?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//Это ключ от врат, ведущих к богатству.
};


instance DIA_Hanna_Blubb(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Blubb_Condition;
	information = DIA_Hanna_Blubb_Info;
	permanent = TRUE;
	description = "В логове все в порядке?";
};

func int DIA_Hanna_Blubb_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_AusKeller) && (Knows_SecretSign == TRUE) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Blubb_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//В логове все в порядке?
	AI_Output(self,other,"DIA_Hanna_Add_17_39");	//Я давно уже не видела их.
	AI_Output(self,other,"DIA_Hanna_Add_17_40");	//Я, пожалуй, схожу туда, когда у меня будет время и проверю, как у них дела.
	AI_Output(self,other,"DIA_Hanna_Add_17_38");	//Да. Но тебе лучше не говорить об этом...
	if(Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
	{
		Hanna_ThievesIsDead = TRUE;
		Hanna_ThievesIsDead_Day = Wld_GetDay();
	};
};

instance DIA_Hanna_Blubb2(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Blubb2_Condition;
	information = DIA_Hanna_Blubb2_Info;
	permanent = TRUE;
	description = "Ты знала о логове воров?";
};

func int DIA_Hanna_Blubb2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_AusKeller) && (Knows_SecretSign == FALSE) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Blubb2_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//Ты знала о логове воров?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//(глупо улыбается) Я не понимаю, о чем ты говоришь...
	if(Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
	{
		Hanna_ThievesIsDead = TRUE;
		Hanna_ThievesIsDead_Day = Wld_GetDay();
	};
};

instance DIA_Hanna_Blubb3(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Blubb3_Condition;
	information = DIA_Hanna_Blubb3_Info;
	important = TRUE;
};

func int DIA_Hanna_Blubb3_Condition()
{
	if(Andre_FoundThieves_KilledByMilitia == TRUE)
	{
		return TRUE;
	};
	if(Andre_FoundThieves_Reported == TRUE)
	{
		if(Andre_FoundThieves_Reported_Day <= (Wld_GetDay() - 2))
		{
			if(!Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez))
			{
				return TRUE;
			};
		};
	};
	if(Hanna_ThievesIsDead == TRUE)
	{
		if(Hanna_ThievesIsDead_Day <= (Wld_GetDay() - 2))
		{
			if(Npc_KnowsInfo(other,DIA_Hanna_AusKeller) || Npc_KnowsInfo(other,DIA_Hanna_Blubb) || Npc_KnowsInfo(other,DIA_Hanna_Blubb2))
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Hanna_Blubb3_Info()
{
	CreateInvItem(self,ItSc_IceCube);
	CreateInvItem(self,ItSc_Firestorm);
	CreateInvItem(self,ItKe_ThiefGuildKey_Hotel_MIS);
	AI_Output(self,other,"DIA_Hanna_Add_17_32");	//Здесь было ополчение... Кто-то предал наше убежище!
	if(Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_33");	//Мне они ничего не смогли предъявить, но Кассия и ее люди мертвы!
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_34");	//Я уверена, что это ТЫ...
	B_SelectSpell(self,other);
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//Я купила это специально для тебя.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//Это обошлось мне в кругленькую сумму. Но для тебя ничего не жалко, свинья...
	B_KillThievesGuild();
	if(MIS_CassiaRing == LOG_Running)
	{
		MIS_CassiaRing = LOG_FAILED;
	};
	if(MIS_CassiaKelche == LOG_Running)
	{
		MIS_CassiaKelche = LOG_FAILED;
	};
	if(MIS_RamirezSextant == LOG_Running)
	{
		MIS_RamirezSextant = LOG_FAILED;
	};
	B_CheckLog();
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Hanna_PICKPOCKET_Book(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 700;
	condition = DIA_Hanna_PICKPOCKET_Book_Condition;
	information = DIA_Hanna_PICKPOCKET_Book_Info;
	permanent = TRUE;
	description = "(украсть долговую книгу будет довольно рискованно)";
};


func int DIA_Hanna_PICKPOCKET_Book_Condition()
{
	if((ClassicLehmarBook == FALSE) && Npc_HasItems(self,ItWr_Schuldenbuch) && Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 35))
	{
		return TRUE;
	};
};

func void DIA_Hanna_PICKPOCKET_Book_Info()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET_Book);
	Info_AddChoice(DIA_Hanna_PICKPOCKET_Book,Dialog_Back,DIA_Hanna_PICKPOCKET_Book_BACK);
	Info_AddChoice(DIA_Hanna_PICKPOCKET_Book,DIALOG_PICKPOCKET,DIA_Hanna_PICKPOCKET_Book_DoIt);
};

func void DIA_Hanna_PICKPOCKET_Book_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 45)
	{
		Npc_RemoveInvItem(self,ItWr_Schuldenbuch);
		CreateInvItem(other,ItWr_Schuldenbuch);
		AI_PrintScreen("Долговая книга получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		B_GiveThiefXP();
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketSuccess));
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket,ConcatStrings(self.name[0],PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Hanna_PICKPOCKET_Book);
};

func void DIA_Hanna_PICKPOCKET_Book_BACK()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET_Book);
};

instance DIA_Hanna_Blubb4(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Blubb4_Condition;
	information = DIA_Hanna_Blubb4_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Hanna_Blubb4_Condition()
{
	if((Andre_FoundThieves_KilledByMilitia == TRUE) && Npc_KnowsInfo(other,DIA_Hanna_Blubb3) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Blubb4_Info()
{
	B_Say(self,other,"$KillEnemy");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

