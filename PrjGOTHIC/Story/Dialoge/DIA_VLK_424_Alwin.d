
instance DIA_Alwin_EXIT(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 999;
	condition = DIA_Alwin_EXIT_Condition;
	information = DIA_Alwin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alwin_PICKPOCKET(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 900;
	condition = DIA_Alwin_PICKPOCKET_Condition;
	information = DIA_Alwin_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Alwin_PICKPOCKET_Condition()
{
	return C_Beklauen(20,10);
};

func void DIA_Alwin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,Dialog_Back,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};


instance DIA_Alwin_Sheep(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Condition;
	information = DIA_Alwin_Sheep_Info;
	permanent = FALSE;
	description = "Это твои овцы?";
};


func int DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Это твои овцы?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Единственная овца, что принадлежит мне, отзывается на имя Люси. (смеется) Это моя жена - Люси.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Эти овцы принадлежат ополчению. Они забирают их у фермеров и приводят ко мне.
};


instance DIA_Alwin_Fellan(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_Fellan_Condition;
	information = DIA_Alwin_Fellan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alwin_Fellan_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Ох, этот стук молотка этого сумасшедшего скоро и меня сведет с ума.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//О ком ты говоришь?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Разве ты не слышишь стук молотка? Кто, как ты думаешь, колотит дни напролет в портовом квартале?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//Я имею в виду этого психа Феллана. Он стучит молотком по своей хижине каждый день.
};


instance DIA_Alwin_FellanRunning(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_FellanRunning_Condition;
	information = DIA_Alwin_FellanRunning_Info;
	permanent = FALSE;
	description = "Я могу поговорить с Фелланом ...";
};


func int DIA_Alwin_FellanRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Я могу поговорить с Фелланом ...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Ты хочешь помочь мне? А зачем тебе это?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//Ты скажи мне.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Ох, вот ты как! Хорошо - если ты заставишь его перестать молотить, я заплачу тебе 25 золотых монет.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Но я скажу тебе сразу - ты не сможешь уговорить этого парня. Он сошел с ума. Единственное, что может помочь, это несколько хороших тумаков!
	MIS_AttackFellan = LOG_Running;
	Log_CreateTopic(TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin,LOG_Running);
	B_LogEntry(TOPIC_Alwin,"Алвин хочет, чтобы я заставил Феллана перестать колотить молотком. Впрочем, убивать его за это не стоит.");
	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning,"Я посмотрю, что можно сделать ...",DIA_Alwin_FellanRunning_Ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning,"Если я начну бить его, у меня будут проблемы с ополчением ...",DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Я посмотрю, что можно сделать ...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Подумай об этом. И помни, я заплачу тебе 25 золотых.
	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Если я начну бить его, у меня будут проблемы с ополчением ...
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Здесь, в порту, никто не обращает внимания на драки ...
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Но если ты украдешь что-нибудь, или убьешь овцу, у тебя будут большие проблемы.
};


instance DIA_Alwin_FellanSuccess(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = DIA_Alwin_FellanSuccess_Condition;
	information = DIA_Alwin_FellanSuccess_Info;
	permanent = FALSE;
	description = "Феллан больше не будет стучать.";
};


func int DIA_Alwin_FellanSuccess_Condition()
{
	if((MIS_AttackFellan == LOG_Running) && ((FellanGeschlagen == TRUE) || Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Феллан больше не будет стучать.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//Надо же! Больше нет этого стука. Наконец-то. Я уж думал, он никогда не перестанет.
	if(Npc_IsDead(Fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Ты оказал мне большую услугу. Знаешь что, я дам тебе 30 золотых монет.
		B_GiveInvItems(self,other,ItMi_Gold,30);
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};


instance DIA_Alwin_Endlos(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 8;
	condition = DIA_Alwin_Endlos_Condition;
	information = DIA_Alwin_Endlos_Info;
	permanent = TRUE;
	description = "Как твои овцы?";
};


func int DIA_Alwin_Endlos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//Как твои овцы?
	if((MIS_AttackFellan != LOG_SUCCESS) && (Npc_IsDead(Fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Стук этого Феллана сведет их с ума. Однажды они все разбегутся.
	}
	else if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Овцы едят и становятся все толще и толще. Прямо как моя жена. ХАХАХА (громко смеется)
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Я, пожалуй, забью одну из них. На мясо для последней трапезы!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Для кого?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Для наемника, который убил паладина. Конечно же, его казнят.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Мне только нужно решить, какую из них отправить на бойню.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Люси очень повезло, что она осталась в живых.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Я думал, что Люси - это твоя жена.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Правильно, но я также назвал эту овцу Люси. Я имею в виду овцу, которая была предназначена для последней трапезы Беннета.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Но все кончилось хорошо. Люси должна быть рада.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//Откровенно говоря, смотреть за тем, как овцы едят - такая скука!
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Я говорю им - прощайте. Лорд Хаген приказал, чтобы вес овцы пошли на провиант для его армии.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Ну, теперь я хотя бы буду проводить больше времени со своей женой.
	};
};

