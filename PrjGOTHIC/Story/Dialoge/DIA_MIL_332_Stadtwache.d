
instance DIA_Mil_332_Stadtwache_EXIT(C_Info)
{
	npc = Mil_332_Stadtwache;
	nr = 999;
	condition = DIA_Mil_332_Stadtwache_EXIT_Condition;
	information = DIA_Mil_332_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_332_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mil_332_Stadtwache_PERM(C_Info)
{
	npc = Mil_332_Stadtwache;
	nr = 1;
	condition = DIA_Mil_332_Stadtwache_PERM_Condition;
	information = DIA_Mil_332_Stadtwache_PERM_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Mil_332_Stadtwache_PERM_Condition()
{
	return TRUE;
};

func void DIA_Mil_332_Stadtwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_332_Stadtwache_PERM_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Mil_332_Stadtwache_PERM_04_01");	//Проходи! Я на посту!
	AI_StopProcessInfos(self);
};

