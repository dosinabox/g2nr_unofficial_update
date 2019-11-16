
instance DIA_None_101_Mario_EXIT(C_Info)
{
	npc = NONE_101_Mario;
	nr = 999;
	condition = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_None_101_Mario_Job(C_Info)
{
	npc = NONE_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int DIA_None_101_Mario_Job_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && !Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Надеюсь, скоро придет какой-нибудь корабль, и я наймусь на него.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Это шатание без дела уже действует мне на нервы.
};


instance DIA_None_101_Mario_YouNeedMe(C_Info)
{
	npc = NONE_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//Я слышал, что ты набираешь команду на свой корабль?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//И?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Я готов!
	B_LogEntry(Topic_Crew,"Некто Марио заговорил со мной в портовой таверне. Он вызвался плыть на корабле.");
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = NONE_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = "Почему я должен брать тебя?";
};


func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Почему я должен брать тебя?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Это просто. Потому что я нужен тебе.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Я... я был лейтенантом в королевском флоте.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//Я служил моряком на 'Короле Робаре' и 'Гордости Миртаны'.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//В битве у восточного архипелага я собственноручно отправил пару десятков орков назад в царство Белиара.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//К сожалению, нас осталось слишком мало, когда наш флагман затонул и нам пришлось отступить.
	B_LogEntry(Topic_Crew,"Марио - бывший моряк королевского флота.");
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = NONE_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = "А что ты делаешь здесь?";
};


func int DIA_None_101_Mario_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//А что ты делаешь здесь?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Флоту пришлось бежать, и мы лишились жалования.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//После моего списания на берег я застрял в этой дыре, и вот теперь ищу новое судно.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = NONE_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = "Что ты можешь делать?";
};


func int DIA_None_101_Mario_Abilities_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Что ты можешь делать?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Я обучен абордажу и ближнему бою, к тому же я метко стреляю из корабельной пушки.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Я уверен, что я смогу обучить тебя чему-нибудь во время путешествия.
	B_LogEntry(Topic_Crew,"Марио, похоже, собаку съел в том, что касается морских боев. Возможно, он сможет научить меня кое-чему.");
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = NONE_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = "Что ты за это хочешь?";
};


func int DIA_None_101_Mario_YourPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//Что ты за это хочешь?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//Что я хочу? Да я буду рад просто убраться отсюда.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Я помогу тебе, а ты поможешь мне выбраться из этой дыры.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = NONE_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = "Путешествие может быть опасным.";
};


func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YourPrice) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Путешествие может быть опасным.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Я привык к опасности. Когда ты вдали от дома, каждый день для тебя полон опасностей.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Любой шторм может стать для тебя последним, а монстры с глубин могут проглотить твой корабль целиком.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//Не говоря уже о галерах орков. Поверь мне, я ничего не боюсь. Матрос, который боится, обречен на гибель.
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = NONE_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = "Ты не нужен мне.";
};


func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//Ты не нужен мне.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Я лучший матрос, которого можно найти здесь.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Мне кажется, ты не очень-то разбираешься в навигации.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Так что дважды подумай, прежде чем доверяться кому-нибудь.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = NONE_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = "Я всегда найду место для хороших людей.";
};


func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Я всегда найду место для хороших людей.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Конечно, увидимся на корабле.
	B_JoinShip(self);
};


instance DIA_Mario_LeaveMyShip(C_Info)
{
	npc = NONE_101_Mario;
	nr = 11;
	condition = DIA_Mario_LeaveMyShip_Condition;
	information = DIA_Mario_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я понял, что ты мне не нужен!";
};


func int DIA_Mario_LeaveMyShip_Condition()
{
	if((Mario_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Я понял, что ты мне не нужен!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Как скажешь. Ты знаешь, где искать меня!
	Mario_IsOnBoard = LOG_OBSOLETE;
	CrewmemberFree_Count -= 1;
	AI_StopProcessInfos(self);
	Mario_Nerver += 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Mario_StillNeedYou(C_Info)
{
	npc = NONE_101_Mario;
	nr = 11;
	condition = DIA_Mario_StillNeedYou_Condition;
	information = DIA_Mario_StillNeedYou_Info;
	permanent = TRUE;
	description = "Ты мне все-таки нужен!";
};


func int DIA_Mario_StillNeedYou_Condition()
{
	if((Mario_IsOnBoard == LOG_OBSOLETE) || (Mario_IsOnBoard == LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//Ты мне все-таки нужен!
	if((Mario_IsOnBoard == LOG_OBSOLETE) && (Mario_Nerver <= 2))
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Я знал! Увидимся на корабле!
		B_JoinShip(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Ты не смеешь так обращаться со мной. Плевать я на тебя хотел!
		AI_StopProcessInfos(self);
		Mario_IsOnBoard = LOG_FAILED;
		self.flags = 0;
		B_Attack(self,other,AR_NONE,1);
	};
	B_CheckLog();
};


instance DIA_MARIO_PICKPOCKET(C_Info)
{
	npc = NONE_101_Mario;
	nr = 900;
	condition = DIA_MARIO_PICKPOCKET_Condition;
	information = DIA_MARIO_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_MARIO_PICKPOCKET_Condition()
{
	return C_Beklauen(71,220);
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,Dialog_Back,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

