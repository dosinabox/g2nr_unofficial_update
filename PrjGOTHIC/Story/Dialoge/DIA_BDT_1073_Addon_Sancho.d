
instance DIA_Addon_Sancho_EXIT(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 999;
	condition = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Sancho_PICKPOCKET(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 900;
	condition = DIA_Addon_Sancho_PICKPOCKET_Condition;
	information = DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	return C_Beklauen(50,40);
};

func void DIA_Addon_Sancho_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET,Dialog_Back,DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Sancho_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};

func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Sancho_PICKPOCKET);
};


instance DIA_Addon_Sancho_HI(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Sancho_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//Черт, еще один новичок. (смеется) Тоже за золотом, да?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//За золотом?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//(смеется) Не пытайся обдурить меня!
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//Все, кто приходят сюда, хотят попасть в шахту.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//Но не думай, что это будет легко!
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_Sancho_Lager(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 2;
	condition = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent = FALSE;
	description = "Как мне попасть в лагерь?";
};


func int DIA_Addon_Sancho_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Sancho_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//Как мне попасть в лагерь?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//Просто иди по настилу!
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//Но если ты захочешь попасть в шахту, тебе придется иметь дело с Франко.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//Он считает, что все новички должны сначала немного поработать снаружи!
	};
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"Прежде чем попасть в шахту, все новички должны поработать на болоте.");
};


instance DIA_Addon_Sancho_Mine(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 3;
	condition = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent = FALSE;
	description = "Расскажи мне про шахту...";
};


func int DIA_Addon_Sancho_Mine_Condition()
{
	if(!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Mine_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//Расскажи мне про шахту...
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//Я дам тебе совет: если ты хочешь попасть туда, ты должен понравиться Франко. Он тут главный.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//Он решает, кто пойдет туда следующим.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//И он пустит тебя туда, только если ты не будешь тут лодырничать.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//Так что пойди к нему и попроси у него какую-нибудь работу!
	B_LogEntry(Topic_Addon_Franco,"Франко решает, кто попадет в лагерь. Также он занимается распределением заданий.");
};


instance DIA_Addon_Sancho_Franco(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 4;
	condition = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent = FALSE;
	description = "Где я могу найти Франко?";
};


func int DIA_Addon_Sancho_Franco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Mine) && !Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Franco_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//Где я могу найти Франко?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//Обычно он торчит во дворе перед лагерем.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//Будь с ним в хороших отношениях  - и ты получишь какую-нибудь работу получше той, что делаю я!
	B_LogEntry(Topic_Addon_Franco,"Франко можно найти перед лагерем.");
};


instance DIA_Addon_Sancho_Spitzel(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 5;
	condition = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent = FALSE;
	description = "Ты должен все время здесь сидеть?";
};


func int DIA_Addon_Sancho_Spitzel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Franco) || Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Sancho_Spitzel_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//Ты должен все время здесь сидеть?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//Я должен встречать всех новичков, чтобы убедиться, что к нам не пробрались шпионы.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//Но об этом можно забыть. Я хочу сказать, что мы здесь на краю света - в середине болота.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//Никто не может найти нас, и никто нас не найдет. Потому что кому нужно посылать сюда шпионов?
};


instance DIA_Addon_Sancho_Perm(C_Info)
{
	npc = BDT_1073_Addon_Sancho;
	nr = 99;
	condition = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent = TRUE;
	description = "Какие новости?";
};


func int DIA_Addon_Sancho_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Sancho_Spitzel))
	{
		return TRUE;
	};
};


var int Comment_Franco;
var int Comment_Esteban;

func void DIA_Addon_Sancho_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//Какие новости?
	if(Npc_IsDead(Franco) && (Comment_Franco == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//Я слышал, ты убил Франко. Хорошая работа...
		if(!Npc_IsDead(Carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//...но теперь нам на шею сел этот Карлос. С ним шутки плохи...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//Ты покончил и с Карлосом? Приятель, ты и правда опасный убийца, не так ли? Оставь меня в покое.
		};
		Comment_Franco = TRUE;
	}
	else if(Npc_IsDead(Esteban) && (Comment_Esteban == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//Говорят, ты убил Эстебана. Приятель, ты явно что-то затеваешь, да?
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//Да нет ничего нового.
	};
};

