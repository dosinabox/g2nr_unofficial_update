
instance DIA_Matteo_EXIT(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 999;
	condition = DIA_Matteo_EXIT_Condition;
	information = DIA_Matteo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Matteo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Matteo_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Matteo_PICKPOCKET(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 900;
	condition = DIA_Matteo_PICKPOCKET_Condition;
	information = DIA_Matteo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Matteo_PICKPOCKET_Condition()
{
	return C_Beklauen(80,150);
};

func void DIA_Matteo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
	Info_AddChoice(DIA_Matteo_PICKPOCKET,Dialog_Back,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Matteo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};

func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Matteo_PICKPOCKET);
};


instance DIA_Matteo_Hallo(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_Hallo_Condition;
	information = DIA_Matteo_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Matteo_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Hallo_Info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//Чем могу помочь?
};


instance DIA_Matteo_SellWhat(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 1;
	condition = DIA_Matteo_SellWhat_Condition;
	information = DIA_Matteo_SellWhat_Info;
	permanent = FALSE;
	description = "Что ты продаешь?";
};


func int DIA_Matteo_SellWhat_Condition()
{
	return TRUE;
};

func void DIA_Matteo_SellWhat_Info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//Что ты продаешь?
	if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//Я могу предложить все, что может понадобиться в твоих странствиях. Оружие, факелы, провизию... даже доспехи.
		AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//У меня есть очень хороший экземпляр на складе.
		AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//Двойные усиленные доспехи из кожи снеппера - совсем новые. Тебе это интересно?
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Выбирай.
	};
	if(Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Лавка Маттео находится у южных ворот города. Он продает снаряжение, оружие и другие товары.");
		Knows_Matteo = TRUE;
	};
};


instance DIA_Matteo_TRADE(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 800;
	condition = DIA_Matteo_TRADE_Condition;
	information = DIA_Matteo_TRADE_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Matteo_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};


var int Matteo_TradeNewsPermanent;

func void B_MatteoAboutLothar()
{
	AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//С тех пор, как наемники прикончили Лотара, инспекции паладинов стали значительно более строгими.
	AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//Я надеюсь, все успокоится, когда этого убийцу повесят.
	Matteo_TradeNewsPermanent = 1;
};

func void DIA_Matteo_TRADE_Info()
{
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Покажи мне свои товары.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (Matteo_TradeNewsPermanent == 0))
	{
		B_MatteoAboutLothar();
	};
	if((Kapitel == 4) && (Matteo_TradeNewsPermanent < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//Это хорошо, что ты опять пополняешь свои запасы. Кто знает, будет ли еще существовать этот город на следующей неделе.
		Matteo_TradeNewsPermanent = 2;
	};
	if((Kapitel == 5) && (Matteo_TradeNewsPermanent < 3))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//Похоже, паладины действительно серьезно настроены на этот раз. Они даже сократили охрану на своем корабле.
		if(Matteo_TradeNewsPermanent != 2)
		{
			AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//Это хорошо, что ты опять пополняешь свои запасы. Кто знает, будет ли еще существовать этот город на следующей неделе.
		};
		Matteo_TradeNewsPermanent = 3;
	};
	B_GiveTradeInv(self);
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		MatteoMinenAnteil = TRUE;
	};
	if(!Npc_HasItems(self,ItMi_Pan) && !Npc_HasItems(other,ItMi_Pan))
	{
		CreateInvItems(self,ItMi_Pan,1);
	};
	Trade_IsActive = TRUE;
};


var int Matteo_LeatherBought;

instance DIA_Matteo_LEATHER(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 850;
	condition = DIA_Matteo_LEATHER_Condition;
	information = DIA_Matteo_LEATHER_Info;
	permanent = TRUE;
	description = "Купить кожаные доспехи. Защита: 25/20/5/0. (250 золотых)";
};


func int DIA_Matteo_LEATHER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_SellWhat) && (Matteo_LeatherBought == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Matteo_LEATHER_Info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//Хорошо, давай мне эти доспехи.
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Они тебе понравятся. (ухмыляется)
		CreateInvItem(hero,ITAR_Leather_L);
		AI_PrintScreen("Кожаные доспехи получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		Matteo_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Эти доспехи стоят недешево - но они, определенно, стоят своих денег. Так что возвращайся, когда у тебя будет достаточно золота.
	};
};


var int Matteo_Confiscated;

instance DIA_Matteo_Paladine(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Paladine_Condition;
	information = DIA_Matteo_Paladine_Info;
	permanent = FALSE;
	description = "Что ты знаешь о паладинах?";
};


func int DIA_Matteo_Paladine_Condition()
{
	return TRUE;
};

func void DIA_Matteo_Paladine_Info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//Что ты знаешь о паладинах?
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (Matteo_TradeNewsPermanent == 0))
	{
		B_MatteoAboutLothar();
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//Ничего личного. Ступай с богом. Ты занятой человек, не буду задерживать тебя.
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//С тех пор, как эти ублюдки прибыли в город, у меня от них одни проблемы.
		AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//Последний раз, когда я шел в верхний квартал, стражники преградили мне дорогу и начали выяснять, что мне там нужно!
		AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//И?
		AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Конечно же, они пропустили меня!
		AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//Да у меня уже была лавка в этом городе, когда эти напыщенные болваны еще пешком под стол ходили!
		AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//А вчера эти ублюдки пришли и конфисковали половину моих товаров!
		Matteo_Confiscated = TRUE;
	};
};


instance DIA_Matteo_Confiscated(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_Confiscated_Condition;
	information = DIA_Matteo_Confiscated_Info;
	permanent = FALSE;
	description = "Паладины забрали твои товары?";
};


func int DIA_Matteo_Confiscated_Condition()
{
	if(Matteo_Confiscated == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Matteo_Confiscated_Info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//Паладины забрали твои товары?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//Все, что у меня хранилось на заднем дворе.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//Они просто поставили стражника перед входом во двор.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//Мне еще повезло, что они не забрали все. Хотя бы доспехи оставили.
	};
};


instance DIA_Matteo_HelpMeToOV(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeToOV_Condition;
	information = DIA_Matteo_HelpMeToOV_Info;
	permanent = FALSE;
	description = "Ты можешь помочь мне попасть в верхний квартал?";
};


func int DIA_Matteo_HelpMeToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_Paladine) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_HelpMeToOV_Info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//Ты можешь помочь мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(ошеломленно) Что? А что тебе нужно ТАМ?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//У меня важное сообщение...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//Так-так... А ты пытался пойти мимо стражников?
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(горький смех) Ох, забудь об этом!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(смеется) Это так ТИПИЧНО для этих нищих!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//Я не понимаю, зачем мне даже пытаться.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//Возможно, ты прав.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//Я не знаю НАСКОЛЬКО важное у тебя сообщение - это меня не касается.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//Но даже если ты скажешь им, что корабль, набитый орками, пришвартовался в гавани, они не пустят тебя.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Потому что у них есть ПРИКАЗ.
};

func void B_Matteo_Preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//Похоже, это очень важно для тебя.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(лукаво) Вопрос в том: НАСКОЛЬКО это важно для тебя?
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//Я могу помочь тебе - я ведь, все же, один из самых влиятельных людей здесь.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//Но это тебе обойдется в некоторую сумму.
};


instance DIA_Matteo_HelpMeNow(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_HelpMeNow_Condition;
	information = DIA_Matteo_HelpMeNow_Info;
	permanent = FALSE;
	description = "Так ты можешь помочь мне попасть в верхний квартал?";
};


func int DIA_Matteo_HelpMeNow_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeToOV) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_HelpMeNow_Info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//Так ты можешь помочь мне попасть в верхний квартал?
	B_Matteo_Preis();
};


instance DIA_Matteo_LehrlingLater(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_LehrlingLater_Condition;
	information = DIA_Matteo_LehrlingLater_Info;
	permanent = FALSE;
	description = "Помоги мне стать учеником одного из мастеров.";
};


func int DIA_Matteo_LehrlingLater_Condition()
{
	if(Player_IsApprentice == APP_NONE)
	{
		if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_LehrlingLater_Info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//Помоги мне стать учеником одного из мастеров.
	B_Matteo_Preis();
};


instance DIA_Matteo_PriceOfHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_PriceOfHelp_Condition;
	information = DIA_Matteo_PriceOfHelp_Info;
	permanent = FALSE;
	description = "Что ты хочешь за свои услуги?";
};


func int DIA_Matteo_PriceOfHelp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};

func void DIA_Matteo_PriceOfHelp_Info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//Что ты хочешь за свои услуги?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 золотых монет.
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
	Info_AddChoice(DIA_Matteo_PriceOfHelp,"Это все чертовски...",DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice(DIA_Matteo_PriceOfHelp,"Ах ты, шельмец!",DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//Воспринимай это проще! Это не ТВОЕ золото я имею в виду.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//А чье?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//В принципе, это МОЕ золото.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Гритта, племянница плотника, уже давно не отдает мне долг.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//Но эта маленькая вертихвостка постоянно дефилирует в новых платьях - это означает, что деньги у нее есть.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//Я хочу, чтобы ты выбил из нее этот долг. Но мастер Торбен, плотник - тоже очень влиятельный человек.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Принеси мне эти деньги, и я помогу тебе.
	MIS_Matteo_Gold = LOG_Running;
	Log_CreateTopic(TOPIC_Matteo,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Matteo,LOG_Running);
	B_LogEntry(TOPIC_Matteo,"Племянница плотника Торбена Гритта должна Маттео 100 золотых монет. Если я верну их ему, он поможет мне попасть в верхний квартал.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//Ах ты, шельмец!
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//Это все чертовски...
	B_Matteo_RegDichAb();
	Info_ClearChoices(DIA_Matteo_PriceOfHelp);
};


instance DIA_Matteo_WoGritta(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 2;
	condition = DIA_Matteo_WoGritta_Condition;
	information = DIA_Matteo_WoGritta_Info;
	permanent = FALSE;
	description = "Где мне найти эту Гритту?";
};


func int DIA_Matteo_WoGritta_Condition()
{
	if(MIS_Matteo_Gold == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Matteo_WoGritta_Info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Где мне найти эту Гритту?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Как я уже говорил, она племянница плотника. Его дом находится ниже по улице, справа от кузницы.
};


instance DIA_Matteo_GoldRunning(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 500;
	condition = DIA_Matteo_GoldRunning_Condition;
	information = DIA_Matteo_GoldRunning_Info;
	permanent = TRUE;
	description = "Вот твои 100 золотых!";
};


func int DIA_Matteo_GoldRunning_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && (Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta)))
	{
		return TRUE;
	};
};

func void DIA_Matteo_GoldRunning_Info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Вот твои 100 золотых!
	if(Npc_IsDead(Gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//На этом золоте кровь Гритты! Я не говорил, что нужно убивать ее!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//Я не хочу иметь никакого отношения к этому делу. Ты можешь забыть о нашей сделке! Не хочу даже вспоминать об этом!
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
		return;
	};
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(Npc_HasItems(Gritta,ItMi_Gold) < 80)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//И? Были какие-нибудь проблемы?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//Ничего такого, о чем стоило бы говорить.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//Хорошо! Ты выполнил свою часть сделки.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//Ты хочешь заплатить за нее? Хм, я бы предпочел, чтобы ты выколотил эти деньги из нее!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Но все же - 100 золотых есть 100 золотых.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//Ты выполнил свою часть сделки.
		};
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Matteo_Gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//У тебя проблемы со счетом? Я не вижу 100 золотых монет.
	};
};


instance DIA_Matteo_Zustimmung(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_Zustimmung_Condition;
	information = DIA_Matteo_Zustimmung_Info;
	permanent = TRUE;
	description = "Помоги мне стать учеником одного из мастеров!";
};


var int DIA_Matteo_Zustimmung_perm;

func int DIA_Matteo_Zustimmung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && ((MIS_Matteo_Gold == LOG_Running) || (MIS_Matteo_Gold == LOG_SUCCESS)) && (Player_IsApprentice == APP_NONE) && (DIA_Matteo_Zustimmung_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Помоги мне стать учеником одного из мастеров!
	if(MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//Не волнуйся, я выполню свои обещания.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//Другие мастера услышат от меня о тебе только хорошее.
		B_GivePlayerXP(XP_Zustimmung);
		B_LogEntry(TOPIC_Lehrling,"Маттео даст мне свое одобрение, если я захочу стать учеником другого мастера.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//Всему своя очередь. Сначала выполни свою часть сделки и принеси мне золото!
	};
};


instance DIA_Matteo_HowCanYouHelp(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_HowCanYouHelp_Condition;
	information = DIA_Matteo_HowCanYouHelp_Info;
	permanent = FALSE;
	description = "Как ИМЕННО ты собираешься помочь мне?";
};


func int DIA_Matteo_HowCanYouHelp_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_HelpMeNow) || Npc_KnowsInfo(other,DIA_Matteo_LehrlingLater)) && (Player_IsApprentice == APP_NONE) && (MIS_Matteo_Gold != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Matteo_HowCanYouHelp_Info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//Как ИМЕННО ты собираешься помочь мне?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//Это просто. Я использую свое влияние, чтобы убедить других здешних мастеров взять тебя в ученики.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//Став учеником, ты автоматически станешь гражданином города и сможешь попасть в верхний квартал. Помимо этого, ты сможешь что-нибудь заработать.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Маттео может помочь мне стать учеником одного из мастеров.");
};


instance DIA_Matteo_WoAlsLehrling(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 4;
	condition = DIA_Matteo_WoAlsLehrling_Condition;
	information = DIA_Matteo_WoAlsLehrling_Info;
	permanent = FALSE;
	description = "А к кому я могу поступить в ученики?";
};


func int DIA_Matteo_WoAlsLehrling_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WoAlsLehrling_Info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//А к кому я могу поступить в ученики?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//К любому мастеру на этой улице.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//Это может быть кузнец Гарад, мастер-лучник Боспер, плотник Торбен или алхимик Константино.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//Один из них обязательно возьмет тебя.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//Но важно, чтобы с этим были согласны другие мастера. Таков обычай Хориниса.
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Я могу стать учеником мастера-лучника Боспера, кузнеца Гарада, плотника Торбена или алхимика Константино.");
	B_LogEntry(TOPIC_Lehrling,"Прежде чем я стану учеником, я должен получить одобрение других мастеров.");
};


instance DIA_Matteo_WieZustimmung(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 5;
	condition = DIA_Matteo_WieZustimmung_Condition;
	information = DIA_Matteo_WieZustimmung_Info;
	permanent = FALSE;
	description = "Как мне получить одобрение других мастеров?";
};


func int DIA_Matteo_WieZustimmung_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo(other,DIA_Matteo_WarumNichtBeiDir)) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WieZustimmung_Info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//Как мне получить одобрение других мастеров?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//Ты просто должен убедить их. Иди и поговори с ними.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//Но, а если хотя бы двое из них будут против тебя, тебе не поступить в ученики! Так что постарайся понравиться им!
	B_LogEntry(TOPIC_Lehrling,"Я смогу получить одобрение мастеров, только если я проявлю себя с лучшей стороны перед ними.");
};


instance DIA_Matteo_WarumNichtBeiDir(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_WarumNichtBeiDir_Condition;
	information = DIA_Matteo_WarumNichtBeiDir_Info;
	permanent = FALSE;
	description = "А почему ТЫ не возьмешь меня в ученики?";
};


func int DIA_Matteo_WarumNichtBeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_WarumNichtBeiDir_Info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//А почему ТЫ не возьмешь меня в ученики?
	if(MIS_Matteo_Gold != LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//Я бы взял - но другие мастера не согласятся.
		AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//Я только недавно взял еще одного ученика.
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	};
};


instance DIA_Matteo_OtherWay(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 6;
	condition = DIA_Matteo_OtherWay_Condition;
	information = DIA_Matteo_OtherWay_Info;
	permanent = FALSE;
	description = "А есть другой способ попасть в верхний квартал?";
};


func int DIA_Matteo_OtherWay_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Matteo_HowCanYouHelp) || (MIS_Matteo_Gold == LOG_FAILED)) && (Mil_305_schonmalreingelassen == FALSE) && (Player_IsApprentice == APP_NONE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Matteo_OtherWay_Info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//А есть другой способ попасть в верхний квартал?
	if(MIS_Matteo_Gold != LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Возможно... Если я что-нибудь придумаю, я дам тебе знать.
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//Я не хочу иметь никакого отношения к этому делу. Ты можешь забыть о нашей сделке! Не хочу даже вспоминать об этом!
		B_EquipTrader(self);
		AI_StopProcessInfos(self);
	};
};


instance DIA_Matteo_Minenanteil(C_Info)
{
	npc = VLK_416_Matteo;
	nr = 3;
	condition = DIA_Matteo_Minenanteil_Condition;
	information = DIA_Matteo_Minenanteil_Info;
	description = "Я вижу, у тебя среди других товаров есть и акции горнодобывающей компании.";
};


func int DIA_Matteo_Minenanteil_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (MatteoMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Matteo_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//Я вижу, у тебя среди других товаров есть и акции горнодобывающей компании. Кто продал их тебе?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(нервно) Акции? Ох. И откуда они взялись? Понятия не имею, где я взял их. Клянусь, ваша честь.
	B_GivePlayerXP(XP_Ambient);
};

