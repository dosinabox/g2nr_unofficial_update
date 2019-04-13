
instance DIA_Mil_333_Stadtwache_EXIT(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 999;
	condition = DIA_Mil_333_Stadtwache_EXIT_Condition;
	information = DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_333_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_333_Checkpoint = "NW_CITY_MERCHANT_PATH_29";

var int MIL_333_Personal_AbsolutionLevel;

instance DIA_Mil_333_Stadtwache_FirstWarn(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 1;
	condition = DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_333_Checkpoint) <= 1000)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_333_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	var C_Item itm;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//СТОЙ!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01");	//(вздыхает) Что еще?
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02");	//Ты прекрасно знаешь, что!
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03");	//Ты разыскиваешься за убийство в городе!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04");	//Мы не потерпим здесь грязных воров!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05");	//Нам не нужны смутьяны в городе!
		};
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06");	//С чего ты взял, что мы должны впустить тебя?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,ITAR_Bau_L) == TRUE) || (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//Да?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08");	//Ты похож на нищего. В этом городе нам не нужны люди, у которых нет денег.
			if(Npc_HasItems(other,ItWr_Passierschein))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09");	//Но у меня есть пропуск!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10");	//Он годен только для других ворот!
			};
			if(Npc_KnowsInfo(other,DIA_Mil_310_Stadtwache_MilizWerden))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11");	//Но я хочу вступить в городскую стражу!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12");	//Ха! Не смеши меня! Иди к другим воротам и попробуй рассказать это там.
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13");	//Я уже был там, они отправили меня сюда.
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14");	//(грязный смех) Ох, парень! Они всегда посылают к нам сливки общества...
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15");	//(спокойно) Что?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16");	//Я просто хотел посмотреть на тебя. Ох, да, похоже, у тебя есть деньги. Проходи.
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
			Mil_333_schonmalreingelassen = TRUE;
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_333_Stadtwache_SecondWarn(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 2;
	condition = DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00");	//У тебя со слухом все в порядке? Еще один шаг, и ты познакомишься с моим мечом!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_333_Stadtwache_Attack(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 3;
	condition = DIA_Mil_333_Stadtwache_Attack_Condition;
	information = DIA_Mil_333_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_Attack_06_00");	//Ты сам напросился...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_333_Stadtwache_Bribe(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_Bribe_Condition;
	information = DIA_Mil_333_Stadtwache_Bribe_Info;
	permanent = TRUE;
	description = "Вот 100 золотых. Позволь мне пройти!";
};


func int DIA_Mil_333_Stadtwache_Bribe_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Bribe_Info()
{
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_Bribe_15_00");	//Вот 100 золотых. Позволь мне пройти!
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_01");	//(жадно) 100 золотых - это неплохо. Проходи, конечно.
		if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_02");	//И сразу иди к Андрэ! Или я в следующий раз опять возьму с тебя 100 золотых!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
		Mil_333_schonmalreingelassen = TRUE;
		B_CheckLog();
		MIL_333_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_03");	//Что?! Где?! Я не вижу золота. Проваливай!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Mil_333_Stadtwache_PERM(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_PERM_Condition;
	information = DIA_Mil_333_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_PERM_06_00");	//Проходи!
	AI_StopProcessInfos(self);
};

