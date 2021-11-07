
instance DIA_Addon_Logan_EXIT(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 999;
	condition = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v4;
};


func int DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Logan_EXIT_Info()
{
	DIA_Common_IllBeBackLater();
	if((MIS_HlpLogan == LOG_Running) && (Logan_Inside == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//(ворчливо) Да-а, просто убегаешь. А я останусь здесь и остановлю каждого, кто подойдет слишком близко.
	}
	else
	{
		AI_WaitTillEnd(self,other);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Logan_PICKPOCKET(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 900;
	condition = DIA_Addon_Logan_PICKPOCKET_Condition;
	information = DIA_Addon_Logan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Logan_PICKPOCKET_Condition()
{
	return C_Beklauen(59,50);
};

func void DIA_Addon_Logan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,Dialog_Back,DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};

func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};


instance DIA_Addon_BDT_1072_Logan_Mine(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Logan_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && Npc_HasItems(other,ItMi_Addon_Stone_01) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//Так значит, ты это сделал, хм... Ладно, хорошо, что ты не забыл про меня.
	Player_SentBuddler += 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Logan_How2(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent = FALSE;
	description = "Как у тебя дела?";
};


func int DIA_Addon_Logan_How2_Condition()
{
	if((Logan_Inside == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_How2_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//Как у тебя дела?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//Ну, по крайней мере я теперь внутри. Люсия варит какой-то гадкий ликер.
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//Но Эстебан не пускает меня в шахту. Ну никак не хочет. Он дал мне другую работу.
		AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//И? Что он хочет от тебя?
		AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//На его жизнь покушались. И он хочет, чтобы я выяснил, кто за этим стоит.
		AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//(тихо) Эстебан считает, что в этом замешан Снаф. Мне нужно следить за ним...
		LoganToldAboutEsteban = TRUE;
	};
};


instance DIA_Addon_Logan_Attentat(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Logan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (Logan_Inside == TRUE) && (LoganToldAboutEsteban == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//Ты ищешь того, кто за этим стоит, да?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//Но я ничего про это не знаю. Откуда мне знать? Тогда я еще был на болоте...
};


instance DIA_Addon_Logan_HI(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_HI_Condition()
{
	if((Logan_Inside == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Смотри-ка, новое лицо.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Ты пришел просто постоять рядом или, может быть, все-таки поможешь?
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Меня послал Франко. Он говорит, что тебе может понадобиться помощь. Так что?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//Ну, это зависит от того, в чем тебе нужна помощь.
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//Болотные акулы начинают подбираться ко мне слишком близко. Самое время прикончить некоторых из них.
	Log_CreateTopic(Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Logan,LOG_Running);
	B_LogEntry(Topic_Addon_Logan,"Логан хочет, чтобы я отправился с ним на охоту на болотных акул.");
};


instance DIA_Addon_Logan_Why(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent = FALSE;
	description = "Что я получу за помощь?";
};


func int DIA_Addon_Logan_Why_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Why_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//Что я получу за помощь?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//(рычит) Франко сгноит тебя здесь, если ты этого не сделаешь.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//Если ты хочешь попасть в лагерь, тебе придется помогать другим. На одних словах ты далеко не уедешь.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//А кроме того, я могу показать тебе, как разделывать этих зверюг.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//Но я не думаю, что Франко пошлет тебя в лагерь просто за то, что мы здесь немного повеселимся с болотными акулами.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//Здесь есть люди, которые уже долгое время ждут возможности попасть внутрь.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//И следующим, кто туда попадет, буду я... (рычит)... Лучше бы это было так...
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Логан может научить меня снимать кожу с рептилий и выдирать зубы и когти.");
};


instance DIA_Addon_Logan_Lager(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent = FALSE;
	description = "А что в лагере?";
};


func int DIA_Addon_Logan_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//А что в лагере?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//(ворчливо) Вопрос в том, чего НЕТ в лагере. Там нет болотных акул, там нет болотных кочек... Вообще НЕТ болота.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Зато там есть и выпивка, и золото. И насколько я знаю, там даже есть женщина. Понял?
};


instance DIA_Addon_Logan_MIS(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 99;
	condition = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent = FALSE;
	description = "Давай разберемся с болотными акулами.";
};


func int DIA_Addon_Logan_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//Давай разберемся с болотными акулами.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//(ворчливо) Ты, наконец, понял, как здесь нужно себя вести. Приятно слышать. Тсс... слышишь? Да-а, я их слышу.
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//Понятно, и что нам теперь делать?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//Они приближаются. Они хотят закусить человечиной. Ну-ну, мы посмотрим, кто кого съест... Пойдем.
	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_Running;
	Wld_InsertNpc(MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
};


var int Logan_Teach_NoPerm;

instance DIA_Addon_Logan_tot(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_tot_Condition()
{
	if(Npc_IsDead(MIS_Addon_Swampshark_01) && Npc_IsDead(MIS_Addon_Swampshark_02) && Npc_IsDead(MIS_Addon_Swampshark_03) && Npc_KnowsInfo(other,DIA_Addon_Logan_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_tot_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//Хорошая акула - дохлая акула. Это будет предупреждением ее собратьям!
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//Отлично, мне нужно сделать еще что-нибудь? Если нет, я пойду...
	if(Logan_Teach_NoPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//Иди. И если ты захочешь научиться чему-нибудь еще, ты знаешь, где меня искать.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Logan_tot_10_02_add");	//Иди...
	};
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog();
	B_LogEntry(Topic_Addon_Franco,"Я помог Логану. Посмотрим, что скажет на это Франко.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Logan_Lern(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 100;
	condition = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent = FALSE;
	description = "Покажи мне, как разделывать туши животных...";
};


func int DIA_Addon_Logan_Lern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Lern_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Покажи мне, как разделывать туши животных...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//Если ты хочешь научиться разделывать кровавых мух, пойди к Эдгору. Он про них знает буквально все.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//А если тебя интересуют болотные акулы и ящеры, я могу научить тебя снимать шкуру и вынимать зубы.
	if(!Npc_KnowsInfo(other,DIA_Addon_Edgor_Teach))
	{
		Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_BDT_Teacher,Log_Text_Addon_EdgorTeach);
	};
};


instance DIA_Addon_Logan_Allg(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent = TRUE;
	description = "Обучи меня.";
};


func int DIA_Addon_Logan_Allg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Lern) && (Logan_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Allg_Info()
{
	DIA_Common_TeachMe();
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Logan_Allg);
		Info_AddChoice(DIA_Addon_Logan_Allg,Dialog_Back,DIA_Addon_Logan_Allg_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString(NAME_TROPHY_Teeth,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_Logan_Allg_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString(NAME_TROPHY_Claws,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Addon_Logan_Allg_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Logan_Allg,B_BuildLearnString(NAME_TROPHY_ReptileSkin,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_ReptileSkin)),DIA_Addon_Logan_Allg_Fur);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Logan_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Logan_Allg_BACK()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == TRUE))
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Logan_Teach_NoPerm = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Logan_Allg);
};

func void DIA_Addon_Logan_Allg_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
};

func void DIA_Addon_Logan_Allg_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws);
};

func void DIA_Addon_Logan_Allg_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin);
};


var int Logan_Lohn;

instance DIA_Addon_Logan_Hacker(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Addon_Logan_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Эй, спасибо тебе, я сделал это! Я в шахте!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//Я пока не много знаю про то, как добывать золото, но это придет.
	if(Logan_Lohn == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//Я выучил самую главную вещь. Стой на земле крепко и всегда бей твердо!
		B_Upgrade_Hero_HackChance(10);
		Logan_Lohn = TRUE;
	};
};


