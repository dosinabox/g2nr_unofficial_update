
instance DIA_Addon_Paul_EXIT(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 999;
	condition = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_Hi(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 1;
	condition = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent = FALSE;
	description = "У тебя есть что-нибудь из кузнечного инструмента?";
};


func int DIA_Addon_Paul_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//У тебя есть что-нибудь из кузнечного инструмента?
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//У Хуно есть сталь. У меня только несколько кусков руды.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//Но я не отдам их. Это единственное, что у меня осталось ценного.
};


instance DIA_Addon_Paul_Huno(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent = FALSE;
	description = "Ты работаешь на Хуно?";
};


func int DIA_Addon_Paul_Huno_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Huno_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//Ты работаешь на Хуно?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//Я хотел заработать немного золота, стал работать с ним. Но с тех пор Эстебан не дал мне ничего.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//Он сказал, что я ему больше не пригожусь.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//А чем я могу еще заняться, кроме как продолжать работать с Хуно?
};


instance DIA_Addon_Paul_Attentat(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 3;
	condition = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Paul_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//Ничего, приятель. И тут уж ничего не поделаешь! Что ты хочешь от меня?
};


instance DIA_Addon_Paul_HunoVerdacht(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 4;
	condition = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent = FALSE;
	description = "Хуно подозревается в причастности к нападению...";
};


func int DIA_Addon_Paul_HunoVerdacht_Condition()
{
	if(((Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE)) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//Хуно подозревается в причастности к нападению...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//Я ничего про это не знаю!
};


instance DIA_Addon_Paul_HunoArbeit(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent = FALSE;
	description = "Но ты же работаешь на Хуно! Так что ты должен что-то знать!";
};


func int DIA_Addon_Paul_HunoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno) && Npc_KnowsInfo(other,DIA_Addon_Paul_HunoVerdacht) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//Но ты же работаешь на Хуно! Так что ты должен что-то знать!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//(в отчаянии) Я ничего не знаю - честно! Мне нужно идти!
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_FearEsteban(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent = FALSE;
	description = "Ты знаешь, что Эстебан сделает с тобой, если узнает, что ты прикрываешь Хуно?";
};


func int DIA_Addon_Paul_FearEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_HunoArbeit) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//Ты знаешь, что Эстебан сделает с тобой, если узнает, что ты прикрываешь Хуно?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//Парень! Оставь меня в покое. Я не имею никакого отношения к этому.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Paul_MaulPaul(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 5;
	condition = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent = FALSE;
	description = "Пол, скажи мне, что тебе известно, или я размажу тебя по этой стенке!";
};


func int DIA_Addon_Paul_MaulPaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_FearEsteban) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//(дружелюбно) Пол, скажи мне, что тебе известно, или я размажу тебя по этой стенке!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//Ты не можешь избить меня просто потому, что ты работаешь на босса.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//(любезно) Могу!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//Не говори глупостей!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//(нетерпеливо) Пол...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//(лихорадочно) Я знаю только, что у Хуно с Эстебаном, ну, какие-то разногласия.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//(лихорадочно) При мне он... он постоянно ругается на Эстебана. Что тот испортил ему дело, ну и все такое...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//Я только слушал и никогда ничего не говорил.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//Отлично! Вот видишь, это было не так сложно.
	Npc_ExchangeRoutine(self,"START");
	Paul_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Пол сказал, что Хуно ненавидит Эстебана, потому что он проворачивает свои дела.");
};


instance DIA_Addon_BDT_1070_Paul_Mine(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 2;
	condition = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Paul_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && Npc_HasItems(other,ItMi_Addon_Stone_01))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//Наконец! Вот, я хочу, чтобы ты взял за это мою руду.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Player_SentBuddler += 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Paul_PERM(C_Info)
{
	npc = BDT_1070_Addon_Paul;
	nr = 99;
	condition = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int DIA_Addon_Paul_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//С тобой все в порядке?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//Да, я получу кучу золота из этой скалы!
	}
	else if((Paul_TellAll == TRUE) && (Huno_zuSnaf == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//Я рассказал тебе все, что я знаю!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//Я просто хочу делать свою работу, приятель!
	};
};

