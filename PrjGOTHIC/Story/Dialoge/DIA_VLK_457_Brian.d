
instance DIA_Brian_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_PICKPOCKET(C_Info)
{
	npc = VLK_457_Brian;
	nr = 900;
	condition = DIA_Brian_PICKPOCKET_Condition;
	information = DIA_Brian_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Brian_PICKPOCKET_Condition()
{
	return C_Beklauen(55,100);
};

func void DIA_Brian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
	Info_AddChoice(DIA_Brian_PICKPOCKET,Dialog_Back,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};


instance DIA_Brian_HALLO(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_HALLO_Condition;
	information = DIA_Brian_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Brian_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info()
{
	AI_Output(self,other,"DIA_Brian_HALLO_04_00");	//Ты недавно в городе, да? Я Брайан! Ученик мастера Гарада.
};


instance DIA_Brian_AboutLehrling(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_AboutLehrling_Condition;
	information = DIA_Brian_AboutLehrling_Info;
	permanent = FALSE;
	description = "Каково это, быть учеником кузнеца?";
};


func int DIA_Brian_AboutLehrling_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_00");	//Каково это, быть учеником кузнеца?
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_01");	//Почему ты спрашиваешь? Ты хочешь стать моим преемником?
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_02");	//Может быть.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_03");	//Почему бы и нет... Я почти закончил свое обучение и собираюсь вскоре покинуть город.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_04");	//Но не из-за Гарада. Он хороший мастер, я многому научился у него.
};


instance DIA_Brian_WhyLeave(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_WhyLeave_Condition;
	information = DIA_Brian_WhyLeave_Info;
	permanent = FALSE;
	description = "Почему ты хочешь покинуть город?";
};


func int DIA_Brian_WhyLeave_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info()
{
	AI_Output(other,self,"DIA_Brian_WhyLeave_15_00");	//Почему ты хочешь покинуть город?
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_00");	//Потому что люди здесь действуют мне на нервы! А особенно остальные мастера.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_01");	//Я еще не забыл, чего это стоило - стать учеником Гарада.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_02");	//Каждый из этих шутников был готов вставить свою шпильку.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_03");	//Я хочу сам решать, кого могу, а кого не могу брать в ученики.
};


instance DIA_Brian_OtherMasters(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_OtherMasters_Condition;
	information = DIA_Brian_OtherMasters_Info;
	permanent = FALSE;
	description = "А кто здесь другие мастера?";
};


func int DIA_Brian_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_WhyLeave) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Brian_Add_15_00");	//А кто здесь другие мастера?
	AI_Output(self,other,"DIA_Brian_Add_04_01");	//Ну, это плотник Торбен, мастер-лучник Боспер, алхимик Константино и Маттео.
	AI_Output(self,other,"DIA_Brian_Add_04_02");	//Он продает доспехи, но, в первую очередь, он торговец.
	AI_Output(self,other,"DIA_Brian_Add_04_03");	//У каждого мастера есть свой дом на этой улице.
	AI_Output(self,other,"DIA_Brian_Add_04_04");	//А лавка Константино находится в подземном проходе, ведущем к храму.
};


instance DIA_Brian_AboutHarad(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_AboutHarad_Condition;
	information = DIA_Brian_AboutHarad_Info;
	permanent = FALSE;
	description = "Расскажи мне о мастере Гараде.";
};


func int DIA_Brian_AboutHarad_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutHarad_15_00");	//Расскажи мне о мастере Гараде.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_01");	//Он сейчас не в лучшем расположении духа.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_02");	//Несколько дней назад пришли паладины и приказали ему ковать мечи для них.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_03");	//Они даже запретили ему продавать мечи кому-либо еще.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_04");	//Теперь он, как раб, работает дни и ночи напролет, чтобы как можно быстрее закончить свою работу.
};


instance DIA_Brian_NEEDWEAPONS(C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_NEEDWEAPONS_Condition;
	information = DIA_Brian_NEEDWEAPONS_Info;
	permanent = FALSE;
	description = "Могу я купить оружие у тебя?";
};


func int DIA_Brian_NEEDWEAPONS_Condition()
{
	return TRUE;
};

func void DIA_Brian_NEEDWEAPONS_Info()
{
	AI_Output(other,self,"DIA_Brian_NEEDWEAPONS_15_00");	//Могу я купить оружие у тебя?
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_01");	//Нет. Я всего лишь помощник.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_02");	//Оружие, которое делается в этой кузнице, забирает ополчение. Они уносят его к башням, где оно хранится.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_03");	//Но во всем остальном, что касается кузнечного дела, я могу помочь.
};


var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN(C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_WASKAUFEN_Condition;
	information = DIA_Brian_WASKAUFEN_Info;
	permanent = TRUE;
	description = "Что я могу купить у тебя?";
	trade = TRUE;
};


func int DIA_Brian_WASKAUFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info()
{
	AI_Output(other,self,"DIA_Brian_WASKAUFEN_15_00");	//Что я могу купить у тебя?
	B_GiveTradeInv(self);
	if(Npc_IsDead(Harad))
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//Если у меня еще есть парочка лишних стальных болванок, ты можешь взять их. Боюсь, что это все.
		if(MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_02");	//С тех пор как Гарада больше нет здесь, ополчение глаз с меня не спускает.
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_03");	//Мне не позволено продолжать работать в кузнице. Они боятся, что я все распродам и свалю.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_05");	//Я могу продать тебе стальные заготовки.
	};
	if(Brian_Trade_einmal == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Брайан, подмастерье Гарада, продает стальные заготовки.");
		Brian_Trade_einmal = TRUE;
	};
	Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
};


instance DIA_Brian_KAP3_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP3_EXIT_Condition;
	information = DIA_Brian_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_RepairNecklace(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_RepairNecklace_Condition;
	information = DIA_Brian_RepairNecklace_Info;
	permanent = FALSE;
	description = "Ты можешь ремонтировать ювелирные изделия?";
};


func int DIA_Brian_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Brian_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Brian_RepairNecklace_15_00");	//Ты можешь ремонтировать ювелирные изделия?
	AI_Output(self,other,"DIA_Brian_RepairNecklace_04_01");	//Я всего лишь помощник, я радуюсь, когда мне позволяют сделать хотя бы кинжал.
	if(Npc_IsDead(Harad) == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_RepairNecklace_04_02");	//Ювелирные изделия? Тебе лучше обратиться к мастеру.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Brian_KAP4_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP4_EXIT_Condition;
	information = DIA_Brian_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_KAP5_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP5_EXIT_Condition;
	information = DIA_Brian_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_NEWLIGHTHOUSEOFFICER(C_Info)
{
	npc = VLK_457_Brian;
	nr = 51;
	condition = DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information = DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;
	description = "Я слышал, что ты интересовался маяком старого Джека.";
};


func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition()
{
	if((Kapitel == 5) && (MIS_Jack_NewLighthouseOfficer == LOG_Running) && Npc_KnowsInfo(other,DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info()
{
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00");	//Я слышал, что ты интересовался маяком старого Джека.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01");	//Джек собирается выйти в море. Но ему не на кого оставить маяк.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02");	//Но Джек должен понимать, что в его отсутствие я превращу маяк в кузницу.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03");	//Это проблема?
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04");	//(смеется) Не для меня. Мне все равно не заполучить кузницу Гарада. Я уже выбросил эту мысль из головы.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05");	//Согласен. Встретимся у Джека.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_Brian_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_LIGHTHOUSEFREE_Condition;
	information = DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent = TRUE;
	description = "И, что скажешь?";
};


func int DIA_Brian_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self,"DIA_Brian_LIGHTHOUSEFREE_15_00");	//И что скажешь?
	AI_Output(self,other,"DIA_Brian_LIGHTHOUSEFREE_04_01");	//Боже, какой бардак. Джек не узнает это место, когда я все здесь устрою как надо.
};

