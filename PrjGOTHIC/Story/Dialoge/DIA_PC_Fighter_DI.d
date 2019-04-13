
instance DIA_Gorn_DI_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 999;
	condition = DIA_Gorn_DI_KAP5_EXIT_Condition;
	information = DIA_Gorn_DI_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorn_DI_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gorn_DI_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorn_DI_Hallo(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_Hallo_Condition;
	information = DIA_Gorn_DI_Hallo_Info;
	permanent = TRUE;
	description = "Все тип-топ?";
};


func int DIA_Gorn_DI_Hallo_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Hallo_15_00");	//Все тип-топ?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_01");	//Пока да. Помни, я хочу действовать.
	}
	else
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_02");	//Там еще есть орки? Пришли их ко мне. Я как раз немного разогрелся.
	};
};


instance DIA_Gorn_DI_Teach(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 10;
	condition = DIA_Gorn_DI_Teach_Condition;
	information = DIA_Gorn_DI_Teach_Info;
	permanent = TRUE;
	description = "Я хочу потренироваться.";
};


func int DIA_Gorn_DI_Teach_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//Я хочу потренироваться.
	AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//Это не помешает.
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//Да уж. Когда-то ты был лучше.
	};
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//Оружие нужно держать выше. Даже слепой легко пробьет твою защиту своей тростью.
	};
	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Gorn_DI_Teach);
};


instance DIA_Gorn_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_UndeadDragonDead_Condition;
	information = DIA_Gorn_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Ты все это время был на корабле?";
};


func int DIA_Gorn_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Gorn_DI_UndeadDragonDead_OneTime;

func void DIA_Gorn_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_00");	//Ты все это время был на корабле?
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_01");	//Конечно. Только представь, чтоб мы делали, если бы он пропал.
	if(DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_02");	//А что случилось?
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_03");	//Ничего. Я собираюсь отправляться домой.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_04");	//(смеется) Домой? А где это? Насколько я знаю, у тебя нет дома.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_05");	//Хочешь предложение? Мы ворвемся в первую же попавшуюся таверну и напьемся до бессознательного состояния.
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_06");	//Ммм. Может быть.
			AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_07");	//Эй, расслабься, дружище. Все кончено.
		};
		DIA_Gorn_DI_UndeadDragonDead_OneTime = TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Biff_DI_plunder))
	{
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_08");	//Кто-то должен сказать об этом Биффу, иначе он сгниет на этом острове.
		if(Npc_IsDead(Biff_DI) == FALSE)
		{
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_09");	//Он будет здесь вовремя.
		};
	};
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_10");	//Здесь нам больше нечего делать. Скажи капитану, чтобы поднимал якорь.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Fighter_DI_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 900;
	condition = DIA_Fighter_DI_PICKPOCKET_Condition;
	information = DIA_Fighter_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Fighter_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(10,45);
};

func void DIA_Fighter_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET,Dialog_Back,DIA_Fighter_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_DI_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

func void DIA_Fighter_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

