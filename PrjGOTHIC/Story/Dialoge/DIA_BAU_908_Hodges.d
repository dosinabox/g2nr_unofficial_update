
instance DIA_Hodges_Kap1_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap1_EXIT_Condition;
	information = DIA_Hodges_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_HALLO(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 1;
	condition = DIA_Hodges_HALLO_Condition;
	information = DIA_Hodges_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hodges_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Привет, я новичок здесь.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Не пойми меня неправильно, но сейчас у меня нет настроения разговаривать - я абсолютно измотан.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//Ты ужасно занят, да?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//Даже не говори. Беннет делает столько оружия, что едва успеваю полировать его.
};


instance DIA_Hodges_TellAboutFarm(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_TellAboutFarm_Condition;
	information = DIA_Hodges_TellAboutFarm_Info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне об этой ферме?";
};


func int DIA_Hodges_TellAboutFarm_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_TellAboutFarm_Info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//Что ты можешь рассказать мне об этой ферме?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//Это ферма Онара.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//Это большое здание - его дом. Он освободил одно крыло для наемников.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//А нам, фермерам, пришлось переселиться в сарай.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(торопливо) Но я совсем не против, хорошо ведь, что есть люди, способные защитить ферму.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//Вот это здание - кухня.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//Перед кухней находится кузница.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Возможно, тебе повезет и Текла приготовит тебе что-нибудь поесть.
};


instance DIA_Hodges_AboutSld(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_AboutSld_Condition;
	information = DIA_Hodges_AboutSld_Info;
	permanent = FALSE;
	description = "А что насчет наемников?";
};


func int DIA_Hodges_AboutSld_Condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//А что насчет наемников?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Онар нанял их, чтобы они не пускали сюда ополчение.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//Но также они охраняют ферму, наших овец и самих фермеров.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//Так что даже не думай украсть что-нибудь или пошарить в чужом сундуке.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//Они только и ждут шанса, чтобы задать тебе трепку.
};


instance DIA_Hodges_TRADE(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 2;
	condition = DIA_Hodges_TRADE_Condition;
	information = DIA_Hodges_TRADE_Info;
	permanent = TRUE;
	description = "Могу я купить оружие у тебя?";
	trade = TRUE;
};


func int DIA_Hodges_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Могу я купить оружие у тебя?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//У меня мало что есть. Мы относим почти все мечи и топоры в дом Онара.
	Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
};


instance DIA_Hodges_Kap2_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap2_EXIT_Condition;
	information = DIA_Hodges_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_Kap3_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap3_EXIT_Condition;
	information = DIA_Hodges_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_DontWork(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 31;
	condition = DIA_Hodges_DontWork_Condition;
	information = DIA_Hodges_DontWork_Info;
	permanent = FALSE;
	description = "Почему ты не работаешь?";
};


func int DIA_Hodges_DontWork_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Почему ты не работаешь?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Ты еще ничего не слышал? Паладины арестовали Беннета.
	MIS_RescueBennet = LOG_Running;
	Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
	B_LogEntry(TOPIC_RescueBennet,"Кузнец Беннет арестован паладинами в городе.");
};


instance DIA_Hodges_WhatHappened(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 31;
	condition = DIA_Hodges_WhatHappened_Condition;
	information = DIA_Hodges_WhatHappened_Info;
	permanent = FALSE;
	description = "Что произошло?";
};


func int DIA_Hodges_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_DontWork) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//Что случилось?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//Ну, мы были в городе за покупками, когда неожиданно услышали крик. Кто-то кричал: 'Вот они, держите их!'
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//Ох, как я испугался! Я бросился бежать. Я бежал так, как будто за мной гнались демоны.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//Беннет бежал за мной. Я не знаю, что произошло, но когда я выбрался из города, его со мной уже не было.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//Должно быть, он отстал где-то в городе.
};


instance DIA_Hodges_BennetsCrime(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 32;
	condition = DIA_Hodges_BennetsCrime_Condition;
	information = DIA_Hodges_BennetsCrime_Info;
	permanent = FALSE;
	description = "Так почему Беннета арестовали?";
};


func int DIA_Hodges_BennetsCrime_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_DontWork) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetsCrime_Info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//Так почему Беннета арестовали?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//Убийство! Беннета подозревают в убийстве паладина. Какая чушь. Я был с ним все это время.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//Так почему ты не пойдешь в город и не расскажешь, как все было?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//Они посадят меня в камеру как его сообщника. Нееет, этого нельзя делать, учитывая ситуацию.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//Ситуацию?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//Понимаешь, Онар и его отношения с городом... Это все может плохо кончиться.
	B_LogEntry(TOPIC_RescueBennet,"Говорят, что Беннет убил паладина. Его ученик Ходжес утверждает, что Беннет невиновен, но он не осмеливается входить в город.");
};


instance DIA_Hodges_BennetAndSLD(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 33;
	condition = DIA_Hodges_BennetAndSLD_Condition;
	information = DIA_Hodges_BennetAndSLD_Info;
	permanent = FALSE;
	description = "А как отреагировали наемники на ферме?";
};


func int DIA_Hodges_BennetAndSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hodges_DontWork) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//А как отреагировали наемники на ферме?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Естественно, я не знаю, что они планируют, но многие из них просто в ярости.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//Это понятно.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//Если бы у них было право решать, они бы атаковали город уже сегодня, чтобы освободить Беннета.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Поговори с Ли, может быть, ты чем-нибудь сможешь помочь.
};


instance DIA_Hodges_Kap4_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap4_EXIT_Condition;
	information = DIA_Hodges_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_Kap5_EXIT(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 999;
	condition = DIA_Hodges_Kap5_EXIT_Condition;
	information = DIA_Hodges_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hodges_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hodges_PICKPOCKET(C_Info)
{
	npc = BAU_908_Hodges;
	nr = 900;
	condition = DIA_Hodges_PICKPOCKET_Condition;
	information = DIA_Hodges_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Hodges_PICKPOCKET_Condition()
{
	return C_Beklauen(15,10);
};

func void DIA_Hodges_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
	Info_AddChoice(DIA_Hodges_PICKPOCKET,Dialog_Back,DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hodges_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
};

func void DIA_Hodges_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hodges_PICKPOCKET);
};

