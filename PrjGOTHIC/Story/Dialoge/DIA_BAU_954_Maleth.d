
func void B_InsertMalethWolf()
{
	if(Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc(YWolf,"NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};

instance DIA_Maleth_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v2;
};


func int DIA_Maleth_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_EXIT_Info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//Мне нужно идти.
	AI_WaitTillEnd(self,other);
	AI_StopProcessInfos(self);
	B_InsertMalethWolf();
};


instance DIA_Maleth_Hallo(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_Hallo_Condition;
	information = DIA_Maleth_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Maleth_Hallo_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Hallo_Info()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//Привет, чужеземец!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//Я видел, как ты спустился с гор.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//Тебе повезло, что ты не пришел три недели назад.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//Мы бы приняли тебя за беглого каторжника. А с ними у нас разговор короткий!
	};
	if(!Npc_HasEquippedArmor(other))
	{
		AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//Ты выглядишь абсолютно измотанным.
		PlayerVisitedLobartFarmArmorless = TRUE;
	}
	else if(PlayerVisitedLobartFarmArmorless == TRUE)
	{
		AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//Ты выглядел абсолютно измотанным, когда первый раз появился здесь.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Ну а теперь ты похож на человека!
		MalethArmorComment = TRUE;
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//(недоверчиво) Что тебе нужно здесь?
};


instance DIA_Maleth_BANDITS(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BANDITS_Condition;
	information = DIA_Maleth_BANDITS_Info;
	permanent = FALSE;
	description = "На меня напали бандиты в горах.";
};


func int DIA_Maleth_BANDITS_Condition()
{
	if((Kapitel < 3) && (Npc_KnowsInfo(other,DIA_BDT_1013_BANDIT_WHERE) || Npc_KnowsInfo(other,DIA_BDT_1014_BANDIT_KILLER) || Npc_KnowsInfo(other,DIA_1015_BANDIT_AMBUSH) || Npc_IsDead(Ambusher_1013) || Npc_IsDead(Ambusher_1014) || Npc_IsDead(Ambusher_1015) || Npc_KnowsInfo(other,DIA_Addon_Cavalorn_LETSKILLBANDITS) || (BragoBanditsAttacked == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//На меня напали бандиты в горах.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//Вот мерзкое отродье! Это, вероятно, те же ублюдки, что увели у нас овцу прошлой ночью!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//Тебе еще очень повезло. Редко кому удается уйти от них живым.
};


instance DIA_Maleth_BanditsDEAD(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BanditsDEAD_Condition;
	information = DIA_Maleth_BanditsDEAD_Info;
	permanent = FALSE;
	description = "Эти бандиты больше не будут беспокоить вас...";
};


func int DIA_Maleth_BanditsDEAD_Condition()
{
	if((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE)) && Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015) && Npc_KnowsInfo(other,DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//Эти бандиты больше не будут беспокоить вас...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//Почему? Они мертвы?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//Они не на того напали...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//Слава Инносу! Вот - здесь немного, но я хочу, чтобы ты принял это!
	B_GiveInvItems(self,other,ItFo_Wine,3);
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_MalethKillBandits);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//Я расскажу остальным об этом!
};


instance DIA_Maleth_BanditsALIVE(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BanditsALIVE_Condition;
	information = DIA_Maleth_BanditsALIVE_Info;
	permanent = FALSE;
	description = "Я знаю, где прячутся эти бандиты...";
};


func int DIA_Maleth_BanditsALIVE_Condition()
{
	if((!Npc_IsDead(Ambusher_1013) || !Npc_IsDead(Ambusher_1014) || !Npc_IsDead(Ambusher_1015)) && Npc_KnowsInfo(other,DIA_Maleth_BANDITS) && (MIS_Maleth_Bandits != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//Я знаю, где прячутся эти бандиты...
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//Ты хочешь напасть на них? Я в такие игры не играю! Это слишком опасно!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//Кроме того, мне нужно присматривать за овцами!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//Но если ты думаешь, что можешь избавить нас от этих подонков, все на этой ферме будут очень благодарны тебе.
	MIS_Maleth_Bandits = LOG_Running;
	Log_CreateTopic(TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Maleth,LOG_Running);
	B_LogEntry(TOPIC_Maleth,"Если я уничтожу бандитов, поселившихся на полпути от башни Ксардаса к ферме Лобарта, все обитатели фермы будут очень благодарны мне.");
};


instance DIA_Maleth_ToTheCity(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 2;
	condition = DIA_Maleth_ToTheCity_Condition;
	information = DIA_Maleth_ToTheCity_Info;
	permanent = FALSE;
	description = "Я иду в город.";
};


func int DIA_Maleth_ToTheCity_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Hallo) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info()
{
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//Я иду в город.
	if(!Npc_HasEquippedArmor(other))
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//Учитывая то, как ты выглядишь, тебе придется подкупить стражу, чтобы попасть в город.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//И ты должен знать, что они хотят услышать.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//Они могут впустить тебя - если ты скажешь им то, что они хотят услышать...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//И что это?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//Ну, например, что ты с фермы Лобарта и идешь к городскому кузнецу.
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (PlayerEnteredCity == FALSE))
	{
		Log_CreateTopic(TOPIC_City,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_City,LOG_Running);
		B_LogEntry(TOPIC_City,"Чтобы попасть в город, я могу сказать стражникам у ворот, что я иду с фермы Лобарта и хочу повидать кузнеца.");
	};
	if(!C_BAUCheck(other))
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//Но это тебе не поможет. Ты не похож на фермера.
		Log_AddEntry(TOPIC_City,"Конечно, я должен быть похож на фермера.");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//Понятно.
};


instance DIA_Maleth_Equipment(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_Equipment_Condition;
	information = DIA_Maleth_Equipment_Info;
	permanent = FALSE;
	description = "Мне нужно снаряжение!";
};


func int DIA_Maleth_Equipment_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Hallo) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//Мне нужно снаряжение!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//Могу представить. Но я честно скажу тебе: у нас нет ничего, чем мы могли бы поделиться!
	if(!Npc_IsDead(Lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//Хотя, если ты можешь заплатить, Лобарт продаст тебе кое-что.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//Ну, или ты можешь пойти к нему и спросить, нет ли у него какой-нибудь работы.
	};
};


instance DIA_Maleth_LOBART(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_LOBART_Condition;
	information = DIA_Maleth_LOBART_Info;
	permanent = FALSE;
	description = "Где мне найти Лобарта?";
};


func int DIA_Maleth_LOBART_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Equipment) && !Npc_IsDead(Lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//Где мне найти Лобарта?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//На ферме, конечно же! Это ведь его ферма!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//И не пытайся надуть его! Он избил и вышвырнул с фермы уже много бездельников.
};


instance DIA_Maleth_KAP3_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP3_EXIT_Condition;
	information = DIA_Maleth_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP3_EXIT_Info()
{
	if((PlayerVisitedLobartFarmArmorless == TRUE) && (MalethArmorComment == FALSE))
	{
		AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//Ты выглядел абсолютно измотанным, когда первый раз появился здесь.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Ну а теперь ты похож на человека!
		MalethArmorComment = TRUE;
	};
	B_InsertMalethWolf();
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_PROBLEME(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 30;
	condition = DIA_Maleth_PROBLEME_Condition;
	information = DIA_Maleth_PROBLEME_Info;
	description = "Ничего нового в последнее время?";
};


func int DIA_Maleth_PROBLEME_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_PROBLEME_Info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//Ничего нового в последнее время?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//Просто иди по дороге в город.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//Если ты увидишь человека в черной рясе, ты поймешь, что нового.
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME,Dialog_Back,DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME,"Как твои овцы?",DIA_Maleth_PROBLEME_schafe);
	Info_AddChoice(DIA_Maleth_PROBLEME,"Люди в черных рясах к вам еще не наведывались?",DIA_Maleth_PROBLEME_beidir);
};

func void DIA_Maleth_PROBLEME_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//Люди в черных рясах к вам еще не наведывались?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//Да. Они были здесь несколько дней назад. Они выглядят так, как будто восстали из ада.
};

func void DIA_Maleth_PROBLEME_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//Как твои овцы?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//(зло) Как будто это тебя интересует. У тебя свои проблемы.
	Info_AddChoice(DIA_Maleth_PROBLEME,"Мои проблемы? Да что ты знаешь об этом?",DIA_Maleth_PROBLEME_schafe_probleme);
};

func void DIA_Maleth_PROBLEME_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//Мои проблемы? Да что ты знаешь об этом?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//(резко) Ты служишь в городской страже или нет? Тогда сделай что-нибудь с этими ублюдками в черных рясах.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//(зло) Вы, грязные наемники, думаете только об одном: как переложить деньги других людей в свои карманы.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//Вы, могущественные маги из монастыря, должны что-нибудь сделать с этими парнями в черных рясах.
	};
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME,Dialog_Back,DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME,"Эй, полегче на поворотах, приятель.",DIA_Maleth_PROBLEME_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Maleth_PROBLEME,"Что у тебя за проблемы?",DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag);
	};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//Что у тебя за проблемы?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//Всему виной это самодельное пойло, что Вино всучил мне несколько недель назад.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//Я ничего не помню. Я знаю только, что мой посох с тех пор пропал.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//И из-за этого ты так шумишь?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//Тебе легко говорить, это же не твой посох пропал.
	Log_CreateTopic(TOPIC_MalethsGehstock,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock,LOG_Running);
	B_LogEntry(TOPIC_MalethsGehstock,"Малет напился в стельку и потерял свой посох. Насколько я знаю его, он никогда не уходил далеко от фермы Лобарта. Возможно, я найду этот посох где-нибудь неподалеку.");
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//Эй, полегче на поворотах, приятель.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//Ты только и можешь, что болтать. Лучше всего тебе уйти.
};

func void DIA_Maleth_PROBLEME_Back()
{
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};


instance DIA_Maleth_GEHSTOCK(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 33;
	condition = DIA_Maleth_GEHSTOCK_Condition;
	information = DIA_Maleth_GEHSTOCK_Info;
	description = "Я думаю, это твой посох.";
};


func int DIA_Maleth_GEHSTOCK_Condition()
{
	if(Npc_HasItems(other,ItMw_MalethsGehstock_MIS) && Npc_KnowsInfo(other,DIA_Maleth_PROBLEME))
	{
		return TRUE;
	};
};

func void DIA_Maleth_GEHSTOCK_Info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//Я думаю, это твой посох.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//Это невероятно! Я...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//Минуточку. Сначала заплати за него.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//Но... у меня почти ничего нет.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//Тогда придумай что-нибудь еще.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//Хорошо. Как насчет этого? Вчера я видел, как мимо пробежали бандиты с несколькими мешками золота.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//Если я скажу тебе, где они прячут свои сокровища, я получу мой посох назад?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP(XP_FoundMalethsGehstock);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	Info_AddChoice(DIA_Maleth_GEHSTOCK,"Извини, мне это не интересно. Я хочу получить золото от тебя.",DIA_Maleth_GEHSTOCK_gold);
	Info_AddChoice(DIA_Maleth_GEHSTOCK,"Хорошо.",DIA_Maleth_GEHSTOCK_ok);
};

func void DIA_Maleth_GEHSTOCK_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//Хорошо.
	B_GiveInvItems(other,self,ItMw_MalethsGehstock_MIS,1);
	AI_EquipBestMeleeWeapon(self);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//Ладно. Просто иди на запад, вон к тому лесу. Там ты увидишь ущелье.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//В пещере внизу ты наверняка найдешь что-нибудь.
	if(!Npc_IsDead(BDT_1024_MalethsBandit))
	{
		B_LogEntry(TOPIC_MalethsGehstock,"Малет рассказал мне, что в пещере к западу от фермы Лобарта находится убежище бандитов.");
		CreateInvItems(BDT_1024_MalethsBandit,ItMi_MalethsBanditGold,1);
	}
	else
	{
		B_LogEntry(TOPIC_MalethsGehstock,"Малет рассказал мне, что в пещере к западу от фермы Лобарта находится убежище бандитов. Нужно внимательно обыскать его.");
		Wld_InsertItem(ItMi_MalethsBanditGold,"FP_ITEM_FARM1_02");
	};
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos(self);
};

func void DIA_Maleth_GEHSTOCK_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//Извини, мне это не интересно. Я хочу получить золото от тебя.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//Вот все, что у меня есть. Этого должно быть достаточно.
	CreateInvItems(self,ItMi_Gold,35);
	B_GiveInvItems(self,other,ItMi_Gold,35);
	B_GiveInvItems(other,self,ItMw_MalethsGehstock_MIS,1);
	AI_EquipBestMeleeWeapon(self);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
};


instance DIA_Maleth_PERM3(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 33;
	condition = DIA_Maleth_PERM3_Condition;
	information = DIA_Maleth_PERM3_Info;
	permanent = TRUE;
	description = "Смотри, не перетрудись.";
};


func int DIA_Maleth_PERM3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_PROBLEME) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Maleth_PERM3_Info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//Смотри, не перетрудись.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//(сердито) Проваливай.
	AI_StopProcessInfos(self);
};

/*
instance DIA_Maleth_KAP4_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP4_EXIT_Condition;
	information = DIA_Maleth_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_KAP5_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP5_EXIT_Condition;
	information = DIA_Maleth_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_KAP6_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP6_EXIT_Condition;
	information = DIA_Maleth_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
*/

instance DIA_Maleth_PICKPOCKET(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 900;
	condition = DIA_Maleth_PICKPOCKET_Condition;
	information = DIA_Maleth_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Maleth_PICKPOCKET_Condition()
{
	return C_Beklauen(10,10);
};

func void DIA_Maleth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
	Info_AddChoice(DIA_Maleth_PICKPOCKET,Dialog_Back,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Maleth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
};

func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
};

