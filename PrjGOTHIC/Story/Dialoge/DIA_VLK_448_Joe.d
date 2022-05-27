
instance DIA_Joe_EXIT(C_Info)
{
	npc = VLK_448_Joe;
	nr = 999;
	condition = DIA_Joe_EXIT_Condition;
	information = DIA_Joe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Joe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Joe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Joe_Hallo(C_Info)
{
	npc = VLK_448_Joe;
	nr = 1;
	condition = DIA_Joe_Hallo_Condition;
	information = DIA_Joe_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Joe_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) || (Npc_GetDistToWP(hero,"NW_CITY_MERCHANT_TOWER_01") <= 210))
	{
		return TRUE;
	};
};

func void DIA_Joe_Hallo_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_Output(self,other,"DIA_Joe_Hallo_10_00");	//Эй, спасибо, парень. Действительно, огромное спасибо. Я уж думал, мне никогда не выбраться отсюда...
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP(XP_Ambient * 4);
	AI_Output(other,self,"DIA_Joe_Hallo_15_01");	//Что ты делаешь ЗДЕСЬ?
	AI_Output(self,other,"DIA_Joe_Hallo_10_02");	//Я оказался взаперти. Дверь была открыта, и я хотел просто пошарить там - но как только я зашел внутрь, пришел стражник и запер эту чертову дверь.
	AI_Output(self,other,"DIA_Joe_Hallo_10_03");	//Я попал в дурацкое положение - и был бы очень благодарен, если бы все это осталось между нами.
	AI_Output(other,self,"DIA_Joe_Hallo_15_04");	//Понимаю. Да уж, тут действительно нечем гордиться.
	AI_Output(self,other,"DIA_Joe_Hallo_10_05");	//Я сейчас был бы не прочь что-нибудь выпить.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Joe_Perm(C_Info)
{
	npc = VLK_448_Joe;
	nr = 2;
	condition = DIA_Joe_Perm_Condition;
	information = DIA_Joe_Perm_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Joe_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Joe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Joe_Perm_Info()
{
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Joe_Perm_10_01");	//Спасибо, что освободил меня.
	AI_StopProcessInfos(self);
};


instance DIA_Joe_Sign(C_Info)
{
	npc = VLK_448_Joe;
	nr = 800;
	condition = DIA_Joe_Sign_Condition;
	information = DIA_Joe_Sign_Info;
	permanent = FALSE;
	description = DIALOG_SecretSign;
};


func int DIA_Joe_Sign_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Joe_Hallo) && (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Joe_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Joe_Sign_10_00");	//Эй, привет - у нас есть общие друзья. И я хотел бы выразить свою благодарность за спасение.
	AI_Output(self,other,"DIA_Joe_Sign_10_01");	//Вот, возьми эти отмычки - я уверен, они пригодятся тебе.
	AI_WaitTillEnd(other,self);
	B_GiveInvItems(self,other,ItKe_Lockpick,5);
	AI_StopProcessInfos(self);
};


