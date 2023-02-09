
instance DIA_DiegoOw_EXIT(C_Info)
{
	npc = PC_ThiefOW;
	nr = 999;
	condition = DIA_DiegoOw_EXIT_Condition;
	information = DIA_DiegoOw_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoOw_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoOw_Hallo(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_DiegoOw_Hallo_Condition;
	information = DIA_DiegoOw_Hallo_Info;
	important = TRUE;
};


func int DIA_DiegoOw_Hallo_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Hallo_Info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Эй, я думал, ты мертв.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Да... так было.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//Ну, теперь я вернулся и ищу доказательства появления драконов.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Для кого ты это делаешь?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//Я работаю на лорда Хагена. С помощью паладинов драконов можно остановить.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//Паладины? Позволь мне сказать тебе кое-что. После того, как мне удалось вырваться отсюда, я отправился в Хоринис.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//Я хотел предупредить паладинов о драконах. Сам не знаю, зачем мне это было нужно.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//Этот напыщенный Лотар даже не стал слушать меня - и, конечно же, не позволил мне поговорить с лордом Хагеном.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Вместо этого они отправили меня назад, с экспедицией. Так что лучше не напоминай мне о паладинах...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//Очень важно остановить драконов, пока у нас еще есть время - и не важно, кто поможет нам сделать это.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Остановить их? Да нам нужно уносить ноги из этой долины, пока у нас еще есть время для этого!
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Скажи - как тебе удалось пробраться через Проход? Я думал, там все кишит орками.
	if(PlayerPassedAbandonedMine == TRUE)
	{
		AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//Есть путь через заброшенные шахты, где нет орков.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//Это хорошая новость. Тогда я должен как можно быстрее отправляться в Хоринис - мне там нужно кое с кем свести счеты.
	}
	else
	{
		B_PC_Thief_JustLucky();
	};
};


instance DIA_DiegoOw_Beweise(C_Info)
{
	npc = PC_ThiefOW;
	nr = 2;
	condition = DIA_DiegoOw_Beweise_Condition;
	information = DIA_DiegoOw_Beweise_Info;
	description = "Послушай, мне нужны доказательства.";
};


func int DIA_DiegoOw_Beweise_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Beweise_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Послушай, мне нужны доказательства.
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//Хорошо, я помогу тебе, чем смогу. Но я не буду рисковать своей шкурой неизвестно из-за чего.
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//Я здесь по поручению Гаронда. Он хочет знать, сколько руды было добыто к этому времени.
		AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//И тогда он даст тебе доказательства?
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//Именно. Поэтому - ты можешь сказать что-нибудь на этот счет?
		if(Npc_KnowsInfo(other,DIA_Parcival_Diego))
		{
			AI_Output(self,other,"DIA_DiegoOw_Garond_11_03");	//Конечно, что ты хочешь знать?
			AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_00");	//Что ты знаешь о руде Сильвестро?
		};
		B_LogEntry(TOPIC_ScoutMine,"Диего переправил в безопасное место ЧЕТЫРЕ ящика руды, добытых старателями Сильвестро.");
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//Хорошо, если такова твоя задача - иди, поговори с командующим Гарондом.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//Если уж кто и знает что-нибудь о нападении драконов, то это парни из замка.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Garond_11_01");	//Когда ты будешь в замке, можешь сказать Гаронду кое-что, что его очень заинтересует:
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//Здесь, в задней части пещеры хранятся ЧЕТЫРЕ ящика руды. Их добыли люди Сильвестро.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Гаронд может прийти и забрать их, но меня здесь к тому времени уже не будет.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_01");	//В пещере неподалеку от того места, где я спрятался, хранятся ЧЕТЫРЕ ящика руды. Их добыли люди Сильвестро.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_02");	//Гаронд может прийти и забрать их.
	};
	Silvestro_Ore = TRUE;
};


instance DIA_DiegoOw_Mine(C_Info)
{
	npc = PC_ThiefOW;
	nr = 3;
	condition = DIA_DiegoOw_Mine_Condition;
	information = DIA_DiegoOw_Mine_Info;
	permanent = FALSE;
	description = "А какое ты имеешь отношение к руде?";
};


func int DIA_DiegoOw_Mine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Beweise))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Mine_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//А какое ты имеешь отношение к руде?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//Я был с группой Сильвестро. Мы добывали руду уже несколько дней, когда Сильвестро вдруг занервничал.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//Он сказал, что мы должны переправить руду в безопасное место.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Ну, так как я все равно собирался линять, я вызвался добровольцем.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//И в этом мне очень повезло. Потому что вскоре на старателей напали краулеры. И никто из них не выжил.
};


instance DIA_DiegoOw_Ritter(C_Info)
{
	npc = PC_ThiefOW;
	nr = 4;
	condition = DIA_DiegoOw_Ritter_Condition;
	information = DIA_DiegoOw_Ritter_Info;
	permanent = FALSE;
	description = "А что насчет этих двух мертвых рыцарей перед твоим укрытием?";
};


func int DIA_DiegoOw_Ritter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Hallo))
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Ritter_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//А что насчет этих двух мертвых рыцарей перед твоим укрытием?
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//Они нашли свою судьбу во время битвы со стаей снепперов.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//Да уж, у Долины Рудников свои собственные правила. Я говорил им это. Но они меня не слушали.
};


instance DIA_DiegoOw_Perm(C_Info)
{
	npc = PC_ThiefOW;
	nr = 5;
	condition = DIA_DiegoOw_Perm_Condition;
	information = DIA_DiegoOw_Perm_Info;
	permanent = FALSE;
	description = "Что мне нужно знать о Долине?";
};


func int DIA_DiegoOw_Perm_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//Что мне нужно знать о Долине?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//С тех пор, как Барьер пал, здесь многое переменилось. Теперь здесь заправляют орки.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//А мы, люди, теперь не более чем корм для истинных правителей этой Долины: драконов.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Держись подальше от всех, кто сильнее тебя - и избегай всего, что напоминает дракона.
};


instance DIA_DiegoOw_Gorn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 6;
	condition = DIA_DiegoOw_Gorn_Condition;
	information = DIA_DiegoOw_Gorn_Info;
	permanent = FALSE;
	description = "Я хочу купить свободу Горну, но Гаронд просит за это 1000 золотых.";
};


func int DIA_DiegoOw_Gorn_Condition()
{
	if(MIS_RescueGorn == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_DiegoOw_Gorn_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//Я хочу купить свободу Горну, но Гаронд просит за это 1000 золотых.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//Немаленькая сумма. У меня есть 300 монет, ты можешь взять их. Остальное найди сам.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	B_LogEntry(TOPIC_RescueGorn,"Диего заплатил 300 золотых за освобождение Горна.");
};


var int Diego_MerkeDEX;
var int Diego_MerkeSTR;

func void B_BuildLearnDialog_Diego_OW()
{
	Info_ClearChoices(DIA_DiegoOw_Teach);
	Info_AddChoice(DIA_DiegoOw_Teach,Dialog_Back,DIA_DiegoOw_TEACH_BACK);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(ATR_DEXTERITY,1)),DIA_DiegoOw_TEACHDEX_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(ATR_DEXTERITY,5)),DIA_DiegoOw_TEACHDEX_5);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(ATR_STRENGTH,1)),DIA_DiegoOw_TEACHSTR_1);
	Info_AddChoice(DIA_DiegoOw_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(ATR_STRENGTH,5)),DIA_DiegoOw_TEACHSTR_5);
};

instance DIA_DiegoOw_Teach(C_Info)
{
	npc = PC_ThiefOW;
	nr = 100;
	condition = DIA_DiegoOw_Teach_Condition;
	information = DIA_DiegoOw_Teach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_DiegoOw_Teach_Condition()
{
	return TRUE;
};

func void DIA_DiegoOw_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Конечно. Что ты хочешь знать?
	if(DiegoOW_Teach == FALSE)
	{
		Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_OutTeacher,"Диего может помочь мне повысить мою ловкость и силу.");
		DiegoOW_Teach = TRUE;
	};
	Diego_MerkeDEX = ATR_Training[ATR_DEXTERITY];
	Diego_MerkeSTR = ATR_Training[ATR_STRENGTH];
	B_BuildLearnDialog_Diego_OW();
};

func void DIA_DiegoOw_TEACH_BACK()
{
	if(ATR_Training[ATR_DEXTERITY] > Diego_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_02");	//Ты уже стал более ловким.
	};
	if(ATR_Training[ATR_STRENGTH] > Diego_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(оценивающе) Очень хорошо. Твоя сила увеличилась.
	};
	Info_ClearChoices(DIA_DiegoOw_Teach);
};

func void DIA_DiegoOw_TEACHDEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		B_BuildLearnDialog_Diego_OW();
	};
};

func void DIA_DiegoOw_TEACHDEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		B_BuildLearnDialog_Diego_OW();
	};
};

func void DIA_DiegoOw_TEACHSTR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED))
	{
		B_BuildLearnDialog_Diego_OW();
	};
};

func void DIA_DiegoOw_TEACHSTR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED))
	{
		B_BuildLearnDialog_Diego_OW();
	};
};

instance DIA_Addon_ThiefOW_Together(C_Info)
{
	npc = PC_ThiefOW;
	nr = 11;
	condition = DIA_Addon_ThiefOW_Together_Condition;
	information = DIA_Addon_ThiefOW_Together_Info;
	description = "Давай пойдем вместе.";
};


func int DIA_Addon_ThiefOW_Together_Condition()
{
	return TRUE;
};

func void DIA_Addon_ThiefOW_Together_Info()
{
	DIA_Common_LetsGoTogether();
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_01");	//К Проходу? Почему бы и нет...
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_02");	//Иди первым. Ты ведь недавно оттуда.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_03");	//Но даже не думай о том, чтобы подойти слишком близко к замку или Стене орков.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_04");	//Кроме того, нам следует избегать лагерей паладинов.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_05");	//Мне удалось сбежать из такого лагеря, и я не собираюсь возвращаться в шахты.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_06");	//И конечно же, мы не должны приближаться к драконам.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_07");	//Скажи, когда будешь готов.
};


instance DIA_Addon_ThiefOW_ComeOn(C_Info)
{
	npc = PC_ThiefOW;
	nr = 12;
	condition = DIA_Addon_ThiefOW_ComeOn_Condition;
	information = DIA_Addon_ThiefOW_ComeOn_Info;
	permanent = TRUE;
	description = "Пойдем со мной.";
};


func int DIA_Addon_ThiefOW_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together) && (Diego_angekommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//Пойдем со мной.
	if(C_DiegoTooFar(0))
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_01");	//Мы идем не туда!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_02");	//Хорошо.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_ThiefOW_GoHome(C_Info)
{
	npc = PC_ThiefOW;
	nr = 13;
	condition = DIA_Addon_ThiefOW_GoHome_Condition;
	information = DIA_Addon_ThiefOW_GoHome_Info;
	permanent = TRUE;
	description = "Подожди здесь!";
};


func int DIA_Addon_ThiefOW_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_GoHome_Info()
{
	var int location;
	location = C_DiegoTooFar(1000);
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//Подожди здесь!
	if(location == LOC_XARDAS)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_02");	//Я подожду снаружи у башни.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(location == LOC_FAJETHMINE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_03");	//Я подожду у шахты.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(location == LOC_SILVESTROMINE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_04");	//Я подожду перед шахтой.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(location == LOC_GRIMESMINE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_05");	//Я подожду поблизости.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"GRIMES");
	}
	else if(Npc_GetDistToWP(self,"LOCATION_02_05") < 15000)
	{
		if(Npc_GetDistToWP(self,"LOCATION_02_05") < 2000)
		{
			AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_01");	//Ладно.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_06");	//Нет. Я возвращаюсь в пещеру.
			AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_07");	//Когда закончишь, приходи ко мне.
			AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_08");	//Но не слишком задерживайся, иначе я вернусь один.
		};
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_09");	//Ты, наверное, шутишь? Мы должны разделиться? Здесь?
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_10");	//Только через мой труп!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_11");	//Мы идем к Проходу немедленно. И вместе.
	};
};

func void B_Addon_Diego_WillWaitOutside()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_00");	//Иди первым и осмотрись. Я подожду снаружи.
};

var int Diego_TooFarComment;
var int Diego_BurgVariation;
var int Diego_FajethVariation;
var int Diego_SilvestroVariation;
var int Diego_GrimesVariation;
var int Diego_XardasVariation;
var int Diego_IceVariation;

instance DIA_Addon_ThiefOW_TooFar(C_Info)
{
	npc = PC_ThiefOW;
	nr = 14;
	condition = DIA_Addon_ThiefOW_TooFar_Condition;
	information = DIA_Addon_ThiefOW_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_TooFar_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_DiegoTooFar(0))
		{
			if(Diego_TooFarComment == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			Diego_TooFarComment = FALSE;
		};
	};
	return FALSE;
};

func void DIA_Addon_ThiefOW_TooFar_Info()
{
	var int location;
	location = C_DiegoTooFar(1000);
	if(location == LOC_ANGAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_02");	//От этой старой гробницы веет ужасом.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_03");	//Лучше нам ее обойти.
	}
	else if(location == LOC_ICE)
	{
		if(Diego_IceVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_04");	//Это вход в бывший Новый Лагерь.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_05");	//Я уверен, что там поселился дракон.
			Diego_IceVariation = 1;
		};
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_01");	//Чтобы попасть к Проходу, мы должны идти в другом направлении.
	}
	else if(location == LOC_SWAMP)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_06");	//Это болото кончается тупиком.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_07");	//Не удивлюсь, если там нас может поджидать дракон.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//Не стоит туда идти.
	}
	else if(location == LOC_FIRE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//Если мы продолжим лезть на эту гору, мы наверняка встретим дракона.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_10");	//А я хотел бы все же живым добраться до Хориниса.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_11");	//Давай пойдем по другому пути.
	}
	else if(location == LOC_LAKE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_12");	//Эта дорога нас никуда не приведет.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_13");	//Чтобы попасть к Проходу, мы должны идти в другом направлении!
	}
	else if(location == LOC_XARDAS)
	{
		if(Diego_XardasVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_14");	//Это старая башня Ксардаса. Сам он, конечно, в ней давно не появляется.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_15");	//Уверен, что внутри нас ждут неприятные сюрпризы.
			Diego_XardasVariation = 1;
		};
		B_Addon_Diego_WillWaitOutside();
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(location == LOC_FAJETHMINE)
	{
		if(Diego_FajethVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_16");	//Это шахта Фаджета.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_17");	//Если ты хочешь туда пойти, на меня не рассчитывай!
			Diego_FajethVariation = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_18");	//Я намерен держаться от этой шахты подальше!
		};
	}
	else if(location == LOC_SILVESTROMINE)
	{
		if(Diego_SilvestroVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_19");	//Эта шахта, в которую меня поместили, когда я вернулся сюда вместе с другими заключенными.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_20");	//Уверен, что живых там не осталось.
			B_Addon_Diego_WillWaitOutside();
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_20");	//Но если ты будешь задерживаться, я вернусь в свое укрытие.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_21");	//Если, конечно, ты не хочешь, чтобы я подождал тебя здесь.
			Diego_SilvestroVariation = 1;
		}
		else
		{
			B_Addon_Diego_WillWaitOutside();
		};
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(location == LOC_GRIMESMINE)
	{
		if(Diego_GrimesVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_21");	//Это одна из новых шахт паладинов.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_22");	//Я никогда там не был и идти туда не собираюсь.
			Diego_GrimesVariation = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_23");	//Давай обойдем ее подальше.
		};
	}
	else if(location == LOC_BURG)
	{
		if(Diego_BurgVariation == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_24");	//Тебе жить надоело? Держись от замка подальше.
			Diego_BurgVariation = 1;
		}
		else if(Diego_BurgVariation == 1)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_25");	//Эй, ты меня вообще слушаешь?! Не подходи к замку!
			Diego_BurgVariation = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_26");	//Что во фразе 'не подходи к замку' тебе непонятно?
			Diego_BurgVariation = 1;
		};
	}
	else if(location == LOC_ORCBARRIER)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_27");	//Нам нельзя туда идти. У Стены орков слишком опасно.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_28");	//Я думаю, нам будет лучше пойти на запад и двигаться по другой стороне.
	}
	else if(location == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_29");	//Если мы продолжим двигаться в этом направлении, мы снова упремся в Стену орков.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_30");	//Пойдем к Проходу!
	}
	else if(location == LOC_ROCK)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//Если мы продолжим лезть на эту гору, мы наверняка встретим дракона.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//Не стоит туда идти.
	};
	Diego_TooFarComment = TRUE;
	Info_ClearChoices(DIA_Addon_ThiefOW_TooFar);
	Info_AddChoice(DIA_Addon_ThiefOW_TooFar,"Подожди здесь!",DIA_Addon_ThiefOW_GoHome_Info);
	Info_AddChoice(DIA_Addon_ThiefOW_TooFar,"Пойдем со мной.",DIA_Addon_ThiefOW_ComeOn_Info);
};

func void B_Diego_WirSindDa()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_02");	//Оставшуюся часть пути я проделаю сам.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_03");	//Мне нужно кое-что сделать, прежде чем возвращаться в Хоринис.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_04");	//Благодарю тебя, мой друг. Увидимся в городе.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"PASS");
	Diego_angekommen = TRUE;
};


instance DIA_Addon_ThiefOW_Angekommen(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Angekommen_Condition;
	information = DIA_Addon_ThiefOW_Angekommen_Info;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_Angekommen_Condition()
{
	if((Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 800) && !Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Nostalgie))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_01");	//Это место...
	B_GivePlayerXP(500);
	B_Diego_WirSindDa();
};


instance DIA_Addon_ThiefOW_Nostalgie(C_Info)
{
	npc = PC_ThiefOW;
	nr = 1;
	condition = DIA_Addon_ThiefOW_Nostalgie_Condition;
	information = DIA_Addon_ThiefOW_Nostalgie_Info;
	important = TRUE;
};


func int DIA_Addon_ThiefOW_Nostalgie_Condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_Nostalgie_Info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_01");	//Помнишь, тогда?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_02");	//Когда мы первый раз встретились?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_03");	//Кажется, это было сотни лет назад...
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_04");	//В этом месте было что-то ЕЩЕ. Черт! Я не могу вспомнить.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_05");	//Ну ладно...
	Diego_Nostalgie = TRUE;
	B_GivePlayerXP(1000);
	if(DelayedPrintScreenMessagesDisabled == FALSE)
	{
		AI_PrintScreen(NAME_Addon_NostalgieBonus,-1,57,FONT_Screen,2);
	}
	else
	{
		PrintScreen(NAME_Addon_NostalgieBonus,-1,57,FONT_Screen,2);
	};
	B_Diego_WirSindDa();
};


instance DIA_Addon_ThiefOW_PERM(C_Info)
{
	npc = PC_ThiefOW;
	nr = 10;
	condition = DIA_Addon_ThiefOW_PERM_Condition;
	information = DIA_Addon_ThiefOW_PERM_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_ThiefOW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DiegoOw_Perm) && Npc_KnowsInfo(other,DIA_Addon_ThiefOW_Together))
	{
		return TRUE;
	};
};

func void DIA_Addon_ThiefOW_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//Как дела?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_01");	//Мне бы не помешало зелье лечения. У тебя не найдется для меня пузырька?
	}
	else if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (Diego_angekommen == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_02");	//Скажи мне, когда будешь готов.
	}
	else if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_03");	//Хорошо... Мне просто нужно... немного отдохнуть.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//Хорошо.
	};
};

