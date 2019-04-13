
instance DIA_Addon_Emilio_EXIT(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 999;
	condition = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Emilio_PICKPOCKET(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 900;
	condition = DIA_Addon_Emilio_PICKPOCKET_Condition;
	information = DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	return C_Beklauen(76,112);
};

func void DIA_Addon_Emilio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET,Dialog_Back,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};

func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};


instance DIA_Addon_BDT_10015_Emilio_Hi(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 1;
	condition = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent = FALSE;
	description = "Ты выглядишь, как рудокоп.";
};


func int DIA_Addon_Emilio_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Hi_15_00");	//Ты выглядишь, как рудокоп.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Hi_10_01");	//Я и есть рудокоп. Последний раз, когда я был в шахте, я устал как собака.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_BDT_10015_Emilio_Gold(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 2;
	condition = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent = FALSE;
	description = "Куда девается золото, которое вы добываете?";
};


func int DIA_Addon_Emilio_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Gold_15_00");	//Куда девается золото, которое вы добываете?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_01");	//Торус собирает его и распределяет. Никому не разрешается забирать себе то, что он нашел.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_02");	//Каждый получает свою долю - таким образом, не обделены даже стражники и охотники.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_03");	//Мне кажется, это хорошая система. С тех пор как ввели это правило, количество смертей уменьшилось, а рудокопы все равно получают больше, чем те, кто не работает в шахте.
};


instance DIA_Addon_BDT_10015_Emilio_Stein(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 3;
	condition = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent = FALSE;
	description = "Что это за система с красными камнями?";
};


func int DIA_Addon_Emilio_Stein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_Jetzt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Stein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Stein_15_00");	//Что это за система с красными камнями?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_01");	//Это придумали Торус и Эстебан.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_02");	//Торус заботится о распределении золота, а Эстебан организует работников для шахты.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_03");	//Конечно, он не хочет бегать к Торусу каждый раз, когда кто-то идет в шахту.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_04");	//Поэтому он и дает работникам одну из таких красных каменных плиток, и Торус тогда точно знает, кого пускать. Это как пропуск.
};


var int Emilio_Switch;

instance DIA_Addon_Emilio_Attentat(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 4;
	condition = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent = TRUE;
	description = "Что тебе известно о нападении?";
};


func int DIA_Addon_Emilio_Attentat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_VonEmilio) && Npc_IsDead(Senyan))
	{
		return FALSE;
	}
	else if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Attentat_15_00");	//Что тебе известно о нападении?
	if(Emilio_Switch == 0)
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_01");	//(испуганно) Эй, приятель, я не хочу ничего об этом знать!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_02");	//(испуганно) ВООБЩЕ НИЧЕГО!
		Emilio_Switch = 0;
	};
};


instance DIA_Addon_BDT_10015_Emilio_Senyan(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 1;
	condition = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Emilio_Senyan_Condition()
{
	if(Npc_IsDead(Senyan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Senyan_Info()
{
	if(Senyan_Called == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_00");	//(пытливо) Скажи мне, ПОЧЕМУ Сеньян закричал: 'Посмотрите, кто пришел'?
		AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_01");	//(сухо) Невыплаченные долги.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_02");	//Ты убил Сеньяна!
	};
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_03");	//А что? Какие-то проблемы?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_04");	//(быстро) Нет, приятель, у меня к тебе по этому поводу никаких претензий.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_05");	//Даже наоборот. (фальшиво) Этот ублюдок работал на Эстебана.
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry(Topic_Addon_Esteban,"Эмилио не на стороне Эстебана.");
};


instance DIA_Addon_Emilio_Jetzt(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 5;
	condition = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent = FALSE;
	description = "Почему ты сейчас не в шахте?";
};


func int DIA_Addon_Emilio_Jetzt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Jetzt_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Jetzt_15_00");	//Почему ты сейчас не в шахте?
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_01");	//(слегка неуверенно) Я был там достаточно долго и вкалывал, пока не стал валиться с ног от усталости. Теперь мне надо отдохнуть несколько дней.
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_02");	//(вздыхая, слегка неуверенно) Прежде, чем я получу следующий красный камень.
};


instance DIA_Addon_Emilio_VonEmilio(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 6;
	condition = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent = FALSE;
	description = "Леннар рассказывал мне о тебе...";
};


func int DIA_Addon_Emilio_VonEmilio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_Jetzt) && Npc_KnowsInfo(other,DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_VonEmilio_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_00");	//Леннар рассказывал мне о тебе...
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_01");	//Леннар? Этот парень - идиот. Ты, наверное, заметил.
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_02");	//Он сказал, что ты не был в шахте с тех пор, как произошло нападение.
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_03");	//(испуганно) Я... ничего не знаю!
	if(!Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_04");	//Ты работаешь вместе с Сеньяном!
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_05");	//И вы оба в сговоре с Эстебаном! Я в точности слышал, о чем вы там болтали!
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_06");	//Пока что Эстебан ничем не помог нам. Почему я должен верить его людям?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_07");	//Оставь меня в покое!
		AI_StopProcessInfos(self);
	};
	B_LogEntry(Topic_Addon_Esteban,"Эмилио думает, что Леннар - идиот.");
};


instance DIA_Addon_Emilio_HilfMir(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 7;
	condition = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent = FALSE;
	description = "Помоги мне выяснить, кто организовал нападение!";
};


func int DIA_Addon_Emilio_HilfMir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_VonEmilio) && Npc_IsDead(Senyan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_HilfMir_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_00");	//Помоги мне выяснить, кто организовал нападение!
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_01");	//Нет! Я не хочу в это ввязываться!
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_02");	//Если даже такой идиот, как Леннар, заметил, что ты ведешь себя странно, вряд ли пройдет много времени, прежде чем это заметит Эстебан.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_03");	//(неловко) Я... черт! Я скажу тебе одно имя. И больше ничего.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//Слушаю.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_05");	//Хуно... поговори с Хуно. Он должен что-то знать об этом деле.
	Emilio_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Эмилио наконец назвал имя: Хуно.");
};


instance DIA_Addon_Emilio_GegenEsteban(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 8;
	condition = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent = FALSE;
	description = "Что ты имеешь против Эстебана?";
};


func int DIA_Addon_Emilio_GegenEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Senyan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_GegenEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_GegenEsteban_15_00");	//Что ты имеешь против Эстебана?
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_01");	//Все, о чем эта свинья думает, - это деньги.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_02");	//Каждые несколько дней одного из нас съедает краулер.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_03");	//Но Эстебан даже и не думает послать в шахту несколько бойцов.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_04");	//А все почему? Потому что эти ребята из личной гвардии Ворона и Эстебан до дрожи в коленках боится говорить с ними.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_05");	//Ему проще дать нам всем подохнуть!
};


instance DIA_Addon_BDT_10015_Emilio_Mine(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 9;
	condition = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Emilio_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Mine_10_00");	//Значит, ты теперь главный. Ладно, тогда я пошел.
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Emilio_Hacker(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 9;
	condition = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_Emilio_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Emilio_Hacker_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Emilio_Hacker_10_01");	//Я просто валюсь с ног.
};

