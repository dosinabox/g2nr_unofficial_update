
instance DIA_Rupert_EXIT(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 999;
	condition = DIA_Rupert_EXIT_Condition;
	information = DIA_Rupert_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rupert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rupert_PICKPOCKET(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 900;
	condition = DIA_Rupert_PICKPOCKET_Condition;
	information = DIA_Rupert_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Rupert_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_Rupert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
	Info_AddChoice(DIA_Rupert_PICKPOCKET,Dialog_Back,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rupert_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};


instance DIA_Rupert_Hello(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_Hello_Condition;
	information = DIA_Rupert_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Rupert_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Hello_Info()
{
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//Привет, чужеземец!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//Ты, должно быть, голоден и хочешь пить. Может, тебя заинтересуют мои товары?
};


instance DIA_Rupert_ZuPal(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_ZuPal_Condition;
	information = DIA_Rupert_ZuPal_Info;
	permanent = FALSE;
	description = "Откровенно говоря, я пришел, чтобы встретиться с паладинами...";
};


func int DIA_Rupert_ZuPal_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void DIA_Rupert_ZuPal_Info()
{
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//Откровенно говоря, я пришел, чтобы встретиться с паладинами...
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//У тебя мало шансов на это. С тех пор, как паладины обосновались в верхнем квартале, туда стало очень трудно попасть.
};


instance DIA_Rupert_HelpMeIntoOV(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_HelpMeIntoOV_Condition;
	information = DIA_Rupert_HelpMeIntoOV_Info;
	permanent = FALSE;
	description = "Ты можешь помочь мне попасть в верхний квартал?";
};


func int DIA_Rupert_HelpMeIntoOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_ZuPal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_HelpMeIntoOV_Info()
{
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//Ты можешь помочь мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//Я? Нет, мое слово мало что значит!
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//Всего несколько людей в нижней части города влиятельны настолько, что могут заставить стражу пропустить тебя.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//Маттео, мой босс, - один из них. Возможно, тебе стоит поговорить с ним.
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_Running);
	B_LogEntry(TOPIC_OV,"Чтобы попасть в верхний квартал, мне нужна помощь влиятельных граждан из нижней части города.");
	B_LogEntry(TOPIC_OV,"Торговец Маттео - один из влиятельных граждан нижней части города.");
};


instance DIA_Rupert_WoMatteo(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 1;
	condition = DIA_Rupert_WoMatteo_Condition;
	information = DIA_Rupert_WoMatteo_Info;
	permanent = FALSE;
	description = "Где я могу найти Маттео?";
};


func int DIA_Rupert_WoMatteo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_HelpMeIntoOV) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WoMatteo_Info()
{
	AI_Output(other,self,"DIA_Rupert_WoMatteo_15_00");	//Где я могу найти Маттео?
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//Ты стоишь прямо перед его лавкой. Просто войди внутрь. Он практически всегда там.
	if(Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Лавка Маттео находится у южных ворот города. Он продает снаряжение, оружие и другие товары.");
		Knows_Matteo = TRUE;
	};
};


instance DIA_Rupert_WerEinfluss(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 2;
	condition = DIA_Rupert_WerEinfluss_Condition;
	information = DIA_Rupert_WerEinfluss_Info;
	permanent = FALSE;
	description = "А что насчет других влиятельных горожан?";
};


func int DIA_Rupert_WerEinfluss_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_HelpMeIntoOV) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WerEinfluss_Info()
{
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//А что насчет других влиятельных горожан?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//Торговцы и мастера ремесленники, здесь, на главной улице - самые влиятельные фигуры в городе.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//Ты должен попытаться стать учеником одного из них, как я.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//С тех пор, как я работаю на Маттео, люди в городе относятся ко мне с уважением!
	B_LogEntry(TOPIC_OV,"Я должен попытаться стать учеником одного из мастеров.");
};


instance DIA_Rupert_Work(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 3;
	condition = DIA_Rupert_Work_Condition;
	information = DIA_Rupert_Work_Info;
	permanent = FALSE;
	description = "Мне нужны деньги и я ищу работу.";
};


func int DIA_Rupert_Work_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Rupert_Work_Info()
{
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//Мне нужны деньги и я ищу работу.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//Я слышал, что у Боспера проблемы с поставщиками. Его лавка находится вон там.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//Говорят, он платит довольно хорошо.
};


instance DIA_Rupert_YourOffer(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_YourOffer_Condition;
	information = DIA_Rupert_YourOffer_Info;
	permanent = FALSE;
	description = "Что ты можешь предложить мне?";
};


func int DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};

func void DIA_Rupert_YourOffer_Info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//Что ты можешь предложить?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//Сейчас, у меня мало что есть.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//Этот чертов лендлорд не поставляет больше продукты, а того, что мы получаем с маленьких ферм, недостаточно для удовлетворения потребностей города.
	};
};


instance DIA_Rupert_Trade(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 900;
	condition = DIA_Rupert_Trade_Condition;
	information = DIA_Rupert_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int DIA_Rupert_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_YourOffer))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Trade_Info()
{
	if(Npc_HasItems(self,ItFo_Cheese) < 5)
	{
		CreateInvItems(self,ItFo_Cheese,5);
	};
	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//Покажи мне свои товары.
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//Я приношу извинения за скудный выбор. Человек вашего положения наверняка привык к лучшему.
	};
};


instance DIA_Rupert_Bauernaufstand(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_Bauernaufstand_Condition;
	information = DIA_Rupert_Bauernaufstand_Info;
	permanent = FALSE;
	description = "Расскажи мне о восстании крестьян.";
};


func int DIA_Rupert_Bauernaufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_YourOffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//Расскажи мне о восстании крестьян.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//Это довольно просто: Онар, жирный лендлорд, больше не платит налоги городу.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//Только представь! Мы воюем с орками, а этот жирный гусь забирает все себе!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//Обычно городская стража принимает жесткие меры в таких случаях.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//Но теперь самое интересное: говорят, что Онар нанял наемников, чтобы те не подпускали к его ферме городские войска!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//НАЕМНИКОВ! Это все кончится войной! Как будто ОДНОЙ войны не достаточно!
};


instance DIA_Rupert_Mercs(C_Info)
{
	npc = VLK_458_Rupert;
	nr = 4;
	condition = DIA_Rupert_Mercs_Condition;
	information = DIA_Rupert_Mercs_Info;
	permanent = FALSE;
	description = "Что ты знаешь о наемниках Онара?";
};


func int DIA_Rupert_Mercs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rupert_Bauernaufstand) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Mercs_Info()
{
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//Что ты знаешь о наемниках Онара?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//Я слышал, что большинство из них бывшие каторжники из колонии.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//А их главарь, по слухам, был большой шишкой при короле - генералом или что-то в этом роде, - которого осудили за предательство!
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//Ужасные времена!
};

