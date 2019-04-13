
instance DIA_Kati_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_EXIT_Condition;
	information = DIA_Kati_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_SLDNOCHDA(C_Info)
{
	npc = BAU_941_Kati;
	nr = 4;
	condition = DIA_Kati_SLDNOCHDA_Condition;
	information = DIA_Kati_SLDNOCHDA_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Kati_SLDNOCHDA_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Kati_SLDNOCHDA_Info()
{
	var int Hilfe;
	if(Hilfe == FALSE)
	{
		AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_00");	//Эти головорезы угрожают моему мужу! Мы простые граждане Хориниса, преданные королю, а эти наемники хотят ограбить нас!
		Hilfe = TRUE;
	};
	AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_01");	//Ну не стой же здесь. Сделай что-нибудь! Помоги нам!
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Фермеру Акилу угрожают наемники.");
	AI_StopProcessInfos(self);
};


instance DIA_Kati_HALLO(C_Info)
{
	npc = BAU_941_Kati;
	nr = 5;
	condition = DIA_Kati_HALLO_Condition;
	information = DIA_Kati_HALLO_Info;
	permanent = FALSE;
	description = "Все в порядке?";
};


func int DIA_Kati_HALLO_Condition()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Kati_HALLO_Info()
{
	AI_Output(other,self,"DIA_Kati_HALLO_15_00");	//С тобой все в порядке?
	if(Npc_IsDead(Akil))
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_01");	//(рыдает) Мой любимый муж мертв! Ох, Иннос, за что ты меня так наказываешь?!
		Npc_ExchangeRoutine(self,"Start");
		B_StartOtherRoutine(Randolph,"Start");
		B_GivePlayerXP(XP_Akil_Tot);
	}
	else
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_02");	//Да, я в порядке, спасибо.
	};
};


instance DIA_Kati_ESSEN(C_Info)
{
	npc = BAU_941_Kati;
	nr = 12;
	condition = DIA_Kati_ESSEN_Condition;
	information = DIA_Kati_ESSEN_Info;
	permanent = FALSE;
	description = "Акил говорит, что ты можешь накормить меня.";
};


func int DIA_Kati_ESSEN_Condition()
{
	if((Kati_Mahlzeit == TRUE) && (Npc_IsDead(Akil) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kati_ESSEN_Info()
{
	AI_Output(other,self,"DIA_Kati_ESSEN_15_00");	//Акил говорит, что ты можешь накормить меня.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_01");	//С тех пор как рухнул Барьер, для нас настали тяжелые времена. Жить здесь стало небезопасно.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_02");	//Вот, держи ломоть хлеба, немного молока и бутылку воды. Извини, но это все, чем мы можем поделиться.
	B_GiveInvItems(self,other,ItFo_Bread,1);
	B_GiveInvItems(self,other,ItFo_Water,1);
	B_GiveInvItems(self,other,ItFoMutton,1);
};


instance DIA_Kati_Baltram(C_Info)
{
	npc = BAU_941_Kati;
	nr = 4;
	condition = DIA_Kati_Baltram_Condition;
	information = DIA_Kati_Baltram_Info;
	permanent = FALSE;
	description = "Меня прислал Бальтрам ...";
};


func int DIA_Kati_Baltram_Condition()
{
	if(Npc_IsDead(Akil) && (MIS_Baltram_ScoutAkil == LOG_Running) && (Lieferung_Geholt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kati_Baltram_Info()
{
	AI_Output(other,self,"DIA_Kati_Baltram_15_00");	//Меня прислал Бальтрам. Я должен забрать посылку для него.
	AI_Output(self,other,"DIA_Kati_Baltram_16_01");	//Да, конечно. Вот, я уже упаковала ее.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};


instance DIA_Kati_BAUERNAUFSTAND(C_Info)
{
	npc = BAU_941_Kati;
	nr = 6;
	condition = DIA_Kati_BAUERNAUFSTAND_Condition;
	information = DIA_Kati_BAUERNAUFSTAND_Info;
	permanent = FALSE;
	description = "Почему вы не противостоите тирании Онара?";
};


func int DIA_Kati_BAUERNAUFSTAND_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Kati_BAUERNAUFSTAND_Info()
{
	AI_Output(other,self,"DIA_Kati_BAUERNAUFSTAND_15_00");	//Почему вы не противостоите тирании Онара?
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_01");	//Для фермеров, живущих у города, это имеет смысл. Им лучше быть на стороне ополчения, чем полагаться на наемников Онара.
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_02");	//С другой стороны, есть Бенгар и Секоб, которые скорее откажутся от своих ферм, чем будут работать на короля.
};


instance DIA_Kati_ANDEREHOEFE(C_Info)
{
	npc = BAU_941_Kati;
	nr = 7;
	condition = DIA_Kati_ANDEREHOEFE_Condition;
	information = DIA_Kati_ANDEREHOEFE_Info;
	permanent = FALSE;
	description = "Где находятся фермы Бенгара и Секоба?";
};


func int DIA_Kati_ANDEREHOEFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info()
{
	AI_Output(other,self,"DIA_Kati_ANDEREHOEFE_15_00");	//Где находятся фермы Бенгара и Секоба?
	AI_Output(self,other,"DIA_Kati_ANDEREHOEFE_16_01");	//Неподалеку от фермы лендлорда. Иди на восток отсюда, и ты найдешь их.
};


instance DIA_Kati_HIERWEG(C_Info)
{
	npc = BAU_941_Kati;
	nr = 9;
	condition = DIA_Kati_HIERWEG_Condition;
	information = DIA_Kati_HIERWEG_Info;
	permanent = FALSE;
	description = "А вы не думали о том, чтобы уехать отсюда?";
};


func int DIA_Kati_HIERWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info()
{
	AI_Output(other,self,"DIA_Kati_HIERWEG_15_00");	//А вы не думали о том, чтобы уехать отсюда?
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_01");	//Не так-то просто уехать из этой части страны. Вся эта земля окружена стеной высоких, непроходимых гор.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_02");	//Выбраться отсюда можно только лежит через Долину Рудников  или через гавань города.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_03");	//Так как мы не можем позволить себе купить место на корабле, а Долина Рудников - это место, откуда не возвращаются, мы вынуждены оставаться здесь.
};


instance DIA_Kati_PASS(C_Info)
{
	npc = BAU_941_Kati;
	nr = 10;
	condition = DIA_Kati_PASS_Condition;
	information = DIA_Kati_PASS_Info;
	permanent = FALSE;
	description = "Что ты знаешь о Проходе?";
};


func int DIA_Kati_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_HIERWEG))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info()
{
	AI_Output(other,self,"DIA_Kati_PASS_15_00");	//Что ты знаешь о Проходе?
	AI_Output(self,other,"DIA_Kati_PASS_16_01");	//Сама я там никогда не была. Но я знаю, что он где-то неподалеку от фермы Бенгара на высокогорных пастбищах.
};


instance DIA_Kati_PERMKAP1(C_Info)
{
	npc = BAU_941_Kati;
	nr = 11;
	condition = DIA_Kati_PERMKAP1_Condition;
	information = DIA_Kati_PERMKAP1_Info;
	permanent = TRUE;
	description = "Береги своего мужа.";
};


func int DIA_Kati_PERMKAP1_Condition()
{
	if(!C_NpcIsDown(Akil) && Npc_KnowsInfo(other,DIA_Kati_HALLO) && Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND) && Npc_KnowsInfo(other,DIA_Kati_ANDEREHOEFE) && Npc_KnowsInfo(other,DIA_Kati_HIERWEG) && Npc_KnowsInfo(other,DIA_Kati_PASS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Kati_PERMKAP1_15_00");	//Береги своего мужа.
	AI_Output(self,other,"DIA_Kati_PERMKAP1_16_01");	//Я стараюсь изо всех сил.
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP3_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP3_EXIT_Condition;
	information = DIA_Kati_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_PERM(C_Info)
{
	npc = BAU_941_Kati;
	nr = 3;
	condition = DIA_Kati_PERM_Condition;
	information = DIA_Kati_PERM_Info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int DIA_Kati_PERM_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Kati_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERM_Info()
{
	AI_Output(other,self,"DIA_Kati_PERM_15_00");	//С тобой все в порядке?
	AI_Output(self,other,"DIA_Kati_PERM_16_01");	//Мы справимся. Вот только не знаю, сколько еще нам придется терпеть этих дьяволов в черном.
	AI_Output(self,other,"DIA_Kati_PERM_16_02");	//Я так долго не вынесу. Они шныряют вокруг дома и везде суют свой нос.
};


instance DIA_Kati_KAP4_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP4_EXIT_Condition;
	information = DIA_Kati_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP5_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP5_EXIT_Condition;
	information = DIA_Kati_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP6_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP6_EXIT_Condition;
	information = DIA_Kati_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_PICKPOCKET(C_Info)
{
	npc = BAU_941_Kati;
	nr = 900;
	condition = DIA_Kati_PICKPOCKET_Condition;
	information = DIA_Kati_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20_Female;
};


func int DIA_Kati_PICKPOCKET_Condition()
{
	return C_Beklauen(13,15);
};

func void DIA_Kati_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
	Info_AddChoice(DIA_Kati_PICKPOCKET,Dialog_Back,DIA_Kati_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kati_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kati_PICKPOCKET_DoIt);
};

func void DIA_Kati_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
};

func void DIA_Kati_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
};

