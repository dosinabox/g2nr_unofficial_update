
instance DIA_Addon_Lennar_EXIT(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 999;
	condition = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent = TRUE;
	description = "Мне нужно идти...";
};


func int DIA_Addon_Lennar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lennar_PICKPOCKET(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 900;
	condition = DIA_Addon_Lennar_PICKPOCKET_Condition;
	information = DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	return C_Beklauen(65,100);
};

func void DIA_Addon_Lennar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,Dialog_Back,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};

func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};


instance DIA_Addon_Lennar_Hi(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 1;
	condition = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent = FALSE;
	description = "Привет.";
};


func int DIA_Addon_Lennar_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//Привет.
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//Привет. Меня зовут Леннар. Добро пожаловать в лагерь рудокопов.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//Рудокопов? Я думал, это бандитский лагерь...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//Верно, но бандиты здесь только для того, чтобы добывать руду. (пожимает плечами) Так что...
};


instance DIA_Addon_Lennar_Attentat(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 2;
	condition = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent = FALSE;
	description = "Насчет попытки покушения на Эстебана...";
};


func int DIA_Addon_Lennar_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//Слушаю?
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//У тебя есть предположения насчет того, кто за этим стоит?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//Конечно!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//(возбужденно) Я уверен, что во всем виноват Эмилио!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//(возбужденно) Он всегда рвался в шахту, как ужаленный, и копал до изнеможения.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//Но с момента нападения он только и делает, что сидит на скамейке.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//Это же очевидно! Чтобы попасть в шахту, он должен получить у Эстебана красную табличку.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//(шепотом) Думаю, он просто не в силах посмотреть ему в глаза.
	B_LogEntry(Topic_Addon_Esteban,"Леннар подозревает Эмилио, потому что он больше не ходит к Эстебану.");
};


instance DIA_Addon_Lennar_Inspektor(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 3;
	condition = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent = FALSE;
	description = "Но что получил бы Эмилио от смерти Эстебана?";
};


func int DIA_Addon_Lennar_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//Но что получил бы Эмилио от смерти Эстебана?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//Откуда мне знать? Может, у него есть приятель, который бы занял место Эстебана.
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//Да, это звучит довольно логично...
};


instance DIA_Addon_Lennar_Mine(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 4;
	condition = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Lennar_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//У тебя действительно есть для меня красная табличка?
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//Отлично! Ну теперь-то я разнесу эту чертову скалу на кусочки! Я уже знаю, где именно буду работать!
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_02");	//Да, один совет: когда ты работаешь с породой, не бей киркой слишком сильно. Иначе она может застрять в золоте!
	B_Upgrade_Hero_HackChance(10);
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Lennar_Gold(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 5;
	condition = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent = FALSE;
	description = "Ты мне можешь рассказать что-нибудь о добыче золота?";
};


func int DIA_Addon_Lennar_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_00");	//Ты мне можешь рассказать что-нибудь о добыче золота?
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_01");	//Конечно! Но если я обучу тебя, ты сможешь добывать больше золота.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_02");	//Поэтому я тебя и спрашиваю.
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_03");	//Да. Но если ты сможешь добывать больше золота, то было бы честно, если бы ты поделился им со мной.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_04");	//Ну...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_05");	//Впрочем, ты можешь заплатить мне мою долю авансом. Скажем...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_06");	//Пятьдесят золотых.
};


var int Lennar_TeachGold;

instance DIA_Addon_Lennar_Train(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 6;
	condition = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent = TRUE;
	description = "Научи меня добывать золото! (50 золотых)";
};


func int DIA_Addon_Lennar_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lennar_Gold) && (Lennar_TeachGold == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Train_15_00");	//Я готов учиться добыче золота!
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_01");	//Знай: основная работа производится размеренными ударами. Не перенапрягайся, но и не засыпай при работе.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_02");	//И не стоит бить все время в одно и то же место. Обрабатывай широкую зону породы - это увеличит твои шансы найти самородок большого размера.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_03");	//Запомни эти приемы: они помогут тебе стать мастером в рудокопном деле.
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_04");	//Сначала я хочу получить свою долю!
	};
};


instance DIA_Addon_Lennar_Hacker(C_Info)
{
	npc = BDT_1096_Addon_Lennar;
	nr = 9;
	condition = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Addon_Lennar_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//Все спокойно.
};

