
var int RosiTradeInfo;
var int RosiLocation;
var int RosiToldAboutBarrier;
var int RosiToldAboutMilitia;
var int RosiToldAboutOnar;

func void B_RosiTradeInfo()
{
	if(RosiTradeInfo == FALSE)
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_06");	//Ты хочешь купить какой-нибудь еды или, возможно, что-то для охоты в лесу?
		if(RosiLocation == LOC_CITY)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader,"У Рози можно купить различные товары.");
		}
		else if(RosiLocation == LOC_MONASTERY)
		{
			Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
			B_LogEntry(Topic_KlosterTrader,"У Рози можно купить различные товары.");
		}
		else if(RosiLocation == LOC_FARM)
		{
			Log_CreateTopic(TOPIC_SoldierTrader,LOG_NOTE);
			B_LogEntry(TOPIC_SoldierTrader,"У Рози можно купить различные товары.");
		}
		else
		{
			Log_CreateTopic(TOPIC_OutTrader,LOG_NOTE);
			if(Rosi_FleeFromSekob_Kap5 == FALSE)
			{
				B_LogEntry(TOPIC_OutTrader,"У Рози на ферме Секоба можно купить различные товары.");
			}
			else
			{
				B_LogEntry(TOPIC_OutTrader,"У Рози можно купить различные товары.");
			};
		};
		RosiTradeInfo = TRUE;
	};
};

func void B_RosiAboutSekob()
{
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_02");	//Он задолжал всем в округе. И еще он ворует продукты из запасов Онара и продает их в городе.
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_03");	//Он сколотил целое состояние своими темными делишками.
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_04");	//Он заставил наших работников трудиться до полного изнеможения. За это его за глаза называют душегубом.
	RosiToldAboutSekob = TRUE;
};

instance DIA_Rosi_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_EXIT_Condition;
	information = DIA_Rosi_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rosi_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_HALLO(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 3;
	condition = DIA_Rosi_HALLO_Condition;
	information = DIA_Rosi_HALLO_Info;
	description = "У тебя все в порядке?";
};


func int DIA_Rosi_HALLO_Condition()
{
	if(Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Rosi_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rosi_HALLO_15_00");	//У тебя все в порядке?
	AI_Output(self,other,"DIA_Rosi_HALLO_17_01");	//Ну, более-менее. Моя спина болит от постоянной тяжелой работы. А что ты делаешь здесь? У нас нечасто бывают гости.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_HALLO_17_02");	//Обычно приходят либо головорезы с гор, либо эти ужасные солдаты ополчения из города.
		RosiToldAboutMilitia = TRUE;
		if(other.guild != GIL_NONE)
		{
			AI_Output(self,other,"DIA_Rosi_HALLO_17_03");	//Последнее время они наведываются на нашу ферму очень часто. Но ты не похож ни на одного из них.
		};
	};
};


instance DIA_Rosi_WASMACHSTDU(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 4;
	condition = DIA_Rosi_WASMACHSTDU_Condition;
	information = DIA_Rosi_WASMACHSTDU_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Rosi_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_HALLO) && (Rosi_FleeFromSekob_Kap5 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Rosi_WASMACHSTDU_15_00");	//Что ты делаешь здесь?
	if(!Npc_IsDead(Sekob))
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_01");	//Я задаю себе этот вопрос уже несколько лет. Секоб, мой муж, умудрился перессориться со всеми соседями.
		B_RosiAboutSekob();
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_05");	//Мне не очень приятно называть себя женой Секоба, поверь мне. Иногда мне даже хочется, чтобы Барьер все еще стоял на месте.
		RosiToldAboutBarrier = TRUE;
	};
	B_RosiTradeInfo();
};


instance DIA_Rosi_WAREZ(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 2;
	condition = DIA_Rosi_WAREZ_Condition;
	information = DIA_Rosi_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Что ты можешь предложить мне?";
};


func int DIA_Rosi_WAREZ_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU) || Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB)) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_WAREZ_Info()
{
	AI_Output(other,self,"DIA_Rosi_WAREZ_15_00");	//Что ты можешь предложить мне?
	B_RosiTradeInfo();
	AI_Output(self,other,"DIA_Rosi_WAREZ_17_01");	//Выбирай.
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		RosiMinenAnteil = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Rosi_BARRIERE(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 6;
	condition = DIA_Rosi_BARRIERE_Condition;
	information = DIA_Rosi_BARRIERE_Info;
	description = "Барьер?";
};


func int DIA_Rosi_BARRIERE_Condition()
{
	if((RosiToldAboutBarrier == TRUE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_BARRIERE_Info()
{
	AI_Output(other,self,"DIA_Rosi_BARRIERE_15_00");	//Барьер?
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_01");	//Ну, купол, который закрывал старую Долину Рудников.
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_02");	//Многих фермеров или простых работников, совершивших преступление, тогда просто бросали туда, и они никогда не возвращались назад.
};


instance DIA_Rosi_DuInBarriere(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 10;
	condition = DIA_Rosi_DuInBarriere_Condition;
	information = DIA_Rosi_DuInBarriere_Info;
	description = "Ты когда-нибудь была за Барьером?";
};


func int DIA_Rosi_DuInBarriere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_BARRIERE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_DuInBarriere_Info()
{
	AI_Output(other,self,"DIA_Rosi_DuInBarriere_15_00");	//Ты когда-нибудь была за Барьером?
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_01");	//Нет. Мы только слышали о нем. Бенгар, фермер с высокогорных пастбищ, наверняка сможет рассказать тебе о нем больше.
};


instance DIA_Rosi_BENGAR(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 11;
	condition = DIA_Rosi_BENGAR_Condition;
	information = DIA_Rosi_BENGAR_Info;
	description = "Как мне попасть на ферму Бенгара?";
};


func int DIA_Rosi_BENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_DuInBarriere) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_BENGAR_Info()
{
	DIA_Common_WhereBengarsFarm();
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_02");	//Его ферма находится очень близко от прохода, ведущего в Долину Рудников.
	if((BalthasarMovedToBengar == FALSE) && !Npc_IsDead(Balthasar))
	{
		AI_Output(self,other,"DIA_Rosi_BENGAR_17_01");	//Спроси Бальтазара. Это наш пастух. Иногда он водит своих овец на пастбища Бенгара.
		AI_Output(self,other,"DIA_Rosi_BENGAR_17_02");	//Он расскажет тебе, как добраться туда.
	};
};


instance DIA_Rosi_Miliz(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 7;
	condition = DIA_Rosi_Miliz_Condition;
	information = DIA_Rosi_Miliz_Info;
	description = "А почему ополчение нападает на ваши фермы?";
};


func int DIA_Rosi_Miliz_Condition()
{
	if((RosiToldAboutMilitia == TRUE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_Miliz_Info()
{
	AI_Output(other,self,"DIA_Rosi_Miliz_15_00");	//А почему ополчение нападает на ваши фермы?
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_Miliz_17_01");	//Потому что здесь никого нет, кто не позволит им просто грабить наши фермы, вместо того, чтобы покупать наши продукты.
		AI_Output(self,other,"DIA_Rosi_Miliz_17_02");	//Король далеко, а нам остается только работать на Онара, надеясь, что он пришлет помощь, когда она действительно будет нам необходима.
		RosiToldAboutOnar = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_Miliz_17_02_add");	//Король далеко...
	};
};


instance DIA_Rosi_ONAR(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 8;
	condition = DIA_Rosi_ONAR_Condition;
	information = DIA_Rosi_ONAR_Info;
	description = "А на что похожа помощь Онара?";
};


func int DIA_Rosi_ONAR_Condition()
{
	if((RosiToldAboutOnar == TRUE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_ONAR_Info()
{
	AI_Output(other,self,"DIA_Rosi_ONAR_15_00");	//А на что похожа помощь Онара?
	AI_Output(self,other,"DIA_Rosi_ONAR_17_01");	//Иногда мы заранее узнаем, что ополчение планирует нанести нам визит.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_ONAR_17_02");	//Тогда мы посылаем кого-нибудь к лендлорду с просьбой о помощи.
		AI_Output(self,other,"DIA_Rosi_ONAR_17_03");	//И затем, обычно вскоре, появляются наемники, которым он платит, чтобы те пришли сюда и прогнали ополчение.
	};
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rosi_ONAR_17_04");	//Но, откровенно говоря, наемники не многим лучше ополчения.
	};
};


instance DIA_Rosi_PERMKAP1(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 80;
	condition = DIA_Rosi_PERMKAP1_Condition;
	information = DIA_Rosi_PERMKAP1_Info;
	permanent = TRUE;
	description = "Выше нос.";
};


func int DIA_Rosi_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU) || Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB))
	{
		return TRUE;
	};
};

func void DIA_Rosi_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Rosi_PERMKAP1_15_00");	//Выше нос.
	if(MIS_bringRosiBackToSekob == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_01");	//Проваливай!
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_02");	//Береги себя.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_FLEEFROMSEKOB(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 50;
	condition = DIA_Rosi_FLEEFROMSEKOB_Condition;
	information = DIA_Rosi_FLEEFROMSEKOB_Info;
	description = "Что ты делаешь здесь, в глуши?";
};


func int DIA_Rosi_FLEEFROMSEKOB_Condition()
{
	if(Rosi_FleeFromSekob_Kap5 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rosi_FLEEFROMSEKOB_Info()
{
	AI_Output(other,self,"DIA_Rosi_FLEEFROMSEKOB_15_00");	//Что ты делаешь здесь, в глуши?
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_01");	//Я больше не в силах терпеть все это. Секоб начал закатывать истерики по любому поводу.
	if(RosiToldAboutSekob == FALSE)
	{
		B_RosiAboutSekob();
	};
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_02");	//В конце концов, все перестали с ним разговаривать. Ну и он тоже не говорит ни с кем.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_03");	//Я должна была бежать оттуда, но теперь я не знаю, куда мне идти.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_04");	//Ты не мог бы помочь мне?
	B_GivePlayerXP(XP_AmbientKap5);
	RosiFoundKap5 = TRUE;
};


instance DIA_Rosi_HILFE(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 51;
	condition = DIA_Rosi_HILFE_Condition;
	information = DIA_Rosi_HILFE_Info;
	description = "Я выведу тебя отсюда.";
};


func int DIA_Rosi_HILFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB))
	{
		return TRUE;
	};
};

func void DIA_Rosi_HILFE_Info()
{
	AI_Output(other,self,"DIA_Rosi_HILFE_15_00");	//Я выведу тебя отсюда.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_NONE))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_01");	//Я могу отвести тебя в город.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//Я отведу тебя на ферму лендлорда.
	}
	else if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_03");	//Пойдем в монастырь. Тебя хорошо примут там.
	};
	AI_Output(self,other,"DIA_Rosi_HILFE_17_04");	//Я никогда не забуду, что ты сделал для меня. Я заплачу тебе, конечно же.
	if(Npc_IsDead(Till))
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_05");	//Ты иди вперед. Я пойду за тобой.
	}
	else
	{
		Till.aivar[AIV_PARTYMEMBER] = TRUE;
		AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//Ты иди вперед. Мы пойдем за тобой.
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_NONE))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		B_StartOtherRoutine(Till,"FollowCity");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		B_StartOtherRoutine(Till,"FollowBigfarm");
	}
	else if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		B_StartOtherRoutine(Till,"FollowKloster");
	};
	if(!Npc_KnowsInfo(other,DIA_Babera_Rosi))
	{
		Log_CreateTopic(TOPIC_RosisFlucht,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RosisFlucht,LOG_Running);
		B_LogEntry(TOPIC_RosisFlucht,"Рози больше не могла выносить жизнь на ферме Секоба и сбежала в лес, но заблудилась и теперь не знает, куда идти. Я выведу ее из лесной глуши.");
	};
	MIS_RosisFlucht = LOG_Running;
};


instance DIA_Rosi_ANGEKOMMEN(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 55;
	condition = DIA_Rosi_ANGEKOMMEN_Condition;
	information = DIA_Rosi_ANGEKOMMEN_Info;
	important = TRUE;
};


func int DIA_Rosi_ANGEKOMMEN_Condition()
{
	if((MIS_bringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE))
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_NONE))
		{
			if((Npc_GetDistToWP(self,"CITY1") < 6000) || (Npc_GetDistToWP(self,"CITY2") < 6000))
			{
				return TRUE;
			};
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000)
			{
				return TRUE;
			};
		}
		else if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
		{
			if(Npc_GetDistToWP(self,"KLOSTER") < 6000)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Rosi_ANGEKOMMEN_Info()
{
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_00");	//Дальше я сама найду дорогу.
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_01");	//Спасибо. Я даже не знаю, что бы я делала без тебя.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
//	MIS_bringRosiBackToSekob = LOG_OBSOLETE;
	MIS_RosisFlucht = LOG_SUCCESS;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_02");	//Пожалуйста, прими этот скромный дар. Ты заслужил его.
	AI_WaitTillEnd(other,self);
	CreateInvItems(self,ItMi_Gold,650);
	B_GiveInvItems(self,other,ItMi_Gold,650);
	if(Npc_IsDead(Till))
	{
		B_GivePlayerXP(XP_SavedRosi);
	}
	else
	{
		Till.aivar[AIV_PARTYMEMBER] = FALSE;
		B_GivePlayerXP(XP_SavedRosi + XP_AmbientKap5);
	};
	AI_StopProcessInfos(self);
	if((Npc_GetDistToWP(self,"CITY1") < 8000) || (Npc_GetDistToWP(self,"CITY2") < 8000))
	{
		Npc_ExchangeRoutine(self,"CITY");
		B_StartOtherRoutine(Till,"CITY");
		RosiLocation = LOC_CITY;
	}
	else if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 8000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		B_StartOtherRoutine(Till,"BIGFARM");
		RosiLocation = LOC_FARM;
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		B_StartOtherRoutine(Till,"KLOSTER");
		RosiLocation = LOC_MONASTERY;
	};
};


instance DIA_Rosi_TRAIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 55;
	condition = DIA_Rosi_TRAIT_Condition;
	information = DIA_Rosi_TRAIT_Info;
	description = "Видишь, теперь ты опять дома.";
};


func int DIA_Rosi_TRAIT_Condition()
{
	if(MIS_bringRosiBackToSekob == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Rosi_TRAIT_Info()
{
	AI_Output(other,self,"DIA_Rosi_TRAIT_15_00");	//Видишь, теперь ты опять дома.
	AI_Output(self,other,"DIA_Rosi_TRAIT_17_01");	//Ты худший кусок дерьма, что я встречала в своей жизни! Ты грязная свинья!
	AI_StopProcessInfos(self);
	MIS_RosisFlucht = LOG_FAILED;
	B_GivePlayerXP(XP_AmbientKap5);
};


instance DIA_Rosi_MinenAnteil(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 3;
	condition = DIA_Rosi_MinenAnteil_Condition;
	information = DIA_Rosi_MinenAnteil_Info;
	description = "А тебе не стыдно продавать поддельные акции?";
};


func int DIA_Rosi_MinenAnteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (RosiMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_MinenAnteil_Info()
{
	AI_Output(other,self,"DIA_Rosi_Minenanteil_15_00");	//А тебе не стыдно продавать поддельные акции?
	if(MIS_bringRosiBackToSekob != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_Minenanteil_17_01");	//Нет. Мне нужно на что-то жить, и, к тому же, я сама их у кого-то купила.
	}
	else
	{
		B_Say(self,other,"$GETOUTOFHERE");
		AI_StopProcessInfos(self);
	};
	B_GivePlayerXP(XP_Ambient);
};

