
instance DIA_Wambo_EXIT(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 999;
	condition = DIA_Wambo_EXIT_Condition;
	information = DIA_Wambo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wambo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wambo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wambo_PICKPOCKET(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 900;
	condition = DIA_Wambo_PICKPOCKET_Condition;
	information = DIA_Wambo_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Воровать этот ключ рискованно)";
};


func int DIA_Wambo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_04) >= 1) && (other.attribute[ATR_DEXTERITY] >= 40))
	{
		return TRUE;
	};
};

func void DIA_Wambo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,Dialog_Back,DIA_Wambo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wambo_PICKPOCKET_DoIt);
};

func void DIA_Wambo_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_04,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Wambo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
};


instance DIA_Wambo_Job(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Job_Condition;
	information = DIA_Wambo_Job_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Wambo_Job_Condition()
{
	return TRUE;
};

func void DIA_Wambo_Job_Info()
{
	AI_Output(other,self,"DIA_Wambo_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Wambo_Job_03_01");	//Я слежу за тем, чтобы никто не входил в дома.
	AI_Output(self,other,"DIA_Wambo_Job_03_02");	//Лорд Хаген лично отдал этот приказ. И даже не думай нарушить его!
};


instance DIA_Wambo_Situation(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 10;
	condition = DIA_Wambo_Situation_Condition;
	information = DIA_Wambo_Situation_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Wambo_Situation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wambo_Job))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Situation_Info()
{
	AI_Output(other,self,"DIA_Wambo_Situation_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Wambo_Situation_03_01");	//Сейчас все спокойно.
};


instance DIA_Wambo_Ramirez(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Ramirez_Condition;
	information = DIA_Wambo_Ramirez_Info;
	permanent = FALSE;
	description = "Я пришел от нашего общего друга, Рамиреза.";
};


func int DIA_Wambo_Ramirez_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ramirez_Viertel))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Ramirez_Info()
{
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_00");	//Я пришел от нашего общего друга, Рамиреза.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_01");	//Ох? Этот Рамирез тот еще подлец. И он мне не друг. Да, ладно. Ты принес мне что-нибудь?
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_02");	//Это зависит от того, что ты хочешь.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_03");	//(тихо) Хорошо, поступим так: ты платишь мне 250 золотых монет. И меня не будет здесь всю ночь.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_04");	//И, если ты уж такой подозрительный, давай договоримся так: если я появлюсь здесь, то нашу сделку можно будет считать расторгнутой.
};


instance DIA_Wambo_Deal(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Deal_Condition;
	information = DIA_Wambo_Deal_Info;
	permanent = TRUE;
	description = "(Заплатить 250 золота)";
};


var int DIA_Wambo_Deal_permanent;

func int DIA_Wambo_Deal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wambo_Ramirez) && (DIA_Wambo_Deal_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Deal_Info()
{
	AI_Output(other,self,"DIA_Wambo_Deal_15_00");	//У меня есть деньги...
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Wambo_Deal_03_01");	//Хорошо, тогда я исчезаю на всю ночь.
		AI_Output(self,other,"DIA_Wambo_Deal_03_02");	//И помни: если у тебя возникнут проблемы, я не знаю тебя.
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self,"DIA_Wambo_Deal_15_03");	//...но с собой  их не захватил.
		AI_Output(self,other,"DIA_Wambo_Deal_03_04");	//Я не выношу, когда кто-нибудь пытается одурачить меня. Так что давай сюда золото.
		AI_StopProcessInfos(self);
	};
};

