
var int DIA_Kardif_Buerger_permanent;
var int DIA_Kardif_Lehmar_permanent;
var int DIA_Kardif_Arbeit_permanent;
var int DIA_Addon_Kardif_MissingPeople_permanent;
var int DIA_Kardif_Lernen_permanent;
var int DIA_Kardif_Diebeswerk_permanent;
var int DIA_Kardif_Diebeswerk2_permanent;
var int DIA_Kardif_DOPE_perm;
var int DIA_Kardif_Paket_perm;
var int DIA_Kardif_Kerl_permanent;

func int C_MartinIsNear()
{
	if(!Hlp_IsValidNpc(Martin))
	{
		return FALSE;
	};
	if(Npc_IsDead(Martin))
	{
		return FALSE;
	};
	if(Npc_GetDistToNpc(self,Martin) >= PERC_DIST_DIALOG) //TODO определять расстояние до точки в таверне
	{
		return FALSE;
	};
	return TRUE;
};

instance DIA_Kardif_EXIT(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 999;
	condition = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kardif_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kardif_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Kardif_Hi(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hi_Condition;
	information = DIA_Kardif_Hi_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Kardif_Hi_Condition()
{
	return TRUE;
};

func void DIA_Kardif_Hi_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//Как дела?
	if(self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Если ты хочешь что-нибудь выпить, заказывай.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//А тебе какое до этого дело?
	};
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Кардиф торгует напитками в таверне в гавани.");
};


instance DIA_Kardif_Hallo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hallo_Condition;
	information = DIA_Kardif_Hallo_Info;
	permanent = FALSE;
	description = "Готов побиться об заклад, ты многое здесь слышишь...";
};


func int DIA_Kardif_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_Hi) && (Kardif_Deal == 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hallo_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Готов побиться об заклад, ты многое здесь слышишь...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//А тебе какое до этого дело?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Мои уши всегда открыты для новостей.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//А кошелек у тебя тоже открыт?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Каждая информация, которую я сообщу тебе, будет стоить 10 золотых монет.
	if(!Npc_KnowsInfo(other,DIA_Meldor_Interessantes))
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Кардиф, владелец кабака в гавани, приторговывает информацией.");
	};
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Я не готов платить за информацию больше 5 монет.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice(DIA_Kardif_Hallo,"Забудь об этом - я найду нужную мне информацию в другом месте.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice(DIA_Kardif_Hallo,"Хорошо, договорились.",DIA_Kardif_Hallo_Zehn);
};

func void DIA_Kardif_Hallo_Zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//Хорошо, договорились.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Ты заключил выгодную сделку. (усмехается) Я всегда к твоим услугам.
	Kardif_Deal = 10;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Я не готов платить за информацию больше 5 монет.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Что, 5 золотых монет? Ты хочешь разорить меня? (делает задумчивый вид) Давай сойдемся на 7.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Нет, так не пойдет. Давай лучше 6!",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice(DIA_Kardif_Hallo,"Договорились, 7 золотых монет - неплохая цена.",DIA_Kardif_Hallo_Sieben);
};

func void DIA_Kardif_Hallo_Hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Забудь об этом - я найду нужную мне информацию в другом месте.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//Хорошо, хорошо... я согласен и на 7.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"Договорились, 7 золотых монет - неплохая цена.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice(DIA_Kardif_Hallo,"Нет, мне не так уж сильно нужна твоя информация.",DIA_Kardif_Hallo_Ablehnen);
};

func void DIA_Kardif_Hallo_Sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Договорились, 7 золотых монет - неплохая цена.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(усмехается) Мудрое решение. Ну, если тебе нужно будет что-то узнать, обращайся ко мне.
	Kardif_Deal = 7;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//Нет, мне не так уж сильно нужна твоя информация.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Эй, подожди... (вздыхает) - хорошо, 5 золотых монет. Но это моя последняя цена!
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"И почему нельзя было сразу сказать об этом?",DIA_Kardif_Hallo_Fuenf);
};

func void DIA_Kardif_Hallo_Fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//И почему нельзя было сразу сказать об этом?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Ох, я просто сейчас не в лучшей форме. Но, как бы то ни было - сделка есть сделка.
	Kardif_Deal = 5;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Нет, так не пойдет. Давай лучше 6!
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Ты отъявленный негодяй, скажу я тебе. Ну, если ты так настаиваешь, информация тебе обойдется в 6 золотых монет.
	Kardif_Deal = 6;
	Info_ClearChoices(DIA_Kardif_Hallo);
};


instance DIA_Kardif_TRADE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TRADE_Condition;
	information = DIA_Kardif_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Дай мне что-нибудь выпить.";
};


func int DIA_Kardif_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_Hi))
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info()
{
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Дай мне что-нибудь выпить.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


func void B_BuildInfoDialog_Kardif()
{
	Info_ClearChoices(DIA_Kardif_TradeInfo);
	Info_AddChoice(DIA_Kardif_TradeInfo,Dialog_Back,DIA_Kardif_TradeInfo_Back);
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE) && (DIA_Kardif_DOPE_perm == FALSE))
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"Где мне здесь купить травки?",DIA_Kardif_DOPE_Info);
	};
	if((MIS_Andre_WAREHOUSE == LOG_Running) && (DIA_Kardif_Paket_perm == FALSE))
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"Ты что-нибудь слышал о тюке болотной травы?",DIA_Kardif_Paket_Info);
	};
	if(DIA_Kardif_Lernen_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"А у кого здесь можно поучиться чему-нибудь?",DIA_Kardif_Lernen_Info);
	};
	if(DIA_Kardif_Arbeit_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"Где я могу найти работу?",DIA_Kardif_Arbeit_Info);
	}
	else if(DIA_Kardif_Diebeswerk_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"А нет ли здесь какой-нибудь 'особой' работы?",DIA_Kardif_Diebeswerk_Info);
	}
	else if(DIA_Kardif_Diebeswerk2_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"Есть что-нибудь 'особенное' для меня?",DIA_Kardif_Diebeswerk2_Info);
	};
	if(DIA_Kardif_Buerger_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"Кого считают влиятельными людьми в этом городе?",DIA_Kardif_Buerger_Info);
	}
	else if((DIA_Kardif_Lehmar_permanent == FALSE) && (SchuldBuchNamesKnown == FALSE))
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"Кто должен Лемару?",DIA_Kardif_Lehmar_Info);
	};
	if((DIA_Addon_Kardif_MissingPeople_permanent == FALSE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"Что ты знаешь о пропавших горожанах?",DIA_Addon_Kardif_MissingPeople_Info);
	};
	if(Npc_KnowsInfo(other,DIA_Kardif_SENDATTILA) && !Npc_IsDead(Attila) && (DIA_Kardif_Kerl_permanent == FALSE))
	{
		if(Attila.aivar[AIV_TalkedToPlayer] == FALSE)
		{
			Info_AddChoice(DIA_Kardif_TradeInfo,"Как выглядел этот парень?",DIA_Kardif_Kerl_Info);
		};
	};
};

func void B_SayKardifZuwenigGold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Возвращайся, когда у тебя будет достаточно золота.
	Info_ClearChoices(DIA_Kardif_TradeInfo);
};

instance DIA_Kardif_TradeInfo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TradeInfo_Condition;
	information = DIA_Kardif_TradeInfo_Info;
	permanent = TRUE;
	description = "Мне нужна информация.";
};


func int DIA_Kardif_TradeInfo_Condition()
{
	if(Kardif_Deal > 0)
	{
		return TRUE;
	};
};

func void DIA_Kardif_TradeInfo_Info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Мне нужна информация.
	B_BuildInfoDialog_Kardif();
};

func void DIA_Kardif_Buerger_Info()
{
	AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Кого считают влиятельными людьми в этом городе?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Здесь, в порту, ты никого из них не найдешь. Единственный влиятельный человек здесь - это Лемар.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Этот ростовщик не очень популярен, но у него есть золото, и другие влиятельные горожане должны ему деньги.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Торговцы и мастера тоже очень влиятельные люди - и даже слишком, если тебе интересно мое мнение.
		DIA_Kardif_Buerger_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Lehmar_Info()
{
	AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Кто должен Лемару?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(смеется) Если ты хочешь узнать это, тебе стоит заглянуть в его гроссбух.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Только это будет очень непросто сделать незаметно.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Насколько мне известно, он всегда носит его с собой...
		DIA_Kardif_Lehmar_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Где я могу найти работу?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//Ты вряд ли найдешь работу здесь, в порту. Тебе нужно обратиться к мастерам в нижней части города.
		if(!Npc_IsDead(VLK_438_Alrik))
		{
			AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Но если у тебя есть приличный меч, ты можешь вызвать Альрика на поединок. Ты найдешь его за складом, он сражается за золото.
		};
		DIA_Kardif_Arbeit_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Addon_Kardif_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//Что ты знаешь о пропавших горожанах?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//Все, что я знаю - это то, что за последние дни исчезли несколько людей.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//Говорят, что больше всего пропавших здесь, в порту. Думаю, тебе стоит расспросить местных.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//В нижней части города тоже исчезли люди.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//Если хочешь знать больше, поговори с Корагоном.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//У него пивная в нижней части города, и думаю, что от его уха не укрываются такие новости.
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		if((Halvor_Ausgeliefert == FALSE) && !Npc_IsDead(Halvor))
		{
			AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//Халвор, торговец рыбой из лавки на пристани, тоже может кое-что знать - к нему заходит много людей.
			B_LogEntry(TOPIC_Addon_WhoStolePeople,"Кардиф говорит, что мне стоит поговорить о пропавших людях с Корагоном, владельцем трактира в нижней части города, а также с Халвором, торгующим рыбой в гавани.");
		}
		else
		{
			B_LogEntry(TOPIC_Addon_WhoStolePeople,"Кардиф говорит, что мне стоит поговорить о пропавших людях с Корагоном, владельцем трактира в нижней части города.");
		};
		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Lernen_Info()
{
	var int Kardif_Log_Carl;
	var int Kardif_Log_Alrik;
	var int Kardif_Log_Lares;
	var int Kardif_Log_Ignaz;
	var int Kardif_Log_Brahim;
	AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//А у кого здесь можно поучиться чему-нибудь?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Здесь, в портовом районе, есть несколько знающих людей.
		if(!Npc_IsDead(VLK_461_Carl))
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Карл, кузнец - крепкий парень. Ручаюсь, он сможет помочь тебе стать сильнее.
			if(!Npc_KnowsInfo(other,DIA_Carl_Lernen))
			{
				Kardif_Log_Carl = TRUE;
			};
		};
		if(!Npc_IsDead(VLK_438_Alrik))
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Альрик опытен в боевых искусствах. А Ларес - мошенник, каких свет не видывал. Он тоже заходит иногда в порт.
			if(Alrik_Teach1H == FALSE)
			{
				Kardif_Log_Alrik = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_03_add");	//А Ларес - мошенник, каких свет не видывал. Он тоже заходит иногда в порт.
		};
		if(Lares_TeachDEX == FALSE)
		{
			Kardif_Log_Lares = TRUE;
		};
		if(!Npc_IsDead(Ignaz))
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//А если ты настолько выжил из ума, чтоб пойти к старому Игнацу - он знает толк в алхем... алхим... ну, как это... зельях.
			if(Ignaz_TeachAlchemy == FALSE)
			{
				Kardif_Log_Ignaz = TRUE;
			};
		};
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//И где мне найти всех этих людей?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(стонет) Боже, король успеет выиграть войну против орков, прежде чем я тебе объясню все это.
		if(!Npc_IsDead(Brahim))
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Просто осмотрись в портовом районе, ты обязательно найдешь их. А если ты хочешь лучше ориентироваться здесь, зайди к Ибрагиму и купи у него карту.
			AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//Его совсем легко найти. Он живет в соседнем доме направо от моего трактира. (бормочет) Я должен был взять в два раза больше за эту информацию.
			if(Brahim_Trade == FALSE)
			{
				Kardif_Log_Brahim = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_07_add");	//Просто осмотрись в портовом районе, ты обязательно найдешь их.
		};
		if((Kardif_Log_Carl == TRUE) || (Kardif_Log_Alrik == TRUE) || (Kardif_Log_Lares == TRUE) || (Kardif_Log_Ignaz == TRUE))
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			if(Kardif_Log_Carl == TRUE)
			{
				B_LogEntries(TOPIC_CityTeacher,"Карл, кузнец в портовом квартале, может сделать меня сильнее.");
			};
			if(Kardif_Log_Alrik == TRUE)
			{
				B_LogEntries(TOPIC_CityTeacher,"Альрик из портового квартала опытен в боевых искусствах.");
			};
			if(Kardif_Log_Lares == TRUE)
			{
				B_LogEntries(TOPIC_CityTeacher,"Ларес может помочь мне повысить мою ловкость и силу.");
			};
			if(Kardif_Log_Ignaz == TRUE)
			{
				B_LogEntries(TOPIC_CityTeacher,"Игнац может показать мне рецепты приготовления зелий. Он живет в портовом квартале.");
			};
			if(Kardif_Log_Brahim == TRUE)
			{
				Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
				B_LogNextEntry(TOPIC_CityTrader,"Ибрагим рисует карты и продает их в гавани.");
				Brahim_Trade = TRUE;
			};
		}
		else if(Kardif_Log_Brahim == TRUE)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader,"Ибрагим рисует карты и продает их в гавани.");
			Brahim_Trade = TRUE;
		};
		DIA_Kardif_Lernen_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Diebeswerk_Info()
{
	AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//А нет ли здесь какой-нибудь 'особой' работы? Мне бы хотелось побыстрее заработать денег.
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Что-нибудь особого, говоришь? Хмм...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//... попробуй поговорить с Нагуром. Возможно, он сможет помочь тебе.
		DIA_Kardif_Diebeswerk_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void B_Kardif_AboutDaronChest()
{
	AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//Ну, у Зуриса, торговца зельями на рынке, сейчас гостит Дарон, маг Огня.
	AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//И?
	AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//При нем есть новый сундучок, сделанный специально для него Торбеном, плотником.
	AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//Говорят, что этот Дарон носит с собой несметные сокровища. Но ты ничего не слышал от меня, понятно?
	DIA_Kardif_Diebeswerk2_permanent = TRUE;
};

func void DIA_Kardif_Diebeswerk2_Info()
{
	AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Есть что-нибудь 'особенное' для меня?
	if(Kardif_Busted == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//Ты обращаешься не по адресу. Я простой трактирщик.
	}
	else if(C_MartinIsNear())
	{
		AI_WaitTillEnd(self,other);
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//Ты обращаешься не по адресу. Я простой трактирщик.
	}
	else if(Npc_KnowsInfo(other,DIA_Kardif_Zeichen) || B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		if(!Npc_KnowsInfo(other,DIA_Kardif_Zeichen))
		{
			AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//Да, есть кое-что - но это заинтересует тебя, только если ты блещешь разносторонними талантами.
			AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Выкладывай, что там у тебя?
		};
		B_Kardif_AboutDaronChest();
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Kerl_Info()
{
	AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Как выглядел этот парень?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//Ну, он довольно высокий, темнокожий и сильный. Он не носит униформы. Какой-то он... зловещий.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//А его лицо?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Его лицо? Когда он глядел на меня, я был рад, что он пришел не за мной.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//В его глазах было что-то пугающее. Ну, как бы то ни было, я думаю... ты должен пойти, повидаться с ним. Это должно быть интересно.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Да... весь вопрос в том, для кого...
		DIA_Kardif_Kerl_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_DOPE_Info()
{
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Где мне здесь купить травки?
	if(Kardif_Busted == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Только не здесь - я не имею дела с подобными вещами.
		Undercover_Failed_Kardif = TRUE;
		B_CheckRedLightUndercover();
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Только не здесь.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//Ладно, тогда где?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//Я бы на твоем месте поговорил с Мелдором - он дымит тут днями напролет.
		DIA_Kardif_DOPE_perm = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Paket_Info()
{
	AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//Ты что-нибудь слышал о тюке болотной травы?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Тот, кто владеет этим тюком - богатый человек. И, возможно, весьма расслабленный тоже!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Не пытайся провести меня. Ты что-то знаешь. Давай, выкладывай!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Хорошо, хорошо - этот парень недавно заходил в мой трактир. Он из наемников.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//Он сказал, что продал тюк болотной травы в гавани, но, конечно же, он был обкуренный в хлам. Это все, что я знаю.
		DIA_Kardif_Paket_perm = TRUE;
		B_LogEntry(TOPIC_Warehouse,"Кардиф говорил с наемником. У этого парня был тюк болотной травы, который он хотел продать.");
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_TradeInfo_Back()
{
	Info_ClearChoices(DIA_Kardif_TradeInfo);
};

instance DIA_Kardif_SENDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_SENDATTILA_Condition;
	information = DIA_Kardif_SENDATTILA_Info;
	important = TRUE;
};


func int DIA_Kardif_SENDATTILA_Condition()
{
	if((MIS_ThiefGuild_sucked == TRUE) || (Diebesgilde_Okay >= 3) || (MIS_Nagur_Bote == LOG_FAILED) || ((Diebesgilde_Okay == 2) && (NagurHack == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SENDATTILA_Info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Эй, ты, иди сюда. У меня есть кое-что для тебя.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01_add");	//Один парень очень хочет поговорить с тобой. За рыбной лавкой Халвора.
//	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//Один парень очень хочет поговорить с тобой.
//	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Так как он не нашел тебя здесь, он попросил меня передать тебе записку.
//	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Он хочет встретиться с тобой. За рыбной лавкой Халвора.
	if(Kardif_Deal > 0)
	{
		AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Эта информация бесплатна - но это исключение! Цена на все остальное осталась прежней.
	};
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Как выглядел этот парень?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//Я мог бы сказать тебе - но тебе придется заплатить за это, мой друг. (усмехается)
	if(Kardif_Deal == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Каждая информация, которую я сообщу тебе, будет стоить 10 золотых монет.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc(VLK_494_Attila,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
	B_InitNpcGlobals();
	if((NagurHack == TRUE) || (MIS_Nagur_Bote == LOG_FAILED))
	{
		MIS_ThiefGuild_sucked = TRUE;
	};
};


instance DIA_Kardif_DEFEATEDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_DEFEATEDATTILA_Condition;
	information = DIA_Kardif_DEFEATEDATTILA_Info;
	permanent = FALSE;
	description = "Этот ублюдок пытался убить меня!";
};


func int DIA_Kardif_DEFEATEDATTILA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Hallo))
	{
		if(Npc_IsDead(Attila))
		{
			return TRUE;
		};
		if(Npc_GetDistToWP(Attila,"NW_CITY_KARDIF") > 2000)
		{
			return TRUE;
		};
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Этот ублюдок пытался убить меня!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Эй, откуда мне было знать? Я просто передал информацию.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Если кто-то решил насолить тебе, я думаю, у него были веские причины.
	B_GivePlayerXP(XP_Kardif_Blame4Attila);
};


instance DIA_Kardif_Zeichen(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 800;
	condition = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent = FALSE;
	description = DIALOG_SecretSign;
};


func int DIA_Kardif_Zeichen_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Ах, ты имеешь дела с бандой. Хорошо. В таком случае, у меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(вкрадчиво) Если тебе понадобятся отмычки, намекни. Я припас несколько на всякий случай. Просто попроси меня налить тебе выпивки.
	if(DIA_Kardif_Diebeswerk2_permanent == FALSE)
	{
		if(!C_MartinIsNear())
		{
			AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Есть что-нибудь 'особенное' для меня?
			B_Kardif_AboutDaronChest();
		};
	};
	CreateInvItems(self,ItKe_Lockpick,20);
	Kardif_Busted = FALSE;
};


instance DIA_Kardif_Crew(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 51;
	condition = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent = FALSE;
	description = "Мне все еще нужны матросы.";
};


func int DIA_Kardif_Crew_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Crew_Info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//Мне все еще нужны матросы.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Настали плохие времена, дружище. Ты не найдешь матросов во всем Хоринисе. Большинство из них давно покинули город.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Но с хорошим капитаном будет нетрудно набрать несколько смышленых парней и довольно быстро сделать из них неплохую команду.
	if(SCGotCaptain == FALSE)
	{
		AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Где я могу найти капитана?
		AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//Ты обращаешься не по адресу. Я простой трактирщик.
		if(!Npc_IsDead(Jack))
		{
			AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Иди, поговори со старым Джеком. Он ошивается в этом порту, сколько я себя помню. В том, что касается морского дела, это тот человек, что тебе нужен.
			if(MIS_Jack_NewLighthouseOfficer == FALSE)
			{
				B_LogEntry(Topic_Captain,"Кардиф отправил меня к старому Джеку. Возможно, он сможет помочь мне.");
			};
		};
	};
};

