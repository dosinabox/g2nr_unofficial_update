
instance DIA_Addon_Saturas_EXIT(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 999;
	condition = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_EXIT_Info()
{
	if((MIS_Addon_Saturas_BringRiordian2Me == FALSE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01") < 700))
	{
		if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Addon_Saturas_Nefarius) || (VatrasLetterGivenToSaturas == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Saturas_geheimbund) || (SaturasKnows_SC_IsRanger == TRUE))
		{
			if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Addon_Saturas_Nefarius) || (VatrasLetterGivenToSaturas == TRUE))
			{
				AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//Ну, раз никаким другим образом тебя нельзя уговорить оставить в покое других магов, придется дать тебе задание.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//Доложи Риордиану, что я его жду.
			AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//Ты найдешь его в задней части хранилища.
			MIS_Addon_Saturas_BringRiordian2Me = LOG_Running;
			Log_CreateTopic(TOPIC_Addon_HolRiordian,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_HolRiordian,LOG_Running);
			B_LogEntry(TOPIC_Addon_HolRiordian,"Сатурас хочет, чтобы я прислал к нему мага Риордиана. Он должен быть в одном из дальних залов.");
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Nefarius(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Nefarius_Condition;
	information = DIA_Addon_Saturas_Nefarius_Info;
	description = "Я взялся помочь Нефариусу и найти потерянные части орнамента.";
};


func int DIA_Addon_Saturas_Nefarius_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Nefarius_Info()
{
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//Я взялся помочь Нефариусу и найти потерянные части орнамента.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//Что? Быть того не может! Ты опять вмешиваешься?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//Не надо беспокоиться. Все доставлю как есть.
	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//(вздыхает) Ты хоть знаешь, что ты ищешь?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//Ну, Нефариус дал мне эту карту...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//Покажи ее мне!
		AI_PrintScreen("Карта Нефариуса отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		B_UseFakeMap();
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//Хм. В большом лесу чрезвычайно опасно. Не следует направляться туда одному.
		if(Kapitel < 3)
		{
			AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//Найди кого-нибудь в Хоринисе, кто мог бы пойти с тобой.
			B_LogEntry(TOPIC_Addon_Ornament,"Сатурас посоветовал мне не отправляться в одиночку на поиски части орнамента, которая находится в лесу. Я должен найти в Хоринисе кого-нибудь, кто пойдет со мной.");
		}
		else
		{
			B_LogEntry(TOPIC_Addon_Ornament,"Сатурас предупредил меня, что в лесу, где мне предстоит искать орнамент, может быть довольно опасно.");
		};
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//Не то, чтобы я о тебе волнуюсь, но монстры могут съесть орнамент вместе с тобой.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//Вот твоя карта...
		AI_PrintScreen("Карта Нефариуса получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	};
};


instance DIA_Addon_Saturas_Hallo(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Hallo_Condition;
	information = DIA_Addon_Saturas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Saturas_Hallo_Condition()
{
	Npc_PerceiveAll(self);
	if(!Wld_DetectNpc(self,Gobbo_Skeleton,ZS_MM_Attack,-1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Hallo_YouKnow()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiЯtdu_14_00");	//Ты хоть имеешь представление о том, что ты наделал?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiЯtdu_14_01");	//Ты настолько сильно пошатнул базовую структуру магического естества, что в Хоринисе все чуть не оглохли.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiЯtdu_14_02");	//Скажи спасибо, что Барьера больше нет.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_weiЯtdu_15_03");	//Что же ты жалуешься, старче? Все ведь сработано как надо.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiЯtdu_14_04");	//(высокомерно) Следите за языком, юноша!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiЯtdu_14_05");	//(раздраженно) Что, во имя всех стихий, тебе здесь нужно?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
};

func void DIA_Addon_Saturas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//Ты спятил? Вон!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//Под сводами этого места слишком опасно для начинающего искателя приключений.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//(раздраженно) Но постой, разве я тебя не знаю? Ну, конечно! Проклятый ублюдок...
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//(раздраженно) Не думаешь ли ты, что я забыл, как ты предал нас тогда в Новом Лагере?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"(смущенно) Я...",DIA_Addon_Saturas_Hallo_Video);
};

func void DIA_Addon_Saturas_Hallo_Video()
{
	PlayVideo("oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//(раздраженно) Ты каким-то образом высосал всю магическую энергию из нашей горы руды, а потом просто исчез!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//(раздраженно) И зачем только тебе это понадобилось!
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Мне правда очень жаль. Я не ведал, что творил.",DIA_Addon_Saturas_Hallo_sorry);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Ваш план не сработал бы, как ни крути.",DIA_Addon_Saturas_Hallo_Spott);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Такова жизнь. Без мощи накопленной вами руды я бы не смог одолеть Спящего.",DIA_Addon_Saturas_Hallo_notwendig);
};

func void DIA_Addon_Saturas_Hallo_notwendig()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//Такова жизнь. Без мощи накопленной вами руды я бы не смог одолеть Спящего.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//(злится) Что за бред ты несешь?! Спящий? Одолеть Спящего?!
	DIA_Addon_Saturas_Hallo_YouKnow();
};

func void DIA_Addon_Saturas_Hallo_Spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//Ваш план не сработал бы, как ни крути. Хе-хе, взорвать гору руды, чтобы убрать Барьер... Смех, да и только.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//Все, на что бы вас хватило тогда, так это взлететь на воздух вместе с вашим лагерем и его жителями в придачу.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//(гневно) Это заходит уже слишком далеко! Кто дал тебе право судить нас и наши намерения?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//Если бы я не исповедовал путь ненасилия, мой мальчик... Считай, тебе повезло.
	DIA_Addon_Saturas_Hallo_YouKnow();
};

func void DIA_Addon_Saturas_Hallo_sorry()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//Мне правда очень жаль. Я не ведал, что творил.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//О, и ты, наивный, полагаешь, что теперь об этом можно забыть?
	DIA_Addon_Saturas_Hallo_YouKnow();
};


instance DIA_Addon_Saturas_keineAhnung(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_keineAhnung_Condition;
	information = DIA_Addon_Saturas_keineAhnung_Info;
	description = "Понятия не имею. Просто заглянул. Нельзя?";
};


func int DIA_Addon_Saturas_keineAhnung_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_keineAhnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//Понятия не имею. Просто заглянул. Нельзя?
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//Ты тратишь мое драгоценное время. Уходи прочь с моих глаз.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//(бормочет) Я разберусь с тобой позже.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Я нашел магов Воды на месте раскопок. Мне нужно выяснить, чем они там занимаются. Сатурас пока ничего мне не говорит. Он все никак не может забыть ту историю в колонии.");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_raus(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_raus_Condition;
	information = DIA_Addon_Saturas_raus_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Saturas_raus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_keineAhnung) && (MIS_Addon_Lares_Ornament2Saturas == FALSE) && Npc_IsInState(self,ZS_Talk) && !Npc_HasItems(other,ItMi_Ornament_Addon_Vatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_raus_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//Прочь, пока с тобой ничего не случилось.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Lares(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Lares_Condition;
	information = DIA_Addon_Saturas_Lares_Info;
	description = "Я пришел сюда с Ларесом.";
};


func int DIA_Addon_Saturas_Lares_Condition()
{
	if(Lares_Angekommen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Lares_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//Я пришел сюда с Ларесом.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//(заинтересованно) Ларес? Правда? Где он?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//Я один. Ларес вернулся в город.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//Что? И он отправил тебя к нам одного? О чем он думал?
};


instance DIA_Addon_Saturas_Ornament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Ornament_Condition;
	information = DIA_Addon_Saturas_Ornament_Info;
	description = "Вот то, что вам нужно. Орнамент.";
};


func int DIA_Addon_Saturas_Ornament_Condition()
{
	if(Npc_HasItems(other,ItMi_Ornament_Addon_Vatras))
	{
		if(Lares_Angekommen == FALSE)
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,DIA_Addon_Saturas_Lares))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Saturas_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//Вот то, что вам нужно. Орнамент.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	Npc_RemoveInvItem(self,ItMi_Ornament_Addon_Vatras);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//Во имя сути всего сущего, что это все должно значить?
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//Кто дал тебе это? Только не говори, что Ларес просто вручил это тебе.
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//Ну, хватит уже, старче. Я ведь принес это вам, чего уж боле?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//Конечно. Меня просто волнует, что ты опять приложил к этому свои подлые руки.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//Почему ты все еще так кипятишься из-за той руды?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//Ведь я тогда уже работал на вас. На меня можно было положиться.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//(вздыхает) И к чему это нас привело, ответь? Хм-м, даже не думай, что я тебе доверяю...
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;
	Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
};


instance DIA_Addon_Saturas_geheimbund(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_geheimbund_Condition;
	information = DIA_Addon_Saturas_geheimbund_Info;
	description = "Я желаю стать членом Кольца Воды.";
};


func int DIA_Addon_Saturas_geheimbund_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_geheimbund_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//Я желаю стать членом Кольца Воды.
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//(яростно) ЧТО? Как ты узнал об этом? Кто?.. ЛАРЕС... Я убью его!
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//Он нарушил наше главное правило. О Кольце Воды говорить запрещено!
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//(совершенно разбито) Не знаю, что мне следовало бы сказать. Просто я доверяю тебе, пока ты у меня на глазах.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) || (Vatras_ToldAboutDuty == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//О Кольце мне сказал Ватрас.
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//(смиренно) Что? Ватрас? (саркастически) Отлично! Из всех магов Воды, которые есть на острове, ты встречаешься именно с тем, который тебя НЕ ЗНАЕТ.
		if(Lares_Angekommen == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//Он нарушил наше главное правило. О Кольце Воды говорить запрещено!
		};
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//Предупреждаю, в этот раз не делай глупостей.
		AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//(сухо) Постараюсь...
	};
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Сатурас не готов принять меня в Кольцо Воды.");
};


instance DIA_Addon_Saturas_wasmachstdu(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_wasmachstdu_Condition;
	information = DIA_Addon_Saturas_wasmachstdu_Info;
	description = "Что ты здесь делаешь?";
};


func int DIA_Addon_Saturas_wasmachstdu_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_wasmachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//(почтительно) В этих чертогах сокрыты древние тайны. Загадочные тайны.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//По надписям и фрескам видно, что это очень древняя культура.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//Все надписи, которые ты видишь, сделаны на совершенно неизвестном нам языке.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//Мы только начинаем изучать его и расшифровали лишь малую часть.
};


instance DIA_Addon_Saturas_Erdbeben(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 6;
	condition = DIA_Addon_Saturas_Erdbeben_Condition;
	information = DIA_Addon_Saturas_Erdbeben_Info;
	description = "Что это за странные подземные толчки?";
};


func int DIA_Addon_Saturas_Erdbeben_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Saturas_wasmachstdu) && Npc_KnowsInfo(other,DIA_Addon_Merdarion_Bedrohung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Erdbeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//Что это за странные подземные толчки?
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//Это одна из загадок, которую я сам пытаюсь разрешить.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//Что-то тревожит структуру магии где-то под этими горами.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//Очевидно, кто-то пытается всеми своими силами разрушить могучую магию.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//Боюсь, это произойдет до того, как весь остров будет содрогаться от этих толчков.
};


instance DIA_Addon_Saturas_WhatsOrnament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_WhatsOrnament_Condition;
	information = DIA_Addon_Saturas_WhatsOrnament_Info;
	description = "Почему для тебя так важен этот орнамент?";
};


func int DIA_Addon_Saturas_WhatsOrnament_Condition()
{
//	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsOrnament == FALSE) && (RitualRingRuns == 0))
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (RitualRingRuns == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//Почему для тебя так важен этот орнамент?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//(раздраженно) Это ключ к порталу.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//Больше я ничего тебе не скажу.
};


instance DIA_Addon_Saturas_ScRanger(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_ScRanger_Condition;
	information = DIA_Addon_Saturas_ScRanger_Info;
	permanent = TRUE;
	description = "Теперь я принадлежу к 'Кольцу Воды'.";
};


func int DIA_Addon_Saturas_ScRanger_Condition()
{
	if((SaturasKnows_SC_IsRanger == FALSE) && (SC_IsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ScRanger_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//Теперь я принадлежу к Кольцу Воды.
	itm = Npc_GetEquippedArmor(other);
	if((RangerRingIsMyRing == TRUE) || Hlp_IsItem(itm,ITAR_RANGER_Addon))
	{
		if(Hlp_IsItem(itm,ITAR_RANGER_Addon))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//Я вижу, ты носишь доспехи наших детей.
		};
		if(RangerRingIsMyRing == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//Я вижу, на тебе наш тайный знак. Аквамариновое кольцо.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//А еще по твоим глазам я вижу, что ты говоришь правду.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//(бормоча) Хорошо. Я приму тебя в наши ряды.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//Но помни, что это налагает на тебя большую ответственность.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//И я надеюсь, что ты будешь поступать по справедливости. Ради собственного же блага.
		SaturasKnows_SC_IsRanger = TRUE;
		B_LogEntry(TOPIC_Addon_RingOfWater,"Сатурас согласился с моим вступлением в Кольцо Воды.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//А как я могу сказать, что теперь ты один из нас?
		if(RangerRingIsLaresRing == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//Аквамариновое кольцо, которое ты носишь, принадлежит Ларесу. Я вижу.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//Ты пытаешься меня провести? Я не ожидал ничего другого.
		AI_StopProcessInfos(self);
	};
};


func void B_GiveVatrasLetterToSaturas()
{
	if(VatrasLetterGivenToSaturas == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//У меня есть для тебя послание от Ватраса.
		AI_WaitTillEnd(self,other);
		if(Vatras2Saturas_FindRaven_Open == TRUE)
		{
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven_opened,1);
			B_UseFakeScroll();
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//(раздраженно) Вижу. И, конечно же, ты не удержался и наверняка вскрыл его?
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//Ну, э-э...
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//(грозно) Надеюсь, мое и так хрупкое доверие к тебе не пошатнется окончательно. Ради твоего же блага.
		}
		else
		{
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven,1);
			B_UseFakeScroll();
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//(удивленно) Интересно. Хорошо.
			B_GivePlayerXP(XP_Ambient);
		};
		VatrasLetterGivenToSaturas = TRUE;
	};
};

func void B_GivePortalRingToSC()
{
	AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//Вот, возьми кольцо. Мы встретимся у портала и подождем тебя.
	CreateInvItems(self,ItMi_PortalRing_Addon,1);
	B_GiveInvItems(self,other,ItMi_PortalRing_Addon,1);
	AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//Если Нефариус прав, портал откроется, как только в него вставят кольцо.
	DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
	B_LogEntry(TOPIC_Addon_Ornament,"Сатурас дал мне украшенное кольцо. Я должен открыть портал, вставив кольцо в механизм, а затем пройти через портал.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"OpenPortal");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"OpenPortal");
	B_StartOtherRoutine(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"OpenPortal");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"OpenPortal");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
};

instance DIA_Addon_Saturas_GiveVatrasLetter(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_GiveVatrasLetter_Condition;
	information = DIA_Addon_Saturas_GiveVatrasLetter_Info;
	description = "У меня есть для тебя послание от Ватраса.";
};

func int DIA_Addon_Saturas_GiveVatrasLetter_Condition()
{
	if((VatrasLetterGivenToSaturas == FALSE) && (RangerMeetingRunning == LOG_SUCCESS) && (Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_GiveVatrasLetter_Info()
{
	B_GiveVatrasLetterToSaturas();
};


instance DIA_Addon_Saturas_OpenPortal(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_OpenPortal_Condition;
	information = DIA_Addon_Saturas_OpenPortal_Info;
	permanent = TRUE;
	description = "Дай мне кольцо. Я открою портал.";
};


func int DIA_Addon_Saturas_OpenPortal_Condition()
{
	if((RitualRingRuns == LOG_SUCCESS) && (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_OpenPortal_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//Дай мне кольцо. Я открою портал.
	if(SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//(лукаво) Хорошо! Как один из наших новых детей, ты должен быть удостоен этой чести.
		if(VatrasLetterGivenToSaturas == TRUE)
		{
			B_GivePortalRingToSC();
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//Однако я по-прежнему жду вестей от Ватраса. Мы никуда не пойдем, пока не дождемся их.
			if((RangerMeetingRunning == LOG_SUCCESS) && (Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened)))
			{
				B_GiveVatrasLetterToSaturas();
				B_GivePortalRingToSC();
			}
			else
			{
				AI_StopProcessInfos(self);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//Пока Ватрас не дал мне знать, что тебе можно доверять полностью, кольцо побудет у меня.
		if(Saturas_WillVertrauensBeweis == FALSE)
		{
			B_LogEntry(TOPIC_Addon_Ornament,"Сатурас не даст мне кольцо, пока он не получит от Ватраса знак, свидетельствующий о том, что мне можно доверять.");
			Saturas_WillVertrauensBeweis = TRUE;
		};
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Saturas_PERM(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 99;
	condition = DIA_Addon_Saturas_PERM_Condition;
	information = DIA_Addon_Saturas_PERM_Info;
	permanent = TRUE;
	description = "Ты можешь немного поучить меня магии?";
};


func int DIA_Addon_Saturas_PERM_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) || (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Addon_Saturas_Nefarius) || (VatrasLetterGivenToSaturas == TRUE) || (RitualRingRuns == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Addon_Saturas_geheimbund) || (SaturasKnows_SC_IsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//Ты можешь немного поучить меня магии?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//Чтобы ты опять натворил дел?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//Нет. У меня нет времени в бирюльки играть.
};

