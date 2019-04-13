
instance DIA_Sergio_EXIT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 999;
	condition = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sergio_EXIT_Info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//Да осветит Иннос твой путь.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_WELCOME(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 5;
	condition = DIA_Sergio_WELCOME_Condition;
	information = DIA_Sergio_WELCOME_Info;
	important = TRUE;
};


func int DIA_Sergio_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,DIA_Sergio_Isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//Да пребудет с тобой Иннос, чем я могу помочь тебе?
};


instance DIA_Sergio_Isgaroth(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Isgaroth_Condition;
	information = DIA_Sergio_Isgaroth_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Isgaroth_Condition()
{
	if(Npc_KnowsInfo(hero,PC_PrayShrine_Paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Isgaroth_Info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//Ты молился за моих товарищей. Я благодарен тебе за это. Скажи мне, что я могу сделать для тебя.
	Info_ClearChoices(DIA_Sergio_Isgaroth);
	Info_AddChoice(DIA_Sergio_Isgaroth,"Как насчет небольшого пожертвования?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice(DIA_Sergio_Isgaroth,"Ты не мог бы поделиться своим боевым опытом?",DIA_Sergio_Isgaroth_XP);
};

func void DIA_Sergio_Isgaroth_Spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//Как насчет небольшого пожертвования?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//Пусть это золото сослужит тебе добрую службу.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};

func void DIA_Sergio_Isgaroth_XP()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//Ты не мог бы поделиться своим боевым опытом?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//Когда ты сражаешься, постарайся, чтобы никто не мог атаковать тебя сзади.
	other.HitChance[NPC_TALENT_2H] = other.HitChance[NPC_TALENT_2H] + 2;
	PrintScreen(PRINT_Learn2H,-1,-1,FONT_ScreenSmall,2);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};


instance DIA_Sergio_Aufgabe(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Aufgabe_Condition;
	information = DIA_Sergio_Aufgabe_Info;
	description = "Мне нужен доступ в библиотеку.";
};


func int DIA_Sergio_Aufgabe_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Sergio_Isgaroth))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//Мне нужен доступ в библиотеку.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//Ну, я не могу обеспечить тебе доступ. Для этого ты должен сначала выполнить свои задания.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//Но я могу помочь тебе. Иди к Мастеру Исгароту и поговори с ним. Я слышал, ему нужна помощь и собирался сам помочь ему, но я поручаю эту задачу тебе.
	Sergio_Sends = TRUE;
	Wld_InsertNpc(BlackWolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus(Topic_IsgarothWolf,LOG_Running);
	B_LogEntry(Topic_IsgarothWolf,"Мастеру Исгароту необходима помощь в часовне. Я должен найти его.");
};


instance DIA_Sergio_WHAT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_WHAT_Condition;
	information = DIA_Sergio_WHAT_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Sergio_WHAT_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHAT_Info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//Я молюсь Инносу, чтобы  он укрепил мою руку и мою волю.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//Тогда я буду готов к любым опасностям и уничтожу всех его врагов с его именем на устах.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//Каких врагов?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//Всех тех, кто противится воле Инноса. Не важно, человек это или вызванное существо.
};


instance DIA_Sergio_Babo(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Babo_Condition;
	information = DIA_Sergio_Babo_Info;
	description = "Не мог бы ты немного потренировать Бабо?";
};


func int DIA_Sergio_Babo_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Babo_Anliegen))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Babo_Info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//Не мог бы ты немного потренировать Бабо?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//А почему он не попросит сам?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//Я думаю, он робеет.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//Понимаю. Хорошо, если это так много значит для него, я буду тренировать его каждое утро в течение двух часов. Мы будем начинать в 5 утра. Можешь передать ему это.
	Npc_ExchangeRoutine(self,"TRAIN");
	B_StartOtherRoutine(Babo,"TRAIN");
	B_LogEntry(Topic_BaboTrain,"Сержио согласился тренироваться с Бабо по два часа каждое утро.");
};


instance DIA_Sergio_WHY(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 4;
	condition = DIA_Sergio_WHY_Condition;
	information = DIA_Sergio_WHY_Info;
	description = "Почему ты не с другими паладинами?";
};


func int DIA_Sergio_WHY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Sergio_WELCOME) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHY_Info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//Почему ты не с другими паладинами?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//Может показаться немного странным, что я здесь, однако не надо забывать, что мы, паладины, также служим магам, так как они проповедуют волю Инноса.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//Мы, паладины, - воины Инноса. Его воля - закон для нас. В настоящий момент я жду новых приказов от магов.
};


instance DIA_Sergio_ORDERS(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_ORDERS_Condition;
	information = DIA_Sergio_ORDERS_Info;
	permanent = TRUE;
	description = "Ты уже получил новые приказы?";
};


func int DIA_Sergio_ORDERS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Sergio_WHY) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_ORDERS_Info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//Ты уже получил новые приказы?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//Пока нет, и у меня есть время найти силу в молитвах.
};


instance DIA_Sergio_Start(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Start_Condition;
	information = DIA_Sergio_Start_Info;
	permanent = FALSE;
	description = "Ты должен сопровождать меня к Проходу.";
};


func int DIA_Sergio_Start_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (Sergio_Follow == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Start_Info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//Ты должен сопровождать меня к Проходу.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//Хорошо, я сделаю это. Я знаю дорогу, иди за мной.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npcType = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Sergio_Guide(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Guide_Condition;
	information = DIA_Sergio_Guide_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Sergio_Guide_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Guide_Info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//Я должен сопроводить тебя к Проходу. Но самая опасная часть путешествия только начинается там.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//Но не будем терять времени
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_Ende(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Ende_Condition;
	information = DIA_Sergio_Ende_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Ende_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Ende_Info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//Мы пришли. Что бы ни ждало тебя в Долине Рудников, я надеюсь, что ты найдешь дорогу назад.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//Не бойся - я вернусь.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//Иди с Инносом. Да не оставит он тебя без защиты.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Sergio_Perm(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Perm_Condition;
	information = DIA_Sergio_Perm_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Perm_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//Хвала Инносу, брат. Если ты пришел узнать что-нибудь об Освящении Меча, поговори с Мардуком.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//Я слышал о тебе. Ты парень с фермы, который был в Долине Рудников. Мое почтение.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_PICKPOCKET(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 900;
	condition = DIA_Sergio_PICKPOCKET_Condition;
	information = DIA_Sergio_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Sergio_PICKPOCKET_Condition()
{
	return C_Beklauen(78,85);
};

func void DIA_Sergio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
	Info_AddChoice(DIA_Sergio_PICKPOCKET,Dialog_Back,DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sergio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
};

func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
};

