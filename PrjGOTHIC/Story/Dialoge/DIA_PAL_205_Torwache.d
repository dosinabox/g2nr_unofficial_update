
instance DIA_PAL_205_Torwache_EXIT(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 999;
	condition = DIA_PAL_205_Torwache_EXIT_Condition;
	information = DIA_PAL_205_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_205_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_205_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void B_Mil_205_Torwache_Crimes()
{
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_01");	//Я нарушу свой самый священный долг, если пущу сюда убийцу.
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_02");	//Ты обвиняешься в воровстве. Пока не доказано обратное, ты не можешь войти сюда!
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_03");	//Говорят, ты принимал участие в драке. Я не пропущу тебя.
	};
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_04");	//Иди к лорду Андрэ и урегулируй этот вопрос!
	B_PlayerEnteredUpperCity();
};

const string PAL_205_Checkpoint = "NW_CITY_CITYHALL_IN";

var int PAL_205_schonmalreingelassen;

instance DIA_PAL_205_Torwache_FirstWarn(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 1;
	condition = DIA_PAL_205_Torwache_FirstWarn_Condition;
	information = DIA_PAL_205_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_FirstWarn_Condition()
{
	if((MILArmor_Equipped == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return FALSE;
	}
	else if(Npc_GetDistToWP(other,PAL_205_Checkpoint) <= 550)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (PAL_205_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(PAL_205_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && !Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//СТОЙ!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		B_Mil_205_Torwache_Crimes();
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_05");	//Только люди, состоящие на службе у короля, могут войти в ратушу.
	};
	B_PlayerEnteredUpperCity();
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_PAL_205_Torwache_SecondWarn(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_SecondWarn_Condition;
	information = DIA_PAL_205_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_SecondWarn_Condition()
{
	if((MILArmor_Equipped == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return FALSE;
	}
	else if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//Если ты сделаешь еще шаг вперед, клянусь Инносом, я применю оружие!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_Attack(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_Attack_Condition;
	information = DIA_PAL_205_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_Attack_Condition()
{
	if((MILArmor_Equipped == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return FALSE;
	}
	else if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_205_Torwache_Hagen(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_Hagen_Condition;
	information = DIA_PAL_205_Torwache_Hagen_Info;
	permanent = TRUE;
	description = "Мне нужно поговорить с лордом Хагеном!";
};


func int DIA_PAL_205_Torwache_Hagen_Condition()
{
	if(PAL_205_schonmalreingelassen == FALSE)
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_PAL_205_Torwache_Hagen_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_Hagen_15_00");	//Мне нужно поговорить с лордом Хагеном!
	AI_Output(self,other,"DIA_PAL_205_Torwache_Hagen_12_01");	//Да ты знаешь, как часто я слышу это? Я не пущу тебя. А если ты все же попытаешься войти, мне придется убить тебя.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsArmoredMil(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsArmoredMil_Condition;
	information = DIA_PAL_205_Torwache_PassAsArmoredMil_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_PassAsArmoredMil_Condition()
{
	if((MILArmor_Equipped == TRUE) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsArmoredMil_Info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//Хорошо, ты можешь войти.
	B_PlayerEnteredUpperCity();
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsMil(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsMil_Condition;
	information = DIA_PAL_205_Torwache_PassAsMil_Info;
	permanent = TRUE;
	description = "Я состою в ополчении.";
};


func int DIA_PAL_205_Torwache_PassAsMil_Condition()
{
	if((other.guild == GIL_MIL) && (PAL_205_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMil_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//Я состою в ополчении.
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		B_Mil_205_Torwache_Crimes();
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//Хорошо, ты можешь войти.
		self.aivar[AIV_PASSGATE] = TRUE;
		PAL_205_schonmalreingelassen = TRUE;
	};
	B_PlayerEnteredUpperCity();
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsMage(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsMage_Condition;
	information = DIA_PAL_205_Torwache_PassAsMage_Info;
	permanent = TRUE;
	description = "Я маг Огня.";
};


func int DIA_PAL_205_Torwache_PassAsMage_Condition()
{
	if((other.guild == GIL_KDF) && (PAL_205_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMage_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//Я маг Огня.
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		B_Mil_205_Torwache_Crimes();
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Да, конечно. Прошу простить меня, о, Избранный, я просто выполняю свой долг.
		self.aivar[AIV_PASSGATE] = TRUE;
		PAL_205_schonmalreingelassen = TRUE;
	};
	B_PlayerEnteredUpperCity();
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsSld(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsSld_Condition;
	information = DIA_PAL_205_Torwache_PassAsSld_Info;
	permanent = TRUE;
	description = "Дай мне пройти, я несу послание от наемников.";
};


func int DIA_PAL_205_Torwache_PassAsSld_Condition()
{
	if(Npc_HasItems(other,ItWr_Passage_MIS) && (PAL_205_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsSld_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSld_15_00");	//Дай мне пройти, я несу послание от наемников.
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		B_Mil_205_Torwache_Crimes();
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSld_12_01");	//Хорошо, но предупреждаю тебя. Если возникнут какие-нибудь проблемы, то ты не успеешь даже пожалеть об этом.
		self.aivar[AIV_PASSGATE] = TRUE;
		PAL_205_schonmalreingelassen = TRUE;
	};
	B_PlayerEnteredUpperCity();
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PERM(C_Info)
{
	npc = PAL_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_PERM_Condition;
	information = DIA_PAL_205_Torwache_PERM_Info;
	permanent = TRUE;
	description = "Как идет служба?";
};


func int DIA_PAL_205_Torwache_PERM_Condition()
{
	if((PAL_205_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PERM_15_00");	//Как идет служба?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_01");	//Мы все держим под контролем.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_02");	//Я полностью доволен службой, о, Избранный.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_03");	//Проходи и заткнись.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_04");	//Что тебе нужно?
	};
	B_PlayerEnteredUpperCity();
	AI_StopProcessInfos(self);
};

