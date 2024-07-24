
instance DIA_Cedric_EXIT(C_Info)
{
	npc = PAL_216_Cedric;
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
	npc = PAL_216_Cedric;
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


var int DIA_Cedric_Teacher_permanent;

instance DIA_Cedric_CanTeach(C_Info)
{
	npc = PAL_216_Cedric;
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
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"ѕаладин —едрик может обучить мен€ искусству сражени€ одноручным оружием.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cedric_CanTeach_12_02");	//я тренирую только паладинов.
		if((other.guild != GIL_NONE) && (other.guild != GIL_MIL))
		{
			Cedric_Teach1H = TRUE;
			DIA_Cedric_Teacher_permanent = TRUE;
		};
	};
};


func void B_BuildLearnDialog_Cedric()
{
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Cedric)
	{
		Info_ClearChoices(DIA_Cedric_Teach);
		Info_AddChoice(DIA_Cedric_Teach,Dialog_Back,DIA_Cedric_Teach_Back);
		Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),DIA_Cedric_Teach_1H_1);
		Info_AddChoice(DIA_Cedric_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),DIA_Cedric_Teach_1H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Cedric)
		{
			DIA_Cedric_Teacher_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_1H_Cedric)),-1,53,FONT_Screen,2);
		AI_Output(self,other,"DIA_DIA_Cedric_Teach_12_01");	//“ы уже владеешь мечом лучше мен€. ћне нечему учить теб€.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Cedric_Teach(C_Info)
{
	npc = PAL_216_Cedric;
	nr = 100;
	condition = DIA_Cedric_Teach_Condition;
	information = DIA_Cedric_Teach_Info;
	permanent = TRUE;
	description = "я хочу потренироватьс€.";
};


func int DIA_Cedric_Teach_Condition()
{
	if((Cedric_Teach1H == TRUE) && (DIA_Cedric_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cedric_Teach_Info()
{
	AI_Output(other,self,"DIA_Cedric_Teach_15_00");	//я хочу потренироватьс€.
	B_BuildLearnDialog_Cedric();
};


func void DIA_Cedric_Teach_Back()
{
	Info_ClearChoices(DIA_Cedric_Teach);
};

func void DIA_Cedric_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Cedric))
	{
		B_BuildLearnDialog_Cedric();
	};
};

func void DIA_Cedric_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Cedric))
	{
		B_BuildLearnDialog_Cedric();
	};
};

