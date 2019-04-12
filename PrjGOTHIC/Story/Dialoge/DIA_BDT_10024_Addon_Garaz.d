
instance DIA_Addon_Garaz_EXIT(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 999;
	condition = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Garaz_PICKPOCKET(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 900;
	condition = DIA_Addon_Garaz_PICKPOCKET_Condition;
	information = DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	return C_Beklauen(66,80);
};

func void DIA_Addon_Garaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,Dialog_Back,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};

func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};


instance DIA_Addon_Garaz_Probleme(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 2;
	condition = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Probleme_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Подожди минутку.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//Есть какие-то проблемы?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//Краулеры. Множество краулеров. Мы напоролись на гнездо.
};


instance DIA_Addon_Garaz_Hi(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent = FALSE;
	description = "Почему мы не можем на них напасть?";
};


func int DIA_Addon_Garaz_Hi_Condition()
{
	if(!Npc_IsDead(Bloodwyn) && (Minecrawler_Killed < 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Почему мы не можем на них напасть?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//Я тоже спрашивал об этом. Но у охранников есть 'более важные дела'.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//Бладвин поручил мне разобраться с этой проблемой.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//Я полагаю, ты не собираешься с ними драться.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//А зачем? Чтобы мы смогли добраться до золота в пещере?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Бладвин все равно заберет большую часть себе. И я не хочу рисковать собственной головой за свою ничтожную долю.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//Если ТЫ хочешь сразиться с краулерами - даже не думай, что я тебя остановлю. Только не надо выманивать их сюда, ладно?
};


instance DIA_Addon_Garaz_Bloodwyn(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 8;
	condition = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent = FALSE;
	description = "Ты мне можешь рассказать что-нибудь про Бладвина?";
};


func int DIA_Addon_Garaz_Bloodwyn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garaz_Hi) && (Minecrawler_Killed < 9) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Ты мне можешь рассказать что-нибудь про Бладвина?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Могу. Он - жадный до золота ублюдок. Он проверяет каждую жилу и каждый самородок.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//Он не может отвлечься от своей жажды золота. А нас он ни во что не ставит.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//Что еще?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//Он думает, что он - лучший и терпеть не может, если у кого-то больше денег, чем у него. Пожалуйста - я не встану у него на пути.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Просто не стой у него на пути и не провоцируй его, если не хочешь, чтобы он впал в ярость и перестал себя контролировать...
	B_LogEntry(Topic_Addon_Tempel,"Если Бладвин узнает, что в шахте была открыта новая золотая жила, он наверняка покинет храм.");
	B_LogEntry(Topic_Addon_Tempel,"Когда Бладвин рассержен, он теряет над собой контроль. Это может мне помочь.");
};


instance DIA_Addon_Garaz_Sieg(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent = FALSE;
	description = "Краулеров больше нет.";
};


func int DIA_Addon_Garaz_Sieg_Condition()
{
	if((Minecrawler_Killed >= 9) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//Ну, готово. С краулерами покончено.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Бладвин уже идет сюда. Ты ведь этого хотел?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//Я хочу сказать, что ты перебил краулеров, чтобы Бладвин пришел сюда, да? Тогда, что бы ты ни планировал, делай это СЕЙЧАС.
	B_StartOtherRoutine(Bloodwyn,"GOLD");
};


instance DIA_Addon_Garaz_Blood(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Blood_Condition()
{
	if(Npc_IsDead(Bloodwyn) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Blood_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//Ты показал этому лодырю! Отличная работа.
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//Я пойду осмотрю пещеру.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GOLD");
	B_StartOtherRoutine(Thorus,"TALK");
};


instance DIA_Addon_Garaz_Gold(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Gold_Condition()
{
	if((Npc_GetDistToWP(self,"ADW_MINE_MC_GARAZ") <= 500) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Gold_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_00");	//Ух ты, приятель, здесь явно много золота.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//Чтобы добраться до этих самородков, нам понадобится лестница.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_02");	//Но после падения Барьера никто не пользуется лестницами... очень жаль...
};

