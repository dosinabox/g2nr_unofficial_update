
instance DIA_Wolf_DI_EXIT(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 999;
	condition = DIA_Wolf_DI_EXIT_Condition;
	information = DIA_Wolf_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wolf_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_DI_HALLO(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 4;
	condition = DIA_Wolf_DI_HALLO_Condition;
	information = DIA_Wolf_DI_HALLO_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Wolf_DI_HALLO_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Wolf_DI_HALLO_OneTime;

func void DIA_Wolf_DI_HALLO_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_00");	//Как дела?
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(Bennet_DI) == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_01");	//Тебе ОЧЕНЬ нужно было брать с собой Беннета?
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_02");	//В чем проблема?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_03");	//А, ничего. Все в порядке. Делай, что считаешь нужным.
	}
	else if(DIA_Wolf_DI_HALLO_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_04");	//Эта кузница не в самом лучшем состоянии, но я думаю, у меня что-нибудь получится.
		B_GivePlayerXP(XP_Ambient);
		DIA_Wolf_DI_HALLO_OneTime = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SmithDI");
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_05");	//Ты можешь изготовить для меня доспехи?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_06");	//Извини, приятель. Но не с этими инструментами. Придется подождать, пока мы не прибудем на материк.
	};
};


instance DIA_Wolf_DI_Training(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 10;
	condition = DIA_Wolf_DI_Training_Condition;
	information = DIA_Wolf_DI_Training_Info;
	permanent = TRUE;
	description = "Обучи меня стрельбе.";
};


func int DIA_Wolf_DI_Training_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_DI_Training_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//Обучи меня стрельбе.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//Из чего?
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_1_08_00");	//В отличие от арбалета, лук очень громоздкий и требует много места. Не забывай об этом в бою.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_5_08_00");	//Тетива при стрельбе должна свободно скользить по пальцам. Скрюченный палец испортит траекторию стрелы.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00");	//Постарайся, чтобы при выстреле из арбалета у тебя не дрогнула рука. Вот почему спусковой крючок нужно нажимать очень нежно.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00");	//Опытный стрелок всегда учитывает направление ветра и никогда не стреляет против него.
	};
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Wolf_DI_Training_CROSSBOW_5);
};

func void DIA_Wolf_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_Training);
};


instance DIA_Wolf_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 2;
	condition = DIA_Wolf_DI_UndeadDragonDead_Condition;
	information = DIA_Wolf_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Wolf_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Wolf_DI_UndeadDragonDead_OneTime;

func void DIA_Wolf_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_01");	//Конечно. А у тебя? Нелегко тебе пришлось, да?
	if(DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_02");	//Куда ты теперь?
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_03");	//Куда угодно, только не назад. Я по горло сыт Хоринисом.
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_04");	//Мне все равно, куда плыть. Лишь бы подальше отсюда.
		DIA_Wolf_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_DI_PICKPOCKET(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 900;
	condition = DIA_Wolf_DI_PICKPOCKET_Condition;
	information = DIA_Wolf_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Wolf_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(32,45);
};

func void DIA_Wolf_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_DI_PICKPOCKET,Dialog_Back,DIA_Wolf_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wolf_DI_PICKPOCKET_DoIt);
};

func void DIA_Wolf_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
};

func void DIA_Wolf_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
};

