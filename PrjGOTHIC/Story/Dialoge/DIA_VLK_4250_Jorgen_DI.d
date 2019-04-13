
instance DIA_Jorgen_DI_KAP3_EXIT(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 999;
	condition = DIA_Jorgen_DI_KAP3_EXIT_Condition;
	information = DIA_Jorgen_DI_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jorgen_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jorgen_DI_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_DI_Hallo(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 4;
	condition = DIA_Jorgen_DI_Hallo_Condition;
	information = DIA_Jorgen_DI_Hallo_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Jorgen_DI_Hallo_Condition()
{
	if(Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_Hallo_15_00");	//Все в порядке?
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_01");	//Конечно - пока эти монстры не приближаются к нам...
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_02");	//Нам не пережить следующую атаку орков. Так что поторопись - нужно убираться отсюда.
		B_StartOtherRoutine(Jorgen_DI,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jorgen_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_4250_Jorgen_DI;
	nr = 4;
	condition = DIA_Jorgen_DI_UndeadDragonDead_Condition;
	information = DIA_Jorgen_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Врагу настал конец.";
};


func int DIA_Jorgen_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_15_00");	//Врагу настал конец.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_07_01");	//Это хорошие новости. Надеюсь, нам больше ничего не нужно на этом острове?
	Info_ClearChoices(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead,"Подожди минутку.",DIA_Jorgen_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead,"Все, мы можем отправляться в путь.",DIA_Jorgen_DI_UndeadDragonDead_over);
};

func void DIA_Jorgen_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_moment_15_00");	//Подожди минутку. Я забыл сделать кое-что.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_moment_07_01");	//Хорошо. Но поторопись.
	AI_StopProcessInfos(self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};

