
instance DIA_Torlof_DI_KAP3_EXIT(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 999;
	condition = DIA_Torlof_DI_KAP3_EXIT_Condition;
	information = DIA_Torlof_DI_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Torlof_DI_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DI_Hallo(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 4;
	condition = DIA_Torlof_DI_Hallo_Condition;
	information = DIA_Torlof_DI_Hallo_Info;
	permanent = TRUE;
	description = "Все спокойно?";
};


func int DIA_Torlof_DI_Hallo_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Hallo_15_00");	//Все спокойно?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_01");	//Пока да. Но все может измениться в одно мгновение. Будь осторожен.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_02");	//Если эти презренные орки будут оставаться там, где они есть сейчас, я не вижу никакой проблемы.
		B_StartOtherRoutine(Torlof_DI,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DI_Teach(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 150;
	condition = DIA_Torlof_DI_Teach_Condition;
	information = DIA_Torlof_DI_Teach_Info;
	permanent = TRUE;
	description = "Я хочу улучшить свои способности!";
};


func int DIA_Torlof_DI_Teach_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Teach_15_00");	//Я хочу улучшить свои способности!
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Torlof_DI_Teach);
};

func void DIA_Torlof_DI_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};

func void DIA_Torlof_DI_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Torlof_DI_Teach_STR_5);
};


instance DIA_Torlof_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 4;
	condition = DIA_Torlof_DI_UndeadDragonDead_Condition;
	information = DIA_Torlof_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Я уничтожил врагов.";
};


func int DIA_Torlof_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_15_00");	//Я уничтожил врагов.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_01_01");	//Я ничего другого и не ожидал. Как все прошло? Мы можем отправляться назад?
	Info_ClearChoices(DIA_Torlof_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead,"Мне нужно еще пару минут.",DIA_Torlof_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead,"Да. Все кончено.",DIA_Torlof_DI_UndeadDragonDead_over);
};

func void DIA_Torlof_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_moment_15_00");	//Мне нужно еще пару минут.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_moment_01_01");	//Поторопись!
	AI_StopProcessInfos(self);
};

func void DIA_Torlof_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};


instance DIA_Torlof_DI_PICKPOCKET(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 900;
	condition = DIA_Torlof_DI_PICKPOCKET_Condition;
	information = DIA_Torlof_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Torlof_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(76,120);
};

func void DIA_Torlof_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_DI_PICKPOCKET,Dialog_Back,DIA_Torlof_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Torlof_DI_PICKPOCKET_DoIt);
};

func void DIA_Torlof_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
};

func void DIA_Torlof_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_DI_PICKPOCKET);
};

