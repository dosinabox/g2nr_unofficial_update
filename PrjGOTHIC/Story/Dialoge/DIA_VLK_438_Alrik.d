
instance DIA_Alrik_EXIT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 999;
	condition = DIA_Alrik_EXIT_Condition;
	information = DIA_Alrik_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alrik_PICKPOCKET(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 900;
	condition = DIA_Alrik_PICKPOCKET_Condition;
	information = DIA_Alrik_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Alrik_PICKPOCKET_Condition()
{
	return C_Beklauen(55,50);
};

func void DIA_Alrik_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,Dialog_Back,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};


instance DIA_Alrik_Hallo(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Hallo_Condition;
	information = DIA_Alrik_Hallo_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hallo_Info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Что ты делаешь здесь?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(смеется) Это мой дом!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//А что мне еще делать здесь? Я пью.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Я собираюсь немного прогуляться.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Но если ты имеешь в виду, что я делаю днем - то я устраиваю бои.
};


instance DIA_Alrik_YouFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_YouFight_Condition;
	information = DIA_Alrik_YouFight_Info;
	permanent = FALSE;
	description = "Ты устраиваешь бои?";
};


func int DIA_Alrik_YouFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ты устраиваешь бои?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Каждый день, с полудня до вечера.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//И прямо здесь!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//За складом в портовом квартале - здесь мой дом!
};


instance DIA_Alrik_Regeln(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Regeln_Condition;
	information = DIA_Alrik_Regeln_Info;
	permanent = FALSE;
	description = "Каковы правила боев?";
};


func int DIA_Alrik_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Regeln_Info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Каковы правила боев?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Это просто: разрешено все обычное оружие. Никаких луков, арбалетов и НИКАКОЙ магии!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Мы сражаемся, пока один из нас не упадет. Как только один из нас окажется распростертым на земле, бой окончен, понятно?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Кто сбежит - тот проиграл! То есть, если ты вышел из боя, то я победил!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Ставка - 50 золотых. Если ты победишь, ты получишь 100 монет. Если нет - ну, тогда твои деньги останутся у меня. (ухмыляется)
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Понял?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Да!
};

func void B_Alrik_Again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Как дела? Ты хочешь сразиться со мной еще раз? Я думаю, за это время я стал лучше...
};


instance DIA_Alrik_NewFights3(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights3_Condition;
	information = DIA_Alrik_NewFights3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights3_Condition()
{
	if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren <= 6))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	B_SetAttributesToChapter(self,4);
	B_Alrik_Again();
};


instance DIA_Alrik_NewFights5(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights5_Condition;
	information = DIA_Alrik_NewFights5_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights5_Condition()
{
	if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren <= 9))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,20);
	B_SetAttributesToChapter(self,6);
	B_Alrik_Again();
};

func void B_Alrik_Enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//Мне кажется, ты побеждаешь слишком часто.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Не пойми меня неверно, но моя башка все еще гудит после прошлого раза...
};

func void B_Alrik_ComeBackLater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Заходи позже. А пока я потренируюсь...
};


instance DIA_Alrik_WannaFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WannaFight_Condition;
	information = DIA_Alrik_WannaFight_Info;
	permanent = TRUE;
	description = "Я хочу сразиться с тобой!";
};


func int DIA_Alrik_WannaFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Regeln) && (self.aivar[AIV_ArenaFight] == AF_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Я хочу сразиться с тобой!
	Info_ClearChoices(DIA_Alrik_WannaFight);
	if(((Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_Alrik_Sword == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Сначала верни мне мой меч. А там посмотрим...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Нет, нет. Прежде чем выйти против тебя еще раз, мне раздобыть нужно оружие получше!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//Мне несколько дней назад пришлось продать свой меч.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//С ним я непобедим! Если ты вернешь его мне, я готов опять сражаться с тобой!
			Alrik_VomSchwertErzaehlt = TRUE;
			Log_CreateTopic(TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_Running);
			B_LogEntry(TOPIC_AlrikSchwert,"Альрик продал свой меч торговцу Джоре. Он будет сражаться со мной, только если я верну ему его меч.");
		};
	}
	else if((Kapitel <= 2) && (Alrik_ArenaKampfVerloren > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Я думаю, пока хватит...
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Дай мне немного передохнуть.
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren > 6))
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren > 9))
	{
		B_Alrik_Enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Кроме того, я сегодня заработал уже достаточно денег.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//С меня хватит. Я собираюсь подыскать себе другое местечко в городе...
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Кто знает, может, я открою оружейную лавку...
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//У тебя есть 50 золотых?
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight,"Нет...",DIA_Alrik_WannaFight_NoGold);
		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight,"Вот, держи...",DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Я сражаюсь только с полудня до вечера.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Бои имеют смысл, только если есть достаточно зрителей, делающих ставки!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Сейчас слишком поздно. Приходи завтра в полдень!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Все еще слишком рано, заходи позже!
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Вот, держи...
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(громко) У нас новый боец!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//Ставки сделаны...
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	CreateInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Ты готов?
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe = Alrik_Kaempfe + 1;
	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight,"Подожди секундочку...",DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight,"Иди сюда!",DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Нет...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//Тогда найди их! Без ставок боя не будет!
	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//Иди сюда!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//Посмотрим, на что ты способен!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Подожди секундочку...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Как хочешь... а я начинаю сейчас!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Alrik_AfterFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_AfterFight_Condition;
	information = DIA_Alrik_AfterFight_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Alrik_AfterFight_Condition()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if((self.aivar[AIV_LastPlayerAR] == AR_NONE) && (self.aivar[AIV_ArenaFight] != AF_NONE) && (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//Ох, парень! Ну и удары у тебя.
			if(Npc_HasItems(self,ItMi_Gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Вот твои 100 золотых! Ты заработал их!
				B_GiveInvItems(self,other,ItMi_Gold,100);
			}
			else if(Npc_HasItems(self,ItMi_Gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Я вижу, ты уже забрал свое золото.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//Ты мог бы подождать, пока я сам не отдам его тебе - я держу свое слово!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Ты пошарил в моих карманах, пока я был без сознания!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//Это дурной тон! Но ладно, эти деньги все равно были твоими! Вот остальное.
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
			};
			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//Ты хорошо дрался. Но твоя ставка пропала - не расстраивайся особенно, она пойдет на доброе дело! (ухмыляется)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Эй, я же предупреждал, тот, кто убежит за угол проигрывает! Если хочешь попробовать еще раз, я к твоим услугам!
		};
		if(Alrik_Kaempfe == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//И еще одно: никто не говорит о том, что происходит за складом.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Ополчение готово за малейшее прегрешение засунуть тебя за решетку. А эти парни не любят когда делаются ставки на бой.
			};
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Бой был окончен, ты, кретин!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Я не люблю, когда кто-нибудь не подчиняется моим правилам.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Убирайся отсюда!
		}
		else
		{
			if(Alrik_Kaempfe == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Если ты хотел сразиться со мной, тебе нужно было вызвать меня.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Если ты хотел сразиться еще раз, тебе нужно было вызвать меня!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//Я не хочу иметь дела с таким дерьмом, как ты! Проваливай!
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Alrik_DuWohnst(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_DuWohnst_Condition;
	information = DIA_Alrik_DuWohnst_Info;
	permanent = FALSE;
	description = "Ты 'живешь' за этим складом?";
};


func int DIA_Alrik_DuWohnst_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(удивленно) Ты 'живешь' за этим складом?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//Только временно. (ухмыляется) Когда имеешь столько денег, как у меня, можно позволить себе немного роскоши!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//Я был инструктором в армии, но я бросил это занятие и выбрал судьбу искателя приключений.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//И вот я застрял в этой дыре. Мои последние 100 золотых ушли в карман стражникам у городских ворот.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//И вот я пытаюсь опять разбогатеть. Мне даже пришлось продать мой меч.
	Alrik_VomSchwertErzaehlt = TRUE;
};


instance DIA_Alrik_WerSchwert(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WerSchwert_Condition;
	information = DIA_Alrik_WerSchwert_Info;
	permanent = FALSE;
	description = "Кому ты продал свой меч?";
};


func int DIA_Alrik_WerSchwert_Condition()
{
	if((Alrik_VomSchwertErzaehlt == TRUE) && (MIS_Alrik_Sword != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Кому ты продал свой меч?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//Я обменял его у торговца с рыночной площади на кое-какие вещи.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Его зовут Джора. Факелы и мясо, что он дал мне, давно закончились.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Он вряд ли отдаст мне этот меч просто так...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//Это старый меч. Он вряд ли много за него запросит. Просто думай об этих деньгах, как о дополнительной ставке. (ухмыляется)
	MIS_Alrik_Sword = LOG_Running;
};


var int Alrik_EinmalSchwertBonus;

instance DIA_Alrik_HaveSword(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_HaveSword_Condition;
	information = DIA_Alrik_HaveSword_Info;
	permanent = TRUE;
	description = "Я принес твой меч!";
};


func int DIA_Alrik_HaveSword_Condition()
{
	if(Npc_HasItems(other,ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//Я принес твой меч!
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	if(MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//Ах! Им значительно удобнее сражаться, чем палкой!
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP(XP_AlriksSword);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Отлично! Интересно, осмелишься ли ты вызвать меня теперь!
	};
	if(Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,20);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_Alrik_Krieg(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Krieg_Condition;
	information = DIA_Alrik_Krieg_Info;
	permanent = FALSE;
	description = "Что ты знаешь о войне с орками?";
};


func int DIA_Alrik_Krieg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Krieg_Info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Что ты знаешь о войне с орками?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//Мне почти нечего сказать. Эта война идет уже очень давно.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Народ голодает. Повсюду поднимаются крестьянские восстания, которые безжалостно подавляются королем.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Но их слишком много. Если война вскоре не закончится, королевство развалится.
};


var int Alrik_VorausErzaehlt;

instance DIA_Alrik_Ausbilden(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Ausbilden_Condition;
	information = DIA_Alrik_Ausbilden_Info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int DIA_Alrik_Ausbilden_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE)) && (Alrik_Teach1H == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbilden_Info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//Ты можешь обучить меня?
	if((Alrik_Kaempfe == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Если ты действительно хочешь научиться сражаться, то выходи против меня. (ухмыляется) За этот урок я не возьму дополнительной платы.
		Alrik_VorausErzaehlt = TRUE;
	}
	else
	{
		if(Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Я держу свое слово. Я научу тебя всему, что я знаю - если у тебя достаточно опыта.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Как только у тебя будет необходимый опыт - пожалуйста.
		};
		Alrik_Teach1H = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Альрик может обучить меня искусству владения одноручным оружием. Он ошивается за складом в портовом квартале.");
	};
};


var int Alrik_Merke_1h;

instance DIA_Alrik_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Teach_Condition;
	information = DIA_Alrik_Teach_Info;
	permanent = TRUE;
	description = "Научи меня обращаться с мечом!";
};


func int DIA_Alrik_Teach_Condition()
{
	if(Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//Научи меня обращаться с мечом!
	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//Ты больше не новичок!
	}
	else if(other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//У тебя уже лучше получается. Скоро ты станешь серьезным бойцом!
	};
	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
};

