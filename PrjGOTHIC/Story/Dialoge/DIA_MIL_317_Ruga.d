
instance DIA_Ruga_EXIT(C_Info)
{
	npc = Mil_317_Ruga;
	nr = 999;
	condition = DIA_Ruga_EXIT_Condition;
	information = DIA_Ruga_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ruga_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ruga_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ruga_PICKPOCKET(C_Info)
{
	npc = Mil_317_Ruga;
	nr = 900;
	condition = DIA_Ruga_PICKPOCKET_Condition;
	information = DIA_Ruga_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Украсть этот ключ будет легко)";
};


func int DIA_Ruga_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_03) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Ruga_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ruga_PICKPOCKET);
	Info_AddChoice(DIA_Ruga_PICKPOCKET,Dialog_Back,DIA_Ruga_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ruga_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ruga_PICKPOCKET_DoIt);
};

func void DIA_Ruga_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems(self,other,ItKe_City_Tower_03,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Ruga_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Ruga_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ruga_PICKPOCKET);
};


instance DIA_Ruga_Hallo(C_Info)
{
	npc = Mil_317_Ruga;
	nr = 2;
	condition = DIA_Ruga_Hallo_Condition;
	information = DIA_Ruga_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ruga_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ruga_Hallo_Info()
{
	AI_Output(other,self,"DIA_Ruga_Hallo_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Ruga_Hallo_11_01");	//Я обучаю парней стрельбе из арбалета и помогаю им стать более ловкими.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Руга, городской гвардеец, может помочь мне повысить мою ловкость и научить меня пользоваться арбалетом. Но для этого я должен служить королю.");
};


instance DIA_Ruga_Train(C_Info)
{
	npc = Mil_317_Ruga;
	nr = 5;
	condition = DIA_Ruga_Train_Condition;
	information = DIA_Ruga_Train_Info;
	permanent = TRUE;
	description = "Ты не мог бы потренировать меня?";
};


func int DIA_Ruga_Train_Condition()
{
	if(Ruga_TeachCrossbow == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ruga_Train_Info()
{
	AI_Output(other,self,"DIA_Ruga_Train_15_00");	//Ты можешь потренировать меня?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_01");	//Конечно. Если у тебя достаточно опыта, я готов помочь тебе.
		AI_Output(self,other,"DIA_Ruga_Train_11_02");	//Но нужно понимать, что ловкость и стрельба неотделимы друг от друга, как арбалет и стрела. Одно...
		AI_Output(other,self,"DIA_Ruga_Train_15_03");	//... ничего не стоит без другого. Я понял.
		Ruga_TeachCrossbow = TRUE;
		Ruga_TeachDEX = TRUE;
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_04");	//Убирайся с глаз моих, (презрительно) наемник.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_05");	//Нет. Я тренирую только людей, состоящих на службе у короля. Больше никого.
		AI_Output(self,other,"DIA_Ruga_Train_11_06");	//Но нам всегда нужны хорошие люди. Так что, если хочешь поступить в ополчение, поговори с лордом Андрэ.
	};
};


instance DIA_Ruga_Teach(C_Info)
{
	npc = Mil_317_Ruga;
	nr = 100;
	condition = DIA_Ruga_Teach_Condition;
	information = DIA_Ruga_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как стрелять из арбалета.";
};


var int DIA_Ruga_Teach_permanent;

func int DIA_Ruga_Teach_Condition()
{
	if((Ruga_TeachCrossbow == TRUE) && (DIA_Ruga_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ruga_Teach_Info()
{
	AI_Output(other,self,"DIA_Ruga_Teach_15_00");	//Покажи мне, как стрелять из арбалета.
	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach,Dialog_Back,DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Ruga_Teach_1H_5);
};

func void DIA_Ruga_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 90)
	{
		AI_Output(self,other,"DIA_Ruga_Teach_11_00");	//Мне больше нечему учить тебя. Тебе лучше поискать другого учителя.
		DIA_Ruga_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Ruga_Teach);
};

func void DIA_Ruga_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,90);
	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach,Dialog_Back,DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Ruga_Teach_1H_5);
};

func void DIA_Ruga_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,90);
	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach,Dialog_Back,DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Ruga_Teach_1H_5);
};


instance DIA_Ruga_TEACHDEX(C_Info)
{
	npc = Mil_317_Ruga;
	nr = 101;
	condition = DIA_Ruga_TEACHDEX_Condition;
	information = DIA_Ruga_TEACHDEX_Info;
	permanent = TRUE;
	description = "Я хочу стать более ловким.";
};


var int DIA_Ruga_TEACHDEX_permanent;

func int DIA_Ruga_TEACHDEX_Condition()
{
	if((Ruga_TeachDEX == TRUE) && (DIA_Ruga_TEACHDEX_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ruga_TEACHDEX_Info()
{
	AI_Output(other,self,"DIA_Ruga_TEACHDEX_15_00");	//Я хочу стать более ловким.
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
	Info_AddChoice(DIA_Ruga_TEACHDEX,Dialog_Back,DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ruga_TEACHDEX_5);
};

func void DIA_Ruga_TEACHDEX_BACK()
{
	if(other.attribute[ATR_DEXTERITY] >= T_LOW)
	{
		AI_Output(self,other,"DIA_Ruga_TEACHDEX_11_00");	//Это все, чему я мог обучить тебя. Если ты хочешь стать еще более ловким, тебе лучше поискать другого учителя.
		DIA_Ruga_TEACHDEX_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
};

func void DIA_Ruga_TEACHDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_LOW);
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
	Info_AddChoice(DIA_Ruga_TEACHDEX,Dialog_Back,DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ruga_TEACHDEX_5);
};

func void DIA_Ruga_TEACHDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_LOW);
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
	Info_AddChoice(DIA_Ruga_TEACHDEX,Dialog_Back,DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ruga_TEACHDEX_5);
};

