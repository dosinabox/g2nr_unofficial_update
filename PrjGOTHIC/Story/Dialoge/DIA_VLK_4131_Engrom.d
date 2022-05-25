
instance DIA_Engrom_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_HALLO(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 5;
	condition = DIA_Engrom_HALLO_Condition;
	information = DIA_Engrom_HALLO_Info;
	description = "Как дела?";
};


func int DIA_Engrom_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Паршиво!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Ммм!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//А что еще я могу сказать? Изо дня в день я вижу только эту чертову реку.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Орки шныряют на левом берегу, бандиты - на правом, и каждый день я ем только мясо луркеров. Я уже не могу выносить все это!
};


instance DIA_Engrom_WhatAboutLeaving(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_WhatAboutLeaving_Condition;
	information = DIA_Engrom_WhatAboutLeaving_Info;
	description = "А ты не думал о том, чтобы выбраться отсюда?";
};


func int DIA_Engrom_WhatAboutLeaving_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_WhatAboutLeaving_Info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//А ты не думал о том, чтобы выбраться отсюда?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//Да, конечно. С этим нет никаких проблем.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Сначала мне нужно прорубить себе дорогу через орды орков, поприветствовать всех остальных монстров, которых там тоже немало, а затем прошмыгнуть через Проход!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//Что может быть легче!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Я же пришел сюда.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Ты хочешь сказать мне, что ты только что прошел через Проход?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Ну, в общем да!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Значит, тебе повезло. Пока вокруг творится такой бардак, я с места не сдвинусь.
};


instance DIA_Engrom_Jagd(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Jagd_Condition;
	information = DIA_Engrom_Jagd_Info;
	permanent = TRUE;
	description = "Как охота?";
};


func int DIA_Engrom_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Jagd_Info()
{
	B_WasMachtJagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Охота - моя единственная отрада. Но мне бы хотелось хоть иногда видеть нормальную цель, а не этих отвратительных луркеров.
};


instance DIA_Engrom_KAP3_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP3_EXIT_Condition;
	information = DIA_Engrom_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_B_NpcObsessedByDMT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 32;
	condition = DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information = DIA_Engrom_B_NpcObsessedByDMT_Info;
	description = "Все в порядке?";
};


func int DIA_Engrom_B_NpcObsessedByDMT_Condition()
{
	if((NpcObsessedByDMT_Engrom == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info()
{
	DIA_Common_IsEverythingOk();
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT(self);
};


instance DIA_Engrom_BESSEN(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 55;
	condition = DIA_Engrom_BESSEN_Condition;
	information = DIA_Engrom_BESSEN_Info;
	permanent = TRUE;
	description = "Ты одержим Злом.";
};


func int DIA_Engrom_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Engrom == TRUE) && (NpcObsessedByDMT == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Ты одержим Злом.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Давай, я помогу тебе.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//(вопит) Не трогай меня!
	B_NpcClearObsessionByDMT(self);
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,ZS_Flee,0,"");
	}
	else
	{
		Npc_ExchangeRoutine(self,"FleePass");
		if(Engrom_Orc_Spawned == FALSE)
		{
			Wld_InsertNpc(OrcWarrior_Scout,"START");
			Engrom_Orc_Spawned = TRUE;
		};
	};
};

