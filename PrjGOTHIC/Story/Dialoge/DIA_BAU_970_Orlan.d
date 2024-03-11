
instance DIA_Orlan_EXIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 999;
	condition = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Orlan_EXIT_Info()
{
	Knows_Taverne = TRUE;
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Orlan_Wein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Wein_Condition;
	information = DIA_Orlan_Wein_Info;
	permanent = FALSE;
	description = "Я принес вино из монастыря.";
};


func int DIA_Orlan_Wein_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) >= 12) && (Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Wein_Info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//Я принес вино из монастыря.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//Превосходно. Это именно то, что мне нужно.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//Я уже договорился о цене с мастером Гораксом. Я дам тебе 100 золотых монет прямо сейчас.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Хорошо, давай мне это золото.",DIA_Orlan_Wein_JA);
	Info_AddChoice(DIA_Orlan_Wein,"Ты пытаешься надуть меня?",DIA_Orlan_Wein_NEIN);
};

func void DIA_Orlan_Wein_JA()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//Хорошо, давай мне это золото.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Держи. С тобой приятно иметь дело.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	B_GiveInvItems(other,self,ItFo_Wine,12);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_NEIN()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//Ты пытаешься надуть меня? Оно стоит 240 монет.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//Так, Горакс предупредил тебя, да? Ну хорошо, может быть, мы сможем договориться. Послушай, давай поступим так - я дам тебе 100 монет за это вино.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//Ты скажешь Гораксу, что я обманул тебя, а я дам тебе в придачу ЧЕТЫРЕ свитка с заклинаниями.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"Эй, давай сюда 240 монет.",DIA_Orlan_Wein_Nie);
	Info_AddChoice(DIA_Orlan_Wein,"Хм, звучит заманчиво. Давай сюда эти свитки.",DIA_Orlan_Wein_Okay);
	Info_AddChoice(DIA_Orlan_Wein,"А что это за свитки?",DIA_Orlan_Wein_Was);
};

func void DIA_Orlan_Wein_Nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Эй, давай сюда 240 монет.
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//(вздыхает) Ну хорошо, хорошо, вот твое золото.
	B_GiveInvItems(self,other,ItMi_Gold,240);
	B_GiveInvItems(other,self,ItFo_Wine,12);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Okay()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//Хм, звучит заманчиво. Давай сюда эти свитки.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Вот твои свитки и золото.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_PrintScreen("4 свитка получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	CreateInvItems(hero,ItSc_Light,2);
	CreateInvItems(hero,ItSc_LightHeal,1);
	CreateInvItems(hero,ItSc_SumGobSkel,1);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//А что это за свитки?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//Понятия не имею - я в этом ничего не понимаю. Они достались мне от гостя, который... э-э... забыл их здесь, да!
};


instance DIA_Orlan_WERBISTDU(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Orlan_WERBISTDU_Condition;
	information = DIA_Orlan_WERBISTDU_Info;
	description = "Ты кто?";
};


func int DIA_Orlan_WERBISTDU_Condition()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Ты кто?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//Я Орлан, хозяин этой скромной таверны.
	if(VisibleGuild(other) == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//Ты что-нибудь ищешь, чужеземец? Может быть, приличный меч или хорошие доспехи?
	};
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//Глоток вина, или, может быть, тебе нужна информация?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//Я могу дать тебе все это и даже больше, если у тебя есть звонкие монеты.
	Log_CreateTopic(TOPIC_OutTrader,LOG_NOTE);
	B_LogEntry(TOPIC_OutTrader,"Орлан - трактирщик в таверне 'Мертвая гарпия'. Я могу купить у него припасы и кое-какое оружие.");
};


instance DIA_Addon_Orlan_Greg(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_Greg_Condition;
	information = DIA_Addon_Orlan_Greg_Info;
	description = "Ты знаешь человека с повязкой на глазу?";
};


func int DIA_Addon_Orlan_Greg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_MeetGregSecondTime) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//Ты знаешь человека с повязкой на глазу?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//Я видел его здесь раньше. Неприятный тип.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//Некоторое время назад он снял у меня верхнюю комнату. При нем был огромный сундук.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//Ему нужно было постоянно напоминать о том, что пора платить за комнату. А он совершенно не обращал на это внимания.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//А в один прекрасный день он просто исчез вместе со своим ящиком. Не люблю таких людей.
};


instance DIA_Addon_Orlan_Ranger(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Ranger_Condition;
	information = DIA_Addon_Orlan_Ranger_Info;
	description = "У меня паранойя, или ты действительно постоянно смотришь на мое кольцо?";
};


func int DIA_Addon_Orlan_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && AnyRangerRingEquipped())
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//У меня паранойя, или ты действительно постоянно смотришь на мое кольцо?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//Я не совсем уверен, как это понимать...
	Orlan_KnowsSCAsRanger = TRUE;
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"Я стал членом Кольца Воды!",DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"Это аквамарин. Видел когда-нибудь такой?",DIA_Addon_Orlan_Ranger_Aqua);
};

func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//Это аквамарин. Видел когда-нибудь такой?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//Видел. Добро пожаловать в штаб-квартиру, брат по Кольцу.
	if(Npc_KnowsInfo(other,DIA_Addon_Orlan_NoMeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//Хотя, конечно, выглядишь ты не особенно одаренным...
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//Что я могу для тебя сделать?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Orlan_Ranger_Idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//Я стал членом Кольца Воды!
	if(Npc_KnowsInfo(other,DIA_Addon_Orlan_NoMeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//Действительно? Не могу поверить, что такого болвана приняли в общество.
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//Итак, что тебе нужно?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
};


instance DIA_Addon_Orlan_Teleportstein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Teleportstein_Condition;
	information = DIA_Addon_Orlan_Teleportstein_Info;
	description = "Ты когда-нибудь использовал телепорты?";
};


func int DIA_Addon_Orlan_Teleportstein_Condition()
{
	if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		if(SCUsed_TELEPORTER == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Orlan_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//Ты когда-нибудь использовал телепорты?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//Ты рехнулся? Пока маги Воды не убедят меня, что это безопасно, я и близко подходить к ним не буду.
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//Меня попросили спрятать один из телепортов. Больше я не хочу иметь с этими штуками ничего общего.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"А я могу посмотреть на этот телепорт?",DIA_Addon_Orlan_Teleportstein_sehen);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"Где находится телепорт?",DIA_Addon_Orlan_Teleportstein_wo);
};

func void DIA_Addon_Orlan_Teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//А я могу посмотреть на этот телепорт?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//Смотри, если хочешь. Вот ключ - я запер вход.
	CreateInvItems(self,ItKe_Orlan_TeleportStation,1);
	B_GiveInvItems(self,other,ItKe_Orlan_TeleportStation,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"Орлан запер телепорт в пещере к юго-западу от своей таверны.");
};

func void DIA_Addon_Orlan_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//Где находится телепорт?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//Недалеко от моей таверны, на юге, есть пещера. В ней маги Воды его и обнаружили.
};


instance DIA_Addon_Orlan_NoMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_NoMeeting_Condition;
	information = DIA_Addon_Orlan_NoMeeting_Info;
	description = "Я хочу присоединиться к Кольцу Воды!";
};


func int DIA_Addon_Orlan_NoMeeting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && !Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger) && !AnyRangerRingEquipped() && (MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_NoMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_NoMeeting_15_00");	//Я хочу присоединиться к Кольцу Воды!
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//Здесь нет никаких колец. Налить тебе выпить?
};


instance DIA_Addon_Orlan_WhenRangerMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information = DIA_Addon_Orlan_WhenRangerMeeting_Info;
	description = "Мне сказали, что в твоей таверне будет встреча членов этого общества.";
};


func int DIA_Addon_Orlan_WhenRangerMeeting_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//Мне сказали, что в твоей таверне будет встреча членов этого общества.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//Верно. Она вот-вот должна начаться.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//Остальные почему-то задерживаются.
	B_GivePlayerXP(XP_Ambient);
	B_Addon_Orlan_RangersReadyForComing();
	self.flags = 0;
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"Остальные должны вот-вот появиться.",DIA_Addon_Orlan_WhenRangerMeeting_theyCome);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"Встреча будет сегодня?",DIA_Addon_Orlan_WhenRangerMeeting_Today);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Today()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//Встреча будет сегодня?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//Да, насколько я помню.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//Надеюсь, мы начнем не слишком поздно.
	B_MakeRangerReadyForMeetingALL();
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,Dialog_Ende,DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//Остальные должны вот-вот появиться.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//Посмотрим...
	B_MakeRangerReadyForMeetingALL();
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,Dialog_Ende,DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Los()
{
	Knows_Taverne = TRUE;
	AI_StopProcessInfos(self);
	B_Addon_Orlan_ComingRanger();
};


instance DIA_Orlan_RUESTUNG(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Orlan_RUESTUNG_Condition;
	information = DIA_Orlan_RUESTUNG_Info;
	permanent = TRUE;
	description = "Что за доспехи ты можешь предложить?";
};


var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (DIA_Orlan_RUESTUNG_noPerm == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Orlan_RUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//Что за доспехи ты можешь предложить?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//У меня есть очень хороший экземпляр, я уверен, это заинтересует тебя.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
	Info_AddChoice(DIA_Orlan_RUESTUNG,Dialog_Back,DIA_Orlan_RUESTUNG_BACK);
	Info_AddChoice(DIA_Orlan_RUESTUNG,B_BuildPriceString("Купить кожаные доспехи. Защита: 25/20/5/0.",VALUE_ITAR_Leather_L),DIA_Orlan_RUESTUNG_Buy);
};

func void DIA_Orlan_RUESTUNG_Buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//Я бы хотел купить кожаные доспехи.
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_Leather_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//Мудрый выбор.
		B_GiveArmor(ITAR_Leather_L);
		DIA_Orlan_RUESTUNG_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Извини. Заходи, когда у тебя появятся деньги.
	};
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//Как хочешь. Только не думай слишком долго.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};


instance DIA_Orlan_TRADE(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 70;
	condition = DIA_Orlan_TRADE_Condition;
	information = DIA_Orlan_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Orlan_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_TRADE_Info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Покажи мне свои товары.
	if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//Конечно, брат по Кольцу.
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Конечно. Для меня большая честь услужить такому важному гостю.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Конечно, сэр.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//Если ты сможешь заплатить.
	};
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		OrlanMinenAnteil = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Orlan_HotelZimmer(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 6;
	condition = DIA_Orlan_HotelZimmer_Condition;
	information = DIA_Orlan_HotelZimmer_Info;
	permanent = TRUE;
	description = "Сколько ты берешь за комнату?";
};


var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;

func int DIA_Orlan_HotelZimmer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (Orlan_SCGotHotelZimmer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_HotelZimmer_Info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//Сколько ты берешь за комнату?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//Братья по Кольцу живут у меня бесплатно.
			Orlan_RangerHelpZimmer = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//Для рыцаря короля у меня всегда найдется свободная комната. Совершенно бесплатно, естественно.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//Я бы никогда не посмел взять деньги за свои услуги с представителя Инноса на земле.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Вот ключ от верхних комнат. Выбирай, которая больше понравится.
		CreateInvItems(self,ItKe_Orlan_HotelZimmer,1);
		B_GiveInvItems(self,other,ItKe_Orlan_HotelZimmer,1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Ты платишь 50 золотых монет в неделю - и комната твоя.
		Info_ClearChoices(DIA_Orlan_HotelZimmer);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"Черт побери, как дорого-то!",DIA_Orlan_HotelZimmer_nein);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"Хорошо. Вот золото.",DIA_Orlan_HotelZimmer_ja);
	};
};

func void DIA_Orlan_HotelZimmer_ja()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//Хорошо. Вот золото.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//А вот ключ. Комнаты находятся вверх по лестнице. Но не загадь ее и не забывай платить ренту вовремя, понятно?
		CreateInvItems(self,ItKe_Orlan_HotelZimmer,1);
		B_GiveInvItems(self,other,ItKe_Orlan_HotelZimmer,1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//У тебя нет пятидесяти. Сначала деньги, потом удовольствие.
	};
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Черт побери, как дорого-то!
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//Тогда попробуй поискать ночлег в другом месте, дружок.
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};


var int Orlan_AngriffWegenMiete;

instance DIA_Orlan_MieteFaellig(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 10;
	condition = DIA_Orlan_MieteFaellig_Condition;
	information = DIA_Orlan_MieteFaellig_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Orlan_MieteFaellig_NoMore;

func int DIA_Orlan_MieteFaellig_Condition()
{
	if((SC_IsRanger == TRUE) || (Orlan_RangerHelpZimmer == TRUE) || (Orlan_KnowsSCAsRanger == TRUE) || AnyRangerRingEquipped())
	{
		return FALSE;
	};
	if((Orlan_AngriffWegenMiete == TRUE) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	if((Orlan_SCGotHotelZimmer == TRUE) && (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay() - 7)) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_MieteFaellig_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(неискренне) Я очень рад визиту такого гостя. Оставайся здесь, сколько пожелаешь. Это честь для меня.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//Когда я, наконец, получу мою ренту?
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Забудь об этом. Я больше не буду платить тебе.",DIA_Orlan_MieteFaellig_nein);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"Вот твои 50 монет.",DIA_Orlan_MieteFaellig_ja);
	};
};


var int DIA_Orlan_MieteFaellig_OneTime;

func void DIA_Orlan_MieteFaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Вот твои 50 монет.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Как раз вовремя.
		if(DIA_Orlan_MieteFaellig_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Где ты шлялся весь день?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//Тебе лучше не знать.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Мммм. Ну, да. Это, в общем-то, не мое дело.
			DIA_Orlan_MieteFaellig_OneTime = TRUE;
		};
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//Ты что, пытаешься надуть меня? У тебя даже нет денег, чтобы заплатить за еду. Я проучу тебя, ах ты...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Orlan_MieteFaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Забудь об этом. Я больше не буду платить тебе.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Тогда мне придется проучить тебя. Презренный жулик!
	Orlan_AngriffWegenMiete = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Orlan_WETTKAMPFLAEUFT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 7;
	condition = DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information = DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important = TRUE;
};


func int DIA_Orlan_WETTKAMPFLAEUFT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && ((MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay() - 2)) || (Kapitel >= 4)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//Вот ты где, наконец. Я ждал тебя.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//Что случилось?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//Состязание 'кто кого перепьет' наконец-то закончилось.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Кто победил?
	if(!Mob_HasItems("CHEST_RUKHAR",ItFo_Booze) && Mob_HasItems("CHEST_RUKHAR",ItFo_Water) && (Rukhar_Won_Wettkampf == FALSE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//На этот раз Рэндольф. Рухару нынче не повезло.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Как всегда Рухар напоил Рэндольфа в стельку. Этого следовало ожидать.
		Rukhar_Won_Wettkampf = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//Я надеюсь, это было в последний раз. Я не хочу, чтобы подобное повторялось в моем доме. Заруби это у себя на носу.
	}
	else if((Rukhar_Won_Wettkampf == FALSE) && !Npc_KnowsInfo(other,DIA_Orlan_EINGEBROCKT))
	{
		AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Да уж, доставил ты мне проблем. Теперь мне нужно быть поосторожнее с Рухаром.
	};
	AI_StopProcessInfos(self);
	if(RangerMeetingRunning != LOG_Running)
	{
		Npc_ExchangeRoutine(self,"START");
	};
	if(Hlp_IsValidNpc(Randolph))
	{
		if((Kapitel < 4) || ((Kapitel >= 4) && (other.guild != GIL_KDF)))
		{
			if(Rukhar_Won_Wettkampf == TRUE)
			{
				B_StartOtherRoutine(Randolph,"WETTKAMPFRANDOLPHLOST");
			}
			else
			{
				B_StartOtherRoutine(Randolph,"START");
			};
		};
	};
	if(Hlp_IsValidNpc(Rukhar))
	{
		if(Kapitel < 4)
		{
			if(Rukhar_Won_Wettkampf == TRUE)
			{
				B_StartOtherRoutine(Rukhar,"WETTKAMPFRUKHARWON");
			}
			else
			{
				B_StartOtherRoutine(Rukhar,"WETTKAMPFRUKHARLOST");
			};
		};
	};
	MIS_Rukhar_Wettkampf = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_EINGEBROCKT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 8;
	condition = DIA_Orlan_EINGEBROCKT_Condition;
	information = DIA_Orlan_EINGEBROCKT_Info;
	important = TRUE;
};


func int DIA_Orlan_EINGEBROCKT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf == LOG_Running) && (MIS_Rukhar_Wettkampf_Day > (Wld_GetDay() - 2)) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Orlan_EINGEBROCKT_Info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//Да уж, доставил ты мне проблем. Теперь мне нужно быть поосторожнее с Рухаром.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Почему?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//Пока он устраивает здесь это свое состязание, лучше, чтобы никто посторонний не знал о нем. Это плохо для бизнеса, понимаешь?
};


instance DIA_Orlan_Perm(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 99;
	condition = DIA_Orlan_Perm_Condition;
	information = DIA_Orlan_Perm_Info;
	permanent = TRUE;
	description = "Как дела в таверне?";
};


func int DIA_Orlan_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Perm_Info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//Как дела в таверне?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//Бывало и лучше.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//Люди нынче не так охотно развязывают свои кошельки, как это было раньше.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Надеюсь, эти черные маги скоро уйдут, иначе, боюсь, мне придется закрыть таверну.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//Почти никто не осмеливается больше заглядывать сюда.
	};
};


instance DIA_Orlan_Minenanteil(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Minenanteil_Condition;
	information = DIA_Orlan_Minenanteil_Info;
	description = "Ты продаешь акции?";
};


func int DIA_Orlan_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (OrlanMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//Ты продаешь акции?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Конечно. Ты тоже можешь купить, если цена тебя устраивает.
	B_GivePlayerXP(XP_Ambient);
};

