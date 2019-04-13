
instance DIA_Ramirez_EXIT(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 999;
	condition = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ramirez_PICKPOCKET(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 900;
	condition = DIA_Ramirez_PICKPOCKET_Condition;
	information = DIA_Ramirez_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Ramirez_PICKPOCKET_Condition()
{
	return C_Beklauen(90,300);
};

func void DIA_Ramirez_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,Dialog_Back,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};

func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};


instance DIA_Ramirez_Zeichen(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Zeichen_Condition;
	information = DIA_Ramirez_Zeichen_Info;
	permanent = FALSE;
	description = "(Показать сигнал воров)";
};


func int DIA_Ramirez_Zeichen_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ramirez_Zeichen_14_00");	//Так, так, кого я вижу. (зевает) Я потрясен.
};


instance DIA_Ramirez_Hallo(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ramirez_Hallo_permanent;

func int DIA_Ramirez_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ramirez_Hallo_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Hallo_Info()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && (Join_Thiefs == FALSE))
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//Ты что, заблудился? По-моему, это не самое подходящее место для тебя.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//Если здесь с тобой что-нибудь случится, тебе никто не придет на помощь. Так что будь осторожен. (широкая ухмылка)
	};
	if(Join_Thiefs == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//Итак, ты с нами. Что ж, тогда я желаю тебе успеха - но будь осторожен.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//Ох, и еще одно - меня не интересует кто ты там наверху, и  кем ты работаешь.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//Но здесь, внизу, ты один из нас. Вор. Не больше и не меньше.
		DIA_Ramirez_Hallo_permanent = TRUE;
	};
	DG_gefunden = TRUE;
};


instance DIA_Ramirez_Beute(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 3;
	condition = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ramirez_Beute_Condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",ItMi_Gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",ItMi_Gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",ItMi_SilverCup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",ItMi_Gold) < 75))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Beute_Info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//Послушай, ты что, пытаешься так пошутить? Ты набиваешь карманы нашим золотом... ты что, пытаешься красть у нас?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//Не стоит расстраиваться так из-за пары монет.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//Я хочу сказать, эта мелочь, что есть здесь - это ВСЕ, что вам удалось награбить? Это все, что гильдия воров Хориниса может предложить?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//Кто сказал, что наши сокровища хранятся здесь?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//Да, я тоже не могу в это поверить. А где вы прячете ваши сокровища?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//В очень надежном месте.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//Понимаю.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//Хорошо, ты можешь оставить себе это золото. Но я буду присматривать за тобой. Так что не пытайся повторить этот трюк.
};


instance DIA_Ramirez_Bezahlen(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 9;
	condition = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


var int DIA_Ramirez_Bezahlen_permanent;

func int DIA_Ramirez_Bezahlen_Condition()
{
	if((Join_Thiefs == TRUE) && (DIA_Ramirez_Bezahlen_permanent == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Bezahlen_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else
	{
		Ramirez_Cost = 300;
	};
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_15_00");	//Ты можешь научить меня чему-нибудь?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//Мне нечему тебя учить. Ты уже знаешь об отмычках все.
		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//Теперь тебе остается только повышать свою ловкость...
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//Я могу показать тебе, как пользоваться отмычками. Это будет стоить тебе...
		B_Say_Gold(self,other,Ramirez_Cost);
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
		Info_AddChoice(DIA_Ramirez_Bezahlen,"Может быть, позже ...(НАЗАД)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice(DIA_Ramirez_Bezahlen,"Хорошо, я готов заплатить...",DIA_Ramirez_Bezahlen_Okay);
	};
};

func void DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices(DIA_Ramirez_Bezahlen);
};

func void DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_00");	//Хорошо, я готов заплатить...
	if(B_GiveInvItems(other,self,ItMi_Gold,Ramirez_Cost))
	{
		AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_01");	//...вот золото.
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_02");	//Отлично. Я к твоим услугам.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_03");	//Возвращайся, когда раздобудешь золото.
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	};
};


instance DIA_Ramirez_Teach(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 99;
	condition = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent = TRUE;
	description = "Научи меня вскрывать замки!";
};


func int DIA_Ramirez_Teach_Condition()
{
	if((Ramirez_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//Научи меня пользоваться отмычками!
	if(Ramirez_Zweimal == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//Вскрытие замков - это высшее искусство.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//Для этого нужны чувствительные пальчики и интуиция. И пара хороших отмычек.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//Некоторые сундуки, впрочем, закрыты на особые замки, которые можно открыть только правильным ключом.
		Ramirez_Zweimal = TRUE;
	};
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//Итак, встань перед замком, и поворачивай отмычку влево и вправо.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//Если ты будешь поворачивать ее слишком быстро или слишком сильно, она сломается.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//Но чем более опытным ты будешь становиться, тем проще тебе будет управляться с этим воровским инструментом.
	};
};


instance DIA_Ramirez_Viertel(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 8;
	condition = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent = FALSE;
	description = "Где ты порекомендуешь мне попробовать свои силы?";
};


func int DIA_Ramirez_Viertel_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Viertel_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//Где ты порекомендуешь мне попробовать свои силы?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//В верхней части города, конечно же.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//Но если ты хочешь пробраться в какой-то дом, лучше дождаться ночи, ночью все спят - за исключением городской стражи.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//Они патрулируют город всю ночь. Я знаю одного из них - Вамбо. Его интересует только золото.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//Его услуги стоят недешево, но если ты ему заплатишь, тебе больше не о чем не нужно будет волноваться.
};


instance DIA_Ramirez_Sextant(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};


func int DIA_Ramirez_Sextant_Condition()
{
	if((Knows_SecretSign == TRUE) && (MIS_CassiaRing == LOG_SUCCESS) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Sextant_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//У тебя есть работа для меня?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//Хмм... есть вещица, которую я хотел бы заполучить. Но я нигде не могу найти ее.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//Что ты хотел бы получить?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//Секстант. Принеси мне секстант - я заплачу за него хорошую цену.
	Log_CreateTopic(Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_Running);
	B_LogEntry(Topic_RamirezSextant,"Рамирез хочет, чтобы я принес ему секстант.");
	MIS_RamirezSextant = LOG_Running;
};


instance DIA_Ramirez_Success(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent = FALSE;
	description = "Я принес тебе секстант.";
};


func int DIA_Ramirez_Success_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ramirez_Sextant) && (Npc_HasItems(other,ItMi_Sextant) > 0))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Success_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//Я принес тебе секстант.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//Невероятно. Тебе удалось найти его!
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//Вот, держи, ты заслужил эти деньги.
	B_GiveInvItems(self,other,ItMi_Gold,Value_Sextant / 2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP(XP_RamirezSextant);
};

