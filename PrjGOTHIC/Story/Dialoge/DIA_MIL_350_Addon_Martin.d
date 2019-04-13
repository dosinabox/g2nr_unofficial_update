
instance DIA_Addon_Martin_EXIT(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 999;
	condition = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Martin_PICKPOCKET(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 900;
	condition = DIA_Addon_Martin_PICKPOCKET_Condition;
	information = DIA_Addon_Martin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Martin_PICKPOCKET_Condition()
{
	return C_Beklauen(65,77);
};

func void DIA_Addon_Martin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET,Dialog_Back,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};

func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};


instance DIA_Addon_Martin_MeetingIsRunning(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 1;
	condition = DIA_Addon_Martin_MeetingIsRunning_Condition;
	information = DIA_Addon_Martin_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Martin_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Martin_MeetingIsRunning_OneTime;

func void DIA_Addon_Martin_MeetingIsRunning_Info()
{
	if(DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_00");	//Итак, ты новенький? Добро пожаловать в Братство, брат по Кольцу.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_01");	//Сначала ты должен сходить к Ватрасу. Возможно, потом у меня найдется для тебя время.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Martin_Hallo(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Hallo_Condition;
	information = DIA_Addon_Martin_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Martin_Hallo_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (RangerMeetingRunning != LOG_SUCCESS) && (SC_IsRanger == FALSE) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Martin_Hallo_07_00");	//Эй, ты! Нечего тебе здесь делать. Здесь могут находиться только паладины и люди из ополчения.
};


instance DIA_Addon_Martin_WasMachstDu(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_WasMachstDu_Condition;
	information = DIA_Addon_Martin_WasMachstDu_Info;
	description = "А что это за место?";
};


func int DIA_Addon_Martin_WasMachstDu_Condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_WasMachstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_WasMachstDu_15_00");	//А что это за место?
	AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_01");	//Здесь хранятся запасы королевской гвардии паладинов.
	if((other.guild == GIL_NONE) && (SC_IsRanger == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_02");	//Я - интендант, и я отвечаю за то, чтобы не пропало ничего из находящегося здесь. А тебе здесь не место.
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_03");	//Так что не трогай здесь ничего, иначе останешься без рук.
	};
};


instance DIA_Addon_Martin_PreTrade(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_PreTrade_Condition;
	information = DIA_Addon_Martin_PreTrade_Info;
	description = "Ты можешь мне продать что-нибудь из вещей паладинов?";
};


func int DIA_Addon_Martin_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_PreTrade_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_00");	//Ты можешь мне продать что-нибудь из вещей паладинов?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_01");	//Хм-м... Скажем так, если ты компенсируешь мне те неприятности, которые у меня возникнут, когда пропажи обнаружатся, то мы можем договориться.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_02");	//И часто случаются пропажи вещей?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_03");	//Нет, пока интендант говорит, что все в порядке.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//Понимаю.
};


instance DIA_Addon_Martin_Farim(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Farim_Condition;
	information = DIA_Addon_Martin_Farim_Info;
	description = "У рыбака Фарима проблемы с ополчением. У него постоянно отбирают весь улов.";
};


func int DIA_Addon_Martin_Farim_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Farim_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_00");	//У рыбака Фарима проблемы с ополчением. У него постоянно отбирают весь улов.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_01");	//И почему меня это должно интересовать?
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_02");	//Ну, у тебя есть определенное влияние среди паладинов.
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_03");	//Фариму нужна твоя защита. Он готов отдавать тебе за нее часть улова.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_04");	//Я понимаю, о чем ты говоришь.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_05");	//Рыба! Как будто у меня без этого не хватало забот!
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_06");	//Скажи своему приятелю, чтобы он пришел ко мне и рассказал, что именно у него стряслось с ополчением.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_07");	//Я разберусь с этим делом.
	B_LogEntry(TOPIC_Addon_FarimsFish,"Интендант Мартин позаботится об этом.");
	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP(XP_Addon_FarimSchutz);
};


instance DIA_Addon_Martin_Trade(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 80;
	condition = DIA_Addon_Martin_Trade_Condition;
	information = DIA_Addon_Martin_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Что ты можешь предложить мне?";
};


func int DIA_Addon_Martin_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};


var int DIA_Addon_Martin_Trade_OneTime;

func void DIA_Addon_Martin_Trade_Info()
{
	if(DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,LogText_Addon_MartinTrade);
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Что ты можешь предложить?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Addon_Martin_Trade_07_01");	//Что ж, смотри внимательно.
};


instance DIA_Addon_Martin_Rangerhelp(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Rangerhelp_Condition;
	information = DIA_Addon_Martin_Rangerhelp_Info;
	description = "Меня послал Ларес. Он сказал, что ты можешь мне помочь.";
};


func int DIA_Addon_Martin_Rangerhelp_Condition()
{
	if((RangerHelp_gildeMIL == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Rangerhelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_00");	//Меня послал Ларес. Он сказал, что ты можешь мне помочь.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_01");	//Да? И что же тебе от меня нужно?
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_02");	//Я хочу присоединиться к ополчению.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_03");	//(смеется) Итак, ты хочешь вступить в наши ряды? Мы, знаешь ли, не берем просто так людей с улицы.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_04");	//Тебе, возможно, придется...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_05");	//Оставь свои нравоучения при себе. Просто скажи, что нужно сделать для то, чтобы вступить в ополчение.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_06");	//(удивленно) Ну хорошо. Тогда слушай меня внимательно.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_07");	//Надо сказать, что работа интенданта - та еще каторга. Разобраться со всеми этими ящиками и мешками совсем не просто.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_08");	//А каждый раз, когда я после работы расслабляюсь в таверне Кардифа, кто-то копается в ящиках с запасами, и наутро я обнаруживаю, что что-то пропало.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_09");	//(сердито) Довольно странно, что эти паладины ничего не замечают.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_10");	//Я так просто рехнусь. Не могу же я всю ночь торчать здесь, как последний идиот.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_11");	//Ты, с другой стороны...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_12");	//Я понял. Ты хочешь, чтобы я посторожил ящики, пока ты пьешь в таверне.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_13");	//Соглашайся или уходи.
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Я должен следить за ящиками интенданта Мартина. Если я поймаю человека, который ворует вещи из ящиков, Мартин поможет мне вступить в ополчение.");
};


instance DIA_Addon_Martin_Auftrag(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_Auftrag_Condition;
	information = DIA_Addon_Martin_Auftrag_Info;
	description = "Хорошо, я присмотрю за твоими ящиками.";
};


func int DIA_Addon_Martin_Auftrag_Condition()
{
	if((RangerHelp_gildeMIL == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Martin_Rangerhelp) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};


var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Auftrag_15_00");	//Хорошо, я присмотрю за твоими ящиками.
	AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_01");	//Отлично.
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_02");	//Тогда я пошел в таверну. И горе тебе, если у тебя что-нибудь пропадет.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_03");	//Возвращайся вечером и заступай на стражу. Я в это время буду в таверне.
	};
	B_StartOtherRoutine(MIL_321_Rangar,"PrePalCampKlau");
	Info_ClearChoices(DIA_Addon_Martin_Auftrag);
	Info_AddChoice(DIA_Addon_Martin_Auftrag,"(еще)",DIA_Addon_Martin_Auftrag_weiter);
};

func void DIA_Addon_Martin_Auftrag_weiter()
{
	MIS_Addon_Martin_GetRangar = LOG_Running;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(MIL_321_Rangar,"PalCampKlau");
};


instance DIA_Addon_Martin_FromVatras(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_FromVatras_Condition;
	information = DIA_Addon_Martin_FromVatras_Info;
	description = "Ты ищешь человека, который продает оружие бандитам?";
};


func int DIA_Addon_Martin_FromVatras_Condition()
{
	if(Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_FromVatras_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_00");	//Ты ищешь человека, который продает оружие бандитам?
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_01");	//Кто тебе это сказал?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//Ватрас.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_03");	//Ясно. Ну и что ты знаешь об этом деле?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_04");	//Немного, но я постараюсь выяснить больше.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//Итак?..
};


instance DIA_Addon_Martin_TellAll(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_TellAll_Condition;
	information = DIA_Addon_Martin_TellAll_Info;
	description = "Расскажи мне, что тебе известно о торговце оружием?";
};


func int DIA_Addon_Martin_TellAll_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_TellAll_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_TellAll_15_00");	//Расскажи мне, что тебе известно о торговце оружием?
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_01");	//Мы знаем, что за этим стоит один из влиятельных торговцев, живущих в верхнем квартале.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_02");	//Часть проданного оружия даже была взята из запасов ополчения.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_03");	//Но мы все еще не знаем, кто именно занимается продажами.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_04");	//Если тебе хватит смелости разобраться с группой, состоящей по меньшей мере из пяти бандитов, то возможно, ты найдешь какие-либо улики...
	B_LogEntry(TOPIC_Addon_Bandittrader,"Мартин утверждает, что поставщик оружия - один из влиятельных горожан, живущих в верхнем квартале.");
};


instance DIA_Addon_Martin_AboutBandits(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_AboutBandits_Condition;
	information = DIA_Addon_Martin_AboutBandits_Info;
	description = "Какова ситуация с бандитами?";
};


func int DIA_Addon_Martin_AboutBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_AboutBandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_AboutBandits_15_00");	//Какова ситуация с бандитами?
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_01");	//Мы знаем, что они устраивают засады на дорогах, соединяющих город с фермами.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_02");	//Еще нам известно, что несколько дней назад они получили крупную партию оружия.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_03");	//Думаю, сейчас самое время для поиска улик, указывающих на личность сотрудничающего с ними торговца.
	MIs_Martin_FindTheBanditTrader = LOG_Running;
	B_LogEntry(TOPIC_Addon_Bandittrader,"Бандиты устраивают засады на дорогах между городом и фермами. Возможно, там я найду улики, указывающие на поставщика оружия.");
};


instance DIA_Addon_Martin_Fernando(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 5;
	condition = DIA_Addon_Martin_Fernando_Condition;
	information = DIA_Addon_Martin_Fernando_Info;
	permanent = TRUE;
	description = "Насчет торговца оружием...";
};


func int DIA_Addon_Martin_Fernando_Condition()
{
	if(MIs_Martin_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};


var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info()
{
	var int FernandoHints;
	AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_00");	//Насчет торговца оружием...
	if(Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE)) || (Fernando_HatsZugegeben == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_01");	//Что тебе удалось узнать?
		FernandoHints = 0;
		if(Npc_HasItems(other,ItMw_Addon_BanditTrader) || Npc_HasItems(other,ItRi_Addon_BanditTrader) || (Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE)))
		{
			if(Npc_HasItems(other,ItMw_Addon_BanditTrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_02");	//Такие шпаги я нашел у бандитов. На эфесе выгравирована буква 'Ф'.
				FernandoHints = FernandoHints + 1;
			};
			if(Npc_HasItems(other,ItRi_Addon_BanditTrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_03");	//У бандитов я нашел это кольцо. Оно указывает на морского торговца.
				FernandoHints = FernandoHints + 1;
			};
			if(Npc_HasItems(other,ItWr_Addon_BanditTrader) && (BanditTrader_Lieferung_Gelesen == TRUE))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_04");	//Этот список оружия и прочих доставленных бандитам вещей подписан неким Фернандо.
				FernandoHints = FernandoHints + 3;
			};
			if(Fernando_HatsZugegeben == TRUE)
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_05");	//И кроме того, Фернандо, старый торговец из верхнего квартала, сознался в том, что ведет дела с бандитами.
				FernandoHints = FernandoHints + 1;
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_06");	//Фернандо сказал, что снабжает бандитов оружием.
		};
		if(FernandoHints >= 3)
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_07");	//Думаю, этого достаточно. Итак, Фернандо... Что ж, он получит по заслугам.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_08");	//А он всегда так спокойно себя вел, когда речь заходила об этом.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_09");	//Ну теперь-то ему предстоит долгое время гнить за решеткой.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_10");	//Должен сказать, ты сделал большое дело.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_11");	//Ватрас будет доволен, когда узнает эту новость.
			B_StartOtherRoutine(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry(TOPIC_Addon_Bandittrader,"Мартин позаботится о том, чтобы Фернандо был наказан. Я должен сообщить об этом Ватрасу.");
			B_GivePlayerXP(XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_12");	//И? Что еще?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//Это все.
			if(Fernando_HatsZugegeben == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_14");	//Хорошо, конечно, что он признался, но без веских улик мы не сможем посадить его за решетку.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_15");	//Я не хочу выставлять себя на посмешище перед лордом Хагеном. Тебе придется найти еще какие-то доказательства.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_16");	//Этого недостаточно. Твои улики могут указывать практически на любого торговца из верхнего квартала.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_17");	//Думаю, тебе придется продолжить выслеживать бандитов и проследить путь последней полученной ими партии оружия.
				if(Martin_IrrlichtHint == FALSE)
				{
					AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_18");	//Может быть, тебе стоит еще раз поговорить с Ватрасом...
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_19");	//Еще раз, что я должен сделать?
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_20");	//Ты должен выяснить, кто стоит за поставками бандитам оружия, и принести мне доказательства его вины.
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_21");	//Но это должны быть действительно убедительные доказательства. Иначе я не смогу арестовать торговца.
	};
};


instance DIA_Addon_Martin_Perm(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 90;
	condition = DIA_Addon_Martin_Perm_Condition;
	information = DIA_Addon_Martin_Perm_Info;
	permanent = TRUE;
	description = "Все ящики на месте?";
};


func int DIA_Addon_Martin_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Perm_15_00");	//Все ящики на месте?
	if((MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay() - 2)) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_01");	//(сердито) Проклятый лентяй, ты должен был охранять эти ящики! Еще несколько вещей пропало!
		if(Wld_IsTime(24,0,3,0))
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_02");	//Отправляйся в гавань и поймай того ублюдка, который это сделал! Ты меня понял?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_03");	//И этой ночью, когда я уйду, будь повнимательнее!
		};
	}
	else if((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (SC_IsRanger == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_04");	//Давай, давай, смейся. Попробовал бы ты постоять целый день на пирсе, пытаясь разобраться во всем этом хаосе.
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_05");	//Паладины привезли с собой столько всякого хлама, что это даже не смешно.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_06");	//Ничего не трогай, иначе я позову стражу. Тебе все понятно?
	};
};


instance DIA_Addon_Martin_GotRangar(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_GotRangar_Condition;
	information = DIA_Addon_Martin_GotRangar_Info;
	description = "Я узнал, кто ворует вещи.";
};


func int DIA_Addon_Martin_GotRangar_Condition()
{
	if((MIS_Addon_Martin_GetRangar == LOG_Running) && (SC_GotRangar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GotRangar_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_00");	//Я узнал, кто ворует вещи.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_01");	//В твоих ящиках копался Рагнар.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_02");	//Ну наконец-то. Теперь я, по крайней мере, буду знать, за кем мне присматривать. Вот сволочь! Ну, если я его поймаю...
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_03");	//А я-то всегда удивлялся, почему паладины ничего не замечают.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//И? Почему?
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_05");	//Это же очевидно! Эти идиоты не могут отличить одного солдата ополчения от другого. Для них мы все на одно лицо.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_06");	//Хорошая работа, приятель.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_07");	//Если тебе что-нибудь понадобится, только скажи.
	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Martin_GotRangar_Report);
};


instance DIA_Addon_Martin_GetMiliz(C_Info)
{
	npc = Mil_350_Addon_Martin;
	nr = 2;
	condition = DIA_Addon_Martin_GetMiliz_Condition;
	information = DIA_Addon_Martin_GetMiliz_Info;
	description = "Ты знаешь, что мне от тебя нужно.";
};


func int DIA_Addon_Martin_GetMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Martin_GotRangar))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GetMiliz_Info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GetMiliz_15_00");	//Ты знаешь, что мне от тебя нужно.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_01");	//А, да. Ты хочешь вступить в ополчение, верно?
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_02");	//Что ж, ты уже доказал мне, на что способен.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_03");	//Скажем так, я бы скорее хотел бы видеть тебя на нашей стороне, чем на чьей-либо еще.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_04");	//Поэтому я помогу тебе. Возьми мое рекомендательное письмо и покажи его Андре, нашему командиру.
	CreateInvItems(self,ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_GiveInvItems(self,other,ItWr_Martin_MilizEmpfehlung_Addon,1);
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_05");	//Ты найдешь его в казармах. Уверен, он сможет найти тебе применение.
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Мартин дал мне рекомендательное письмо для лорда Андре. Прочитав его, Андре примет меня в ополчение. Найти Андре можно в казармах.");
};

