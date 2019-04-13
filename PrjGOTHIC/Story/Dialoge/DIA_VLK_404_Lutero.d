
instance DIA_Lutero_EXIT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 999;
	condition = DIA_Lutero_EXIT_Condition;
	information = DIA_Lutero_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if((Lutero_Krallen == LOG_Running) && (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && (Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE))
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
};


instance DIA_Lutero_Hallo(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Hallo_Condition;
	information = DIA_Lutero_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_Hallo_Condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Меня зовут Лютеро. Я торгую практически всем.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Какие товары ты предлагаешь?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//Ну, в основном редкие и необычные вещи. Я готов удовлетворить даже самые причудливые прихоти моих клиентов.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Лютеро торгует необычными и редкими предметами в верхнем квартале.");
};


instance DIA_Lutero_GetLost(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_GetLost_Condition;
	information = DIA_Lutero_GetLost_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_GetLost_Condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Проваливай отсюда! Тебе что, нечего делать? Тогда найди себе работу - только где-нибудь еще!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Что тебе нужно, послушник? Разве ты не должен быть в монастыре?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lutero_Snapper(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Snapper_Condition;
	information = DIA_Lutero_Snapper_Info;
	permanent = FALSE;
	description = "Ты ищешь что-нибудь конкретное?";
};


func int DIA_Lutero_Snapper_Condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Ты ищешь что-нибудь конкретное?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Да, для одного из моих клиентов мне нужны когти снеппера.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Но не просто обычные когти. Это должно быть что-то особенное - когти очень большого зверя, убившего много людей, например.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Где мне найти снепперов?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//На этом острове они встречаются повсеместно, но большинство из них живет в Долине Рудников.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//А что я с этого получу?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//Я могу дать тебе рунный камень.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//Я могу дать тебе кольцо неуязвимости.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Я посмотрю, что можно сделать.
	Log_CreateTopic(TOPIC_Lutero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lutero,LOG_Running);
	B_LogEntry(TOPIC_Lutero,"Торговец Лютеро ищет когти необычайно сильного снеппера.");
	Lutero_Krallen = LOG_Running;
};


instance DIA_Lutero_Kralle(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Kralle_Condition;
	information = DIA_Lutero_Kralle_Info;
	permanent = FALSE;
	description = "У меня есть особенные когти снеппера для тебя.";
};


func int DIA_Lutero_Kralle_Condition()
{
	if((Npc_HasItems(other,ItAt_ClawLeader) >= 1) && Npc_KnowsInfo(other,DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//У меня есть особенные когти снеппера для тебя.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//Мой клиент будет счастлив услышать это.
	B_GiveInvItems(other,self,ItAt_ClawLeader,1);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//У меня нет этого рунного камня с собой. Но я знаю, где его можно найти.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//По пути от города к таверне, ты пойдешь под мостом.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Там, в пещере, мой друг спрятал в сундуке рунный камень. Вот ключ.
		B_GiveInvItems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Вот кольцо, как я и обещал тебе.
		B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	};
};


instance DIA_Lutero_Trade(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Trade_Condition;
	information = DIA_Lutero_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int DIA_Lutero_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lutero_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Покажи мне свои товары.
};


instance DIA_Lutero_PICKPOCKET(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 900;
	condition = DIA_Lutero_PICKPOCKET_Condition;
	information = DIA_Lutero_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Lutero_PICKPOCKET_Condition()
{
	return C_Beklauen(58,65);
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,Dialog_Back,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

