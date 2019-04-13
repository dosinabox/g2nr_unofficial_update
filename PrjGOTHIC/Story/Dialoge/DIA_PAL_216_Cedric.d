
instance DIA_Cedric_EXIT(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 999;
	condition = DIA_Cedric_EXIT_Condition;
	information = DIA_Cedric_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cedric_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cedric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cedric_Hallo(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 2;
	condition = DIA_Cedric_Hallo_Condition;
	information = DIA_Cedric_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cedric_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cedric_Hallo_12_00");	//я —едрик, мастер меча и паладин корол€.
};


instance DIA_Cedric_CanTeach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 5;
	condition = DIA_Cedric_CanTeach_Condition;
	information = DIA_Cedric_CanTeach_Info;
	permanent = TRUE;
	description = "“ы можешь обучить мен€?";
};


func int DIA_Cedric_CanTeach_Condition()
{
	if(Cedric_Teach1H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Cedric_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Cedric_CanTeach_15_00");	//“ы можешь обучить мен€?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_01");	//я могу научить теб€ сражатьс€ одноручным оружием.
		Cedric_Teach1H = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"ѕаладин —едрик может обучить мен€ искусству сражени€ одноручным оружием.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_02");	//я тренирую только паладинов.
	};
};


instance DIA_Cedric_Teach(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 100;
	condition = DIA_Cedric_Teach_Condition;
	information = DIA_Cedric_Teach_Info;
	permanent = TRUE;
	description = "я хочу потренироватьс€.";
};


var int DIA_Cedric_Teach_permanent;

func int DIA_Cedric_Teach_Condition()
{
	if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Teach_Info()
{
	AI_Output(other,self,"DIA_Cedric_Teach_15_00");	//я хочу потренироватьс€.
	if(other.HitChance[NPC_TALENT_1H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Cedric_Teach_12_01");	//“ы уже владеешь мечом лучше мен€. ћне нечему учить теб€.
	}
	else
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);
		Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
		Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
	};
};

func void DIA_Cedric_Teach_Back()
{
	Info_ClearChoices(DIA_Cedric_Teach);
};

func void DIA_Cedric_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(DIA_Cedric_Teach);
	Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);
	Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
	Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
};

func void DIA_Cedric_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(DIA_Cedric_Teach);
	Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);
	Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cedric_Teach_2H_1);
	Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cedric_Teach_2H_5);
};


instance DIA_Cedric_PICKPOCKET(C_Info)
{
	npc = Pal_216_Cedric;
	nr = 900;
	condition = DIA_Cedric_PICKPOCKET_Condition;
	information = DIA_Cedric_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Cedric_PICKPOCKET_Condition()
{
	return C_Beklauen(37,55);
};

func void DIA_Cedric_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
	Info_AddChoice(DIA_Cedric_PICKPOCKET,Dialog_Back,DIA_Cedric_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cedric_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cedric_PICKPOCKET_DoIt);
};

func void DIA_Cedric_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
};

func void DIA_Cedric_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cedric_PICKPOCKET);
};

