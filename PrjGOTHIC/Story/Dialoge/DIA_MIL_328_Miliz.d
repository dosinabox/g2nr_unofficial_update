
instance DIA_328_Miliz_EXIT(C_Info)
{
	npc = Mil_328_Miliz;
	nr = 999;
	condition = DIA_328_Miliz_EXIT_Condition;
	information = DIA_328_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_328_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_328_Miliz_Hi(C_Info)
{
	npc = Mil_328_Miliz;
	nr = 1;
	condition = DIA_328_Miliz_Hi_Condition;
	information = DIA_328_Miliz_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_328_Miliz_Hi_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_Hi_Info()
{
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_00");	//Эй, тебе нечего делать здесь. Понятно?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_01");	//Кто ты такой?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_02");	//Это не твое дело! Здесь я главный. Понял?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_03");	//Главный? Над чем? Над этими сундуками?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_04");	//Эй, этот склад находится в моем ведении, понял? Так что проваливай, или я раскрою твой череп.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
};


instance DIA_328_Miliz_Kill(C_Info)
{
	npc = Mil_328_Miliz;
	nr = 2;
	condition = DIA_328_Miliz_Kill_Condition;
	information = DIA_328_Miliz_Kill_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_328_Miliz_Kill_Condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_328_Miliz_Kill_Info()
{
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_00");	//Эй, ты все еще здесь! Разве я не сказал тебе, чтобы ты проваливал?
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_01");	//Ну, держись! Сейчас я покажу тебе, кто здесь главный!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	B_Attack(self,other,AR_KILL,1);
};

