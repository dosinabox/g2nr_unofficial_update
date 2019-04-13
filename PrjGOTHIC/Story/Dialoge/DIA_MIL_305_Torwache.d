
instance DIA_Mil_305_Torwache_EXIT(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 999;
	condition = DIA_Mil_305_Torwache_EXIT_Condition;
	information = DIA_Mil_305_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_305_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_305_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_305_Checkpoint = "NW_CITY_UPTOWN_PATH_02";

instance DIA_Mil_305_Torwache_FirstWarn(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_FirstWarn_Condition;
	information = DIA_Mil_305_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_305_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (Mil_305_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_305_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_00");	//СТОЙ!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_01");	//Тебя подозревают в убийстве в городе! Пока обвинения не сняты, я не могу пропустить тебя в верхний квартал.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_02");	//Пока ты обвиняешься в воровстве, ты не можешь войти в верхний квартал города!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_03");	//Я не могу пропустить в верхний квартал города нарушителя спокойствия вроде тебя.
		};
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_04");	//Иди к лорду Андрэ и урегулируй эту проблему!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_05");	//Только граждане города и служащие королевских войск могут входить  верхний квартал города!
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_305_Torwache_SecondWarn(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_SecondWarn_Condition;
	information = DIA_Mil_305_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_SecondWarn_03_00");	//Я последний раз предупреждаю тебя. Еще один шаг - и ты познакомишься с моим мечом.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_Attack(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_Attack_Condition;
	information = DIA_Mil_305_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_305_Torwache_Attack_03_00");	//Ты сам напросился...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_305_Torwache_MESSAGE(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_MESSAGE_Condition;
	information = DIA_Mil_305_Torwache_MESSAGE_Info;
	permanent = FALSE;
	description = "У меня важное сообщение для лорда Хагена.";
};


func int DIA_Mil_305_Torwache_MESSAGE_Condition()
{
	if((Player_KnowsLordHagen == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_MESSAGE_15_00");	//У меня важное сообщение для лорда Хагена.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_01");	//Половина города хочет поговорить с лордом Хагеном по важному вопросу.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_02");	//Если я буду пропускать каждого просителя, он только и будет что заниматься мелкими проблемами горожан.
};


instance DIA_Mil_305_Torwache_Ausnahme(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_Ausnahme_Condition;
	information = DIA_Mil_305_Torwache_Ausnahme_Info;
	permanent = TRUE;
	description = "А может сделать для меня исключение?";
};


func int DIA_Mil_305_Torwache_Ausnahme_Condition()
{
	if(Mil_305_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Ausnahme_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_Ausnahme_15_00");	//А может сделать для меня исключение?
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_01");	//Что?! Правила есть правила! Правила применимы ко всем без исключения!
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_02");	//Если я позволю тебе нарушить эти правила, это будет нечестно по отношению к тем, кто выполняет их.
};


instance DIA_Mil_305_Torwache_PassAsCitizen(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information = DIA_Mil_305_Torwache_PassAsCitizen_Info;
	permanent = TRUE;
	description = "Я уважаемый гражданин Хориниса! Позволь мне пройти!";
};


func int DIA_Mil_305_Torwache_PassAsCitizen_Condition()
{
	if((Mil_305_schonmalreingelassen == FALSE) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsCitizen_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00");	//Я уважаемый гражданин Хориниса! Позволь мне пройти!
	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01");	//Я не знаю, что заставило мастеров Хориниса принять тебя в ученики - и не хочу знать.
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02");	//Ты можешь войти! Но веди себя как положено! Если не хочешь нарваться на серьезные неприятности!
		self.aivar[AIV_PASSGATE] = TRUE;
		Mil_305_schonmalreingelassen = TRUE;
		B_CheckLog();
		AI_StopProcessInfos(self);
	}
	else if((MIS_Matteo_Gold == LOG_SUCCESS) || (MIS_Thorben_GetBlessings == LOG_SUCCESS) || (MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS) || (MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03");	//Возможно, тебе удалось договориться с некоторыми мастерами в нижней части города, но если бы ты был гражданином, я бы знал об этом!
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04");	//Не пытайся обмануть меня! Я предупреждаю тебя!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05");	//Ты не стоишь грязи под моими ногтями! Прочь с глаз моих!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Mil_305_Torwache_PassAsMil(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsMil_Condition;
	information = DIA_Mil_305_Torwache_PassAsMil_Info;
	permanent = TRUE;
	description = "Я состою в ополчении - дай мне пройти!";
};


func int DIA_Mil_305_Torwache_PassAsMil_Condition()
{
	if((other.guild == GIL_MIL) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMil_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMil_15_00");	//Я состою в ополчении - дай мне пройти!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_01");	//Так Андрэ принял тебя? Возможно, ты не такой уж плохой парень, как кажешься!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_02");	//Теперь ты один из защитников города! Так что постарайся быть вежливым и дружелюбным с горожанами!
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PassAsMage(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsMage_Condition;
	information = DIA_Mil_305_Torwache_PassAsMage_Info;
	permanent = TRUE;
	description = "Ты смеешь стоять на пути представителя Инноса?";
};


func int DIA_Mil_305_Torwache_PassAsMage_Condition()
{
	if((other.guild == GIL_KDF) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMage_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_00");	//Ты смеешь стоять на пути представителя Инноса?
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_01");	//Ээээ... нет! Конечно, нет! Для избранных Инноса вход открыт!
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_02");	//Молись, чтобы Иннос простил тебе это кощунство!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_03");	//Да, о, избранный!
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PassAsSld(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsSld_Condition;
	information = DIA_Mil_305_Torwache_PassAsSld_Info;
	permanent = TRUE;
	description = "У меня важное сообщение для лорда Хагена!";
};


func int DIA_Mil_305_Torwache_PassAsSld_Condition()
{
	if((other.guild == GIL_SLD) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsSld_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_00");	//У меня важное сообщение для лорда Хагена!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_01");	//Ты один из этих подонков наемников! Что тебе нужно от лорда Хагена?
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_02");	//Я пришел с предложением мира.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_03");	//Ах! Значит, наконец, до вас, подлецов, дошел голос разума. Тогда проходи к лорду Хагену, но постарайся быть милым и вежливым, или я так отделаю тебя, что мало не покажется!
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PERM(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_PERM_Condition;
	information = DIA_Mil_305_Torwache_PERM_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Mil_305_Torwache_PERM_Condition()
{
	if((Mil_305_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PERM_15_00");	//Как дела?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_01");	//Все хорошо, друг!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_02");	//Мы просто выполняем свою работу. Спасибо, что обратил на меня свое внимание, о, избранный!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_03");	//Возможно, мне придется пропустить тебя, но я не хочу разговаривать с тобой!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_04");	//Что тебе нужно?
	};
	AI_StopProcessInfos(self);
};

