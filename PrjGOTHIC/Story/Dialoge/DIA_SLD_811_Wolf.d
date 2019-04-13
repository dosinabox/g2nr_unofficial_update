
instance DIA_Wolf_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_EXIT_Condition;
	information = DIA_Wolf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hallo(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_Hallo_Condition;
	information = DIA_Wolf_Hallo_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Wolf_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Эй! Я знаю тебя! Ты из колонии.
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//Что тебе нужно здесь?
};


instance DIA_Wolf_WannaJoin(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 5;
	condition = DIA_Wolf_WannaJoin_Condition;
	information = DIA_Wolf_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу присоединиться к вам.";
};


func int DIA_Wolf_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//Я хочу присоединиться к вам.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//Почему бы и нет? Я не имею ничего против. Я помню, как ты освободил нашу шахту, убив стражников.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//Но не рассчитывай, что тебе так просто удастся получить согласие других.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//Последнее время мы набрали всякого сброда. И даже многие старые наемники могут не помнить тебя.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//Я сам-то еле узнал тебя, ты выглядишь ужасно изможденным.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//Когда Барьер пал, мне чудом удалось остаться в живых.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//Но, похоже, тебе все же повезло.
	B_LogEntry(TOPIC_SLDRespekt,"Вольф не возражает против моего вступления в ряды наемников.");
};


instance DIA_Wolf_WannaBuy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 6;
	condition = DIA_Wolf_WannaBuy_Condition;
	information = DIA_Wolf_WannaBuy_Info;
	permanent = FALSE;
	description = "Ты можешь что-нибудь продать?";
};


func int DIA_Wolf_WannaBuy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaBuy_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Ты можешь что-нибудь продать?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//Ох, лучше не спрашивай.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//Беннет, один из новых парней, теперь заведует оружием и доспехами.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//В колонии я отвечал за весь арсенал Ли, и вот пришел хороший кузнец и - пфф - я остался без работы.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//Мне очень нужна новая работа, даже если это будет охрана местных ферм.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//Меня это не волнует, лишь бы только не быть баклуши здесь.
};


instance DIA_Wolf_WannaLearn(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 7;
	condition = DIA_Wolf_WannaLearn_Condition;
	information = DIA_Wolf_WannaLearn_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Wolf_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//Я могу научить тебя секретам обращения с луком, если хочешь. Все равно мне сейчас нечего делать.
	Wolf_TeachBow = TRUE;
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Вольф может обучить меня обращению с луком.");
};


var int Wolf_Merke_Bow;

instance DIA_Wolf_TEACH(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 8;
	condition = DIA_Wolf_TEACH_Condition;
	information = DIA_Wolf_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу научиться стрельбе из лука.";
};


func int DIA_Wolf_TEACH_Condition()
{
	if(Wolf_TeachBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_TEACH_Info()
{
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//Я хочу научиться стрельбе из лука.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//Чему обучить тебя?
	Wolf_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Back()
{
	if(Wolf_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//Вот так. Твоя меткость значительно выросла.
	};
	Info_ClearChoices(DIA_Wolf_TEACH);
};

func void DIA_Wolf_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90);
	Info_ClearChoices(DIA_Wolf_TEACH);
	Info_AddChoice(DIA_Wolf_TEACH,Dialog_Back,DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_TEACH,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_Teach_Bow_5);
};


instance DIA_Wolf_PERM(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 9;
	condition = DIA_Wolf_PERM_Condition;
	information = DIA_Wolf_PERM_Info;
	permanent = TRUE;
	description = "Ну, как? Не нашел еще работы?";
};


func int DIA_Wolf_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_PERM_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//Ну, как? Не нашел еще работы?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Пока нет. Дай мне знать, если подвернется какая-нибудь работа для меня.
};


instance DIA_Wolf_Stadt(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 10;
	condition = DIA_Wolf_Stadt_Condition;
	information = DIA_Wolf_Stadt_Info;
	permanent = FALSE;
	description = "А ты не пытался найти работу в городе?";
};


func int DIA_Wolf_Stadt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_WannaBuy) && (MIS_BengarsHelpingSLD == 0) && (Wolf_IsOnBoard != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Stadt_Info()
{
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//А ты не пытался найти работу в городе?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//В городе? (смеется) Да меня туда силком не затащишь.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//Или ты думаешь, что я стану работать солдатом ополчения? Я даже представить себя не могу в этой дурацкой униформе.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//И эта их одержимость повиновением. Нет, забудь об этом - хотя здесь, на ферме, и нечем заняться, но, по крайней мере, я могу делать что хочу.
};


var int MIS_Wolf_BringCrawlerPlates;
var int Wolf_MakeArmor;
var int Player_GotCrawlerArmor;

instance DIA_Wolf_AboutCrawler(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 1;
	condition = DIA_Wolf_AboutCrawler_Condition;
	information = DIA_Wolf_AboutCrawler_Info;
	permanent = FALSE;
	description = "Я слышал, ты умеешь делать доспехи из панцирей краулеров?";
};


func int DIA_Wolf_AboutCrawler_Condition()
{
	if((Kapitel >= 2) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutCrawler_Info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//Я слышал, ты умеешь делать доспехи из панцирей краулеров?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//Это правда. А от кого ты об этом узнал?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//Мне сказал охотник Гестат.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Ты можешь сделать такие доспехи для меня?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Конечно. Принеси мне 10 панцирей краулеров, и я сделаю тебе доспехи.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//Сколько ты хочешь за них?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Забудь об этом. Я сделаю их бесплатно. В память о старых временах.
	MIS_Wolf_BringCrawlerPlates = LOG_Running;
	Log_CreateTopic(TOPIC_Wolf_BringCrawlerPlates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates,LOG_Running);
	B_LogEntry(TOPIC_Wolf_BringCrawlerPlates,"Вольф может сделать мне доспехи из 10 панцирей краулеров.");
};


instance DIA_Wolf_TeachCrawlerPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_TeachCrawlerPlates_Condition;
	information = DIA_Wolf_TeachCrawlerPlates_Info;
	permanent = TRUE;
	description = B_BuildLearnString("Научи меня снимать панцири с краулеров!",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate));
};


func int DIA_Wolf_TeachCrawlerPlates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TeachCrawlerPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//Научи меня снимать панцири с краулеров!
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//Это просто. Верхняя часть панциря соединяется с туловищем только по краям. Просто берешь и отрезаешь его при помощи острого ножа.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Понятно?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//Вроде бы просто.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//Ну, я так и сказал.
	};
};


instance DIA_Wolf_BringPlates(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 3;
	condition = DIA_Wolf_BringPlates_Condition;
	information = DIA_Wolf_BringPlates_Info;
	permanent = TRUE;
	description = "Я принес панцири краулеров для доспехов.";
};


func int DIA_Wolf_BringPlates_Condition()
{
	if((MIS_Wolf_BringCrawlerPlates == LOG_Running) && (Npc_HasItems(other,ItAt_CrawlerPlate) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Wolf_BringPlates_Info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//Я принес панцири краулеров для доспехов.
	B_GiveInvItems(other,self,ItAt_CrawlerPlate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Хорошо! Давай их сюда.
	MIS_Wolf_BringCrawlerPlates = LOG_SUCCESS;
};


var int Wolf_Armor_Day;

instance DIA_Wolf_ArmorReady(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 4;
	condition = DIA_Wolf_ArmorReady_Condition;
	information = DIA_Wolf_ArmorReady_Info;
	permanent = TRUE;
	description = "Как мои доспехи?";
};


func int DIA_Wolf_ArmorReady_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_AboutCrawler) && (Player_GotCrawlerArmor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//Как мои доспехи?
	if(Npc_HasItems(self,ItAt_CrawlerPlate) >= 10)
	{
		if(Wolf_MakeArmor == FALSE)
		{
			Wolf_Armor_Day = Wld_GetDay() + 1;
			Wolf_MakeArmor = TRUE;
		};
		if((Wolf_MakeArmor == TRUE) && (Wolf_Armor_Day > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//Скоро они будут готовы. Заходи завтра.
		}
		else
		{
			CreateInvItems(self,ITAR_DJG_Crawler,1);
			Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//Я закончил их. Вот, держи.
			B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Получилось неплохо, мне кажется...
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Спасибо!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Да ладно.
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//Ты шутник. Сначала мне нужны панцири краулеров...
		Wolf_MakeArmor = FALSE;
		MIS_Wolf_BringCrawlerPlates = LOG_Running;
	};
};


instance DIA_Wolf_KAP3_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP3_EXIT_Condition;
	information = DIA_Wolf_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_BENGAR(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 31;
	condition = DIA_Wolf_BENGAR_Condition;
	information = DIA_Wolf_BENGAR_Info;
	permanent = TRUE;
	description = "Похоже, я нашел работу для тебя на ферме Бенгара.";
};


func int DIA_Wolf_BENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_Hallo) && (MIS_BengarsHelpingSLD == LOG_Running) && (Kapitel >= 3) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_BENGAR_oneTime;
var int Wolf_BENGAR_geld;

func void DIA_Wolf_BENGAR_Info()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//Похоже, я нашел работу для тебя на ферме Бенгара.
	if(DIA_Wolf_BENGAR_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Выкладывай.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//Проход в Долину Рудников начинается сразу за фермой Бенгара. Ему досаждают звери, просачивающиеся через Проход.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Нужно, чтобы кто-нибудь защищал ферму Бенгара.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//Ну, хоть что-то. Я хотя бы буду далеко от этой фермы, и не буду смотреть как идиот на здешнюю кузницу.
		DIA_Wolf_BENGAR_oneTime = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//Я согласен. А так как ты один из нас, я не возьму много за эту работу. Дай мне 300 золотых, и я сразу же отправляюсь туда.
		Wolf_BENGAR_geld = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//Хорошо. Это будет стоить 800 золотых.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//Неслабая цена.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//Да. Для одного из нас, я сделал бы это практически бесплатно. Но для тебя...
		Wolf_BENGAR_geld = 800;
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
	Info_AddChoice(DIA_Wolf_BENGAR,"Я подумаю над этим.",DIA_Wolf_BENGAR_nochnicht);
	Info_AddChoice(DIA_Wolf_BENGAR,"Вот твое золото.",DIA_Wolf_BENGAR_geld);
};

func void DIA_Wolf_BENGAR_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Вот твое золото.
	if(B_GiveInvItems(other,self,ItMi_Gold,Wolf_BENGAR_geld))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Хорошо. Я иду туда. Посмотрим, что там за звери.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//Увидимся позже.
		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		B_StartOtherRoutine(SLD_815_Soeldner,"BengarsFarm");
		B_StartOtherRoutine(SLD_817_Soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//Если бы у тебя были деньги, я уже был бы там.
	};
	Info_ClearChoices(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Ладно, только не обмани меня.
	Info_ClearChoices(DIA_Wolf_BENGAR);
};


instance DIA_Wolf_PERMKAP3(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 80;
	condition = DIA_Wolf_PERMKAP3_Condition;
	information = DIA_Wolf_PERMKAP3_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Wolf_PERMKAP3_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BengarsHelpingSLD == LOG_SUCCESS) && (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int DIA_Wolf_PERMKAP3_onetime;

func void DIA_Wolf_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Все в порядке?
	if(Npc_IsDead(Bengar) && (DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//Мой работодатель мертв. Пусть земля ему будет пухом. Кстати, я всегда хотел иметь свою собственную ферму.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//Конечно! Все спокойно.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP4_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP4_EXIT_Condition;
	information = DIA_Wolf_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_KAP5_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP5_EXIT_Condition;
	information = DIA_Wolf_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int wolf_SaidNo;

instance DIA_Wolf_SHIP(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_SHIP_Condition;
	information = DIA_Wolf_SHIP_Info;
	description = "А ты не хочешь отправиться со мной в путешествие на корабле?";
};


func int DIA_Wolf_SHIP_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIP_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//А ты не хочешь отправиться со мной в путешествие на корабле?
	if((MIS_BengarsHelpingSLD == LOG_SUCCESS) && !Npc_IsDead(Bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//Нет. Теперь не хочу. Я нашел себе работу. Может быть, в другой раз.
		wolf_SaidNo = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//Да, конечно. Нужно сваливать отсюда. Ты не пожалеешь об этом. Я помогу тебе защищать корабль. Куда мы направляемся?
		MIS_BengarsHelpingSLD = LOG_OBSOLETE;
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntry(Topic_Crew,"Вольфу надоел этот остров, и он готов на все, чтобы убраться отсюда. Он хороший боец.");
	};
};


instance DIA_Wolf_KnowWhereEnemy(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 2;
	condition = DIA_Wolf_KnowWhereEnemy_Condition;
	information = DIA_Wolf_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я направляюсь на остров недалеко отсюда.";
};


func int DIA_Wolf_KnowWhereEnemy_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wolf_SHIP) && (wolf_SaidNo == FALSE) && (MIS_SCKnowsWayToIrdorath == TRUE) && (Wolf_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//Я направляюсь на остров недалеко отсюда.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//И чего мы тогда ждем? Пока мы будем в море, я могу обучить тебя стрельбе из лука и арбалета.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//Я вспомнил, что у меня уже достаточно людей.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(зло) Так вот как ты поступаешь. Сначала зовешь меня с собой, а потом даешь от ворот поворот, да?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Да пошел ты. Чтоб твое корыто потонуло.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Я еще немного подумаю.",DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy,"Добро пожаловать на борт!",DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

func void DIA_Wolf_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//Добро пожаловать на борт!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//Приходи в гавань. Мы скоро отправляемся.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//Можешь считать, что я уже там.
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Wolf_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

func void DIA_Wolf_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//Я еще немного подумаю.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//По-моему, ты просто болтун. Я не верю ни одному твоему слову. Проваливай.
	Wolf_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
};


instance DIA_Wolf_LeaveMyShip(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 55;
	condition = DIA_Wolf_LeaveMyShip_Condition;
	information = DIA_Wolf_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я решил, что ты мне не нужен.";
};


func int DIA_Wolf_LeaveMyShip_Condition()
{
	if((Wolf_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//Я решил, что ты мне не нужен.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//Сначала ты вселяешь в меня надежду, а потом даешь от ворот поворот. Ты еще пожалеешь об этом!
	Wolf_IsOnBoard = LOG_FAILED;
	Crewmember_Count = Crewmember_Count - 1;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Wolf_SHIPOFF(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 56;
	condition = DIA_Wolf_SHIPOFF_Condition;
	information = DIA_Wolf_SHIPOFF_Info;
	permanent = TRUE;
	description = "Послушай.";
};


func int DIA_Wolf_SHIPOFF_Condition()
{
	if(Wolf_IsOnBoard == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIPOFF_Info()
{
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//Послушай.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//Проваливай, ублюдок.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Wolf_KAP6_EXIT(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 999;
	condition = DIA_Wolf_KAP6_EXIT_Condition;
	information = DIA_Wolf_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_PICKPOCKET(C_Info)
{
	npc = SLD_811_Wolf;
	nr = 900;
	condition = DIA_Wolf_PICKPOCKET_Condition;
	information = DIA_Wolf_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Wolf_PICKPOCKET_Condition()
{
	return C_Beklauen(32,35);
};

func void DIA_Wolf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,Dialog_Back,DIA_Wolf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wolf_PICKPOCKET_DoIt);
};

func void DIA_Wolf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

func void DIA_Wolf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

