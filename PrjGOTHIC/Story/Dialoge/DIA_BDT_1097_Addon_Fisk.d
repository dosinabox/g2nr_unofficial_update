
instance DIA_Addon_Fisk_EXIT(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 999;
	condition = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fisk_PICKPOCKET(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 900;
	condition = DIA_Addon_Fisk_PICKPOCKET_Condition;
	information = DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	return C_Beklauen(118,300);
};

func void DIA_Addon_Fisk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,Dialog_Back,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};

func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};


instance DIA_Addon_Fisk_Hi(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 1;
	condition = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Fisk_Hi_Condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Эй, если тебе нужен торговец, то ты его нашел.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//Моя лавка находится за домом Эстебана. Если тебе что-нибудь понадобится, заходи.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Фиск продает самые разные товары.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Fisk_Trade(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 888;
	condition = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Fisk_Trade_Condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Trade_Info()
{
	B_Say(other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	if(Npc_HasItems(self,ItRw_Bolt) < 50)
	{
		CreateInvItems(self,ItRw_Bolt,50 - Npc_HasItems(self,ItRw_Bolt));
	};
	if(Npc_HasItems(self,ItRw_Arrow) < 50)
	{
		CreateInvItems(self,ItRw_Arrow,50 - Npc_HasItems(self,ItRw_Arrow));
	};
};


instance DIA_Addon_Fisk_Attentat(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fisk_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//Слушай, я не имею к этому делу никакого отношения, понятно?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//У меня свои заботы. К тому же, я сам стал жертвой злодеяния.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//Каким образом?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//За последнюю партию товара я заплатил солидную сумму золотом.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//Но товар я так и не получил! Один подонок украл его у меня.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//Меня обокрали, и это сделал кое-кто из моих же людей!
};


instance DIA_Addon_Fisk_Lieferung(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 3;
	condition = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent = FALSE;
	description = "Что за товар ты должен был получить?";
};


func int DIA_Addon_Fisk_Lieferung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//Что за товар ты должен был получить?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//Пакет с отмычками. Кто-то должен был принести мне его от пиратов.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//Но парень по имени Хуан украл и отмычки, и золото, которое я заплатил!
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//Этот ублюдок прячется где-то на болоте.
	MIS_Lennar_Lockpick = LOG_Running;
	Log_CreateTopic(Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Fisk,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan,"Парень по имени Хуан заключил сделку с бандитами. Он прячется где-то на болоте.");
	B_LogEntry(Topic_Addon_Fisk,"Человек по имени Хуан украл посылку (пакет с отмычками) у Фиска. Он прячется где-то на болоте.");
};

func void B_Addon_Fisk_AboutJuan()
{
	if(Npc_IsDead(Juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//Он мертв.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Хорошо, значит, он больше не сможет доставлять мне неприятности!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//Он все еще жив...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//Ты оставил эту тварь в живых?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//Он был не один...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Ну ладно. Я сам разберусь с этими ворами...
	};
};

func void B_Addon_Fisk_Belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//Думаю, что тебя это заинтересует...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//У меня хорошие отношения с Хуно.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//Я поговорю с ним, и он сделает тебе скидку на доспехи.
	Huno_ArmorCheap = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//Да, и возьми вот этот камень. Я когда-то получил его от Корристо.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//Это единственная вещь, которая сохранилась у меня после путешествия через Барьер. Я думаю, ты найдешь ему применение.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//И еще я дам тебе это оружие.
		if(other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])
		{
			B_GiveInvItems(self,other,ItMw_Streitaxt1,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_Bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//Рука руку моет. Старый принцип, который работает и по сей день.
};


instance DIA_Addon_Fisk_GivePaket(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 4;
	condition = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent = FALSE;
	description = "Я принес тебе твой пакет.";
};


func int DIA_Addon_Fisk_GivePaket_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Lennar_Paket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//Я принес тебе твой пакет.
	B_GiveInvItems(other,self,ItMi_Addon_Lennar_Paket,1);
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_LennarPaket);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//Замечательно! (подозрительно) А что с Хуаном?
	B_Addon_Fisk_AboutJuan();
	B_Addon_Fisk_Belohnung();
};


instance DIA_Addon_Fisk_PaketOpen(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 5;
	condition = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent = FALSE;
	description = "Я открыл твой пакет!";
};


func int DIA_Addon_Fisk_PaketOpen_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (LennarPaket_Open == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//Я открыл твой пакет!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//(смеется) Ну конечно! Тебе не терпелось узнать, что внутри, не так ли?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//Отмычки-то ты хотя бы принес?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//И что еще более важно, что с Хуаном?
	B_Addon_Fisk_AboutJuan();
};


instance DIA_Addon_Fisk_GivePicks(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 6;
	condition = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent = TRUE;
	description = "Вот твоя дюжина отмычек...";
};


func int DIA_Addon_Fisk_GivePicks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_PaketOpen) && (MIS_Lennar_Lockpick == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Вот твоя дюжина отмычек...
	if(B_GiveInvItems(other,self,ItKE_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Очень хорошо! Покупатели их уже заждались.
		B_Addon_Fisk_Belohnung();
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//Здесь нет дюжины отмычек! Ты же не пытаешься меня обмануть, верно?
	};
};


instance DIA_Addon_Fisk_Inspektor(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 7;
	condition = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent = FALSE;
	description = "Хуан работал на Эстебана!";
};


func int DIA_Addon_Fisk_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Lieferung) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Хуан работал на Эстебана!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//Что?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Не играй со мной в свои игры! Ты знал об этом!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//(спокойно) Хорошо. Ты прав. Но я надеюсь, что ты понимаешь, почему я тебе об этом не сказал.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//Каждый в этом лагере знает, что ты тоже работаешь на Эстебана.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//У меня нет никакого желания быть втянутым в эту историю из-за твоего дурацкого энтузиазма.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Собственно, я и не работаю на Эстебана.",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Я не верю тебе!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Понимаю!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//Понимаю!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Хорошо! В таком случае, оставим этот вопрос. Я не хочу, чтобы нас подслушали!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//Я тебе не верю!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//Не верь, дело твое! Но предупреждаю тебя, приятель, проговорись ты хоть словом об этом Эстебану - тебе не жить!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//Собственно, я и не работаю на Эстебана.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//Кого ты хочешь тут обмануть, лопух? Не дорос еще до этого.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//Мой тебе совет: не трать понапрасну время.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//Когда речь заходит об Эстебане, никому не доверяй. Даже мне.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//И хватит об этом. Глядишь, подслушают еще.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};


instance DIA_Addon_Fisk_Meeting(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent = FALSE;
	description = "Значит, ты спланировал нападение!";
};


func int DIA_Addon_Fisk_Meeting_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,ZS_Talk) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//Значит, ты спланировал нападение!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Да. Эстебан стоит на моем пути. И это нехорошо.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//Он не позволяет никому из бандитов работать на меня на руднике. Он хочет,  чтобы все работали только на него.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//Так он хочет получать свою долю с каждой сделки и держать весь лагерь за задницу.
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"Что ты собираешься делать дальше?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"И ты, я полагаю, хочешь сам контролировать лагерь.",DIA_Addon_Fisk_Meeting_You);
	if(!Npc_IsDead(Esteban))
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting,"Знаешь, я ведь могу тебя выдать Эстебану.",DIA_Addon_Fisk_Meeting_sell);
	};
};

func void DIA_Addon_Fisk_Meeting_You()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//И ты, я полагаю, хочешь сам контролировать лагерь.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//Нет. Я ведь простой торговец. Я всего лишь хочу, чтобы моему делу никто не мешал.
};

func void DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//Знаешь, я ведь могу тебя выдать Эстебану.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//И что? Что с того? Думаешь, что он даст все, что тебе нужно? Ха!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Забудь и выслушай меня. У меня есть идея получше?
};

func void DIA_Addon_Fisk_Meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//Что за идея?
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//Мы уберем Эстебана с нашего пути. А это значит, ты его убьешь и займешь его место.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//Пока с ним его охранники, он для меня недосягаем.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//Тогда мы их выманим. Правдой.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Правдой?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//Ты ведь выполнил свою работу. Ты узнал, что за нападением стоял я.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//Скажи так Эстебану, и он отправит своих ребят сюда, чтобы покончить со мной. Тут-то я их и буду ждать.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//Когда они уйдут, ты займешься ублюдком, а я - охранниками.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Эстебан мертв. Наконец-то я смогу вновь заняться своим делом.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Вот, держи, это для тебя.
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	B_LogEntry(Topic_Addon_Esteban,"Нападение на Эстебана заказал Фиск.");
};


instance DIA_Addon_Fisk_Sieg(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent = FALSE;
	description = "С Эстебаном можно больше не считаться. Он мертв.";
};


func int DIA_Addon_Fisk_Sieg_Condition()
{
	if((MIS_Judas == LOG_SUCCESS) && Npc_IsDead(Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//С Эстебаном можно больше не считаться. Он мертв.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//Давненько я этого ждал.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//Я полагаю, у тебя дел невпроворот, да и у меня немало, так что давай расставаться.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//А если вдруг понадобится чего, ты знаешь, где меня искать.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};

