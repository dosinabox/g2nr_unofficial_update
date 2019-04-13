
instance DIA_Akil_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_EXIT_Condition;
	information = DIA_Akil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_EXIT_Info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//Я должен идти.
	if(Akil_Sauer == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Не буду задерживать тебя.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//Пока! Всегда рад буду помочь чем-нибудь.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Hallo(C_Info)
{
	npc = BAU_940_Akil;
	nr = 4;
	condition = DIA_Akil_Hallo_Condition;
	information = DIA_Akil_Hallo_Info;
	permanent = FALSE;
	description = "У тебя какие-то проблемы?";
};


func int DIA_Akil_Hallo_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hallo_Info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//У тебя какие-то проблемы?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(в поту)... Э-э... нет, нет... все в порядке. (нервно) Это... тебе лучше уйти сейчас.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//Э-э... да, да... все в порядке. Ты... э-э... я... я сейчас не могу говорить с тобой.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Фермеру Акилу угрожают наемники.");
	Akils_SLDStillthere = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Nichtjetzt(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Nichtjetzt_Condition;
	information = DIA_Akil_Nichtjetzt_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Akil_Nichtjetzt_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && Npc_KnowsInfo(other,DIA_Akil_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Nichtjetzt_Info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Э-э... не сейчас, я сейчас не могу говорить с тобой.
	AI_StopProcessInfos(self);
};


instance DIA_Akil_NachKampf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Akil_NachKampf_Condition;
	information = DIA_Akil_NachKampf_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Akil_NachKampf_Condition()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_NachKampf_Info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//Слава Инносу. Я уж думал, мне конец.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//Меня зовут Акил. Я фермер на этом маленьком клочке земли.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Кто эти люди?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//Ты должен знать их. Это наемники с фермы Онара. Как и ты.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//Это наемники с фермы Онара. Эти ублюдки только и знают, что грабить и убивать.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//Я боялся худшего...
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(глубоко вздыхает)... слава Инносу до этого не дошло. Скажи мне, что я могу сделать для тебя?
	Info_ClearChoices(DIA_Akil_NachKampf);
	Info_AddChoice(DIA_Akil_NachKampf,"Ничего. Я просто рад, что у тебя теперь все в порядке.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice(DIA_Akil_NachKampf,"Как насчет нескольких золотых?",DIA_Akil_NachKampf_Gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(Kati) && !Npc_IsDead(Kati))
	{
		Npc_ExchangeRoutine(Kati,"Start");
		AI_ContinueRoutine(Kati);
		Kati.flags = 0;
	};
	if(Hlp_IsValidNpc(Randolph) && !Npc_IsDead(Randolph))
	{
		Npc_ExchangeRoutine(Randolph,"Start");
		AI_ContinueRoutine(Randolph);
		Randolph.flags = 0;
	};
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Akil_NachKampf_Ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Ничего. Я просто рад, что у тебя теперь все в порядке.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//Ты настоящий друг. Да хранит тебя Иннос на твоем пути.
	B_GivePlayerXP(XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices(DIA_Akil_NachKampf);
};

func void DIA_Akil_NachKampf_Gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//Как насчет нескольких золотых?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//Боюсь, мне придется разочаровать тебя - мы бедные фермеры. Нам еле на жизнь хватает.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//Все, что я могу предложить тебе - это еду. Иди к Кати, пусть она накормит тебя.
	B_GivePlayerXP(XP_Akil_SLDWegVomHof);
	Info_ClearChoices(DIA_Akil_NachKampf);
	Kati_Mahlzeit = TRUE;
};


instance DIA_Akil_Soeldner(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Soeldner_Condition;
	information = DIA_Akil_Soeldner_Info;
	permanent = FALSE;
	description = "Что эти наемники хотели от тебя?";
};


func int DIA_Akil_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};

func void DIA_Akil_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//Что эти наемники хотели от тебя?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//Ты издеваешься надо мной? Эти наемники хотели собрать ренту.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//Ты этого не знаешь? Их нанял Онар, лендлорд. Они охраняют его ферму и собирают ренту для него.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//Это означает, что они ходят с фермы на ферму и забирают то, что им больше нравится. А те, кто не могут платить, рискуют расстаться с жизнью.
	};
};


instance DIA_Addon_Akil_MissingPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_MissingPeople_Condition;
	information = DIA_Addon_Akil_MissingPeople_Info;
	description = "Ты слышал что-нибудь о пропавших горожанах?";
};


func int DIA_Addon_Akil_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//Ты слышал что-нибудь о пропавших горожанах?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//Слышал? Не смеши меня. У меня самого пропало несколько людей.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//У меня на полях работали Тонак и Телбор. Но три дня назад они пропали.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//Я точно знаю, что они не стали бы просто так уходить с фермы, не сказав об этом мне.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//Однако они исчезли, и никто не знает, где они сейчас.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Если ты узнаешь что-нибудь об их судьбе, обязательно дай мне знать
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Фермер Акил беспокоится о двух пропавших работниках - Тонаке и Телборе");
	MIS_Akil_BringMissPeopleBack = LOG_Running;
};


instance DIA_Addon_Akil_ReturnPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_ReturnPeople_Condition;
	information = DIA_Addon_Akil_ReturnPeople_Info;
	permanent = FALSE;
	description = "Насчет твоих работников...";
};


func int DIA_Addon_Akil_ReturnPeople_Condition()
{
	if((MIS_Akil_BringMissPeopleBack == LOG_Running) && (MissingPeopleReturnedHome == TRUE) && ((Npc_GetDistToWP(Tonak_NW,"NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(Telbor_NW,"NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_ReturnPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//Насчет твоих работников...
	if((Npc_GetDistToWP(Tonak_NW,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(Telbor_NW,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//Ты привел их назад! Ты очень храбрый человек.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//Хоть один из них выжил.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//Возьми в качестве награды это золото.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	B_GivePlayerXP(XP_Ambient);
	MIS_Akil_BringMissPeopleBack = LOG_SUCCESS;
};


instance DIA_Akil_Lieferung(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Lieferung_Condition;
	information = DIA_Akil_Lieferung_Info;
	permanent = FALSE;
	description = "Меня прислал Бальтрам ...";
};


func int DIA_Akil_Lieferung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (MIS_Baltram_ScoutAkil == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Akil_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Меня прислал Бальтрам. Я должен забрать посылку для него.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//Так ты его новый посыльный. Хорошо, я уже приготовил ее.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
	B_LogEntry(TOPIC_Baltram,"Я получил посылку. Теперь я могу доставить ее Бальтраму...");
	B_LogEntry(TOPIC_Nagur,"Я получил посылку. Теперь я могу отнести ее Нагуру...");
};


instance DIA_Akil_Gegend(C_Info)
{
	npc = BAU_940_Akil;
	nr = 90;
	condition = DIA_Akil_Gegend_Condition;
	information = DIA_Akil_Gegend_Info;
	permanent = FALSE;
	description = "Ты знаешь здешние места...";
};


func int DIA_Akil_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel < 3))
	{
		return TRUE;
	};
};


var int Knows_Taverne;

func void DIA_Akil_Gegend_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//Ты знаешь здешние места...
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Конечно, что ты хочешь узнать?
};


instance DIA_Akil_Hof(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Hof_Condition;
	information = DIA_Akil_Hof_Info;
	permanent = FALSE;
	description = "Как мне найти ферму Онара?";
};


func int DIA_Akil_Hof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hof_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Как мне найти ферму Онара?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Спустись по каменной лестнице вон там, а дальше иди по дороге на восток.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//По пути тебе встретится таверна. От нее иди дальше на восток, пока не выйдешь на большое поле. Вот там-то эти наемники и живут.
	Knows_Taverne = TRUE;
};


instance DIA_Akil_Taverne(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Taverne_Condition;
	information = DIA_Akil_Taverne_Info;
	permanent = FALSE;
	description = "Что это за таверна к востоку отсюда?";
};


func int DIA_Akil_Taverne_Condition()
{
	if(Knows_Taverne == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Akil_Taverne_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//Что это за таверна к востоку отсюда?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Спроси об этом Рендольфа. Он знает о ней лучше меня. Он бывал там несколько раз.
};


instance DIA_Akil_Wald(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Wald_Condition;
	information = DIA_Akil_Wald_Info;
	permanent = FALSE;
	description = "А что там, в лесу за твоей фермой?";
};


func int DIA_Akil_Wald_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Wald_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//А что там, в лесу за твоей фермой?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//Там бродят монстры. И волки еще самые безобидные из них.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//Также говорят, что там устроили себе логово бандиты. Ну - хотя бы они не трогают мою ферму.
};


instance DIA_Akil_Perm(C_Info)
{
	npc = BAU_940_Akil;
	nr = 32;
	condition = DIA_Akil_Perm_Condition;
	information = DIA_Akil_Perm_Info;
	permanent = TRUE;
	description = "Есть что-нибудь интересное?";
};


func int DIA_Akil_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Akil_Perm_Info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Есть что-нибудь интересное?
	if(Kapitel == 3)
	{
		if(MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//Нет. Я надеюсь, теперь мои овцы больше не будут пропадать.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//Мои овцы постоянно пропадают. Скоро нам нечего будет есть.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//Орки теперь повсюду. Говорят даже, что у них здесь где-то есть штаб-квартира. Расспроси об этом фермера Лобарта.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//Говорят, что в округе появились люди-ящеры. На твоем месте я бы не ходил в пещеры.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//Люди в черных рясах ищут тебя.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//Это не новость.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//Ну и ладно. Я просто подумал, что тебе стоит знать это.
		};
	};
};


instance DIA_Akil_KAP3_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP3_EXIT_Condition;
	information = DIA_Akil_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_SCHAFDIEB(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEB_Condition;
	information = DIA_Akil_SCHAFDIEB_Info;
	description = "Это не новость.";
};


func int DIA_Akil_SCHAFDIEB_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEB_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Есть еще новости?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//Кто-то постоянно крадет моих овец. Я теперь не могу спокойно спать по ночам.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Это не мои проблемы.",DIA_Akil_SCHAFDIEB_nein);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Сколько овец у тебя пропало?",DIA_Akil_SCHAFDIEB_wieviel);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Кто может делать это?",DIA_Akil_SCHAFDIEB_wer);
	MIS_Akil_SchafDiebe = LOG_Running;
	Log_CreateTopic(TOPIC_AkilSchafDiebe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe,LOG_Running);
	B_LogEntry(TOPIC_AkilSchafDiebe,"Овцы Акила продолжают пропадать. Он подозревает, что к этому причастны бандиты, живущие в пещере в соседнем лесу.");
};

func void DIA_Akil_SCHAFDIEB_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Кто может делать это?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//У меня есть подозрения.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//Какие-то темные личности обосновались в пещере вон в том лесу.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//Мне трудно поверить, что они питаются только ягодами. Я почти уверен, что именно они виновны в исчезновении моих овец.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//Сколько овец у тебя пропало?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//По крайней мере, три.
};

func void DIA_Akil_SCHAFDIEB_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//Это не мои проблемы.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//Понимаю. У тебя других забот полно.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};


instance DIA_Akil_SCHAFDIEBEPLATT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information = DIA_Akil_SCHAFDIEBEPLATT_Info;
	description = "Я нашел тех, кто воровал у тебя овец.";
};


func int DIA_Akil_SCHAFDIEBEPLATT_Condition()
{
	if((Kapitel >= 3) && (MIS_Akil_SchafDiebe == LOG_Running) && Npc_IsDead(BDT_1025_Bandit_H) && Npc_IsDead(BDT_1026_Bandit_H) && Npc_IsDead(BDT_1027_Bandit_H))
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//Я нашел тех, кто воровал у тебя овец.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//Ты был прав. Это были бандиты из пещеры в лесу. Но больше они у тебя ничего не украдут.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//Спасибо тебе, о, благородный служитель Инноса.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//Спасибо. Теперь я вижу, что ополчение иногда помогает нам, мелким фермерам.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//Спасибо. Ты очень странный наемник. Не такой, как другие.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//Возьми это в качестве благодарности за бескорыстную услугу, что ты оказал мне.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_Akil_SchafDiebe = LOG_SUCCESS;
	B_GivePlayerXP(XP_Akil_SchafDiebe);
};


instance DIA_Akil_AkilsSchaf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_AkilsSchaf_Condition;
	information = DIA_Akil_AkilsSchaf_Info;
	description = "(вернуть овцу Акила)";
};


func int DIA_Akil_AkilsSchaf_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToNpc(self,Follow_Sheep_AKIL) < 1000) && (MIS_Akil_SchafDiebe != 0))
	{
		return TRUE;
	};
};

func void DIA_Akil_AkilsSchaf_Info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//Очень хорошо. Вот несколько золотых. Надеюсь, этого достаточно.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Follow_Sheep_AKIL.aivar[AIV_PARTYMEMBER] = FALSE;
	Follow_Sheep_AKIL.wp = "NW_FARM2_OUT_02";
	Follow_Sheep_AKIL.start_aistate = ZS_MM_AllScheduler;
	B_GivePlayerXP(XP_AkilsSchaf);
};


instance DIA_Akil_KAP4_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP4_EXIT_Condition;
	information = DIA_Akil_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP5_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP5_EXIT_Condition;
	information = DIA_Akil_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP6_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP6_EXIT_Condition;
	information = DIA_Akil_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_PICKPOCKET(C_Info)
{
	npc = BAU_940_Akil;
	nr = 900;
	condition = DIA_Akil_PICKPOCKET_Condition;
	information = DIA_Akil_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Akil_PICKPOCKET_Condition()
{
	return C_Beklauen(37,30);
};

func void DIA_Akil_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
	Info_AddChoice(DIA_Akil_PICKPOCKET,Dialog_Back,DIA_Akil_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Akil_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Akil_PICKPOCKET_DoIt);
};

func void DIA_Akil_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

func void DIA_Akil_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

