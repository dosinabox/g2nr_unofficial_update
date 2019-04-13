
instance DIA_Addon_SawPirate_EXIT(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_SawPirate_EXIT_Condition;
	information = DIA_Addon_SawPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_SawPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_SawPirate_Hello(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_SawPirate_Hello_Condition;
	information = DIA_Addon_SawPirate_Hello_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_SawPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_SawPirate_Hello_09_01");	//Не приставай ко мне.
};


instance DIA_Addon_SawPirate_Anheuern(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_SawPirate_Anheuern_Condition;
	information = DIA_Addon_SawPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Ты один из людей Генри?";
};


func int DIA_Addon_SawPirate_Anheuern_Condition()
{
	if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_00");	//Ты один из людей Генри?
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_01");	//Нет. Просто мне нравится пилить деревья.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_02");	//Что такое? Генри поручил тебе какое-то задание?
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_04");	//Да. Я должен убить нескольких бандитов.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_03");	//Нет. Не-ет! Не смотри на меня так! Я не хочу туда идти.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_04");	//Мне нужно пилить, ты меня слышишь?
};


var int SawPirate_ComeOn_Once;

instance DIA_Addon_SawPirate_ComeOn(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_SawPirate_ComeOn_Condition;
	information = DIA_Addon_SawPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Пойдем со мной.";
};


func int DIA_Addon_SawPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Henry_FreeBDTTower == LOG_Running) && (C_TowerBanditsDead() == FALSE) && Npc_KnowsInfo(other,DIA_Addon_SawPirate_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_ComeOn_15_00");	//Пойдем со мной.
	if(HammerPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_01");	//Зачем я тебе нужен? С тобой уже есть люди...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_04");	//Сначала давай подойдем поближе к лагерю.
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(HammerPirate) && (SawPirate_ComeOn_Once == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_02");	//(ворчит) Он бы мог позвать и кого-нибудь другого...
		SawPirate_ComeOn_Once = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_03");	//Есть!..
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_SawPirate_GoHome(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_SawPirate_GoHome_Condition;
	information = DIA_Addon_SawPirate_GoHome_Info;
	permanent = TRUE;
	description = "Ты мне больше не нужен.";
};


func int DIA_Addon_SawPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_GoHome_15_00");	//Ты мне больше не нужен.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_01");	//В таком случае я вернусь к своей работе.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_SawPirate_TooFar(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_SawPirate_TooFar_Condition;
	information = DIA_Addon_SawPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_SawPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_TooFar_09_01");	//Мы слишком далеко от лагеря.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_02");	//Мне все это не нравится. Я возвращаюсь.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_SawPirate_Success(C_Info)
{
	npc = PIR_1361_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_SawPirate_Success_Condition;
	information = DIA_Addon_SawPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_SawPirate_Success_Condition()
{
	if((C_TowerBanditsDead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_Success_Info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_01");	//Знаешь что? Поразмыслив, я решил, что ты просто сволочь!
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_02");	//Я возвращаюсь в лагерь и надеюсь, что больше тебя никогда не увижу!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

