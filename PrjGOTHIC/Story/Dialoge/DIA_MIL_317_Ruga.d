
instance DIA_Ruga_EXIT(C_Info)
{
	npc = MIL_317_Ruga;
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


instance DIA_Ruga_Hallo(C_Info)
{
	npc = MIL_317_Ruga;
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
};


instance DIA_Ruga_Train(C_Info)
{
	npc = MIL_317_Ruga;
	nr = 5;
	condition = DIA_Ruga_Train_Condition;
	information = DIA_Ruga_Train_Info;
	permanent = TRUE;
	description = "Ты можешь потренировать меня?";
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
	B_Ruga_Teach_Log();
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
		AI_Output(self,other,"DIA_Ruga_Train_11_04");	//(презрительно) Убирайся с глаз моих, наемник.
		AI_StopProcessInfos(self);
	}
	else if(hero.guild == GIL_NOV)
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_05");	//Нет. Я тренирую только людей, состоящих на службе у короля. Больше никого.
		AI_Output(self,other,"DIA_Ruga_Train_11_06");	//Но нам всегда нужны хорошие люди. Так что, если хочешь поступить в ополчение, поговори с лордом Андрэ.
	};
};


var int DIA_Ruga_Teach_permanent;

func void B_BuildLearnDialog_Ruga()
{
	if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Ruga)
	{
		Info_ClearChoices(DIA_Ruga_Teach);
		Info_AddChoice(DIA_Ruga_Teach,Dialog_Back,DIA_Ruga_Teach_Back);
		Info_AddChoice(DIA_Ruga_Teach,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,1),DIA_Ruga_Teach_CROSSBOW_1);
		Info_AddChoice(DIA_Ruga_Teach,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,5),DIA_Ruga_Teach_CROSSBOW_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Ruga)
		{
			DIA_Ruga_Teach_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_Crossbow_Ruga)),-1,53,FONT_Screen,2);
		AI_Output(self,other,"DIA_Ruga_Teach_11_00");	//Мне больше нечему учить тебя. Тебе лучше поискать другого учителя.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ruga_Teach(C_Info)
{
	npc = MIL_317_Ruga;
	nr = 100;
	condition = DIA_Ruga_Teach_Condition;
	information = DIA_Ruga_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как стрелять из арбалета.";
};


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
	B_BuildLearnDialog_Ruga();
};

func void DIA_Ruga_Teach_Back()
{
	Info_ClearChoices(DIA_Ruga_Teach);
};

func void DIA_Ruga_Teach_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,TeachLimit_Crossbow_Ruga))
	{
		B_BuildLearnDialog_Ruga();
	};
};

func void DIA_Ruga_Teach_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,TeachLimit_Crossbow_Ruga))
	{
		B_BuildLearnDialog_Ruga();
	};
};

var int DIA_Ruga_TEACHDEX_permanent;

func void B_BuildLearnDialog_Ruga_DEX()
{
	if(RealAttributeValue(ATR_DEXTERITY) >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Ruga_TEACHDEX_11_00");	//Это все, чему я мог обучить тебя. Если ты хочешь стать еще более ловким, тебе лучше поискать другого учителя.
		DIA_Ruga_TEACHDEX_permanent = TRUE;
	}
	else
	{
		Info_ClearChoices(DIA_Ruga_TEACHDEX);
		Info_AddChoice(DIA_Ruga_TEACHDEX,Dialog_Back,DIA_Ruga_TEACHDEX_BACK);
		Info_AddChoice(DIA_Ruga_TEACHDEX,B_BuildLearnAttributeString(ATR_DEXTERITY,1),DIA_Ruga_TEACHDEX_1);
		Info_AddChoice(DIA_Ruga_TEACHDEX,B_BuildLearnAttributeString(ATR_DEXTERITY,5),DIA_Ruga_TEACHDEX_5);
	};
};

instance DIA_Ruga_TEACHDEX(C_Info)
{
	npc = MIL_317_Ruga;
	nr = 101;
	condition = DIA_Ruga_TEACHDEX_Condition;
	information = DIA_Ruga_TEACHDEX_Info;
	permanent = TRUE;
	description = "Я хочу стать более ловким.";
};


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
	B_BuildLearnDialog_Ruga_DEX();
};

func void DIA_Ruga_TEACHDEX_BACK()
{
	Info_ClearChoices(DIA_Ruga_TEACHDEX);
};

func void DIA_Ruga_TEACHDEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_HIGH))
	{
		B_BuildLearnDialog_Ruga_DEX();
	};
};

func void DIA_Ruga_TEACHDEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_HIGH))
	{
		B_BuildLearnDialog_Ruga_DEX();
	};
};

