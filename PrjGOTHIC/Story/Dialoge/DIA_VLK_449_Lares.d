
var int LaresToldAboutKDW1;
var int LaresToldAboutKDW2;

func void B_LaresTellAboutKDW1()
{
	if(LaresToldAboutKDW1 == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00");	//Мы, ребята из бывшего Нового Лагеря, сохранили хорошие отношения с магами Воды.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01");	//Даже Ли готов защищать магов Воды от любой опасности, если только это будет в его силах.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02");	//Чтобы поддерживать связь с магами, я практически постоянно нахожусь в городе, работая вместе с Ватрасом.
		LaresToldAboutKDW1 = TRUE;
	};
};

func void B_LaresTellAboutKDW2()
{
	if(LaresToldAboutKDW2 == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_00");	//Маги Воды полностью погружены в работу. Они уже несколько недель раскапывают какие-то руины на северо-востоке. Никто не знает, что они пытаются там найти.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_01");	//Все началось с землетрясений, таких, какие бывали в худшие дни Барьера.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_02");	//Из-под земли появились ужасные каменные создания, убивающие каждого, кто подходил к ним ближе, чем на тридцать метров.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_03");	//Маги Воды взяли ситуацию в свои руки и уничтожили монстров. А теперь они проводят раскопки, пытаясь найти объяснение этим странным событиям.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_04");	//Но ты скоро сам все увидишь.
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"Ларес рассказал мне о раскопках магов Воды. Маги занимаются расследованием необычных событий, происходящих в последнее время - странных землетрясений и появления из-под земли загадочных каменных существ.");
		LaresToldAboutKDW2 = TRUE;
	};
};

func void B_SCForgotSaturas()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00");	//Сатурас? Кто это такой?
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01");	//Он был главным у магов Воды в Новом Лагере в Долине Рудников, когда Барьер еще не был разрушен.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02");	//Мы с Ли тогда заключили с магами Воды союз.
};

func void B_SCRememberSaturas()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00");	//Конечно. Он был предводителем магов Воды в Новом Лагере.
};

func void DIA_Addon_Lares_Patch_WhereTo()
{
	B_LaresTellAboutKDW1();
	B_LaresTellAboutKDW2();
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//Да, и еще одно. Не стоит бродить по округе с этим орнаментом. Сразу же отправляйся к Сатурасу.
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
};

instance DIA_Addon_Lares_Patch(C_Info)
{
	npc = VLK_449_Lares;
	nr = 99;
	condition = DIA_Addon_Lares_Patch_Condition;
	information = DIA_Addon_Lares_Patch_Info;
	description = "Я могу отнести орнамент!";
};


func int DIA_Addon_Lares_Patch_Condition()
{
	if(Npc_HasItems(self,ItMi_Ornament_Addon_Vatras) && (Kapitel >= 3) && (ENTERED_ADDONWORLD == FALSE) && !Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Patch_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//Я могу отнести орнамент!
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//Орнамент, который ты мне отдал, нужно отнести Сатурасу. Ты же помнишь Сатураса, не так ли?
	if(LaresToldAboutKDW1 == FALSE)
	{
		Info_ClearChoices(DIA_Addon_Lares_Patch);
		Info_AddChoice(DIA_Addon_Lares_Patch,"Конечно.",DIA_Addon_Lares_Patch_ja);
		Info_AddChoice(DIA_Addon_Lares_Patch,"Сатурас? Кто это такой?",DIA_Addon_Lares_Patch_wer);
	}
	else
	{
		DIA_Addon_Lares_Patch_WhereTo();
	};
};


func void DIA_Addon_Lares_Patch_wer()
{
	B_SCForgotSaturas();
	DIA_Addon_Lares_Patch_WhereTo();
	Info_ClearChoices(DIA_Addon_Lares_Patch);
};

func void DIA_Addon_Lares_Patch_ja()
{
	B_SCRememberSaturas();
	DIA_Addon_Lares_Patch_WhereTo();
	Info_ClearChoices(DIA_Addon_Lares_Patch);
};

instance DIA_Lares_Kap1_EXIT(C_Info)
{
	npc = VLK_449_Lares;
	nr = 999;
	condition = DIA_Lares_Kap1_EXIT_Condition;
	information = DIA_Lares_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lares_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_HaltsMaul(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_HaltsMaul_Condition;
	information = DIA_Addon_Lares_HaltsMaul_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Lares_HaltsMaul_Condition()
{
	if((Lares_HaltsMaul == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_HaltsMaul_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_HaltsMaul_09_01");	//Увидимся позже, в гавани.
	AI_StopProcessInfos(self);
};


instance DIA_Lares_PICKPOCKET(C_Info)
{
	npc = VLK_449_Lares;
	nr = 900;
	condition = DIA_Lares_PICKPOCKET_Condition;
	information = DIA_Lares_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Lares_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_Lares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
	Info_AddChoice(DIA_Lares_PICKPOCKET,Dialog_Back,DIA_Lares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lares_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lares_PICKPOCKET_DoIt);
};

func void DIA_Lares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};

func void DIA_Lares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lares_PICKPOCKET);
};


func void B_Lares_Comment_MIL()
{
	AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(смеется) Со смеху помереть можно - бывший каторжник в ополчении...
};

func void B_Lares_Comment_PAL()
{
	AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Так, теперь ты один из паладинов короля!
};

func void B_Lares_Comment_SLD()
{
	AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_00");	//Я слышал, тебя приняли в ряды наемников Ли?
};

instance DIA_Lares_HALLO(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Lares_HALLO_Condition;
	information = DIA_Lares_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_HALLO_Condition()
{
	if(RangerMeetingRunning == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_HALLO_Info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Я, должно быть, сошел с ума! Что ты делаешь здесь?
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		B_GivePlayerXP(500);
	};
	if(other.guild == GIL_NONE)
	{
		if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (B_GetLaresLocation() == LOC_CITY))
		{
			AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//Ты что, ПРИПЛЫЛ сюда?
			AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//(смеется) Это единственный способ миновать стражу у городских ворот.
		};
		Lares_FirstMetAsGuildless = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		B_Lares_Comment_MIL();
	}
	else if(other.guild == GIL_PAL)
	{
		B_Lares_Comment_PAL();
	}
	else if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06_add");	//Я слышал, ты поступил в монастырь.
	}
	else if(other.guild == GIL_SLD)
	{
		B_Lares_Comment_SLD();
	};
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Мы уже встречались раньше?",DIA_Lares_HALLO_NO);
	Info_AddChoice(DIA_Lares_HALLO,"Эй, Ларес, старый пройдоха! А как ты попал сюда?",DIA_Lares_HALLO_YES);
};

func void DIA_Lares_HALLO_NO()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Мы уже встречались раньше?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Парень, ты что, не помнишь меня? Мы были вместе в Новом Лагере.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Не говоря уже о шахте... Эй, мы знатно повеселились там. Ты помнишь Ли?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Конечно же, я помню Ли!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Ли?",DIA_Lares_HALLO_NOIDEA);
};

func void DIA_Lares_HALLO_YES()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Эй, Ларес, старый пройдоха! А как ты попал сюда?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Я смог выбраться из Долины Рудников вместе с Ли и другими парнями.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Ты ведь помнишь Ли?
	Info_ClearChoices(DIA_Lares_HALLO);
	Info_AddChoice(DIA_Lares_HALLO,"Конечно же, я помню Ли!",DIA_Lares_HALLO_LEE);
	Info_AddChoice(DIA_Lares_HALLO,"Ли?",DIA_Lares_HALLO_NOIDEA);
};

func void B_Lares_AboutLee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Я выбрался из колонии вместе с ним. Сразу после того, как Барьер был уничтожен.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Он и его парни сейчас на ферме лендлорда Онара.
		AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Он договорился с этим фермером. Ли с парнями защищает ферму, а Онар кормит их за это.
	};
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_03");	//А зачем ТЫ пришел в город?
	AI_Output(other,self,"DIA_Lares_Alternative_15_00");	//У меня есть выбор?
};

func void DIA_Lares_HALLO_LEE()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Конечно же, я помню Ли!
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};

func void DIA_Lares_HALLO_NOIDEA()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Ли?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Тебе, похоже, многое пришлось пережить. Ли был предводителем наемников в Новом Лагере.
	B_Lares_AboutLee();
	Info_ClearChoices(DIA_Lares_HALLO);
};


instance DIA_Lares_AboutGorn(C_Info)
{
	npc = VLK_449_Lares;
	nr = 98;
	condition = DIA_Lares_AboutGorn_Condition;
	information = DIA_Lares_AboutGorn_Info;
	permanent = FALSE;
	description = "Горн сказал тебе обо мне? Что произошло с ним?";
};


func int DIA_Lares_AboutGorn_Condition()
{
	if((KnowsAboutGorn == TRUE) && (MIS_RescueGorn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_AboutGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Горн сказал тебе обо мне? Что произошло с ним?
	AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//Я думаю, он где-то в Долине Рудников.
};


instance DIA_Addon_Lares_Vatras(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_Vatras_Condition;
	information = DIA_Addon_Lares_Vatras_Info;
	description = "Меня послал Ватрас. Он сказал, что если мне понадобится помощь, я могу обратиться к тебе.";
};


func int DIA_Addon_Lares_Vatras_Condition()
{
	if(Vatras_GehZuLares == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Vatras_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Vatras_15_00");	//Меня послал Ватрас. Он сказал, что если мне понадобится помощь, я могу обратиться к тебе.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_01");	//(удивленно) Итак, ты уже повидался с Ватрасом. Должно быть, ты произвел на него впечатление.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_02");	//Иначе он не назвал бы тебе мое имя. Особенно сейчас, когда повсюду пропадают люди.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_03");	//Итак, что тебе нужно?
	Lares_RangerHelp = TRUE;
	if(GregLocation == Greg_Farm1)
	{
		B_StartOtherRoutine(BAU_974_Bauer,"GregInTaverne");
		GregLocation = Greg_Taverne;
		B_StartOtherRoutine(Greg_NW,"Taverne");
		B_InsertGregWolfs();
	};
};


instance DIA_Addon_Lares_WhatAreYouGuys(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Addon_Lares_WhatAreYouGuys_Condition;
	information = DIA_Addon_Lares_WhatAreYouGuys_Info;
	description = "Что у вас за дела с Ватрасом?";
};


func int DIA_Addon_Lares_WhatAreYouGuys_Condition()
{
	if((Lares_RangerHelp == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WhatAreYouGuys_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_00");	//Что у вас за дела с Ватрасом?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_01");	//Я заключил с магами Воды небольшое соглашение. Понимаешь?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_02");	//Что за соглашение?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_03");	//Мы на них работаем, а они заботятся о том, чтобы из-за нашего прошлого в колонии у нас не было проблем.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_04");	//Ты говоришь о 'Кольце Воды'?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//Ты слышал о нем?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_06");	//Да, мне сказал Ватрас.
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_07");	//Что ж, ты сам ответил на свой вопрос.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Ларес принадлежит к 'Кольцу Воды'.");
};


instance DIA_Addon_Lares_Ranger(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Ranger_Condition;
	information = DIA_Addon_Lares_Ranger_Info;
	description = "Расскажи мне о 'Кольце Воды'.";
};


func int DIA_Addon_Lares_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_WhatAreYouGuys) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_00");	//Расскажи мне о 'Кольце Воды'.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_01");	//Кольцо для магов Воды - то же самое, что паладины для магов Огня.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_02");	//Но в отличие от паладинов, мы действуем тайно.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_03");	//Кольцо - это могучее оружие в битвах с силами Зла, угрожающими Хоринису.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_04");	//Но сила Кольца основывается на том, что имена его членов хранятся в тайне.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_05");	//Поэтому помалкивай об этом!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Конечно.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Члены общества Кольца для магов Воды - все равно, что паладины для магов Огня. Но братство действует тайно. Его члены не выдают себя, и никто не знает его истинную силу.");
};


instance DIA_Addon_Lares_WannaBeRanger(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_WannaBeRanger_Condition;
	information = DIA_Addon_Lares_WannaBeRanger_Info;
	description = "Я хочу присоединиться к Кольцу Воды...";
};


func int DIA_Addon_Lares_WannaBeRanger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ranger) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_WannaBeRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_15_00");	//Я хочу присоединиться к Кольцу Воды...
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_09_01");	//Я не против. Но решение о том, можешь ли ты вступить в наши ряды, должны принять маги.
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Понимаю.",DIA_Addon_Lares_WannaBeRanger_BACK);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"А что это значит - быть членом вашего общества?",DIA_Addon_Lares_WannaBeRanger_HowIsIt);
	Info_AddChoice(DIA_Addon_Lares_WannaBeRanger,"Что ты сделал для того, чтобы произвести впечатление на магов Воды?",DIA_Addon_Lares_WannaBeRanger_AboutYou);
};

func void DIA_Addon_Lares_WannaBeRanger_BACK()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//Понимаю.
	Info_ClearChoices(DIA_Addon_Lares_WannaBeRanger);
};

func void DIA_Addon_Lares_WannaBeRanger_AboutYou()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00");	//Что ты сделал для того, чтобы произвести впечатление на магов Воды?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01");	//Я защищал их все то время, пока мы жили за Барьером.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02");	//(улыбается) И у них есть множество причин быть мне благодарными.
};

func void DIA_Addon_Lares_WannaBeRanger_HowIsIt()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00");	//А что это значит - быть членом вашего общества?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01");	//Мы не похожи на остальные сообщества Хориниса, к которым ты можешь присоединиться.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02");	//Когда ты становишься одним из нас, мы не даем тебе поручения, выполнить которые ты не готов.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03");	//Единственное, что требуется от тебя с самого начала - молчание.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04");	//Мы действуем тайно и не хотим, чтобы посторонние знали о наших действиях.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05");	//Мы будем наблюдать за тобой. Все остальное ты узнаешь со временем.
};

func void B_Lares_Geheimtreffen()
{
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_07");	//Скоро в таверне Орлана состоится собрание членов общества.
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_08");	//Приходи туда, и ты получишь свое снаряжение.
};


instance DIA_Addon_Lares_RingBack(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_RingBack_Condition;
	information = DIA_Addon_Lares_RingBack_Info;
	description = "Я стал членом общества Кольца Воды.";
};


func int DIA_Addon_Lares_RingBack_Condition()
{
	if((SC_IsRanger == TRUE) && (MIS_Addon_Lares_ComeToRangerMeeting != LOG_SUCCESS) && ((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B") < 1000) || (Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") < 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_00");	//Я стал членом общества Кольца Воды.
	if((Lares_GotRingBack == FALSE) && (SC_GotLaresRing == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_01");	//Прекрасно. Я могу получить обратно свое кольцо?
		if(B_GiveInvItems(other,self,ItRi_Ranger_Lares_Addon,1))
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_02");	//Конечно, вот оно.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_03");	//Надеюсь, тебе оно пригодилось. Я рад, что ты стал одним из нас.
			Lares_GotRingBack = TRUE;
			B_GivePlayerXP(XP_Ambient);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_04");	//Хм-м... Оно у меня не с собой.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_05");	//Постарайся вернуть его поскорее! Оно мне нужно.
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_06");	//Наверное, тебе хочется поскорее получить снаряжение? Слушай меня внимательно.
	B_Lares_Geheimtreffen();
	B_LogEntry(TOPIC_Addon_RingOfWater,"Ларес пригласил меня на тайную встречу Кольца Воды в таверне Орлана.");
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
};


instance DIA_Addon_Lares_RingBack2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_RingBack2_Condition;
	information = DIA_Addon_Lares_RingBack2_Info;
	description = "Вот твое кольцо.";
};


func int DIA_Addon_Lares_RingBack2_Condition()
{
	if(Npc_HasItems(other,ItRi_Ranger_Lares_Addon) && (Lares_GotRingBack == FALSE) && (MIS_Addon_Lares_ComeToRangerMeeting != FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RingBack2_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack2_15_00");	//Вот твое кольцо.
	B_GiveInvItems(other,self,ItRi_Ranger_Lares_Addon,1);
	AI_Output(self,other,"DIA_Addon_Lares_RingBack2_09_01");	//Замечательно. Я боялся, что ты его потерял.
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		B_GivePlayerXP(XP_AmbientKap1);
	};
	Lares_GotRingBack = TRUE;
};


func int C_AllRangersAreInPositions()
{
	if(Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") > 200)
	{
		return FALSE;
	};
	if(!Npc_IsDead(Cord))
	{
		if(Npc_GetDistToWP(Cord,"NW_TAVERNE_IN_RANGERMEETING") >= 500)
		{
			return FALSE;
		};
	};
	if(!Npc_IsDead(Gaan))
	{
		if(Npc_GetDistToWP(Gaan,"NW_TAVERNE_IN_RANGERMEETING") >= 500)
		{
			return FALSE;
		};
	};
	if(!Npc_IsDead(Martin))
	{
		if(Npc_GetDistToWP(Martin,"NW_TAVERNE_IN_RANGERMEETING") >= 500)
		{
			return FALSE;
		};
	};
	if(!Npc_IsDead(Cavalorn) && (MIS_Addon_Cavalorn_GetOrnamentFromPAL != FALSE))
	{
		if(Npc_GetDistToWP(Cavalorn,"NW_TAVERNE_IN_RANGERMEETING") >= 500)
		{
			return FALSE;
		};
	};
	if(!Npc_IsDead(Orlan))
	{
		if(Npc_GetDistToWP(Orlan,"NW_TAVERNE_IN_RANGERMEETING") >= 500)
		{
			return FALSE;
		};
	};
	return TRUE;
};

instance DIA_Addon_Lares_Geduld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_Geduld_Condition;
	information = DIA_Addon_Lares_Geduld_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Lares_Geduld_Condition()
{
	if((RangerMeetingRunning == LOG_Running) && !C_AllRangersAreInPositions() && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Geduld_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Geduld_09_01");	//Тебе придется немного подождать. Еще не все собрались.
	AI_StopProcessInfos(self);
};


var int Lares_ArmorComment;

instance DIA_Addon_Lares_GetRangerArmor(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_GetRangerArmor_Condition;
	information = DIA_Addon_Lares_GetRangerArmor_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_GetRangerArmor_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && C_AllRangersAreInPositions() && (RangerMeetingRunning == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GetRangerArmor_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_00");	//Итак, мой юный друг, мы собрались здесь, чтобы отпраздновать твое вступление в общество Кольца Воды.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_01");	//Люди, которые сейчас здесь присутствуют, будут присматривать за тобой.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_02");	//Конечно же, здесь не все члены общества, так что будь внимателен.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_03");	//Нам будет известно как о твоих действиях на благо Кольца, так и обо всех проступках.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_04");	//А теперь прими от братства эти доспехи.
	if(Lares_ArmorComment == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03_add");	//Члены общества Кольца Воды носили такую броню еще до войны с орками.
		Lares_ArmorComment = TRUE;
	};
	AI_WaitTillEnd(other,self);
	B_GiveArmor(ITAR_RANGER_Addon);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_05");	//Носи их с гордостью! Но никогда не надевай их в городе или каком-либо другом населенном месте.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_06");	//Помни: наши имена должны оставаться в тайне. Никто не должен знать, что мы являемся членами общества.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_07");	//Болтать о Кольце Воды запрещено. Это наше главное правило. Запомни его.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//Вопросы есть?
	MIS_Addon_Lares_ComeToRangerMeeting = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"Я должен идти.",DIA_Addon_Lares_GetRangerArmor_end);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"Как вы можете помочь мне?",DIA_Addon_Lares_GetRangerArmor_Learn);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,"Что насчет оружия?",DIA_Addon_Lares_GetRangerArmor_weapons);
};

func void DIA_Addon_Lares_GetRangerArmor_weapons()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_15_00");	//Что насчет оружия?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_01");	//Традиционное оружие членов братства Кольца - боевой посох, однако каждый может использовать то оружие, которое ему нравится.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_02");	//Вот один из наших посохов. Я так и не смог им овладеть, но, может быть, тебе он пригодится.
	CreateInvItems(self,ItMw_RangerStaff_Addon,1);
	B_GiveInvItems(self,other,ItMw_RangerStaff_Addon,1);
};

func void DIA_Addon_Lares_GetRangerArmor_end()
{
	B_MakeRangerReadyToLeaveMeetingALL();
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_end_15_00");	//Я должен идти.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_01");	//Прекрасно, мы не будем тебя задерживать.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_02");	//Отправляйся к Ватрасу и попроси его дать тебе твое первое задание.
	B_StopLookAt(self);
	AI_AlignToWP(self);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_03");	//Братья! Пришло время вернуться к нашей работе.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_04");	//Нападения бандитов все еще продолжаются. Мы должны ликвидировать эту угрозу.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_05");	//Да сохранит Аданос равновесие нашего мира.
	if(!Npc_IsDead(Orlan))
	{
		CreateInvItem(Orlan,ItMW_Addon_Stab03);
	};
	Lares_TakeFirstMissionFromVatras = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_GetRangerArmor);
	Info_AddChoice(DIA_Addon_Lares_GetRangerArmor,Dialog_Ende,DIA_Addon_Lares_GetRangerArmor_weiter);
};

func void DIA_Addon_Lares_GetRangerArmor_weiter()
{
	AI_StopProcessInfos(self);
	B_RangerMeetingParking();
	B_LogEntry(TOPIC_Addon_RingOfWater,"На встрече в таверне Орлана я получил свою броню Кольца Воды. Теперь я должен встретиться с Ватрасом, который даст мне мое первое задание.");
};

func void DIA_Addon_Lares_GetRangerArmor_Learn()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_Learn_15_00");	//Как вы можете помочь мне?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_01");	//Я могу сделать тебя более ловким.
	if(!Npc_IsDead(Cord))
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_02");	//Если тебе нужно улучшить свое мастерство ближнего боя, поговори с Кордом. Он мастер клинка.
		Cord_RangerHelp_Fight = TRUE;
	};
	if(!Npc_IsDead(Gaan))
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_03");	//Гаан научит тебя правильно разделывать животных.
	};
	if(!Npc_IsDead(Martin))
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_04");	//Мартину есть что рассказать тебе о паладинах.
	};
	if(!Npc_IsDead(Cavalorn))
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_05");	//Кавалорн может научить тебя красться, сражаться одноручным оружием и стрелять из лука.
	};
	if(!Npc_IsDead(Orlan))
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_06");	//У Орлана всегда найдется для тебя теплая комната и мягкая кровать.
	};
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_07");	//А во всем, что касается магии, ты можешь положиться на Ватраса.
};


instance DIA_Addon_Lares_Teleportstation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Teleportstation_Condition;
	information = DIA_Addon_Lares_Teleportstation_Info;
	description = "Тебе доводилось пользоваться телепортами?";
};


func int DIA_Addon_Lares_Teleportstation_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SCUsed_TELEPORTER == TRUE) && (MIS_Lares_BringRangerToMe != FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Teleportstation_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_00");	//Тебе доводилось пользоваться телепортами?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_01");	//Нет, но я о них слышал. Маги Воды сами пока не уверены в их надежности.
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_02");	//Я уже проходил через телепорт.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_03");	//(смеется) Ну конечно! Ты же вообще ничего не боишься, не так ли?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_04");	//Ну что ж, если тебе не страшно ими пользоваться, попроси трактирщика Орлана впустить тебя в его пещеру.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_05");	//В ней спрятан один из телепортов магов Воды. Пещера находится неподалеку от его таверны.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_06");	//Выходи через восточные городские ворота и иди по дороге прямо. Не промахнешься.
	if(!Npc_KnowsInfo(other,DIA_Addon_Orlan_Teleportstein))
	{
		B_LogEntry(TOPIC_Addon_TeleportsNW,"Ларес рассказал мне, что неподалеку от таверны Орлана спрятан телепорт.");
	};
};


instance DIA_Addon_Lares_Ornament(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_Ornament_Condition;
	information = DIA_Addon_Lares_Ornament_Info;
	description = "Ватрас просил передать тебе этот орнамент.";
};


func int DIA_Addon_Lares_Ornament_Condition()
{
	if(Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && Npc_KnowsInfo(other,DIA_Addon_Lares_Vatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ornament_15_00");	//Ватрас просил передать тебе этот орнамент. Он сказал, что его нужно отнести назад.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_01");	//(вздыхает) Ну конечно! Как всегда, работа достается мне. Я так и знал.
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_02");	//Теперь мне придется тащиться через пол-острова, чтобы отдать эту штуковину магам Воды.
};


func void B_LaresCantGoToPlaces()
{
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_02");	//Но сейчас я не могу уйти. Я должен наблюдать за гаванью.
};

instance DIA_Addon_Lares_OrnamentBringJob(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_OrnamentBringJob_Condition;
	information = DIA_Addon_Lares_OrnamentBringJob_Info;
	description = "Я могу отнести орнамент!";
};


func int DIA_Addon_Lares_OrnamentBringJob_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ornament) && (MIS_Addon_Lares_Ornament2Saturas == FALSE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_OrnamentBringJob_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//Я могу отнести орнамент!
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_01");	//(задумчиво) Хм-м... Нет, лучше я займусь этим сам. Впрочем, ты можешь пойти со мной.
	if(Lares_CanBringScToPlaces == FALSE)
	{
		B_LaresCantGoToPlaces();
	};
	B_LogEntry(TOPIC_Addon_KDW,"Я передал Ларесу орнамент Ватраса. Он хочет отнести его магам Воды и просит меня сопровождать его.");
	MIS_Addon_Lares_Ornament2Saturas = LOG_Running;
};


instance DIA_Addon_Lares_YourMission(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_YourMission_Condition;
	information = DIA_Addon_Lares_YourMission_Info;
	permanent = TRUE;
	description = "Чем именно ты занимаешься в порту?";
};


func int DIA_Addon_Lares_YourMission_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lares_Ornament) && (MIS_Lares_BringRangerToMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_YourMission_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_YourMission_15_00");	//Чем именно ты занимаешься в порту?
	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_WhatAreYouGuys))
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_01");	//Я не могу тебе сказать.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_02");	//Ватрас меня убьет...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_03");	//Я делаю то, что делаем мы все. Выполняю задание, которое дали мне маги Воды.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_04");	//Некоторые из пропавших людей были рыбаками. Они пропали вместе со своими лодками.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_05");	//Поэтому я нахожусь здесь и наблюдаю за гаванью. Если что-то еще произойдет, я это замечу.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_06");	//Но ты можешь мне помочь.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_07");	//Я дам тебе свое аквамариновое кольцо. Оно показывает, что его обладатель принадлежит к Кольцу Воды.
		CreateInvItems(self,ItRi_Ranger_Lares_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Lares_Addon,1);
		SC_GotLaresRing = TRUE;
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_08");	//Если ты будешь носить мое кольцо, то членам братства будет ясно, что ты действуешь от моего имени.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_09");	//Найди кого-нибудь, кто сменит меня, чтобы я смог отнести орнамент.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_10");	//На рынке постоянно дежурит кто-нибудь из наших. Но я не знаю, чья сейчас смена.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_11");	//Тебе лучше поговорить со всеми, кто там стоит. Когда наш человек увидит аквамариновое кольцо, он сам тебе откроется.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_12");	//Скажи ему, что мне нужен кто-то, кто сменит меня в порту.
		Log_CreateTopic(TOPIC_Addon_BringRangerToLares,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BringRangerToLares,LOG_Running);
		B_LogEntries(TOPIC_Addon_BringRangerToLares,"Ларес хочет покинуть гавань. Я должен пройтись по рынку, надев аквамариновое кольцо, и попробовать найти кого-то, кто займет место Лареса.");
		B_LogNextEntry(TOPIC_Addon_RingOfWater,"Ларес дал мне аквамариновое кольцо - тайный знак Кольца Воды. Если я буду его носить, другие члены Кольца Воды смогут мне открыться.");
		MIS_Lares_BringRangerToMe = LOG_Running;
	};
};


instance DIA_Addon_Lares_BaltramAbloese(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_BaltramAbloese_Condition;
	information = DIA_Addon_Lares_BaltramAbloese_Info;
	description = "Я говорил с Бальтрамом. Он найдет тебе замену.";
};


func int DIA_Addon_Lares_BaltramAbloese_Condition()
{
	if((MIS_Lares_BringRangerToMe == LOG_Running) && (Baltram_Exchange4Lares == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_BaltramAbloese_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_BaltramAbloese_15_00");	//Я говорил с Бальтрамом. Он найдет тебе замену.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_01");	//Очень хорошо! В таком случае, мы можем отправляться.
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_02");	//Мое кольцо пока можешь оставить себе.
		if(Npc_KnowsInfo(other,DIA_Addon_Lares_WannaBeRanger))
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_03");	//(улыбается) Думаю, оно тебе еще поможет.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_04");	//(улыбается) Кто знает, может, ты решишь стать одним из нас...
		};
	};
	MIS_Lares_BringRangerToMe = LOG_SUCCESS;
	B_CheckLog();
	Lares_CanBringScToPlaces = TRUE;
};


var int Lares_PeopleMissing_PERM;

instance DIA_Addon_Lares_PeopleMissing(C_Info)
{
	npc = VLK_449_Lares;
	nr = 3;
	condition = DIA_Addon_Lares_PeopleMissing_Condition;
	information = DIA_Addon_Lares_PeopleMissing_Info;
	permanent = TRUE;
	description = "Насчет пропавших людей...";
};


func int DIA_Addon_Lares_PeopleMissing_Condition()
{
	if((Lares_RangerHelp == TRUE) && (Lares_PeopleMissing_PERM == FALSE) && ((SC_IsRanger == FALSE) || (MissingPeopleReturnedHome == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PeopleMissing_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_15_00");	//Насчет пропавших людей...
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
	Info_AddChoice(DIA_Addon_Lares_PeopleMissing,Dialog_Back,DIA_Addon_Lares_PeopleMissing_BACK);
	if(MissingPeopleReturnedHome == TRUE)
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"Мне удалось спасти некоторых из похищенных людей.",DIA_Addon_Lares_PeopleMissing_SAVED);
	}
	else if((MIS_Lares_BringRangerToMe != FALSE) && (SCKnowsMissingPeopleAreInAddonWorld == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"Я знаю, что случилось с пропавшими людьми!",DIA_Addon_Lares_PeopleMissing_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"Разве этим делом не должно заниматься ополчение?",DIA_Addon_Lares_PeopleMissing_MIL);
		Info_AddChoice(DIA_Addon_Lares_PeopleMissing,"Расскажи мне, что тебе известно.",DIA_Addon_Lares_PeopleMissing_TellMe);
	};
};

func void DIA_Addon_Lares_PeopleMissing_BACK()
{
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_TellMe()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_TellMe_15_00");	//Расскажи мне, что тебе известно.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_01");	//Первым пропал Вильям, один из городских рыбаков. В один прекрасный день он просто не вернулся из плаванья.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_02");	//Сначала мы подумали, что его вместе с его лодкой просто сожрали морские чудовища.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_03");	//Но через некоторое время начали пропадать другие люди, как горожане, так и жители предместий.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_04");	//Найти пока никого не удалось. Похоже на то, что нам остается только ждать, пока кто-нибудь не наткнется на какую-нибудь улику.
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntries(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		if(MissingPeopleReturnedHome == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		};
		B_LogNextEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
		SC_HearedAboutMissingPeople = TRUE;
	};
};

func void DIA_Addon_Lares_PeopleMissing_MIL()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_MIL_15_00");	//Разве этим делом не должно заниматься ополчение?
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_01");	//На мой взгляд, ополчение здесь довольно бесполезно.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_02");	//Люди пропадали безо всяких следов. Нет, ополчению здесь не справиться.
};

func void DIA_Addon_Lares_PeopleMissing_Success()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_00");	//Я знаю, что случилось с пропавшими людьми!
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_01");	//(удивленно) Действительно?
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_02");	//Их похитил бывший рудный барон Ворон.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_03");	//Ты уверен? В таком случае мы должны освободить их.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_04");	//Я над этим работаю.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_05");	//Очень хорошо. И не забывай, если тебе понадобится моя помощь...
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_06");	//... то я знаю, где тебя найти. Все понятно.
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};

func void DIA_Addon_Lares_PeopleMissing_SAVED()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_SAVED_15_00");	//Мне удалось спасти некоторых из похищенных людей.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_SAVED_09_01");	//Я знал, что ты справишься. Теперь я наконец-то смогу заняться своими делами.
	B_GivePlayerXP(XP_Ambient);
	Lares_PeopleMissing_PERM = TRUE;
	Lares_CanBringScToPlaces = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_PeopleMissing);
};


var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld;
var int DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung;

instance DIA_Addon_Lares_RangerHelp(C_Info)
{
	npc = VLK_449_Lares;
	nr = 2;
	condition = DIA_Addon_Lares_RangerHelp_Condition;
	information = DIA_Addon_Lares_RangerHelp_Info;
	permanent = TRUE;
	description = "Мне нужна твоя помощь.";
};


func int DIA_Addon_Lares_RangerHelp_Condition()
{
	if(((Lares_RangerHelp == TRUE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE) && (DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE)) || Npc_IsInState(Moe,ZS_Attack))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_RangerHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_15_00");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_09_01");	//Что именно тебе нужно?
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
	Info_AddChoice(DIA_Addon_Lares_RangerHelp,Dialog_Back,DIA_Addon_Lares_RangerHelp_nix);
	if(Npc_IsInState(Moe,ZS_Attack))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Этот парень мне надоедает...",DIA_Addon_Lares_RangerHelp_Moe);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Мне нужно лучшее оружие.",DIA_Addon_Lares_RangerHelp_waffe);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Как насчет лучшей брони?",DIA_Addon_Lares_RangerHelp_ruestung);
	};
	if((DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld == FALSE) && (Lares_RangerHelp == TRUE))
	{
		Info_AddChoice(DIA_Addon_Lares_RangerHelp,"Мне нужны деньги.",DIA_Addon_Lares_RangerHelp_geld);
	};
};

func void DIA_Addon_Lares_RangerHelp_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_00");	//Как насчет лучшей брони?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_01");	//Хм-м. Броню продает Маттео. Но он сдерет с тебя за нее три шкуры.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_02");	//Но ты можешь получить доспехи бесплатно, если, конечно, ты не против того, чтобы немного нарушить закон...
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_03");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_04");	//Рядом с домом Маттео есть небольшой открытый склад. Но все находящиеся там товары были конфискованы ополчением.
	if(!Npc_IsDead(Zuris))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_05");	//Отправляйся на рынок и купи у Зуриса заклинание сна. Оно позволит тебе усыпить охранника.
		if(!Npc_HasItems(other,ItSc_Sleep) && !Npc_HasItems(Zuris,ItSc_Sleep))
		{
			CreateInvItem(Zuris,ItSc_Sleep);
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_06");	//Уверен, что среди вещей Маттео ты найдешь себе достойную броню...
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_ruestung = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_waffe()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_waffe_15_00");	//Мне нужно лучшее оружие.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01");	//Боюсь, что тут я тебе помочь не могу. Почему бы тебе не сходить на рынок?
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_Waffe = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_geld()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_geld_15_00");	//Мне нужны деньги.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_01");	//А кому они не нужны? Извини, но я сам поиздержался. Впрочем, ростовщик Лемар кое-чем мне обязан.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_02");	//Отправляйся к нему и одолжи столько, сколько тебе нужно. Об остальном я позабочусь. Дом Лемара находится на границе порта и нижнего квартала города.
	DIA_Addon_Lares_RangerHelp_gilde_OneTime_geld = TRUE;
	RangerHelp_LehmarKohle = TRUE;
};

func void DIA_Addon_Lares_RangerHelp_nix()
{
	Info_ClearChoices(DIA_Addon_Lares_RangerHelp);
};

func void DIA_Addon_Lares_RangerHelp_Moe()
{
	AI_Output(other,self,"DIA_Addon_Lares_Moe_15_00");	//Этот парень мне надоедает...
	AI_Output(self,other,"DIA_Addon_Lares_Moe_09_01");	//Ничего, это пройдет...
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self,Moe,AR_GuardStopsFight,0);
};


instance DIA_Lares_Paladine(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = DIA_Lares_Paladine_Condition;
	information = DIA_Lares_Paladine_Info;
	permanent = FALSE;
	description = "Мне во что бы то ни стало нужно поговорить с паладинами!";
};


func int DIA_Lares_Paladine_Condition()
{
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		if((RangerHelp_gildeMIL == FALSE) && (RangerHelp_gildeSLD == FALSE) && (RangerHelp_gildeKDF == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Lares_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Мне во что бы то ни стало нужно поговорить с паладинами!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//Что тебе нужно от них?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//У них есть амулет, Глаз Инноса. Я должен заполучить его.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//И ты думаешь, они отдадут его тебе? Тебе никогда не попасть в верхний квартал города.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_Paladine_09_03_add");	//И ты думаешь, они отдадут его тебе?
	};
	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_Vatras))
	{
		AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Я что-нибудь придумаю.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Конечно, если ты сможешь снискать уважение горожан или станешь мальчиком на побегушках в ополчении...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01_add");	//Боюсь, что тут я тебе помочь не могу.
		};
	};
};


instance DIA_Lares_WhyPalHere(C_Info)
{
	npc = VLK_449_Lares;
	nr = 4;
	condition = DIA_Lares_WhyPalHere_Condition;
	information = DIA_Lares_WhyPalHere_Info;
	permanent = FALSE;
	description = "Ты знаешь, зачем паладины прибыли сюда?";
};


func int DIA_Lares_WhyPalHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_Paladine) || (RangerHelp_gildeMIL == TRUE) || (RangerHelp_gildeSLD == TRUE) || (RangerHelp_gildeKDF == TRUE) || (MIS_Garvell_Infos == LOG_Running))
	{
		if(KnowsPaladins_Ore == FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Lares_WhyPalHere_Info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Ты знаешь, зачем паладины прибыли сюда?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Никто точно не знает этого... Большинство думает, что из-за орков, но мне кажется, причина совсем в другом.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//Скорее всего, это имеет отношение к старой колонии.
};


var int Lares_WayToOnar;

func void B_LaresOffersWayToOnar()
{
	if(Lares_WayToOnar == FALSE)
	{
		if(Lares_CanBringScToPlaces == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_01");	//Если хочешь, я могу тебя проводить.
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_WegZumHof_09_01");	//Я могу отвести тебя туда, если хочешь. Я все равно уже слишком долго здесь ошиваюсь.
		};
		Lares_WayToOnar = TRUE;
	};
};

instance DIA_Addon_Lares_Gilde(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_Gilde_Condition;
	information = DIA_Addon_Lares_Gilde_Info;
	permanent = TRUE;
	description = "Ватрас сказал, что ты можешь помочь мне присоединиться к одному из сообществ.";
};


func int DIA_Addon_Lares_Gilde_Condition()
{
	if((Lares_RangerHelp == TRUE) && (other.guild == GIL_NONE) && (RangerHelp_gildeMIL == FALSE) && (RangerHelp_gildeSLD == FALSE) && (RangerHelp_gildeKDF == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Gilde_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_15_00");	//Ватрас сказал, что ты можешь помочь мне присоединиться к одному из сообществ.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_01");	//(смеется) Что, устал быть человеком второго сорта?
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_02");	//Ладно, я все понимаю.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_03");	//Если ты хочешь присоединиться к Ли, я могу использовать свое влияние среди наемников.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_04");	//Уверен, что мы также сможем найти быстрый способ определить тебя в монастырь.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_05");	//Но проще всего, конечно, тебе будет вступить в ряды ополчения.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_06");	//Итак, что ты предпочитаешь?
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Мне нужно подумать...",DIA_Addon_Lares_Gilde_BACK);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Магов Огня.",DIA_Addon_Lares_Gilde_KDF);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Наемников.",DIA_Addon_Lares_Gilde_SLD);
	Info_AddChoice(DIA_Addon_Lares_Gilde,"Ополчение.",DIA_Addon_Lares_Gilde_MIL);
};

func void DIA_Addon_Lares_Gilde_BACK()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_BACK_15_00");	//Мне нужно подумать...
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_SLD()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00");	//Наемников.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_01");	//Я уверен, что Ли тебя примет.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_01");	//Но сначала тебе придется пройти испытание.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_02");	//Отправляйся на ферму Онара и поговори с Кордом.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_02");	//Он поможет тебе.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_03");	//Скажи ему, что ты 'под моим крылом'. Он тебя поймет.
	if(Npc_KnowsInfo(other,DIA_Addon_Cord_YouAreRanger))
	{
		AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00_add");	//Я поговорил с ним.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(лукаво) Только ты мог провернуть такое...
		B_GivePlayerXP(100);
	}
	else
	{
		B_LaresOffersWayToOnar();
		Log_CreateTopic(TOPIC_Addon_RangerHelpSLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpSLD,LOG_Running);
		B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Ларес сказал, что наемник Корд может сделать мою жизнь среди наемников проще.");
	};
	RangerHelp_gildeSLD = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_MIL()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_MIL_15_00");	//Ополчение.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_01");	//(весело) Я так понимаю, тебе это понравится. Следить за соблюдением законов, в то же время обчищая кошельки горожан.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_02");	//Паладины устроили в гавани склад своих запасов. Их интендант - мой хороший друг.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_03");	//Думаю, он сможет тебе помочь. Его зовут Мартин.
	Log_CreateTopic(TOPIC_Addon_RangerHelpMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpMIL,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpMIL,"Ларес говорит, что интендант Мартин может помочь мне быстро присоединиться к ополчению. Обычно Мартина можно найти в гавани, где он занимается припасами паладинов.");
	RangerHelp_gildeMIL = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};

func void DIA_Addon_Lares_Gilde_KDF()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_KDF_15_00");	//Магов Огня.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_01");	//(смеется) Уверен, Ватрас не предвидел твой выбор. Иначе бы он не послал тебя ко мне.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_02");	//Путь в послушники требует денег.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_03");	//Если ты не заплатишь, тебя просто не пустят в монастырь.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_04");	//Единственный, кто может тут тебе помочь - это сам Ватрас. Так что поговори с ним.
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Ларес сказал, что Ватрас знает легкий способ попасть в монастырь.");
	RangerHelp_gildeKDF = TRUE;
	Info_ClearChoices(DIA_Addon_Lares_Gilde);
};


var int Lares_WorkForLee;

instance DIA_Lares_AboutSld(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_AboutSld_Condition;
	information = DIA_Lares_AboutSld_Info;
	permanent = TRUE;
	description = "Расскажи мне о Ли и наемниках...";
};


func int DIA_Lares_AboutSld_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lares_AboutSld_Info()
{
	AI_Output(other,self,"DIA_ADDON_Lares_AboutSld_15_00");	//Расскажи мне о Ли и наемниках...
	AI_Output(self,other,"DIA_ADDON_Lares_AboutSld_09_01");	//Что ты хочешь узнать?
	Info_ClearChoices(DIA_Lares_AboutSld);
	Info_AddChoice(DIA_Lares_AboutSld,Dialog_Back,DIA_Lares_AboutSld_BACK);
	Info_AddChoice(DIA_Lares_AboutSld,"А почему ТЫ не с Ли и наемниками?",DIA_Lares_AboutSld_WhyNotYou);
	Info_AddChoice(DIA_Lares_AboutSld,"Расскажи мне подробнее о наемниках.",DIA_Lares_AboutSld_Sld);
	if(Lares_WayToOnar == FALSE)
	{
		Info_AddChoice(DIA_Lares_AboutSld,"Как мне найти ферму лендлорда?",DIA_Lares_AboutSld_WayToOnar);
	};
};

func void DIA_Lares_AboutSld_BACK()
{
	Info_ClearChoices(DIA_Lares_AboutSld);
};

func void DIA_Lares_AboutSld_Sld()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Расскажи мне подробнее о наемниках.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Ну, если ты так же силен, как был в долине, то у тебя не должно возникнуть проблем с ними.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Большинство из них настоящие головорезы, и если ты не сможешь дать им отпор, то далеко ты не продвинешься.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(смеется) Если ты проявишь слабость, у тебя не будет шансов присоединиться к ним...
};

func void DIA_Lares_AboutSld_WhyNotYou()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//А почему ТЫ не с Ли и наемниками?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Я с ними! Просто я сейчас не на ферме.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Можно сказать, я их аванпост в городе. Мы не хотим, чтобы корабль уплыл без нас.
	Lares_WorkForLee = TRUE;
	Info_AddChoice(DIA_Lares_AboutSld,"О каком корабле ты говоришь?",DIA_Lares_AboutSld_Schiff);
};

func void DIA_Lares_AboutSld_Schiff()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//О каком корабле ты говоришь?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Он стоит в гавани порта, за утесами. Ли и часть его людей очень хотят убраться отсюда.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Но это может занять некоторое время...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Почему?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Тебе лучше спросить об этом Ли, если встретишь его... У него есть план.
	B_LaresOffersWayToOnar();
};

func void DIA_Lares_AboutSld_WayToOnar()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Как мне найти ферму лендлорда?
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_00");	//Это довольно просто. Ты выходишь из города через восточные ворота, а затем следуешь по дороге на восток.
	B_LaresOffersWayToOnar();
};

instance DIA_Lares_GuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 14;
	condition = DIA_Lares_GuildOfThieves_Condition;
	information = DIA_Lares_GuildOfThieves_Info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о городской гильдии воров?";
};


func int DIA_Lares_GuildOfThieves_Condition()
{
	if(((MIS_Andre_GuildOfThieves == LOG_Running) || Npc_KnowsInfo(other,DIA_Lares_GotKey)) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Ты знаешь что-нибудь о городской гильдии воров?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Ну и вопросы ты задаешь...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Конечно, здесь есть гильдия воров. Как и в любом большом городе.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//И каждый более-менее стоящий вор, вероятно, как-то связан с ними.
};


instance DIA_Lares_WhereGuildOfThieves(C_Info)
{
	npc = VLK_449_Lares;
	nr = 15;
	condition = DIA_Lares_WhereGuildOfThieves_Condition;
	information = DIA_Lares_WhereGuildOfThieves_Info;
	permanent = FALSE;
	description = "Ты знаешь, где мне найти гильдию воров?";
};


func int DIA_Lares_WhereGuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GuildOfThieves) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_WhereGuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Ты знаешь, где мне найти гильдию воров?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(смеется) Не обижайся, но даже если бы знал, не сказал бы.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Эти люди обычно ОЧЕНЬ жестко реагируют на такие вещи.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Если ты собираешься связаться с ними, тебе нужно быть поосторожнее.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lares_WegZumHof_09_02");	//Ополчение в гавани бывает редко, но все же не стоит рисковать и вызывать их подозрения...
	};
};


instance DIA_Lares_GotKey(C_Info)
{
	npc = VLK_449_Lares;
	nr = 16;
	condition = DIA_Lares_GotKey_Condition;
	information = DIA_Lares_GotKey_Info;
	permanent = FALSE;
	description = "Я нашел здесь этот ключ. Он весь изъеден морской водой...";
};


func int DIA_Lares_GotKey_Condition()
{
	if(Npc_HasItems(other,ItKe_ThiefGuildKey_MIS) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_GotKey_Info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Я нашел здесь этот ключ. Он весь изъеден морской водой...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//И?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Я думаю, он приведет меня к логову воровской гильдии...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Ну, это может быть ключ от канализации.
};


instance DIA_Lares_Kanalisation(C_Info)
{
	npc = VLK_449_Lares;
	nr = 17;
	condition = DIA_Lares_Kanalisation_Condition;
	information = DIA_Lares_Kanalisation_Info;
	permanent = FALSE;
	description = "Где мне найти канализацию?";
};


func int DIA_Lares_Kanalisation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lares_GotKey) && (DG_gefunden == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_Kanalisation_Info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Где мне найти канализацию?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//Насколько я знаю... канализации обычно выходят в океан.
};


instance DIA_Lares_OtherGuild(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_OtherGuild_Condition;
	information = DIA_Lares_OtherGuild_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_OtherGuild_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild != GIL_NONE) && (SC_IsRanger == FALSE) && (Lares_FirstMetAsGuildless == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lares_OtherGuild_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Теперь ты в ополчении!
			B_Lares_Comment_MIL();
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_09");	//Я слышал, ты был принят.
			B_Lares_Comment_PAL();
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(лукаво) Только ты мог провернуть такое...
		if(Lares_WorkForLee == TRUE)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(озабоченно) Ты ведь никому не расскажешь, что я работаю на Ли, правда?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Ты же знаешь меня...
		};
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Я не понимаю. Ты поступил в монастырь. Как там тебе?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//По-разному.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Представляю.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		B_Lares_Comment_SLD();
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Поздравляю.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_Forest(C_Info)
{
	npc = VLK_449_Lares;
	nr = 9;
	condition = DIA_Addon_Lares_Forest_Condition;
	information = DIA_Addon_Lares_Forest_Info;
	description = "Ты можешь проводить меня через восточный лес?";
};


func int DIA_Addon_Lares_Forest_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_Forest_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_00");	//Ты можешь проводить меня через восточный лес?
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_01");	//Конечно. Но что тебе там нужно?
	};
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_02");	//Нефариус поручил мне найти недостающие орнаменты.
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_03");	//Одно из указанных им мест находится как раз в этом лесу.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_04");	//Понимаю. Пока тебе идти туда одному было бы слишком опасно.
		AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_05");	//Хорошо. Когда ты будешь готов отправляться, скажи.
		RangerHelp_OrnamentForest = TRUE;
	}
	else
	{
		B_LaresCantGoToPlaces();
	};
};


func void DIA_Lares_GoNow_GoingConditions()
{
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Пошли... Иди за мной.
	AI_StopProcessInfos(self);
	Lares_Distracted = FALSE;
	Lares_Guide = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if(!Npc_KnowsInfo(other,DIA_Moe_Hallo) && !Npc_IsDead(Moe))
	{
		Npc_SetRefuseTalk(Moe,30);
	};
};

func void DIA_Addon_Lares_InfoOutsideTheCity1()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_00");	//Теперь, когда мы покинули город и нас не могут подслушать, я хочу тебе кое-что рассказать.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//Орнамент, который ты мне отдал, нужно отнести Сатурасу. Ты же помнишь Сатураса, не так ли?
};

func void DIA_Addon_Lares_InfoOutsideTheCity2()
{
	B_LaresTellAboutKDW1();
	B_MakeRangerReadyForMeeting(self);
	if(Lares_ArmorComment == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03");	//А такие доспехи выдают маги Воды каждому из нас. Члены общества Кольца Воды носили такую броню еще до войны с орками.
		Lares_ArmorComment = TRUE;
	};
	if(Cavalorn_RangerHint == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04");	//А как ко всему этому относится Кавалорн? Насколько я знаю, в Новом Лагере он ничем таким не занимался.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05");	//Ты прав. Но наше сообщество растет, и даже я не знаю, сколько членов оно сейчас насчитывает.
	};
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06");	//Но нам нужно идти. Когда мы отойдем подальше от города, мы сможем поговорить еще.
};

func void B_StartLaresGuideToPortal()
{
	if(B_GetLaresLocation() == LOC_CITY)
	{
		LaresGuide_ZumPortal = 1;
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");
	}
	else
	{
		LaresGuide_ZumPortal = 3;
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL3");
	};
	DIA_Lares_GoNow_GoingConditions();
};

instance DIA_Lares_GoNow(C_Info)
{
	npc = VLK_449_Lares;
	nr = 10;
	condition = DIA_Lares_GoNow_Condition;
	information = DIA_Lares_GoNow_Info;
	permanent = TRUE;
	description = "Хорошо, пошли.";
};


func int DIA_Lares_GoNow_Condition()
{
	if((Lares_WayToOnar == TRUE) || (MIS_Addon_Lares_Ornament2Saturas == LOG_Running) || (RangerHelp_OrnamentForest == TRUE))
	{
		if(Kapitel >= 3)
		{
			return FALSE;
		};
		if((LaresGuide_ZumPortal > 0) && (LaresGuide_ZumPortal < 8))
		{
			return FALSE;
		};
		if(LaresGuide_ZuOnar == 1)
		{
			return FALSE;
		};
		if((LaresGuide_OrnamentForest > 0) && (LaresGuide_OrnamentForest < 3))
		{
			return FALSE;
		};
		return TRUE;
	};
};

func void DIA_Lares_GoNow_Info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Хорошо, пошли.
	if(Lares_CanBringScToPlaces == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_03");	//Я не могу уйти отсюда, пока мы не узнаем больше о пропавших людях или пока меня кто-нибудь не сменит.
	}
	else if(MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running)
	{
		B_Lares_Geheimtreffen();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_04");	//Куда?
		Info_ClearChoices(DIA_Lares_GoNow);
		Info_AddChoice(DIA_Lares_GoNow,Dialog_Back,DIA_Lares_GoNow_warte);
		if((Lares_WayToOnar == TRUE) && (LaresGuide_ZuOnar != 2))
		{
			Info_AddChoice(DIA_Lares_GoNow,"На ферму Онара.",DIA_Lares_GoNow_Onar);
		};
		if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && (LaresGuide_ZumPortal != 8))
		{
			Info_AddChoice(DIA_Lares_GoNow,"Давай вернем орнамент Ватраса.",DIA_Lares_GoNow_Maya);
		};
		if((RangerHelp_OrnamentForest == TRUE) && (LaresGuide_OrnamentForest != 3))
		{
			Info_AddChoice(DIA_Lares_GoNow,"В лес на востоке.",DIA_Lares_GoNow_Forest);
		};
	};
};

func void DIA_Lares_GoNow_Maya()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Maya_15_00");	//Давай вернем орнамент Ватраса.
	if(B_GetLaresLocation() == LOC_CITY)
	{
		LaresGuide_ZumPortal = 1;
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");
		DIA_Lares_GoNow_GoingConditions();
	}
	else
	{
		if(LaresToldAboutKDW1 == FALSE)
		{
			DIA_Addon_Lares_InfoOutsideTheCity1();
			Info_ClearChoices(DIA_Lares_GoNow);
			Info_AddChoice(DIA_Lares_GoNow,"Конечно.",DIA_Lares_GoNow_Maya_ja);
			Info_AddChoice(DIA_Lares_GoNow,"Сатурас? Кто это такой?",DIA_Lares_GoNow_Maya_wer);
		}
		else
		{
			B_StartLaresGuideToPortal();
		};
	};
};

func void DIA_Lares_GoNow_Maya_wer()
{
	B_SCForgotSaturas();
	DIA_Addon_Lares_InfoOutsideTheCity2();
	B_StartLaresGuideToPortal();
};

func void DIA_Lares_GoNow_Maya_ja()
{
	B_SCRememberSaturas();
	DIA_Addon_Lares_InfoOutsideTheCity2();
	B_StartLaresGuideToPortal();
};

func void DIA_Lares_GoNow_Onar()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Onar_15_00");	//На ферму Онара.
	LaresGuide_ZuOnar = 1;
	Npc_ExchangeRoutine(self,"GUIDE");
	DIA_Lares_GoNow_GoingConditions();
};

func void DIA_Lares_GoNow_Forest()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Forest_15_00");	//В лес на востоке.
	LaresGuide_OrnamentForest = 1;
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD1");
	DIA_Lares_GoNow_GoingConditions();
};

func void DIA_Lares_GoNow_warte()
{
	Info_ClearChoices(DIA_Lares_GoNow);
};


func void B_LaresDistractionCheck()
{
	if(Lares_Guide > (Wld_GetDay() - 2))
	{
		if(C_NpcIsNearWP(self,"NW_TAVERNE_BIGFARM_05"))
		{
			AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//Пришли.
		}
		else if(C_NpcIsNearWP(self,"NW_TROLLAREA_RUINS_41") || C_NpcIsNearWP(self,"NW_FOREST_PATH_62"))
		{
			AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_00");	//Мы на месте.
		}
		else if(Lares_Distracted == TRUE)
		{
			if(LaresGuide_ZumPortal == 3)
			{
				AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00");	//Не отвлекай меня.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00");	//В чем дело? Почему ты задерживаешься?
			};
		}
		else
		{
			if(LaresGuide_ZumPortal == 3)
			{
				AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//Вопросы есть?
			}
			else if(!C_NpcIsNearWP(self,"NW_CITY_TO_FARM2_04"))
			{
				AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00");	//Ты идешь дальше?
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//Вот ты где. А я уж начал думать, что тебя загрызли волки.
	};
};

instance DIA_Lares_GUIDE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Lares_GUIDE_Condition;
	information = DIA_Lares_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lares_GUIDE_Condition()
{
	if((LaresGuide_ZuOnar == 1) && C_NpcIsNearWP(self,"NW_TAVERNE_BIGFARM_05"))
	{
		return TRUE;
	};
};

func void DIA_Lares_GUIDE_Info()
{
	B_LaresDistractionCheck();
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//Что ж, оставшуюся часть пути ты сможешь пройти сам. А мне нужно возвращаться в город...
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Просто пойдешь по этой дороге. Но помни - сумей постоять за себя, не нарушай закон и все будет в порядке.
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lares_Paladine))
	{
		AI_Output(self,other,"DIA_Lares_Alternative_09_01");	//На твоем месте я бы пошел на ферму Онара и поговорил с Ли.
		AI_Output(self,other,"DIA_Lares_Alternative_09_02");	//Я уверен, он найдет способ попасть в верхний квартал.
	};
	Knows_Taverne = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LaresGuide_ZuOnar = 2;
};


instance DIA_Addon_Lares_ArrivedPortalInter1(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortalInter1_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInter1_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInter1_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && C_NpcIsNearWP(self,"NW_CITY_TO_FOREST_11") && (LaresGuide_ZumPortal == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter1_Info()
{
	if(LaresToldAboutKDW1 == FALSE)
	{
		DIA_Addon_Lares_InfoOutsideTheCity1();
		Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
		Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1,"Конечно.",DIA_Addon_Lares_ArrivedPortalInter1_ja);
		Info_AddChoice(DIA_Addon_Lares_ArrivedPortalInter1,"Сатурас? Кто это такой?",DIA_Addon_Lares_ArrivedPortalInter1_wer);
	}
	else 
	{
		B_LaresDistractionCheck();
		B_MakeRangerReadyForMeeting(self);
	};
	LaresGuide_ZumPortal = 2;
};

func void DIA_Addon_Lares_ArrivedPortalInter1_wer()
{
	B_SCForgotSaturas();
	DIA_Addon_Lares_InfoOutsideTheCity2();
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
};

func void DIA_Addon_Lares_ArrivedPortalInter1_ja()
{
	B_SCRememberSaturas();
	DIA_Addon_Lares_InfoOutsideTheCity2();
	Info_ClearChoices(DIA_Addon_Lares_ArrivedPortalInter1);
};


var int LaresKnowsErolProblem;

func void B_TellLaresAboutErolProblem()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01");	//У этого парня проблемы с бандитами.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02");	//Бедняга. К сожалению, сейчас у нас нет на него времени.
	LaresKnowsErolProblem = TRUE;
};

func int C_SCCanTellLaresAboutErolProblem()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_Running) && !Npc_IsDead(Erol) && (LaresKnowsErolProblem == FALSE))
	{
		if((Npc_GetDistToWP(self,"NW_TAVERN_TO_FOREST_03") < 1000) && (Npc_GetDistToWP(Erol,"NW_TAVERN_TO_FOREST_03") < 1000))
		{
			return TRUE;
		};
	};
	return FALSE;
};

instance DIA_Addon_Lares_ArrivedPortalInterWeiter(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && C_NpcIsNearWP(self,"NW_TAVERN_TO_FOREST_02") && (LaresGuide_ZumPortal == 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter_Info()
{
	B_LaresDistractionCheck();
	if(C_SCCanTellLaresAboutErolProblem())
	{
		B_TellLaresAboutErolProblem();
	};
	LaresGuide_ZumPortal = 3;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter2_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && C_NpcIsNearWP(self,"NW_TAVERNE_TROLLAREA_14") && (LaresGuide_ZumPortal == 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter2_Info()
{
	B_LaresDistractionCheck();
	LaresGuide_ZumPortal = 4;
};


instance DIA_Addon_Lares_ArrivedPortalInter2(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortalInter2_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInter2_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInter2_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && C_NpcIsNearWP(self,"NW_TROLLAREA_PATH_58") && (LaresGuide_ZumPortal == 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInter2_Info()
{
	if(LaresToldAboutKDW2 == FALSE)
	{
		B_LaresTellAboutKDW2();
	}
	else
	{
		B_LaresDistractionCheck();
	};
	LaresGuide_ZumPortal = 5;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter3(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter3_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) && (LaresGuide_ZumPortal == 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter3_Info()
{
	B_LaresDistractionCheck();
	LaresGuide_ZumPortal = 6;
};


instance DIA_Addon_Lares_ArrivedPortalInterWeiter4(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition;
	information = DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortalInterWeiter4_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && C_NpcIsNearWP(self,"NW_TROLLAREA_RUINS_02") && (LaresGuide_ZumPortal == 6))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortalInterWeiter4_Info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00");	//Очень хорошо. Здесь может быть опасно.
	B_StartOtherRoutine(BridgeBandit,"Intercept");
	LaresGuide_ZumPortal = 7;
};


instance DIA_Addon_Lares_ArrivedPortal(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_ArrivedPortal_Condition;
	information = DIA_Addon_Lares_ArrivedPortal_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_ArrivedPortal_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_Running) && C_NpcIsNearWP(self,"NW_TROLLAREA_RUINS_41") && (LaresGuide_ZumPortal == 7))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ArrivedPortal_Info()
{
	B_MakeRangerReadyToLeaveMeeting(self);
	B_LaresDistractionCheck();
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_01");	//Возьми орнамент. Маги Воды должны быть где-то внизу. Отнеси орнамент им.
	AI_WaitTillEnd(other,self);
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_02");	//Если внизу ты встретишь каких-нибудь диких зверей, с которыми не сможешь справиться, беги к Сатурасу.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_03");	//Он с ними разберется. Ну а мне нужно возвращаться.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//Да, и еще одно. Не стоит бродить по округе с этим орнаментом. Сразу же отправляйся к Сатурасу.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//До встречи.
	B_LogEntry(TOPIC_Addon_KDW,"Ларес дал мне этот орнамент. Он хочет, чтобы я передал его магу Воды Сатурасу.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LaresGuide_ZumPortal = 8;
	Lares_Angekommen = TRUE;
};


instance DIA_Addon_Lares_Albern(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_Albern_Condition;
	information = DIA_Addon_Lares_Albern_Info;
	important = TRUE;
};


func int DIA_Addon_Lares_Albern_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS) && (Lares_Angekommen == TRUE))
	{
		if(Npc_GetDistToWP(self,"NW_TROLLAREA_RUINS_41") > 1000)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Lares_Albern_Info()
{
	if(B_GetLaresLocation() == LOC_CITY)
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//Ну что, договорились?
		DIA_Common_NoNotYet();
	};
	AI_Output(self,other,"DIA_Addon_Lares_Albern_09_00");	//(строго) Прекрати паясничать! Немедленно отнеси орнамент Сатурасу!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lares_GOFORESTPRE(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_GOFORESTPRE_Condition;
	information = DIA_Addon_Lares_GOFORESTPRE_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Lares_GOFORESTPRE_Condition()
{
	if(C_NpcIsNearWP(self,"NW_CITY_TO_FARM2_04") && (LaresGuide_OrnamentForest == 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_GOFORESTPRE_Info()
{
	B_LaresDistractionCheck();
	if(Ornament_Switched_Forest == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_00");	//Ты все еще хочешь пойти со мной в лес?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_01");	//Ты уже подумал о походе в лес? Ты действительно хочешь туда направиться?
	};
	Lares_Distracted = FALSE;
	Info_ClearChoices(DIA_Addon_Lares_GOFORESTPRE);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE,"Нет, можешь идти.",DIA_Addon_Lares_GOFORESTPRE_nein);
	Info_AddChoice(DIA_Addon_Lares_GOFORESTPRE,"Да.",DIA_Addon_Lares_GOFORESTPRE_ja);
};

func void DIA_Addon_Lares_GOFORESTPRE_ja()
{
	B_MakeRangerReadyForMeeting(self);
	DIA_Common_Yes();
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_ja_09_01");	//Прекрасно, друг мой. В таком случае, следуй за мной. Здесь может быть небезопасно.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LaresGuide_OrnamentForest = 2;
};

func void DIA_Addon_Lares_GOFORESTPRE_nein()
{
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_nein_15_00");	//Нет, можешь идти.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_nein_09_01");	//Я так понимаю, проблема решилась сама собой? Ладно, увидимся позже.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LaresGuide_OrnamentForest = 3;
};

instance DIA_Addon_Lares_GOFOREST(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_GOFOREST_Condition;
	information = DIA_Addon_Lares_GOFOREST_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Lares_GOFOREST_Condition()
{
	if(C_NpcIsNearWP(self,"NW_FOREST_PATH_62") && (LaresGuide_OrnamentForest == 2) && Npc_IsDead(Stoneguardian_Ornament))
	{
		if(Lares_ArrivedToForest == FALSE)
		{
			return TRUE;
		};
		if((Ornament_Switched_Forest == FALSE) && Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
		if(Ornament_Switched_Forest == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Lares_GOFOREST_Info()
{
	if(Lares_ArrivedToForest == FALSE)
	{
		B_LaresDistractionCheck();
		Lares_ArrivedToForest = TRUE;
	};
	if(Ornament_Switched_Forest == TRUE)
	{
		B_MakeRangerReadyToLeaveMeeting(self);
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_00");	//Ну вот. Дальше ты дойдешь сам. А я отправляюсь обратно.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
		LaresGuide_OrnamentForest = 3;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_01");	//Поторопись! Я не хочу оставаться здесь дольше, чем необходимо.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Lares_PortalInterWEITER(C_Info)
{
	npc = VLK_449_Lares;
	nr = 1;
	condition = DIA_Addon_Lares_PortalInterWEITER_Condition;
	information = DIA_Addon_Lares_PortalInterWEITER_Info;
	permanent = TRUE;
	description = "Двигаемся дальше.";
};


func int DIA_Addon_Lares_PortalInterWEITER_Condition()
{
	if((LaresGuide_ZumPortal != 0) && (LaresGuide_ZumPortal != 8))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_PortalInterWEITER_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_02");	//Двигаемся дальше.
	Lares_Distracted = FALSE;
	Lares_Guide = Wld_GetDay();
	if(LaresGuide_ZumPortal == 7)
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_03");	//Отойди немного назад.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_04");	//Держись ко мне поближе.
	};
	if(LaresGuide_ZumPortal == 4)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_00");	//Прекрати болтать.
	}
	else if(LaresGuide_ZumPortal == 6)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_01");	//(раздраженно) Да, да.
	};
	AI_StopProcessInfos(self);
	if(LaresGuide_ZumPortal == 2)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL2");
	}
	else if(LaresGuide_ZumPortal == 3)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL3");
	}
	else if(LaresGuide_ZumPortal == 4)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL4");
	}
	else if(LaresGuide_ZumPortal == 5)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL5");
		if(!Npc_IsDead(BridgeBandit))
		{
			if(Hlp_IsValidNpc(Gobbo_Black_Crossbow_Guard_01) && !Npc_IsDead(Gobbo_Black_Crossbow_Guard_01))
			{
				Npc_ChangeAttribute(Gobbo_Black_Crossbow_Guard_01,ATR_HITPOINTS,-Gobbo_Black_Crossbow_Guard_01.attribute[ATR_HITPOINTS_MAX]);
			};
			if(Hlp_IsValidNpc(Gobbo_Black_Crossbow_Guard_02) && !Npc_IsDead(Gobbo_Black_Crossbow_Guard_02))
			{
				Npc_ChangeAttribute(Gobbo_Black_Crossbow_Guard_02,ATR_HITPOINTS,-Gobbo_Black_Crossbow_Guard_02.attribute[ATR_HITPOINTS_MAX]);
			};
			B_StartOtherRoutine(BridgeBandit,"Hide");
		};
	}
	else if(LaresGuide_ZumPortal == 6)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL6");
	}
	else if(LaresGuide_ZumPortal == 7)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPELEND");
	};
};


instance DIA_Addon_Lares_ErolProblem(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Addon_Lares_ErolProblem_Condition;
	information = DIA_Addon_Lares_ErolProblem_Info;
	permanent = FALSE;
	description = "У этого парня проблемы с бандитами.";
};


func int DIA_Addon_Lares_ErolProblem_Condition()
{
	if(C_SCCanTellLaresAboutErolProblem())
	{
		return TRUE;
	};
};

func void DIA_Addon_Lares_ErolProblem_Info()
{
	B_TellLaresAboutErolProblem();
};


instance DIA_Lares_DEX(C_Info)
{
	npc = VLK_449_Lares;
	nr = 20;
	condition = DIA_Lares_DEX_Condition;
	information = DIA_Lares_DEX_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Lares_DEX_Condition()
{
	return TRUE;
};

func void DIA_Lares_DEX_Info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Addon_Lares_DEX_Add_09_01");	//Конечно. Я могу помочь тебе стать более сильным и ловким.
	Lares_TeachDEX = TRUE;
	if(DIA_Kardif_Lernen_permanent == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Ларес может помочь мне повысить мою ловкость и силу.");
	};
};


var int Lares_MerkeDEX;
var int Lares_MerkeSTR;

func void B_BuildLearnDialog_Lares()
{
	Info_ClearChoices(DIA_Lares_TEACH);
	Info_AddChoice(DIA_Lares_TEACH,Dialog_Back,DIA_Lares_TEACH_BACK);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_TEACH_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_TEACH_5);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Lares_TEACHSTR_1);
	Info_AddChoice(DIA_Lares_TEACH,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Lares_TEACHSTR_5);
};

instance DIA_Lares_TEACH(C_Info)
{
	npc = VLK_449_Lares;
	nr = 20;
	condition = DIA_Lares_TEACH_Condition;
	information = DIA_Lares_TEACH_Info;
	permanent = TRUE;
	description = "Тренируй меня.";
};


func int DIA_Lares_TEACH_Condition()
{
	if(Lares_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lares_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teach_15_00");	//Тренируй меня.
	Lares_MerkeDEX = other.aivar[REAL_DEXTERITY];
	Lares_MerkeSTR = other.aivar[REAL_STRENGTH];
	B_BuildLearnDialog_Lares();
};

func void DIA_Lares_TEACH_BACK()
{
	if(other.aivar[REAL_DEXTERITY] > Lares_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Ты уже стал более ловким.
	};
	if(other.aivar[REAL_STRENGTH] > Lares_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Addon_Lares_TEACH_BACK_Add_09_00");	//(оценивающе) Очень хорошо. Ты стал сильнее.
	};
	Info_ClearChoices(DIA_Lares_TEACH);
};

func void DIA_Lares_TEACH_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		B_BuildLearnDialog_Lares();
	};
};

func void DIA_Lares_TEACH_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		B_BuildLearnDialog_Lares();
	};
};

func void DIA_Lares_TEACHSTR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_LOW))
	{
		B_BuildLearnDialog_Lares();
	};
};

func void DIA_Lares_TEACHSTR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_LOW))
	{
		B_BuildLearnDialog_Lares();
	};
};

var int Lares_AnyNews_OneTime;

instance DIA_Lares_AnyNews(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_AnyNews_Condition;
	information = DIA_Lares_AnyNews_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Lares_AnyNews_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lares_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Есть новости?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		if(Lares_AnyNews_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Основные новости связаны с тобой. Беннета отпустили, и он возвращается на ферму.
			if(!Npc_KnowsInfo(other,DIA_Bennet_Present))
			{
				AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//Иди к нему, я думаю, он хочет отблагодарить тебя лично.
			};
			Lares_AnyNews_OneTime = TRUE;
		}
		else
		{
			DIA_Common_09_AllQuiet();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Можно сказать и так. Паладины арестовали Беннета, нашего кузнеца.
		if(MIS_RescueBennet == LOG_Running)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//Я слышал. Нечистое это дело.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//Ну, ты сам все понимаешь.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Как это случилось?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Беннет пришел в город за покупками. Но вернуться ему было не суждено.
			MIS_RescueBennet = LOG_Running;
			Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
			B_LogEntry(TOPIC_RescueBennet,"Кузнец Беннет арестован паладинами в городе.");
			if(Hodges_isAlive_Kap3 == TRUE)
			{
				AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Если хочешь узнать больше, расспроси Ходжеса, он был в городе вместе с Беннетом.
				if(!Npc_KnowsInfo(other,DIA_Hodges_BennetsCrime))
				{
					Log_AddEntry(TOPIC_RescueBennet,"Чтобы узнать больше, мне надо поговорить с его учеником Ходжесом.");
				};
			};
 		};
	};
};


instance DIA_Lares_NewsAboutBennet(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Lares_NewsAboutBennet_Condition;
	information = DIA_Lares_NewsAboutBennet_Info;
	permanent = FALSE;
	description = "Есть новости о Беннете?";
};


func int DIA_Lares_NewsAboutBennet_Condition()
{
	if(MIS_RescueBennet == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lares_NewsAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Есть новости о Беннете?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Его увели в казармы и бросили там за решетку.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Как нам вызволить его оттуда?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Пока у меня нет никаких идей. Я не могу пробраться в его камеру и поговорить с ним.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Все, что мне остается - это держать ушки на макушке, может, мне удастся что-то узнать.
};


instance DIA_Lares_Kap4_PERM(C_Info)
{
	npc = VLK_449_Lares;
	nr = 6;
	condition = DIA_Lares_Kap4_PERM_Condition;
	information = DIA_Lares_Kap4_PERM_Info;
//	permanent = TRUE;
	permanent = FALSE;
	description = "Почему ты не охотишься на драконов?";
};


func int DIA_Lares_Kap4_PERM_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Lares_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Почему ты не охотишься на драконов?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//Это не по мне. Пусть этим занимаются другие.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Нет уж, спасибо. Чистый морской воздух - это все, что мне сейчас нужно.
};


instance DIA_Lares_KnowWhereEnemy(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_KnowWhereEnemy_Condition;
	information = DIA_Lares_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Ты не хочешь покинуть этот остров?";
};


func int DIA_Lares_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lares_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Ты не хочешь покинуть этот остров?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Это самое большое мое желание. А что ты задумал?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Я выяснил, где скрывается повелитель драконов. Он на острове, недалеко отсюда.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Я собираюсь избавиться от него раз и навсегда.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Звучит заманчиво. Если я тебе нужен, ты можешь на меня рассчитывать.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Тебе не нужен учитель ловкости или боя одноручным оружием в твоем путешествии?
	if(SCToldLaresHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"Если я возьму с собой Лареса, то он сможет помочь мне с одноручным оружием и повысить мою ловкость.");
		SCToldLaresHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Корабль уже полон, но я вернусь к тебе, если что-то изменится.
	}
	else
	{
		Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"Я ценю твое предложение, но вынужден отказать тебе.",DIA_Lares_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lares_KnowWhereEnemy,"Я знал, что могу положиться на тебя.",DIA_Lares_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lares_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Я знал, что могу положиться на тебя.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Встретимся у корабля.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Ты человек действия - это мне нравится. Увидимся позже.
	B_JoinShip(self);
};

func void DIA_Lares_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Я ценю твое предложение, но вынужден отказать тебе.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Ты должен понять, что ты хочешь. Если захочешь вернуться к этому вопросу, ты знаешь, где меня найти.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Info_ClearChoices(DIA_Lares_KnowWhereEnemy);
};


instance DIA_Lares_LeaveMyShip(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_LeaveMyShip_Condition;
	information = DIA_Lares_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Будет лучше, если ты не поплывешь со мной.";
};


func int DIA_Lares_LeaveMyShip_Condition()
{
	if((Lares_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Будет лучше, если ты не поплывешь со мной.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Как знаешь, но в будущем думай, что ты обещаешь и кому.
	if(hero.guild == GIL_DJG)
	{
		Lares_IsOnBoard = LOG_OBSOLETE;
	}
	else
	{
		Lares_IsOnBoard = LOG_FAILED;
	};
	Crewmember_Count -= 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lares_StillNeedYou(C_Info)
{
	npc = VLK_449_Lares;
	nr = 5;
	condition = DIA_Lares_StillNeedYou_Condition;
	information = DIA_Lares_StillNeedYou_Info;
	permanent = TRUE;
	description = "Ты все еще заинтересован в месте на корабле?";
};


func int DIA_Lares_StillNeedYou_Condition()
{
	if(((Lares_IsOnBoard == LOG_OBSOLETE) || (Lares_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lares_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Ты все еще заинтересован в месте на корабле?
	if(Lares_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Обычно я не позволяю людям так обращаться со мной, но так как ты - один из нас, на этот раз я тебя прощу.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Встретимся на корабле.
		B_JoinShip(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Не обижайся, но я думаю, ты был прав.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Мне лучше остаться здесь.
		AI_StopProcessInfos(self);
	};
	B_CheckLog();
};

