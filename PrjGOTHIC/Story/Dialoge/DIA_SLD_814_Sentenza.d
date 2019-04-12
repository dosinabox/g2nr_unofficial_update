
instance DIA_Sentenza_EXIT(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 999;
	condition = DIA_Sentenza_EXIT_Condition;
	information = DIA_Sentenza_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sentenza_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Sentenza_Wants50;
var int Sentenza_SearchDay;

instance DIA_Sentenza_Hello(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 1;
	condition = DIA_Sentenza_Hello_Condition;
	information = DIA_Sentenza_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sentenza_Hello_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Hello_Info()
{
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//И куда это ты собрался?!
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"А какое тебе до этого дело?",DIA_Sentenza_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Sentenza_Hello,"Я просто прогуливаюсь. Вот и все.",DIA_Sentenza_Hello_JustLooking);
};

func void DIA_Sentenza_Hello_JustLooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//Я просто прогуливаюсь. Вот и все.
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//(смеется) Таких как ты, здесь ожидают большие проблемы! Это ты мне заявляешь, что просто прогуливаешься?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//Ха! Ты идешь на двор! Зачем еще тебе нужно было бы проделывать столь долгий путь?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//Так что прекращай нести эту чушь. Сейчас я обыщу тебя, и можешь топать дальше.
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"Не распускай руки!",DIA_Sentenza_Hello_HandsOff);
	Info_AddChoice(DIA_Sentenza_Hello,"Как хочешь. Можешь обыскать меня!",DIA_Sentenza_Hello_SearchMe);
};

func void DIA_Sentenza_Hello_NotYourBusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//А какое тебе до этого дело?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//(вздыхает) Значит, мне придется объяснить тебе это в деталях.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Sentenza_SearchMe()
{
	var int playerGold;
	playerGold = Npc_HasItems(other,ItMi_Gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//Как хочешь. Можешь обыскать меня!
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//Так, посмотрим, что у нас здесь есть...
	if(playerGold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//Ах! Золото! Очень опасно носить с собой такое количество золота.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//Многие из наемников настоящие головорезы. А не такие честные парни, как я.
		B_GiveInvItems(other,self,ItMi_Gold,50);
		Sentenza_GoldTaken = TRUE;
	}
	else if(playerGold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//Да-а... У тебя не так уж много с собой.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//Я вернусь к тебе позже.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//У тебя нет с собой золота?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//Не похоже, что ты голодаешь. Ты, должно быть, припрятал золотишко где-то, правильно?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//Да ты не дурак. Я уверен, что мы еще встретимся. Береги себя.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//Ты, вероятно, единственный, кто знает, где все твое золото!
	};
	Sentenza_Wants50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//Я хочу получить с тебя всего 50 золотых - это стандартный сбор. Ты должен заплатить его всего один раз. Это ведь честно, правда?
};

func void DIA_Sentenza_Hello_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Hello_HandsOff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//Не распускай руки!
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//(угрожающе) А то что?
	Info_ClearChoices(DIA_Sentenza_Hello);
	Info_AddChoice(DIA_Sentenza_Hello,"Или ничего. Обыщи меня!",DIA_Sentenza_Hello_SearchMe);
	Info_AddChoice(DIA_Sentenza_Hello,"А то ты долго не сможешь никого обыскивать!",DIA_Sentenza_Hello_OrElse);
};

func void DIA_Sentenza_Hello_OrElse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//А то ты долго не сможешь никого обыскивать!
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//Ну, это мы посмотрим!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_Vzwei(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 2;
	condition = DIA_Sentenza_Vzwei_Condition;
	information = DIA_Sentenza_Vzwei_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sentenza_Vzwei_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Sentenza_GoldTaken == FALSE) && (Sentenza_SearchDay < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vzwei_Info()
{
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//Опять ты! Давай посмотрим, что у тебя есть на этот раз!
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	Info_ClearChoices(DIA_Sentenza_Vzwei);
	Info_AddChoice(DIA_Sentenza_Vzwei,"Убери от меня свои грязные руки!",DIA_Sentenza_Vzwei_HandsOff);
	Info_AddChoice(DIA_Sentenza_Vzwei,"Как хочешь. Можешь обыскать меня!",DIA_Sentenza_Vzwei_SearchMe);
};

func void DIA_Sentenza_Vzwei_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Vzwei_HandsOff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//Убери от меня свои грязные руки!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//(угрожающе) Да? Похоже, у тебя с собой сейчас побольше золотишка!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_WannaJoin(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 3;
	condition = DIA_Sentenza_WannaJoin_Condition;
	information = DIA_Sentenza_WannaJoin_Info;
	permanent = FALSE;
	description = "Я пришел, чтобы присоединиться к вам!";
};


func int DIA_Sentenza_WannaJoin_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Sentenza_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//Я пришел, чтобы присоединиться к вам!
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//Похвальное желание.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//(вскользь) А ты знаешь, что наемники будут голосовать - принять тебя или нет?
};


instance DIA_Sentenza_Vote(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 4;
	condition = DIA_Sentenza_Vote_Condition;
	information = DIA_Sentenza_Vote_Info;
	permanent = TRUE;
	description = "Ты проголосуешь за меня?";
};


func int DIA_Sentenza_Vote_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sentenza_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Vote_Info()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//Ты проголосуешь за меня?
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//Только потому, что ты побил меня? (смеется) Нет.
	}
	else if((Npc_HasItems(self,ItMi_Gold) >= 50) && ((Sentenza_GoldTaken == TRUE) || (Sentenza_GoldGiven == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//Хотя, почему бы и нет? 50 золотых - это разумная плата за мой голос, тебе так не кажется?
		Sentenza_Stimme = TRUE;
		B_LogEntry(TOPIC_SLDRespekt,"Сентенза не возражает против моего вступления в ряды наемников.");
	}
	else if((Sentenza_Stimme == TRUE) && (Npc_HasItems(self,ItMi_Gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//После того, как ты забрал мое золото? Вряд ли, мой мальчик.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//У тебя так ничего не выйдет, парень! Если ты хочешь, чтобы я проголосовал за тебя, ты должен презентовать мне немного золота.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//Сколько?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 монет. Это сбор, который тебе все равно пришлось бы заплатить.
		Sentenza_Wants50 = TRUE;
	};
};


var int Sentenza_GoldGiven;

instance DIA_Sentenza_Pay50(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 5;
	condition = DIA_Sentenza_Pay50_Condition;
	information = DIA_Sentenza_Pay50_Info;
	permanent = TRUE;
	description = "Вот твои 50 золотых монет.";
};


func int DIA_Sentenza_Pay50_Condition()
{
	if((Sentenza_Wants50 == TRUE) && (Npc_HasItems(self,ItMi_Gold) < 50) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_Pay50_Info()
{
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//Вот твои 50 золотых монет.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//Спасибо, дорогой.
		Sentenza_GoldGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//Не пытайся обмануть меня. 50 золотых и ни монетой меньше! Понял?
	};
};


var int Sentenza_Einmal;

instance DIA_Sentenza_GoldBack(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 6;
	condition = DIA_Sentenza_GoldBack_Condition;
	information = DIA_Sentenza_GoldBack_Info;
	permanent = TRUE;
	description = "Верни мне мое золото!";
};


func int DIA_Sentenza_GoldBack_Condition()
{
	if(Npc_HasItems(self,ItMi_Gold) >= 50)
	{
		if((Sentenza_GoldGiven == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void DIA_Sentenza_GoldBack_Info()
{
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//Верни мне мое золото!
	if((other.guild == GIL_SLD) && (Torlof_SentenzaCounted == TRUE) && (Sentenza_Einmal == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//После того, как я проголосовал за тебя?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//Ах ты, мерзкий попрошайка!
		Sentenza_Einmal = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//Расслабься! Я просто пригляжу пока за ним...
	};
};


instance DIA_Sentenza_AufsMaul(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 7;
	condition = DIA_Sentenza_AufsMaul_Condition;
	information = DIA_Sentenza_AufsMaul_Info;
	permanent = FALSE;
	description = "Слушай, а что это у тебя перед головой? Лицо или задница? ";
};


func int DIA_Sentenza_AufsMaul_Condition()
{
	if((Npc_HasItems(self,ItMi_Gold) >= 50) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Sentenza_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//Слушай, а что это у тебя перед головой? Лицо или задница?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//(зло смеется) Ладно, ты сам этого хотел...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_AufsMaulAgain(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 8;
	condition = DIA_Sentenza_AufsMaulAgain_Condition;
	information = DIA_Sentenza_AufsMaulAgain_Info;
	permanent = TRUE;
	description = "Пришло время очередной взбучки!";
};


func int DIA_Sentenza_AufsMaulAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sentenza_AufsMaul))
	{
		if((Npc_HasItems(self,ItMi_Gold) >= 50) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
		{
			return TRUE;
		};
	};
};

func void DIA_Sentenza_AufsMaulAgain_Info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//Пришло время очередной взбучки!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//Как скажешь...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sentenza_PERM(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 1;
	condition = DIA_Sentenza_PERM_Condition;
	information = DIA_Sentenza_PERM_Info;
	permanent = TRUE;
	description = "Эй, как дела?";
};


func int DIA_Sentenza_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sentenza_PERM_Info()
{
	AI_Output(other,self,"DIA_Sentenza_PERM_15_00");	//Эй, как дела?
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//Мало кто заходит сюда, но до последнего времени все они платили мне сбор.
	if(Npc_HasItems(self,ItMi_Gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//За исключением тебя. (скалится)
	};
};


instance DIA_Sentenza_PICKPOCKET(C_Info)
{
	npc = SLD_814_Sentenza;
	nr = 900;
	condition = DIA_Sentenza_PICKPOCKET_Condition;
	information = DIA_Sentenza_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Sentenza_PICKPOCKET_Condition()
{
	return C_Beklauen(56,65);
};

func void DIA_Sentenza_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET,Dialog_Back,DIA_Sentenza_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sentenza_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sentenza_PICKPOCKET_DoIt);
};

func void DIA_Sentenza_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

func void DIA_Sentenza_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sentenza_PICKPOCKET);
};

