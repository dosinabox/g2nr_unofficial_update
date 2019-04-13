
instance DIA_Angar_NW_KAP5_EXIT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 999;
	condition = DIA_Angar_NW_KAP5_EXIT_Condition;
	information = DIA_Angar_NW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_NW_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_NW_AllDragonsDead(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 59;
	condition = DIA_Angar_NW_AllDragonsDead_Condition;
	information = DIA_Angar_NW_AllDragonsDead_Info;
	description = "Как дела?";
};


func int DIA_Angar_NW_AllDragonsDead_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_AllDragonsDead_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//Хорошо. Но меня все равно мучают головные боли, хотя они уменьшились с тех пор, как я покинул Долину Рудников.
	if(Angar_IsOnBoard != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//Я останусь здесь. Ты будешь знать, где найти меня, если я тебе понадоблюсь.
	};
};


instance DIA_Angar_NW_KnowWhereEnemy(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_KnowWhereEnemy_Condition;
	information = DIA_Angar_NW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я собираюсь покинуть Хоринис. Ты хочешь присоединиться ко мне?";
};


func int DIA_Angar_NW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Angar_IsOnBoard == FALSE) && Npc_KnowsInfo(other,DIA_Angar_NW_AllDragonsDead))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//Я собираюсь покинуть Хоринис. Ты хочешь присоединиться ко мне?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//Чем дальше я буду от Долины Рудников, тем лучше. Когда мы отчаливаем?
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Ангар будет рад каждой миле, что разделяет его и Долину рудников. Он предложил присоединиться ко мне и путешествовать вместе.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//У меня сейчас достаточно людей, чтобы управлять кораблем. Возможно, я обращусь к тебе позже.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//Хорошо. Ты знаешь, где найти меня.
	}
	else
	{
		Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"Я дам тебе знать, когда придет время.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"Иди в гавань. Встретимся там.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//Иди в гавань. Встретимся там.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//Уже иду.
	self.flags = NPC_FLAG_IMMORTAL;
	Angar_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};

func void DIA_Angar_NW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, когда придет время.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//Хорошо.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};


instance DIA_Angar_NW_LeaveMyShip(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_LeaveMyShip_Condition;
	information = DIA_Angar_NW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Оставайся здесь и лечись от своей головной боли.";
};


func int DIA_Angar_NW_LeaveMyShip_Condition()
{
	if((Angar_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//Оставайся здесь и лечись от своей головной боли.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//Хорошо. Я пойду назад. Может, так даже будет лучше.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Angar_NW_StillNeedYou(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_StillNeedYou_Condition;
	information = DIA_Angar_NW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Возвращайся на борт.";
};


func int DIA_Angar_NW_StillNeedYou_Condition()
{
	if(((Angar_IsOnBoard == LOG_OBSOLETE) || (Angar_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//Возвращайся на борт.
	AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//Ты даже хуже чем я. Немного определенности тебе совсем бы не помешало. Увидимся позже.
	self.flags = NPC_FLAG_IMMORTAL;
	Angar_IsOnBoard = LOG_SUCCESS;
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


instance DIA_Angar_NW_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 900;
	condition = DIA_Angar_NW_PICKPOCKET_Condition;
	information = DIA_Angar_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Angar_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(47,34);
};

func void DIA_Angar_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,Dialog_Back,DIA_Angar_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_NW_PICKPOCKET_DoIt);
};

func void DIA_Angar_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};

func void DIA_Angar_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};


instance DIA_Angar_NW_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 7;
	condition = DIA_Angar_NW_FOUNDAMULETT_Condition;
	information = DIA_Angar_NW_FOUNDAMULETT_Info;
	description = "Я нашел твой амулет.";
};


func int DIA_Angar_NW_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
};

