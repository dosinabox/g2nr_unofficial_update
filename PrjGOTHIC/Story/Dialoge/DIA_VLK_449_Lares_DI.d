
instance DIA_Lares_DI_EXIT(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 999;
	condition = DIA_Lares_DI_EXIT_Condition;
	information = DIA_Lares_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lares_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_DI_Hallo(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 2;
	condition = DIA_Lares_DI_Hallo_Condition;
	information = DIA_Lares_DI_Hallo_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Lares_DI_Hallo_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_Hallo_15_00");	//Как дела?
	if(ORkSturmDI == TRUE)
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_01");	//Поторопись. Орки, наверняка, вернутся опять.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_02");	//Хорошо. Хотя этот грот немного пугает меня.
	};
};


instance DIA_Lares_DI_Training(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 10;
	condition = DIA_Lares_DI_Training_Condition;
	information = DIA_Lares_DI_Training_Info;
	permanent = TRUE;
	description = "Научи меня тому, что знаешь сам.";
};


func int DIA_Lares_DI_Training_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Training_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_Training_15_00");	//Научи меня тому, что знаешь сам.
	AI_Output(self,other,"DIA_Lares_DI_Training_09_01");	//Нет проблем.
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Научиться красться",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_1_09_00");	//Тебе нужно согнуть немного переднюю ногу и выпрямить спину - так ты займешь правильную стойку.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Научиться красться",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_5_09_00");	//Не напрягай бедра, это позволит тебе вовремя уклониться от контратаки.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Научиться красться",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_1_09_00");	//Верхняя часть твоего туловища должна действовать согласованно с нижней.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Научиться красться",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_5_09_00");	//Всегда следи за своими ногами.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Научиться красться",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_SNEAK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_SNEAK_09_00");	//Всегда используй всю площадь подошвы, когда крадешься.
	};
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training,"Научиться красться",DIA_Lares_DI_Training_SNEAK);
	};
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Lares_DI_Training);
};


instance DIA_Lares_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 5;
	condition = DIA_Lares_DI_UndeadDragonDead_Condition;
	information = DIA_Lares_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Похоже, все это тебя не особенно волнует.";
};


func int DIA_Lares_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Lares_DI_UndeadDragonDead_OneTime;

func void DIA_Lares_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_00");	//Похоже, все это тебя не особенно волнует.
	AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_01");	//Ах, знаешь, я был уверен, что ты справишься.
	if(DIA_Lares_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_02");	//Что ты собираешься делать дальше?
		AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_03");	//Пока не знаю. Пожалуй, я пока побуду с тобой.
		DIA_Lares_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};

