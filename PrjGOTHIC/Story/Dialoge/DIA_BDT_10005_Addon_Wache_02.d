
instance DIA_Addon_Wache_02_EXIT(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 999;
	condition = DIA_Addon_Wache_02_EXIT_Condition;
	information = DIA_Addon_Wache_02_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Wache_02_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_02_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Wache_02_Hi(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 2;
	condition = DIA_Addon_Wache_02_Hi_Condition;
	information = DIA_Addon_Wache_02_Hi_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Addon_Wache_02_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_02_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Hi_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_01");	//Подожди-ка, а мы с тобой не знакомы?
	B_UseFakeHeroFace(self,other);
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_02");	//Хм-м... нет, ты не похож. Проходи, не задерживайся.
};


instance DIA_Addon_Wache_02_Attentat(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 2;
	condition = DIA_Addon_Wache_02_Attentat_Condition;
	information = DIA_Addon_Wache_02_Attentat_Info;
	permanent = FALSE;
	description = "Что ты знаешь о нападении?";
};


func int DIA_Addon_Wache_02_Attentat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Wache_02_Hi) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Wache_02_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Attentat_15_00");	//Что ты знаешь о нападении?
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_01");	//Что я знаю о нем? (смеется) Я сломал этому парню ноги.
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_02");	//(угрожающе) И я сделаю это с каждым, кто попробует напасть на Эстебана...
};


instance DIA_Addon_Wache_02_perm(C_Info)
{
	npc = BDT_10005_Addon_Wache_02;
	nr = 99;
	condition = DIA_Addon_Wache_02_perm_Condition;
	information = DIA_Addon_Wache_02_perm_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_Wache_02_perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Wache_02_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Wache_02_perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_perm_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_01");	//Пока что тихо.
	if(MIS_Judas == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_02");	//Ты найдешь предателя - мы позаботимся о нем...
	};
};

