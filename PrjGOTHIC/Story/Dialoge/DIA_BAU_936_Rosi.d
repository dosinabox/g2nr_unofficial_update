
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
	if(Kapitel < 3)
	{
		return TRUE;
	};
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
	return TRUE;
};

func void DIA_Rosi_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rosi_HALLO_15_00");	//У тебя все в порядке?
	AI_Output(self,other,"DIA_Rosi_HALLO_17_01");	//Ну, более-менее. Моя спина болит от постоянной тяжелой работы. А что ты делаешь здесь? У нас нечасто бывают гости.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_HALLO_17_02");	//Обычно приходят либо головорезы с гор, либо эти ужасные солдаты ополчения из города.
		AI_Output(self,other,"DIA_Rosi_HALLO_17_03");	//Последнее время они наведываются на нашу ферму очень часто. Но ты не похож ни на одного из них.
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
	if(Npc_KnowsInfo(other,DIA_Rosi_HALLO) && (Kapitel < 5))
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
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_02");	//Он задолжал всем в округе. И еще он ворует продукты из запасов Онара и продает их в городе.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_03");	//Он сколотил целое состояние своими темными делишками.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_04");	//Он заставил наших работников трудиться до полного изнеможения. За это его за глаза называют душегубом.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_05");	//Мне не очень приятно называть себя женой Секоба, поверь мне. Иногда мне даже хочется, чтобы Барьер все еще стоял на месте.
	};
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_06");	//Ты хочешь купить какой-нибудь еды или, возможно, что-то для охоты в лесу?
	Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
	B_LogEntry(Topic_OutTrader,"У Рози на ферме Секоба можно купить различные товары.");
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
	if((Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU) || ((Kapitel >= 5) && Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB)) || Npc_IsDead(Sekob)) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_WAREZ_Info()
{
	AI_Output(other,self,"DIA_Rosi_WAREZ_15_00");	//Что ты можешь предложить мне?
	B_GiveTradeInv(self);
	AI_Output(self,other,"DIA_Rosi_WAREZ_17_01");	//Выбирай.
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		RosiMinenAnteil = TRUE;
	};
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
	if(Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU))
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
	if(Npc_KnowsInfo(other,DIA_Rosi_BARRIERE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_DuInBarriere_Info()
{
	AI_Output(other,self,"DIA_Rosi_DuInBarriere_15_00");	//Ты когда-нибудь была за Барьером?
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_01");	//Нет. Мы только слышали о нем. Бенгар, фермер с высокогорных пастбищ, наверняка сможет рассказать тебе о нем больше.
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_02");	//Его ферма находится очень близко от прохода, ведущего в Долину Рудников.
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
	if(Npc_KnowsInfo(other,DIA_Rosi_DuInBarriere) && !Npc_IsDead(Balthasar))
	{
		return TRUE;
	};
};

func void DIA_Rosi_BENGAR_Info()
{
	AI_Output(other,self,"DIA_Rosi_BENGAR_15_00");	//Как мне попасть на ферму Бенгара?
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_01");	//Спроси Бальтазара. Это наш пастух. Иногда он водит своих овец на пастбища Бенгара.
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_02");	//Он расскажет тебе, как добраться туда.
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
	if(Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU) && (hero.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Rosi_Miliz_Info()
{
	AI_Output(other,self,"DIA_Rosi_Miliz_15_00");	//А почему ополчение нападает на ваши фермы?
	AI_Output(self,other,"DIA_Rosi_Miliz_17_01");	//Потому что здесь никого нет, кто не позволит им просто грабить наши фермы, вместо того, чтобы покупать наши продукты.
	AI_Output(self,other,"DIA_Rosi_Miliz_17_02");	//Король далеко, а нам остается только работать на Онара, надеясь, что он пришлет помощь, когда она действительно будет нам необходима.
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
	if(Npc_KnowsInfo(other,DIA_Rosi_Miliz))
	{
		return TRUE;
	};
};

func void DIA_Rosi_ONAR_Info()
{
	AI_Output(other,self,"DIA_Rosi_ONAR_15_00");	//А на что похожа помощь Онара?
	AI_Output(self,other,"DIA_Rosi_ONAR_17_01");	//Иногда мы заранее узнаем, что ополчение планирует нанести нам визит.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_02");	//Тогда мы посылаем кого-нибудь к лендлорду с просьбой о помощи.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_03");	//И затем, обычно вскоре, появляются наемники, которым он платит, чтобы те пришли сюда и прогнали ополчение.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_04");	//Но, откровенно говоря, наемники не многим лучше ополчения.
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
	if(Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU) || ((Kapitel >= 5) && Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB)))
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


instance DIA_Rosi_KAP3_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_KAP3_EXIT_Condition;
	information = DIA_Rosi_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP3_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_KAP4_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_KAP4_EXIT_Condition;
	information = DIA_Rosi_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP4_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_KAP5_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_KAP5_EXIT_Condition;
	information = DIA_Rosi_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP5_EXIT_Info()
{
	B_EquipTrader(self);
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
	if((Kapitel == 5) && (Rosi_FleeFromSekob_Kap5 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_FLEEFROMSEKOB_Info()
{
	AI_Output(other,self,"DIA_Rosi_FLEEFROMSEKOB_15_00");	//Что ты делаешь здесь, в глуши?
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_01");	//Я больше не в силах терпеть все это. Секоб начал закатывать истерики по любому поводу.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_02");	//В конце концов, все перестали с ним разговаривать. Ну и он тоже не говорит ни с кем.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_03");	//Я должна была бежать оттуда, но теперь я не знаю, куда мне идти.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_04");	//Ты не мог бы помочь мне?
	B_GivePlayerXP(XP_Ambient);
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
	if(Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB) && (Rosi_FleeFromSekob_Kap5 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_HILFE_Info()
{
	AI_Output(other,self,"DIA_Rosi_HILFE_15_00");	//Я выведу тебя отсюда.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Till.aivar[AIV_PARTYMEMBER] = TRUE;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_01");	//Я могу отвести тебя в город.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//Я отведу тебя на ферму лендлорда.
	};
	if(hero.guild == GIL_KDF)
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
		AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//Ты иди вперед. Мы пойдем за тобой.
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		B_StartOtherRoutine(Till,"FollowCity");
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		B_StartOtherRoutine(Till,"FollowBigfarm");
	};
	if(hero.guild == GIL_KDF)
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		B_StartOtherRoutine(Till,"FollowKloster");
	};
	if(!Npc_KnowsInfo(other,DIA_Babera_Rosi))
	{
		Log_CreateTopic(TOPIC_RosisFlucht,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RosisFlucht,LOG_Running);
		B_LogEntry(TOPIC_RosisFlucht,"Рози больше не могла выносить жизнь на ферме Секоба, и сбежала в лес, но заблудилась и теперь не знает, куда идти. Я выведу ее из лесной глуши.");
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
	if((Kapitel == 5) && (MIS_bringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE) && (((Npc_GetDistToWP(self,"CITY2") < 6000) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))) || ((Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))) || ((Npc_GetDistToWP(self,"KLOSTER") < 6000) && (hero.guild == GIL_KDF))))
	{
		return TRUE;
	};
};

func void DIA_Rosi_ANGEKOMMEN_Info()
{
	var int XPForBoth;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_00");	//Дальше я сама найду дорогу.
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_01");	//Спасибо. Я даже не знаю, что бы я делала без тебя.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_bringRosiBackToSekob = LOG_OBSOLETE;
	MIS_RosisFlucht = LOG_SUCCESS;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_02");	//Пожалуйста, прими этот скромный дар. Ты заслужил его.
	CreateInvItems(Rosi,ItMi_Gold,650);
	B_GiveInvItems(self,other,ItMi_Gold,650);
	if(Npc_IsDead(Till))
	{
		B_GivePlayerXP(XP_SavedRosi);
	}
	else
	{
		XPForBoth = XP_SavedRosi + XP_Ambient;
		B_GivePlayerXP(XPForBoth);
	};
	AI_StopProcessInfos(self);
	if(Npc_GetDistToWP(self,"CITY2") < 8000)
	{
		Npc_ExchangeRoutine(self,"CITY");
		B_StartOtherRoutine(Till,"CITY");
	}
	else if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 8000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		B_StartOtherRoutine(Till,"BIGFARM");
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		B_StartOtherRoutine(Till,"KLOSTER");
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
	if((MIS_bringRosiBackToSekob == LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_TRAIT_Info()
{
	AI_Output(other,self,"DIA_Rosi_TRAIT_15_00");	//Видишь, теперь ты опять дома.
	AI_Output(self,other,"DIA_Rosi_TRAIT_17_01");	//Ты худший кусок дерьма, что я встречала в своей жизни! Ты грязная свинья!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_RosisFlucht = LOG_FAILED;
	B_GivePlayerXP(XP_Ambient);
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
	//if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU))
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (RosiMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_MinenAnteil_Info()
{
	AI_Output(other,self,"DIA_Rosi_Minenanteil_15_00");	//А тебе не стыдно продавать поддельные акции?
	AI_Output(self,other,"DIA_Rosi_Minenanteil_17_01");	//Нет. Мне нужно на что-то жить, и, к тому же, я сама их у кого-то купила.
	B_GivePlayerXP(XP_Ambient);
};

/*
instance DIA_Rosi_KAP6_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_KAP6_EXIT_Condition;
	information = DIA_Rosi_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
*/

instance DIA_Rosi_PICKPOCKET(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 900;
	condition = DIA_Rosi_PICKPOCKET_Condition;
	information = DIA_Rosi_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Female;
};


func int DIA_Rosi_PICKPOCKET_Condition()
{
	return C_Beklauen(30,75);
};

func void DIA_Rosi_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
	Info_AddChoice(DIA_Rosi_PICKPOCKET,Dialog_Back,DIA_Rosi_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rosi_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rosi_PICKPOCKET_DoIt);
};

func void DIA_Rosi_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
};

func void DIA_Rosi_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
};

