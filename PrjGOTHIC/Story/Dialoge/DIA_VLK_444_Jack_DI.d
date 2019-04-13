
instance DIA_Jack_DI_EXIT(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 999;
	condition = DIA_Jack_DI_EXIT_Condition;
	information = DIA_Jack_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jack_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_DI_GREET(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 4;
	condition = DIA_Jack_DI_GREET_Condition;
	information = DIA_Jack_DI_GREET_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Jack_DI_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Jack_DI_GREET_OneTime;

func void DIA_Jack_DI_GREET_Info()
{
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_00");	//Надеюсь, ты знаешь, что делаешь, приятель.
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_01");	//На это не уйдет много времени.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_02");	//Будь осторожен, и возвращайся назад целым и невредимым.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output(other,self,"DIA_Jack_DI_GREET_15_03");	//Что ты здесь делаешь?
			B_GivePlayerXP(XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_04");	//Если на нас опять обрушится этот ад, я уведу корабль отсюда. С тобой или без тебя! Ты слышал?
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_05");	//Не болтай ерунды. Я со всем справлюсь.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_06");	//Тогда поторопись.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_Jack_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_444_Jack_DI;
	nr = 4;
	condition = DIA_Jack_DI_UndeadDragonDead_Condition;
	information = DIA_Jack_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Я сделал это. Я уничтожил врага!";
};


func int DIA_Jack_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Jack_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_15_00");	//Я сделал это. Я уничтожил врага!
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_01");	//Я надеялся, что все кончится хорошо. Но, должен признать, последние несколько часов я не был так уверен.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_02");	//Мы можем наконец поднять паруса?
	Info_ClearChoices(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead,"Подожди немного.",DIA_Jack_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead,"Да. Закончим с этим.",DIA_Jack_DI_UndeadDragonDead_over);
};

func void DIA_Jack_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_moment_15_00");	//Подожди немного. Я еще кое-что должен сделать.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_moment_14_01");	//Тогда поторопись. Я не хочу подхватить здесь цингу.
	AI_StopProcessInfos(self);
};

func void DIA_Jack_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};

