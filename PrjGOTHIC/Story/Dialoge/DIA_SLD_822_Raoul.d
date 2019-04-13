
instance DIA_Raoul_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_EXIT_Condition;
	information = DIA_Raoul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Raoul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_NoSentenza(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_NoSentenza_Condition;
	information = DIA_Raoul_NoSentenza_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Raoul_NoSentenza_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Sentenza_Hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_NoSentenza_Info()
{
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");	//Минутку, приятель!
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");	//Я не видел, чтобы Сентенза обыскивал тебя.
	if(Hlp_IsValidNpc(Sentenza) && !C_NpcIsDown(Sentenza))
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");	//СЕНТЕНЗА! Иди сюда!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");	//(фальшиво вежливо) Подожди секундочку, сейчас он подойдет!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");	//И тогда тебя ждет неприятный сюрприз!
		B_Attack(Sentenza,other,AR_NONE,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");	//Где же он? А, ладно, не важно, тебе повезло...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_Hello(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_Hello_Condition;
	information = DIA_Raoul_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Raoul_Hello_Condition()
{
	if((other.guild == GIL_NONE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Hello_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_00");	//(скучающе) Чего тебе нужно?
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_01");	//(раздраженно) Что тебе нужно на этот раз?
	};
};


var int Raoul_gesagt;

instance DIA_Raoul_PERMNone(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_PERMNone_Condition;
	information = DIA_Raoul_PERMNone_Info;
	permanent = TRUE;
	description = "Я хочу осмотреться на этой ферме!";
};


func int DIA_Raoul_PERMNone_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERMNone_Info()
{
	if(Raoul_gesagt == FALSE)
	{
		AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");	//Я хочу осмотреться на этой ферме!
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");	//Не заходи в здание слева. Там Сильвио. Он сейчас не в самом лучшем расположении духа.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");	//Если он увидит слабака, не работающего на этой ферме, он может решить выместить на нем свою злобу.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//Удачи!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Raoul_WannaJoin(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_WannaJoin_Condition;
	information = DIA_Raoul_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу присоединиться к Ли!";
};


func int DIA_Raoul_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");	//Я хочу присоединиться к Ли!
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");	//Если Ли будет продолжать в том же духе, ему скоро некем будет командовать!
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");	//Что ты хочешь этим сказать?
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");	//Он хочет, чтобы мы сидели здесь и били баклуши. Иногда приходится задавать взбучку фермерам - и это все.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");	//Сильвио всегда говорил, что нападение - это лучшая оборона, и, черт возьми, он прав.
};


instance DIA_Raoul_AboutSylvio(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_AboutSylvio_Condition;
	information = DIA_Raoul_AboutSylvio_Info;
	permanent = FALSE;
	description = "Кто такой Сильвио?";
};


func int DIA_Raoul_AboutSylvio_Condition()
{
	if((Raoul_gesagt == TRUE) || Npc_KnowsInfo(other,DIA_Raoul_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Raoul_AboutSylvio_Info()
{
	AI_Output(other,self,"DIA_Raoul_AboutSylvio_15_00");	//Кто такой Сильвио?
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");	//Наш следующий предводитель, если тебе интересно мое мнение. Если ты собираешься просить его, чтобы он позволил тебе присоединиться к нашим рядам, забудь об этом!
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");	//Судя по твоему виду, ты не подходишь даже для того, чтобы пасти овец.
};


instance DIA_Raoul_Stimme(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Stimme_Condition;
	information = DIA_Raoul_Stimme_Info;
	permanent = FALSE;
	description = "Я бы хотел стать наемником. Ты не возражаешь?";
};


func int DIA_Raoul_Stimme_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_Stimme_Info()
{
	AI_Output(other,self,"DIA_Raoul_Stimme_15_00");	//Я бы хотел стать наемником. Ты не возражаешь?
	AI_Output(self,other,"DIA_Raoul_Stimme_01_01");	//Ааа, делай, что хочешь...
	Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
	B_LogEntry(TOPIC_SLDRespekt,"Рауль не возражает против моего вступления в ряды наемников.");
};


instance DIA_Raoul_Duell(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Duell_Condition;
	information = DIA_Raoul_Duell_Info;
	permanent = TRUE;
	description = "Я думаю, тебе стоит дать по морде...";
};


func int DIA_Raoul_Duell_Condition()
{
	if((Raoul_gesagt == TRUE) || Npc_KnowsInfo(other,DIA_Raoul_AboutSylvio) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Duell_Info()
{
	AI_Output(other,self,"DIA_Raoul_Duell_15_00");	//Я думаю, тебе стоит дать по морде...
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//Что?
	AI_Output(other,self,"DIA_Raoul_Duell_15_02");	//Это именно то, что тебе сейчас нужно...
	AI_Output(self,other,"DIA_Raoul_Duell_01_03");	//По-моему, я был с тобой слишком вежлив!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Raoul_PERM(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 900;
	condition = DIA_Raoul_PERM_Condition;
	information = DIA_Raoul_PERM_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Raoul_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info()
{
	AI_Output(other,self,"DIA_Raoul_PERM_15_00");	//Все в порядке?
	if(MIS_Raoul_KillTrollBlack == LOG_Running)
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_01");	//Не болтай попусту. Или и принеси шкуру черного тролля.
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_02");	//Ты пытаешься подлизаться ко мне? Забудь об этом!
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Raoul_PERM_01_03");	//Я не забыл, что ты сделал со мной.
		};
	};
};


instance DIA_Raoul_TROLL(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_TROLL_Condition;
	information = DIA_Raoul_TROLL_Info;
	important = TRUE;
};


func int DIA_Raoul_TROLL_Condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_01_00");	//(цинично) Только посмотрите на это!
	AI_Output(other,self,"DIA_Raoul_TROLL_15_01");	//Чего тебе нужно?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_02");	//Ты присоединился к городским нищим? Похоже на то.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_03");	//Не думай, что я стану уважать тебя только за то, что ты стал одним из нас.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_04");	//Разыгрываешь из себя великого мага, ха?
	};
	AI_Output(self,other,"DIA_Raoul_TROLL_01_05");	//Я скажу тебе одну вещь. Не важно, что ты носишь, я вижу тебя насквозь.
	AI_Output(self,other,"DIA_Raoul_TROLL_01_06");	//По мне, так ты просто скользкий маленький бездельник и ничего больше.
	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL,"Я должен идти.",DIA_Raoul_TROLL_weg);
	Info_AddChoice(DIA_Raoul_TROLL,"В чем твоя проблема?",DIA_Raoul_TROLL_rechnung);
};

func void DIA_Raoul_TROLL_weg()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");	//Я должен идти.
	AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");	//Да, проваливай.
	AI_StopProcessInfos(self);
};

func void DIA_Raoul_TROLL_rechnung()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00");	//В чем твоя проблема?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01");	//Я вижу таких людей, как ты, насквозь. Способны только на слова, а когда доходит до дела - в кусты.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02");	//Я ненавижу тех, кто одевается как вельможа и повсюду хвастает своими героическими делами.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03");	//Не далее как вчера я набил морду одному такому. Он утверждал, что может завалить черного тролля одной левой.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//И что?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05");	//(язвительно) Что ты хочешь сказать этим 'и что'?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06");	//Ты хоть раз в своей жизни видел черного тролля, болтун? Ты хотя бы представляешь себе, насколько велики эти монстры?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07");	//Если ты подойдешь к ним слишком близко, они разорвут тебя на куски.
	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL,"Мне это не интересно.",DIA_Raoul_TROLL_rechnung_hastrecht);
	if(Npc_IsDead(Troll_Black))
	{
		Info_AddChoice(DIA_Raoul_TROLL,"Я уже убил черного тролля.",DIA_Raoul_TROLL_rechnung_ich);
	}
	else
	{
		Info_AddChoice(DIA_Raoul_TROLL,"Черного тролля? Нет проблем.",DIA_Raoul_TROLL_rechnung_noProb);
	};
};

func void B_Raoul_Blame()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");	//Ты напрашиваешься, да? Я должен был уже оторвать тебе голову. Но у меня есть идея получше.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");	//Если ты такой великий боец, докажи это.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");	//А что мне с этого будет?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");	//Глупый вопрос. Почет, и твоя челюсть останется не сломанной.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");	//Не так уж много.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");	//Ммм. Скажем, я заплачу тебе целую кучу денег, если ты принесешь мне шкуру черного тролля. Как тебе?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//Уже лучше.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");	//Тогда чего ты ждешь?
	Log_CreateTopic(TOPIC_KillTrollBlack,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack,LOG_Running);
	B_LogEntry(TOPIC_KillTrollBlack,"Рауль чтобы я принес ему шкуру черного тролля.");
	MIS_Raoul_KillTrollBlack = LOG_Running;
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");	//Мне это не интересно.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");	//Ну, как знаешь.
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");	//Я уже убил черного тролля.
	B_Raoul_Blame();
};

func void DIA_Raoul_TROLL_rechnung_noProb()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");	//Черного тролля? Нет проблем.
	B_Raoul_Blame();
};


instance DIA_Raoul_TrophyFur(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_TrophyFur_Condition;
	information = DIA_Raoul_TrophyFur_Info;
	permanent = TRUE;
	description = "Сначала скажи мне, как снять шкуру с черного тролля.";
};


func int DIA_Raoul_TrophyFur_Condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) && (MIS_Raoul_KillTrollBlack == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TrophyFur_Info()
{
	AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");	//Сначала скажи мне, как снять шкуру с черного тролля.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");	//Тогда прочисть свои уши. Этот совет бесплатный.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");	//Ты хватаешь этого зверя и делаешь надрез на каждой из его лап.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");	//Затем снимаешь с него шкуру через голову. Разве это так сложно?
	};
};


instance DIA_Raoul_TROLLFELL(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_TROLLFELL_Condition;
	information = DIA_Raoul_TROLLFELL_Info;
	description = "Я принес шкуру черного тролля.";
};


func int DIA_Raoul_TROLLFELL_Condition()
{
	if(Npc_HasItems(other,ItAt_TrollBlackFur) && Npc_KnowsInfo(other,DIA_Raoul_TROLL))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLLFELL_Info()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");	//Я принес шкуру черного тролля.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");	//Невероятно. Покажи.
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");	//Невероятно. Что ты хочешь за нее?
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");	//Отдай мне все, что у тебя есть.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");	//Хорошо. Я дам тебе 500 золотых монет и три сильных лечебных зелья. Что скажешь?
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
	Info_AddChoice(DIA_Raoul_TROLLFELL,"Этого недостаточно.",DIA_Raoul_TROLLFELL_nein);
	Info_AddChoice(DIA_Raoul_TROLLFELL,"Готово.",DIA_Raoul_TROLLFELL_ja);
	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//Продано.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");	//Отличная сделка.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
};

func void DIA_Raoul_TROLLFELL_nein()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00");	//Этого недостаточно.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01");	//Как знаешь. Я все равно заберу эту шкуру.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02");	//Я не прощу себе, если упущу такую возможность.
	MIS_Raoul_DoesntPayTrollFur = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_FELLZURUECK(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_FELLZURUECK_Condition;
	information = DIA_Raoul_FELLZURUECK_Info;
	permanent = TRUE;
	description = "Верни мне мою шкуру черного тролля.";
};


func int DIA_Raoul_FELLZURUECK_Condition()
{
	if((MIS_Raoul_DoesntPayTrollFur == LOG_Running) && Npc_HasItems(self,ItAt_TrollBlackFur))
	{
		return TRUE;
	};
};

func void DIA_Raoul_FELLZURUECK_Info()
{
	AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");	//Верни мне мою шкуру черного тролля.
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//Нет.
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_GotTrollFurBack(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_GotTrollFurBack_Condition;
	information = DIA_Raoul_GotTrollFurBack_Info;
	description = "Никогда больше не пытайся обмануть меня, понятно?";
};


func int DIA_Raoul_GotTrollFurBack_Condition()
{
	if((MIS_Raoul_DoesntPayTrollFur == LOG_Running) && (Npc_HasItems(self,ItAt_TrollBlackFur) == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Raoul_GotTrollFurBack_Info()
{
	AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");	//Никогда больше не пытайся обмануть меня, понятно?
	AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");	//Хорошо. Ты знаешь здешние законы. Так что успокойся.
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP3_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP3_EXIT_Condition;
	information = DIA_Raoul_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP4_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP4_EXIT_Condition;
	information = DIA_Raoul_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_KAP5_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP5_EXIT_Condition;
	information = DIA_Raoul_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_Ship(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Ship_Condition;
	information = DIA_Raoul_Ship_Info;
	description = "Ты не отказался бы от океанского круиза?";
};


func int DIA_Raoul_Ship_Condition()
{
	if((Kapitel >= 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info()
{
	AI_Output(other,self,"DIA_Raoul_Ship_15_00");	//Ты не отказался бы от океанского круиза?
	AI_Output(self,other,"DIA_Raoul_Ship_01_01");	//Что ты замышляешь? Ты хочешь захватить корабль паладинов? (смеется)
	AI_Output(other,self,"DIA_Raoul_Ship_15_02");	//А что если и так?
	AI_Output(self,other,"DIA_Raoul_Ship_01_03");	//(серьезно) У тебя совсем крыша поехала. Нет, спасибо. Это не для меня.
	AI_Output(self,other,"DIA_Raoul_Ship_01_04");	//Я не вижу причин покидать Хоринис. Мне все равно, где зарабатывать деньги, здесь или на материке.
	AI_Output(self,other,"DIA_Raoul_Ship_01_05");	//Найди кого-нибудь еще.
	if(Npc_IsDead(Torlof) == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Ship_01_06");	//Спроси Торлофа. Он ходил по морям, насколько я знаю.
	};
};


instance DIA_Raoul_KAP6_EXIT(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_KAP6_EXIT_Condition;
	information = DIA_Raoul_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_PICKPOCKET(C_Info)
{
	npc = Sld_822_Raoul;
	nr = 900;
	condition = DIA_Raoul_PICKPOCKET_Condition;
	information = DIA_Raoul_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Raoul_PICKPOCKET_Condition()
{
	return C_Beklauen(45,85);
};

func void DIA_Raoul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
	Info_AddChoice(DIA_Raoul_PICKPOCKET,Dialog_Back,DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Raoul_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

