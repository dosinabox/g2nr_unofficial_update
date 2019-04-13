
var int DJG_Cipher_DragonKilledNotYet;

instance DIA_CipherDJG_EXIT(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 999;
	condition = DIA_CipherDJG_EXIT_Condition;
	information = DIA_CipherDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_CipherDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_CipherDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_HALLO(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_Cipher_HALLO_Condition;
	information = DIA_Cipher_HALLO_Info;
	description = "Отличный лагерь.";
};


func int DIA_Cipher_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Cipher_HALLO_Info()
{
	AI_Output(other,self,"DIA_Cipher_HALLO_15_00");	//Отличный лагерь.
	AI_Output(self,other,"DIA_Cipher_HALLO_07_01");	//Скажешь тоже. Здесь воняет, как на скотобойне. Повсюду трупы животных и сгнившие деревья.
};


instance DIA_CipherDJG_HELLOAGAIN(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_HELLOAGAIN_Condition;
	information = DIA_CipherDJG_HELLOAGAIN_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_CipherDJG_HELLOAGAIN_Condition()
{
	if((Npc_IsDead(SwampDragon) == FALSE) && Npc_KnowsInfo(other,DIA_Cipher_HALLO))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_HELLOAGAIN_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_01");	//Я давно уже здесь сижу. Выжидаю подходящий момент.
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_02");	//Подходящий момент? Для чего?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_03");	//Там где-то должен прятаться дракон. Это вонючее болото затопило все вокруг вскоре после того, как он появился здесь.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_04");	//Я еще хорошо помню время, когда здесь невозможно было ноги замочить.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_05");	//Но теперь я ни за что не пойду туда один.
	if(Npc_IsDead(DJG_Rod) == FALSE)
	{
		AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_06");	//Правда, со мной Род. Но он побежит сломя голову даже при виде мясного жука.
	};
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_07");	//А как насчет тебя? Ты ведь тоже пришел сюда не на прогулку, правда? Пойдем туда вместе.
	B_LogEntry(TOPIC_Dragonhunter,"Сифер сказал мне, что в болотах Долины рудников живет дракон.");
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN,"Я предпочитаю действовать в одиночку.",DIA_CipherDJG_HELLOAGAIN_GoAlone);
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN,"Почему бы и нет. Помощь мне не помешает.",DIA_CipherDJG_HELLOAGAIN_GoTogether);
};

func void DIA_CipherDJG_HELLOAGAIN_GoAlone()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00");	//Я предпочитаю действовать в одиночку.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01");	//Как знаешь. Значит, я ошибался в тебе!
	AI_StopProcessInfos(self);
};

func void DIA_CipherDJG_HELLOAGAIN_GoTogether()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00");	//Почему бы и нет. Помощь мне не помешает.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01");	//Это хорошо. Тогда я, наконец, смогу выбраться отсюда. Эта вонь невыносима. Просто дай мне слово!
	DJG_SwampParty = TRUE;
	Info_ClearChoices(DIA_CipherDJG_HELLOAGAIN);
};


instance DIA_CipherDJG_GOTOGETHERAGAIN(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GOTOGETHERAGAIN_Condition;
	information = DIA_CipherDJG_GOTOGETHERAGAIN_Info;
	description = "Я передумал! Пойдем вместе!";
};


func int DIA_CipherDJG_GOTOGETHERAGAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_CipherDJG_HELLOAGAIN) && (DJG_SwampParty == FALSE) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GOTOGETHERAGAIN_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_GOTOGETHERAGAIN_15_00");	//Я передумал! Пойдем вместе!
	AI_Output(self,other,"DIA_CipherDJG_GOTOGETHERAGAIN_07_01");	//Просто дай мне слово!
	DJG_SwampParty = TRUE;
};


instance DIA_CipherDJG_GO(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GO_Condition;
	information = DIA_CipherDJG_GO_Info;
	description = "Сейчас самый подходящий момент, чтобы идти туда!";
};


func int DIA_CipherDJG_GO_Condition()
{
	if((DJG_SwampParty == TRUE) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};


var int DJG_SwampParty_GoGoGo;

func void DIA_CipherDJG_GO_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_GO_15_00");	//Сейчас самый подходящий момент, чтобы идти туда!
	AI_Output(self,other,"DIA_CipherDJG_GO_07_01");	//Тогда пойдем!
	AI_StopProcessInfos(self);
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait1");
	B_StartOtherRoutine(DJG_Rod,"SwampWait1");
};


instance DIA_CipherDJG_SwampWait2(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_SwampWait2_Condition;
	information = DIA_CipherDJG_SwampWait2_Info;
	important = TRUE;
};


func int DIA_CipherDJG_SwampWait2_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT1_01") < 700) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SwampWait2_Info()
{
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_00");	//Болото начинается сразу за следующим поворотом. Я предлагаю идти прямо туда.
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_01");	//Ну, ты также можешь проверить вон тот проход, чтобы эти твари не напали на нас сзади. Что ты выбираешь?
	AI_Output(other,self,"DIA_CipherDJG_SwampWait2_15_02");	//Не будем терять времени!
	Info_AddChoice(DIA_CipherDJG_SwampWait2,Dialog_Ende,DIA_CipherDJG_SwampWait2_weiter);
};

func void DIA_CipherDJG_SwampWait2_weiter()
{
	AI_StopProcessInfos(self);
	DJG_SwampParty = TRUE;
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
	B_StartOtherRoutine(DJG_Rod,"SwampWait2");
};


instance DIA_CipherDJG_GoForSwampDragon(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_GoForSwampDragon_Condition;
	information = DIA_CipherDJG_GoForSwampDragon_Info;
	important = 1;
	permanent = 0;
};


func int DIA_CipherDJG_GoForSwampDragon_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_01") < 1000) && (Npc_IsDead(SwampDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GoForSwampDragon_Info()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Exit))
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_00");	//(рычит) В атаку!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SwampDragon");
		B_StartOtherRoutine(DJG_Rod,"SwampDragon");
	}
	else
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_01");	//Я уже слышу эту тварь. Мы должны быть осторожны!
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_02");	//Иди вперед и посмотри, можем ли мы атаковать.
		AI_StopProcessInfos(self);
	};
	self.flags = 0;
	DJG_Rod.flags = 0;
};


instance DIA_CipherDJG_SWAMPDRAGONDEAD(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_SWAMPDRAGONDEAD_Condition;
	information = DIA_CipherDJG_SWAMPDRAGONDEAD_Info;
	important = TRUE;
};


func int DIA_CipherDJG_SWAMPDRAGONDEAD_Condition()
{
	if((Npc_IsDead(SwampDragon) == TRUE) && (DJG_SwampParty == TRUE) && (DJG_SwampParty_GoGoGo == TRUE))
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SWAMPDRAGONDEAD_Info()
{
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_00");	//Черт. Он мертв?
	AI_Output(other,self,"DIA_CipherDJG_SWAMPDRAGONDEAD_15_01");	//Успокойся. Все кончено!
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_02");	//Ух, ну и громадина.
	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_CipherDJGDeadDragon);
	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Rod,"Start");
};


instance DIA_CipherDJG_WHATNEXT(C_Info)
{
	npc = DJG_703_Cipher;
	condition = DIA_CipherDJG_WHATNEXT_Condition;
	information = DIA_CipherDJG_WHATNEXT_Info;
	permanent = TRUE;
	description = "Болотный дракон мертв!";
};


func int DIA_CipherDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(SwampDragon) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_WHATNEXT_Info()
{
	AI_Output(other,self,"DIA_CipherDJG_WHATNEXT_15_00");	//Болотный дракон мертв! Что ты будешь делать дальше?
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_01");	//Понятия не имею. Я еще об этом не думал. А ты теперь можешь вернуться в Хоринис как герой.
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_02");	//Ручаюсь, на этом можно сделать состояние. Подумай над этим.
	B_LogEntry(TOPIC_Dragonhunter,"Сифер думает, что теперь, когда болотный дракон мертв, он может заработать кучу денег как великий 'герой'. Что ж, посмотрим.");
	AI_StopProcessInfos(self);
};


instance DIA_Cipher_PICKPOCKET(C_Info)
{
	npc = DJG_703_Cipher;
	nr = 900;
	condition = DIA_Cipher_PICKPOCKET_Condition;
	information = DIA_Cipher_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Cipher_PICKPOCKET_Condition()
{
	return C_Beklauen(79,220);
};

func void DIA_Cipher_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cipher_PICKPOCKET);
	Info_AddChoice(DIA_Cipher_PICKPOCKET,Dialog_Back,DIA_Cipher_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cipher_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cipher_PICKPOCKET_DoIt);
};

func void DIA_Cipher_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cipher_PICKPOCKET);
};

func void DIA_Cipher_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cipher_PICKPOCKET);
};

