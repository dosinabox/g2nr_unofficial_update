
instance DIA_Addon_HammerPirate_EXIT(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_HammerPirate_EXIT_Condition;
	information = DIA_Addon_HammerPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_HammerPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Hello(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_HammerPirate_Hello_Condition;
	information = DIA_Addon_HammerPirate_Hello_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_Hello_15_00");	//Все в порядке?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_TowerBanditsDead() == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_01");	//Конечно. Мы же расправились с этими подонками.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_02");	//Давай покончим с ними!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_03");	//Нет! Это не для меня.
	};
};


instance DIA_Addon_HammerPirate_Anheuern(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_HammerPirate_Anheuern_Condition;
	information = DIA_Addon_HammerPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Ты должен мне помочь.";
};


func int DIA_Addon_HammerPirate_Anheuern_Condition()
{
	if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_00");	//Только не говори, что ты хочешь, чтобы я пошел с тобой и помог тебе разделаться с бандитами!
	AI_Output(other,self,"DIA_Addon_PIR_6_JoinHenry_15_08");	//Точно.
	if(!Npc_IsDead(SawPirate))
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_01");	//Почему бы тебе не взять парня, который пилит дрова?
	};
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_02");	//Это работа не для меня...
};


instance DIA_Addon_HammerPirate_ComeOn(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_HammerPirate_ComeOn_Condition;
	information = DIA_Addon_HammerPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Пойдем со мной.";
};


func int DIA_Addon_HammerPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Henry_FreeBDTTower == LOG_Running) && (C_TowerBanditsDead() == FALSE) && Npc_KnowsInfo(other,DIA_Addon_HammerPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_ComeOn_15_00");	//Пойдем со мной.
	if(SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_01");	//Один из нас должен остаться здесь...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_02");	//Сначала давай подойдем поближе к лагерю.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_03");	//Есть!..
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_HammerPirate_GoHome(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_HammerPirate_GoHome_Condition;
	information = DIA_Addon_HammerPirate_GoHome_Info;
	permanent = TRUE;
	description = "Ты мне больше не нужен.";
};


func int DIA_Addon_HammerPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_GoHome_15_00");	//Ты мне больше не нужен.
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_01");	//Как скажешь...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_HammerPirate_TooFar(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_HammerPirate_TooFar_Condition;
	information = DIA_Addon_HammerPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_TooFar_07_01");	//Если ты пойдешь дальше, то я тебе не помощник...
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_02");	//Думаю, я пойду назад.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Success(C_Info)
{
	npc = PIR_1360_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_HammerPirate_Success_Condition;
	information = DIA_Addon_HammerPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_Success_Condition()
{
	if((C_TowerBanditsDead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_Success_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_01");	//Знаешь, что? Я тут подумал... а ты, пожалуй, не такой уж и плохой парень.
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_02");	//Ладно, я возвращаюсь в лагерь. Увидимся!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

