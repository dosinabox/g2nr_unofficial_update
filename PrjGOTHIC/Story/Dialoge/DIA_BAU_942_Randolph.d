
instance DIA_Randolph_EXIT(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 999;
	condition = DIA_Randolph_EXIT_Condition;
	information = DIA_Randolph_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Randolph_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Randolph_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_SchwereLuft(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_SchwereLuft_Condition;
	information = DIA_Randolph_SchwereLuft_Info;
	permanent = FALSE;
	description = "Все в порядке?";
};


func int DIA_Randolph_SchwereLuft_Condition()
{
	if(Kapitel < 4)
	{
		if(!C_AkilFarmIsFree())
		{
			return TRUE;
		};
	};
};

func void DIA_Randolph_SchwereLuft_Info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//Хммм... Как только кто-нибудь здесь скажет неверное слово, начнется танец смерти... так что будь осторожнее - или резни не миновать.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//Ты будешь участвовать в схватке?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//Я не останусь в стороне, когда начнется драка. Но я также не собираюсь провоцировать ее.
	if(Akils_SLDStillthere == FALSE)
	{
		Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
		B_LogEntry(TOPIC_AkilsSLDStillthere,"Фермеру Акилу угрожают наемники.");
		Akils_SLDStillthere = TRUE;
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_HALLO(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_HALLO_Condition;
	information = DIA_Randolph_HALLO_Info;
	permanent = FALSE;
	description = "Все в порядке?";
};


func int DIA_Randolph_HALLO_Condition()
{
	if(C_AkilFarmIsFree() && (Kapitel < 4))
	{
		return TRUE;
	};
	if((Kapitel >= 4) && (other.guild == GIL_KDF) && (NpcObsessedByDMT_Randolph == TRUE) && Npc_IsDead(Akil) && Npc_IsDead(Kati))
	{
		return TRUE;
	};
};

func void DIA_Randolph_HALLO_Info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//Все в порядке?
	if(Npc_IsDead(Akil) && Npc_IsDead(Kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//Теперь, когда Кати и Акил отправились в царство Инноса, я буду управлять этой фермой.
		TOPIC_END_AkilsSLDStillthere = TRUE;
		B_CheckLog();
	}
	else if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//Да, я в порядке. Этот Альварес становился все наглее и наглее с каждым днем. Хорошо, что все кончилось.
	};
	if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//От чего я не отказался бы сейчас - так это от стаканчика хорошего вина в таверне.
	};
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(Akil) && !Npc_IsDead(Akil))
	{
		B_StartOtherRoutine(Akil,"Start");
	};
	if(Hlp_IsValidNpc(Kati) && !Npc_IsDead(Kati))
	{
		B_StartOtherRoutine(Kati,"Start");
	};
};


instance DIA_Randolph_Baltram(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Baltram_Condition;
	information = DIA_Randolph_Baltram_Info;
	permanent = FALSE;
	description = "Меня прислал Бальтрам. Я должен забрать пакет для него.";
};


func int DIA_Randolph_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (MIS_Baltram_ScoutAkil == LOG_Running) && Npc_IsDead(Akil) && Npc_IsDead(Kati) && (Lieferung_Geholt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Baltram_Info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//Меня прислал Бальтрам. Я должен забрать пакет для него.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	if((Kapitel >= 4) && (hero.guild == GIL_KDF) && (NpcObsessedByDMT_Randolph == FALSE))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//Хорошо. Я уже все приготовил. Вот твой пакет.
		B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
		B_LogEntry(TOPIC_Baltram,"Я получил посылку. Теперь я могу отнести ее Бальтраму...");
		Log_AddEntry(TOPIC_Nagur,"Я получил посылку. Теперь я могу отнести ее Нагуру...");
	};
	Lieferung_Geholt = TRUE;
};


instance DIA_Randolph_Geschichte(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Geschichte_Condition;
	information = DIA_Randolph_Geschichte_Info;
	permanent = FALSE;
	description = "Ты ведь нездешний, да?";
};


func int DIA_Randolph_Geschichte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Geschichte_Info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//Ты ведь нездешний, да?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//Я пришел с Южных островов. Когда-то ходили глашатаи и объявляли, что на Хоринисе нужны люди, чтобы добывать магическую руду.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//Но когда я приехал сюда, они возвели этот огромный барьер. И мне расхотелось идти туда. Поэтому я начал работать в порту.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//Затем сюда перестали заплывать корабли, и я пошел работать на Акила. У меня была работа и похуже, сейчас еще ничего.
};


instance DIA_Randolph_TAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_TAVERNE_Condition;
	information = DIA_Randolph_TAVERNE_Info;
	description = "Ты бываешь в таверне?";
};


func int DIA_Randolph_TAVERNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_TAVERNE_Info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//Ты бываешь в таверне?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//Бывал.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//Но больше я не могу позволить себе ходить туда.
};


instance DIA_Randolph_WASISTINTAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 6;
	condition = DIA_Randolph_WASISTINTAVERNE_Condition;
	information = DIA_Randolph_WASISTINTAVERNE_Info;
	description = "А что там происходит, в таверне?";
};


func int DIA_Randolph_WASISTINTAVERNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_TAVERNE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASISTINTAVERNE_Info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//А что там происходит, в таверне?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//Там проводят азартные игры.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//Двое состязаются друг с другом. Тот, кто может выпить больше пива - побеждает.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//В последнее время я только проигрывал, и теперь у меня совсем не осталось денег.
	if(TaverneTopicStarted == FALSE)
	{
		Log_CreateTopic(TOPIC_Wettsaufen,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Wettsaufen,LOG_Running);
		B_LogEntry(TOPIC_Wettsaufen,"В таверне можно заключить пари.");
		TaverneTopicStarted = TRUE;
	};
};


instance DIA_Randolph_GEGENWEN(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 7;
	condition = DIA_Randolph_GEGENWEN_Condition;
	information = DIA_Randolph_GEGENWEN_Info;
	description = "С кем ты соревновался?";
};


func int DIA_Randolph_GEGENWEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_WASISTINTAVERNE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_GEGENWEN_Info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//С кем ты соревновался?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//С Рухаром, этим старым бездельником. Он всегда побеждал меня.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//Но у меня есть подозрение, что эта грязная свинья все время подмешивала в мое пиво джин.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//Я думаю, он держит джин в своем чертовом сундуке. Вот подлец!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//Кто-нибудь должен подменить джин в его сундуке на воду. Тогда он может подливать ее в мое пиво сколько хочет.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//Если бы только у меня были деньги, чтобы сразиться с ним еще раз.
	B_LogEntry(TOPIC_Wettsaufen,"Рэндольф рассказал мне о Рухаре и состязании 'кто кого перепьет'. У Рэндольфа недостаточно денег, чтобы заключить пари с Рухаром еще раз.");
	Log_AddEntry(TOPIC_Wettsaufen,"Рэндольф подозревает Рухара в жульничестве в состязании 'кто кого перепьет'. Рэндольф хотел бы подменить бутылку джина в сундуке Рухара на бутылку с водой.");
};


instance DIA_Randolph_WASBRAUCHSTDU(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 8;
	condition = DIA_Randolph_WASBRAUCHSTDU_Condition;
	information = DIA_Randolph_WASBRAUCHSTDU_Info;
	description = "Сколько денег тебе нужно для этого состязания?";
};


func int DIA_Randolph_WASBRAUCHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_GEGENWEN) && (MIS_Rukhar_Wettkampf == LOG_Running) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASBRAUCHSTDU_Info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//Сколько денег тебе нужно для этого состязания?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 золотых.
};


instance DIA_Randolph_ICHGEBEDIRGELD(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 9;
	condition = DIA_Randolph_ICHGEBEDIRGELD_Condition;
	information = DIA_Randolph_ICHGEBEDIRGELD_Info;
	permanent = TRUE;
	description = "Я дам тебе деньги, чтобы ты сразился с Рухаром.";
};


var int DIA_Randolph_ICHGEBEDIRGELD_noPerm;

func int DIA_Randolph_ICHGEBEDIRGELD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_WASBRAUCHSTDU) && (DIA_Randolph_ICHGEBEDIRGELD_noPerm == FALSE) && (Kapitel < 4) && !Npc_IsDead(Rukhar))
	{
		return TRUE;
	};
};

func void DIA_Randolph_ICHGEBEDIRGELD_Info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//Я дам тебе деньги, чтобы ты сразился с Рухаром.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(восторженно) Правда? Огромное спасибо. Я скоро верну их тебе.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//Если я смогу победить, я даже верну тебе их с процентами. Еще увидимся.
		B_LogEntry(TOPIC_Wettsaufen,"Пари заключено. Состязание пройдет в таверне 'Мертвая гарпия'.");
		B_GivePlayerXP(XP_Randolph_WettkampfStart);
		DIA_Randolph_ICHGEBEDIRGELD_noPerm = TRUE;
		B_NpcClearObsessionByDMT(self);
		MIS_Rukhar_Wettkampf_Day = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		B_StartOtherRoutine(Orlan,"Wettkampf");
		B_StartOtherRoutine(Rukhar,"Wettkampf");
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//Да ладно. У тебя даже этого-то нет.
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_WETTKAMPFZUENDE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 10;
	condition = DIA_Randolph_WETTKAMPFZUENDE_Condition;
	information = DIA_Randolph_WETTKAMPFZUENDE_Info;
	permanent = TRUE;
	description = "Похмелье?";
};


func int DIA_Randolph_WETTKAMPFZUENDE_Condition()
{
	if((MIS_Rukhar_Wettkampf == LOG_SUCCESS) && (Kapitel < 4))
	{
		return TRUE;
	};
};


var int DIA_Randolph_WETTKAMPFZUENDE_OneTime;

func void B_Randolph_SuccessPay()
{
	AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//Все, наконец, получилось. Спасибо еще раз за деньги. Вот, получи их назад.
	CreateInvItems(self,ItMi_Gold,20);
	B_GiveInvItems(self,other,ItMi_Gold,20);
	B_GivePlayerXP(XP_Rukhar_WettkampfVorbei);
};

func void DIA_Randolph_WETTKAMPFZUENDE_Info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//Похмелье?
	if(Rukhar_Won_Wettkampf == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//Да уж, врагу такого не пожелаешь. И я не могу избавиться от него. Я больше капли в рот не возьму, клянусь!
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Твои деньги пропали. Извини.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//Нет. Я чувствую себя отлично, правда.
		if(DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
		{
			B_Randolph_SuccessPay();
			DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//Похоже, Рухар не скоро еще оправится после этого.
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_PERM(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 30;
	condition = DIA_Randolph_PERM_Condition;
	information = DIA_Randolph_PERM_Info;
	permanent = TRUE;
	description = "Ты в порядке?";
};


func int DIA_Randolph_PERM_Condition()
{
	if((Kapitel >= 4) && (NpcObsessedByDMT_Randolph == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Randolph_PERM_OneTime;
var int DIA_Randolph_SoberForever;

func void DIA_Randolph_PERM_Info()
{
	AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//Ты в порядке?
	if(hero.guild == GIL_KDF)
	{
		B_NpcObsessedByDMT(self);
	}
	else if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(MIS_HealRandolph == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//Я все еще чувствую слабость в ногах, но мне уже стало лучше.
		}
		else if(MIS_HealRandolph == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Мне плохо. Каждый раз, когда я перестаю пить, это похмелье убивает меня. Мне очень нужна помощь.
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Мне плохо. Каждый раз, когда я перестаю пить, это похмелье убивает меня. Мне очень нужна помощь.
			AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//Но есть лекарство, которое может помочь.
			AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//Сагитта, ведьма-целительница, уже готовила его для меня. Но я не думаю, что теперь смогу добраться до нее сам. Там повсюду орки.
			MIS_HealRandolph = LOG_Running;
			Log_CreateTopic(TOPIC_HealRandolph,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HealRandolph,LOG_Running);
			B_LogEntry(TOPIC_HealRandolph,"Рэндольф, похоже, решил бросить пить и послал меня к Сагитте за лекарством от похмельного синдрома.");
		};
	}
	else if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE))
	{
		if(Rukhar_Won_Wettkampf == TRUE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Твои деньги пропали. Извини.
		}
		else
		{
			B_Randolph_SuccessPay();
		};
		DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//Я больше капли в рот не возьму. Только не в этой жизни. Ты можешь мне поверить, парень.
		DIA_Randolph_SoberForever = TRUE;
	};
};


instance DIA_Randolph_PAYME(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 56;
	condition = DIA_Randolph_PAYME_Condition;
	information = DIA_Randolph_PAYME_Info;
	description = "Ты послал меня, не дав денег...";
};


func int DIA_Randolph_PAYME_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Randolph_PAYME_Info()
{
	AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//Ты послал меня, не дав денег, и не предупредил, что это лекарство такое дорогое?!
	AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//Сагитта хочет 300 золотых за него.
	AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//Я могу дать тебе только 150 золотых. Пожалуйста. Ты должен помочь мне. Пожалуйста.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
};


instance DIA_Randolph_SAGITTAHEAL(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 56;
	condition = DIA_Randolph_SAGITTAHEAL_Condition;
	information = DIA_Randolph_SAGITTAHEAL_Info;
	description = "Держи. Это облегчит твое похмелье.";
};


func int DIA_Randolph_SAGITTAHEAL_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && Npc_HasItems(other,ItPo_HealRandolph_MIS))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SAGITTAHEAL_Info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//Держи. Это облегчит твое похмелье.
	B_GiveInvItems(other,self,ItPo_HealRandolph_MIS,1);
	B_UseItem(self,ItPo_HealRandolph_MIS);
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//Ох! Спасибо, друг. Теперь я смогу хотя бы поспать.
	MIS_HealRandolph = LOG_SUCCESS;
	if(!Npc_KnowsInfo(other,DIA_Randolph_PAYME))
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//Я думаю, эти несколько монет могут только помочь мне спасти лицо. Но боюсь, это все, что у меня есть.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
		B_GivePlayerXP(XP_HealRandolph);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//Чем я могу отплатить тебе за это?
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//Я заплатил за тебя кучу денег. Твои жалкие несколько монет никак не могут компенсировать мои затраты.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//Ну, в таком случае мне повезло, что я встретил такого великодушного паладина, тебе так не кажется?
		}
		else
		{
			AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//У меня нет денег. Но ты можешь рассчитывать на мою сердечную благодарность.
		};
		B_GivePlayerXP(XP_HealRandolph / 2);
	};
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Randolph_Heilung(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 55;
	condition = DIA_Randolph_Heilung_Condition;
	information = DIA_Randolph_Heilung_Info;
	permanent = TRUE;
	description = "Спиртное ударило тебе в голову, ха?";
};


func int DIA_Randolph_Heilung_Condition()
{
	if((NpcObsessedByDMT_Randolph == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Heilung_Info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//Спиртное ударило тебе в голову, ха?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//Я больше капли в рот не возьму. Только не в этой жизни. Ты можешь мне поверить, парень.
	B_NpcClearObsessionByDMT(self);
	if(Randolph_ExchangeRoutine_Once == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		Randolph_ExchangeRoutine_Once = TRUE;
	};
};


instance DIA_Randolph_PICKPOCKET(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 900;
	condition = DIA_Randolph_PICKPOCKET_Condition;
	information = DIA_Randolph_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Randolph_PICKPOCKET_Condition()
{
	return C_Beklauen(58,2);
};

func void DIA_Randolph_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
	Info_AddChoice(DIA_Randolph_PICKPOCKET,Dialog_Back,DIA_Randolph_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Randolph_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Randolph_PICKPOCKET_DoIt);
};

func void DIA_Randolph_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};

func void DIA_Randolph_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};

