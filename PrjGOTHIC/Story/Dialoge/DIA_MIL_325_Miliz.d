
instance DIA_Mil_325_Miliz_EXIT(C_Info)
{
	npc = MIL_325_Miliz;
	nr = 999;
	condition = DIA_Mil_325_Miliz_EXIT_Condition;
	information = DIA_Mil_325_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_325_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_325_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_325_Checkpoint = "NW_CITY_MERCHANT_PATH_03";

instance DIA_Mil_325_Miliz_FirstWarn(C_Info)
{
	npc = MIL_325_Miliz;
	nr = 1;
	condition = DIA_Mil_325_Miliz_FirstWarn_Condition;
	information = DIA_Mil_325_Miliz_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_325_Miliz_FirstWarn_Condition()
{
	if(C_NpcHasGuardStatus(self,Mil_325_Checkpoint,GP_NONE) && !Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_FirstWarn_Info()
{
	B_PlayerEnteredCity();
	if(Npc_GetDistToWP(other,Mil_325_Checkpoint) < 650)
	{
		other.aivar[AIV_LastDistToWP] = 0;
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
		B_Say(self,other,"$WHATDIDYOUDOINTHERE");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_325_Miliz_FirstWarn_12_00");	//СТОЙ!
		AI_Output(self,other,"DIA_Mil_325_Miliz_FirstWarn_12_01");	//Сюда вход запрещен!
		other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_325_Checkpoint);
		self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	};
};


instance DIA_Mil_325_Miliz_SecondWarn(C_Info)
{
	npc = MIL_325_Miliz;
	nr = 2;
	condition = DIA_Mil_325_Miliz_SecondWarn_Condition;
	information = DIA_Mil_325_Miliz_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_325_Miliz_SecondWarn_Condition()
{
	if(C_NpcHasGuardStatus(self,Mil_325_Checkpoint,GP_FirstWarnGiven))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_SecondWarn_Info()
{
	if(Npc_GetDistToWP(other,Mil_325_Checkpoint) < 650)
	{
		other.aivar[AIV_LastDistToWP] = 0;
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
		B_Say(self,other,"$WHATDIDYOUDOINTHERE");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_325_Miliz_SecondWarn_12_00");	//Ты что, оглох? Еще один шаг, и я порублю тебя в капусту!
		other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_325_Checkpoint);
		self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Mil_325_Miliz_Attack(C_Info)
{
	npc = MIL_325_Miliz;
	nr = 3;
	condition = DIA_Mil_325_Miliz_Attack_Condition;
	information = DIA_Mil_325_Miliz_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_325_Miliz_Attack_Condition()
{
	if(C_NpcHasGuardStatus(self,Mil_325_Checkpoint,GP_SecondWarnGiven))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_Attack_Info()
{
	if(Npc_GetDistToWP(other,Mil_325_Checkpoint) < 650)
	{
		other.aivar[AIV_LastDistToWP] = 0;
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
		B_Say(self,other,"$WHATDIDYOUDOINTHERE");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else
	{
		other.aivar[AIV_LastDistToWP] = 0;
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
		AI_Output(self,other,"DIA_Mil_325_Miliz_Attack_12_00");	//Это была твоя ошибка!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	};
};


func void B_Mil_325_Storage_Pass()
{
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_Yes_12_01");	//Хорошо, ты можешь войти!
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Mil_325_Miliz_Pass(C_Info)
{
	npc = MIL_325_Miliz;
	nr = 5;
	condition = DIA_Mil_325_Miliz_Pass_Condition;
	information = DIA_Mil_325_Miliz_Pass_Info;
	permanent = FALSE;
	description = "Я состою в королевской армии. Я хочу взять снаряжение!";
};


func int DIA_Mil_325_Miliz_Pass_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_Pass_Info()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_15_00");	//Я состою в королевской армии. Я хочу взять снаряжение!
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_12_01");	//У тебя есть разрешение на это?
	Info_ClearChoices(DIA_Mil_325_Miliz_Pass);
	Info_AddChoice(DIA_Mil_325_Miliz_Pass,"Нет.",DIA_Mil_325_Miliz_Pass_No);
	Info_AddChoice(DIA_Mil_325_Miliz_Pass,"Конечно.",DIA_Mil_325_Miliz_Pass_Yes);
};

func void DIA_Mil_325_Miliz_Pass_Yes()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_Yes_15_00");	//Конечно.
	B_Mil_325_Storage_Pass();
};

func void DIA_Mil_325_Miliz_Pass_No()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_Pass_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Mil_325_Miliz_Pass_No_12_01");	//Тогда убирайся отсюда.
	AI_StopProcessInfos(self);
};


instance DIA_Mil_325_Miliz_PassAsMage(C_Info)
{
	npc = MIL_325_Miliz;
	nr = 5;
	condition = DIA_Mil_325_Miliz_PassAsMage_Condition;
	information = DIA_Mil_325_Miliz_PassAsMage_Info;
	permanent = FALSE;
	description = "Я маг Огня.";
};


func int DIA_Mil_325_Miliz_PassAsMage_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_PassAsMage_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//Я маг Огня.
	B_Mil_325_Storage_Pass();
};


instance DIA_Mil_325_Miliz_PERM(C_Info)
{
	npc = MIL_325_Miliz;
	nr = 5;
	condition = DIA_Mil_325_Miliz_PERM_Condition;
	information = DIA_Mil_325_Miliz_PERM_Info;
	permanent = TRUE;
	description = "Почему никому нельзя входить на этот склад?";
};


func int DIA_Mil_325_Miliz_PERM_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_325_Miliz_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_325_Miliz_PERM_15_00");	//Почему никому нельзя входить на этот склад?
	AI_Output(self,other,"DIA_Mil_325_Miliz_PERM_12_01");	//Достопочтенный лорд Хаген хранит здесь товары, конфискованные для королевской армии.
};

