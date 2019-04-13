
instance DIA_GornNW_nach_DJG_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 999;
	condition = DIA_GornNW_nach_DJG_KAP5_EXIT_Condition;
	information = DIA_GornNW_nach_DJG_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_nach_DJG_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_nach_DJG_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_nach_DJG_AllDragonsDead(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 59;
	condition = DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information = DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent = TRUE;
	description = "Ты спокоен?";
};


func int DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if(Gorn_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Ты спокоен?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Конечно, а почему нет? Драконы ведь мертвы, разве не так?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Все немного сложнее.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//(смеется) Ладно. Все как всегда. Дай мне знать, если тебе понадобится мой топор.
};


instance DIA_GornNW_nach_DJG_KnowWhereEnemy(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information = DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Мне нужны ты и твой топор.";
};


func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Gorn_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//Мне нужны ты и твой топор.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Хорошо. Я не удивлен. Что я могу сделать для тебя?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Ты поплывешь со мной на другой остров? Нужно кое-кому надрать задницу.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//(смеется) Конечно. Всегда готов. Просто скажи, что нужно делать.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Горн был готов на все, когда я рассказал ему об острове. Если мне понадобится его топор, я могу взять его с собой.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Сейчас моя команда почти укомплектована, но я думаю, что тебе тоже могло бы найтись место на борту.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Если тебе придется вышвырнуть кого-нибудь из своей команды ради меня - выбери самого слабого.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//В наше суровое время, нельзя разбрасываться людьми, способными крепко держать оружие в руках.
	}
	else
	{
		Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Я дам тебе знать, когда придет время.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Добро пожаловать на борт. Встретимся в гавани.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Добро пожаловать на борт. Встретимся в гавани.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//Корабль? Ха! Могу сказать одно. С тобой никогда не бывает скучно. До скорой встречи.
	B_GivePlayerXP(XP_Crewmember_Success);
	self.flags = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, когда придет время.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//Хорошо.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};


instance DIA_GornNW_nach_DJG_LeaveMyShip(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information = DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Возможно, тебе лучше остаться здесь.";
};


func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition()
{
	if((Gorn_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Возможно, тебе лучше остаться здесь.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//Ты хочешь, чтобы я отпустил тебя одного? Ммм. Мне нелегко это сделать, но это твоя война. Найди меня, если решишь, что я все же тебе нужен.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornNW_nach_DJG_StillNeedYou(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information = DIA_GornNW_nach_DJG_StillNeedYou_Info;
	permanent = TRUE;
	description = "Возвращайся. ТЫ нужен мне.";
};


func int DIA_GornNW_nach_DJG_StillNeedYou_Condition()
{
	if(((Gorn_IsOnBoard == LOG_OBSOLETE) || (Gorn_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Возвращайся. ТЫ нужен мне.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//Наконец-то. А я уж думал, ты оставишь гнить меня здесь, пока будешь развлекаться там. До скорой встречи.
	self.flags = NPC_FLAG_IMMORTAL;
	Gorn_IsOnBoard = LOG_SUCCESS;
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


instance DIA_Fighter_nach_DJG_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 900;
	condition = DIA_Fighter_nach_DJG_PICKPOCKET_Condition;
	information = DIA_Fighter_nach_DJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Fighter_nach_DJG_PICKPOCKET_Condition()
{
	return C_Beklauen(10,25);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,Dialog_Back,DIA_Fighter_nach_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_nach_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};

