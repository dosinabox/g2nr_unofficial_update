
instance DIA_Sekob_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 999;
	condition = DIA_Sekob_EXIT_Condition;
	information = DIA_Sekob_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sekob_EXIT_Info()
{
	if(Kapitel >= 3)
	{
		self.flags = 0;
	};
	if(Kapitel < 5)
	{
		AI_StopProcessInfos(self);
	}
	else
	{
		B_NpcClearObsessionByDMT(self);
	};
};


instance DIA_Sekob_HALLO(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 3;
	condition = DIA_Sekob_HALLO_Condition;
	information = DIA_Sekob_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sekob_HALLO_Condition()
{
	if((Kapitel < 3) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_HALLO_Info()
{
	AI_Output(self,other,"DIA_Sekob_HALLO_01_00");	//Что ты делаешь на моей земле? Здесь нечего украсть. Проваливай.
	AI_Output(other,self,"DIA_Sekob_HALLO_15_01");	//Неужели в этой проклятой стране нет ни кусочка земли, который никому не принадлежит?
	AI_Output(self,other,"DIA_Sekob_HALLO_01_02");	//А ты займись делом, тогда, возможно, когда-нибудь и ты сможешь называть кусок земли своей собственностью. Но до той поры, будь добр, бей баклуши где-нибудь в другом месте.
};


instance DIA_Sekob_PermVorMis(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 3;
	condition = DIA_Sekob_PermVorMis_Condition;
	information = DIA_Sekob_PermVorMis_Info;
	permanent = TRUE;
	description = "Послушай...";
};


func int DIA_Sekob_PermVorMis_Condition()
{
	if((Kapitel < 3) && (MIS_Torlof_HolPachtVonSekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PermVorMis_Info()
{
	AI_Output(other,self,"DIA_Sekob_PermVorMis_15_00");	//Послушай...
	AI_Output(self,other,"DIA_Sekob_PermVorMis_01_01");	//У меня сейчас нет для тебя никакой работы. Уходи!
};


instance DIA_Sekob_ZAHLPACHT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_ZAHLPACHT_Condition;
	information = DIA_Sekob_ZAHLPACHT_Info;
	permanent = FALSE;
	description = "Онар хочет, чтобы ты, наконец, заплатил ренту.";
};


func int DIA_Sekob_ZAHLPACHT_Condition()
{
	if(MIS_Torlof_HolPachtVonSekob == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Sekob_ZAHLPACHT_Info()
{
	AI_Output(other,self,"DIA_Sekob_ZAHLPACHT_15_00");	//Эта земля принадлежит крупному землевладельцу. Ты здесь всего лишь арендатор. Онар хочет, чтобы ты, наконец, заплатил ренту. Ты должен был сделать это еще несколько недель назад.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_01");	//Что? И он послал бандита вроде тебя? Да ты сам не веришь в это!
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_02");	//Убирайся отсюда, пока я не вышел из себя.
	self.aivar[AIV_DefeatedByPlayer] = FALSE;
};


instance DIA_Sekob_KohleRaus(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_KohleRaus_Condition;
	information = DIA_Sekob_KohleRaus_Info;
	permanent = TRUE;
	description = "Давай сюда деньги, или я выбью тебе последние зубы.";
};


func int DIA_Sekob_KohleRaus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_KohleRaus_Info()
{
	AI_Output(other,self,"DIA_Sekob_KohleRaus_15_00");	//Давай сюда деньги, или я выбью тебе последние зубы.
	AI_Output(self,other,"DIA_Sekob_KohleRaus_01_01");	//Ты не получишь ни цента из моего кошелька, преступник. ТОЛЬКО НЕ ТЫ!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sekob_InformOnar(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_InformOnar_Condition;
	information = DIA_Sekob_InformOnar_Info;
	permanent = FALSE;
	description = "Что ж, тогда мне придется доложить об этом Онару.";
};


func int DIA_Sekob_InformOnar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_InformOnar_Info()
{
	AI_Output(other,self,"DIA_Sekob_InformOnar_15_00");	//Что ж, тогда мне придется доложить об этом Онару.
	AI_Output(self,other,"DIA_Sekob_InformOnar_01_01");	//Меня это не волнует! Можешь сказать Онару, что у меня ничего нет. Это печальная правда.
	MIS_Sekob_RedeMitOnar = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_Defeated(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_Defeated_Condition;
	information = DIA_Sekob_Defeated_Info;
	permanent = FALSE;
	description = "Где ты хранишь деньги?!";
};


func int DIA_Sekob_Defeated_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == TRUE) && Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (Sekob_Pachtbezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Defeated_Info()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_15_00");	//Где ты хранишь деньги?!
	AI_Output(self,other,"DIA_Sekob_Defeated_01_01");	//Не бей меня больше, пожалуйста. Я сделаю все, что ты скажешь.
	AI_Output(other,self,"DIA_Sekob_Defeated_15_02");	//Заплати ренту.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_03");	//(хныча) Но, господин, но у меня ничего нет. Я простой бедняк, я сам пухну от голода.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_04");	//Мой последний урожай полностью погиб от засухи. Я ХОЧУ заплатить ренту, но мне просто НЕЧЕМ. Мне очень жаль.
	Info_ClearChoices(DIA_Sekob_Defeated);
	Info_AddChoice(DIA_Sekob_Defeated,"Заплати ренту, или я убью тебя.",DIA_Sekob_Defeated_hart);
	if(Onar_WegenSekob == FALSE)
	{
		Info_AddChoice(DIA_Sekob_Defeated,"Хорошо, я поговорю с Онаром.",DIA_Sekob_Defeated_weich);
	};
};

func void DIA_Sekob_Defeated_weich()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_weich_15_00");	//Хорошо, я поговорю с Онаром.
	AI_Output(self,other,"DIA_Sekob_Defeated_weich_01_01");	//Спасибо, господин. Огромное спасибо!
	MIS_Sekob_RedeMitOnar = LOG_Running;
	AI_StopProcessInfos(self);
};

func void B_Sekob_Kassieren()
{
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_01");	//(подобострастно) Нет, пожалуйста, вот, возьми золото. Я даже прибавлю сверху, если ты оставишь меня в живых.
	CreateInvItems(self,ItMi_Gold,60);
	B_GiveInvItems(self,other,ItMi_Gold,60);
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_02");	//Вот видишь, это было не так уж и сложно.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_03");	//(в отчаянии) Я разорен.
	Sekob_Pachtbezahlt = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Defeated_hart()
{
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00_add");	//Заплати ренту, или я убью тебя.
	B_Sekob_Kassieren();
};


instance DIA_Sekob_Again(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 5;
	condition = DIA_Sekob_Again_Condition;
	information = DIA_Sekob_Again_Info;
	permanent = TRUE;
	description = "Насчет ренты...";
};


func int DIA_Sekob_Again_Condition()
{
	if((MIS_Sekob_RedeMitOnar == LOG_Running) && Npc_KnowsInfo(other,DIA_Sekob_Defeated) && (Sekob_Pachtbezahlt == FALSE) && (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Again_Info()
{
	AI_Output(other,self,"DIA_Sekob_Again_15_00");	//Насчет ренты...
	AI_Output(self,other,"DIA_Sekob_Again_01_01");	//Ты поговоришь с Онаром, правда?
	Info_ClearChoices(DIA_Sekob_Again);
	Info_AddChoice(DIA_Sekob_Again,"Я передумал.",DIA_Sekob_Again_Nein);
	if(Onar_WegenSekob == TRUE)
	{
		Info_AddChoice(DIA_Sekob_Again,"Я поговорил...",DIA_Sekob_Again_verarscht);
	}
	else
	{
		Info_AddChoice(DIA_Sekob_Again,"Конечно.",DIA_Sekob_Again_Ja);
	};
};

func void DIA_Sekob_Again_Nein()
{
	AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");	//Я передумал.
	DIA_Sekob_Defeated_hart();
};

func void DIA_Sekob_Again_Ja()
{
	AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Sekob_Again_Ja_01_01");	//У тебя получится.
	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Again_verarscht()
{
	MIS_Sekob_RedeMitOnar = LOG_SUCCESS;
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");	//Я поговорил...
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_01");	//И? Что он сказал?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_02");	//Извини, но теперь мне придется оторвать тебе голову.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_03");	//За что? Что такого я сделал?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_04");	//Ты пытался провести меня.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_05");	//Я сказал правду - честно!
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00");	//Хватит нести чушь. Дожди шли почти не переставая, и твои закрома ломятся от зерна. Заплати ренту, или я убью тебя.
	B_Sekob_Kassieren();
};


instance DIA_Sekob_PERMKAP1(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 6;
	condition = DIA_Sekob_PERMKAP1_Condition;
	information = DIA_Sekob_PERMKAP1_Info;
	permanent = TRUE;
	description = "В следующий раз ты заплатишь вовремя, понятно?";
};


func int DIA_Sekob_PERMKAP1_Condition()
{
	if((Sekob_Pachtbezahlt == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Sekob_PERMKAP1_15_00");	//В следующий раз ты заплатишь вовремя, понятно?
	AI_Output(self,other,"DIA_Sekob_PERMKAP1_01_01");	//(себе под нос) Что я сделал, чтобы заслужить такое...
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_DMT(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 30;
	condition = DIA_Sekob_DMT_Condition;
	information = DIA_Sekob_DMT_Info;
	description = "Что-нибудь случилось?";
};


func int DIA_Sekob_DMT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMT_Info()
{
	AI_Output(other,self,"DIA_Sekob_DMT_15_00");	//Что-нибудь случилось?
	AI_Output(self,other,"DIA_Sekob_DMT_01_01");	//Ты должен помочь мне. Мой дом заняли люди в черных рясах.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_02");	//Вы, слуги короля, ведь должны заботиться о населении, правда?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_03");	//Я знаю, что вы, наемники, не занимаетесь благотворительностью, но я заплачу тебе.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04");	//Ты должен помочь мне, о, великий маг.
	};
	AI_Output(self,other,"DIA_Sekob_DMT_01_05");	//Эти люди говорят, что кого-то ищут. Но почему-то в моем доме?!
	AI_Output(self,other,"DIA_Sekob_DMT_01_06");	//Пожалуйста, помоги мне. Заставь их убраться.
	Log_CreateTopic(TOPIC_SekobDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SekobDMT,LOG_Running);
	B_LogEntry(TOPIC_SekobDMT,"Черные маги выгнали Секоба из дома. Секоб хочет, чтобы я изгнал их.");
};


instance DIA_Sekob_DMTWEG(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 31;
	condition = DIA_Sekob_DMTWEG_Condition;
	information = DIA_Sekob_DMTWEG_Info;
	description = "Твой дом пуст. Людей в черных рясах больше нет.";
};


func int DIA_Sekob_DMTWEG_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Sekob_DMT) && Npc_IsDead(DMT_DementorAmbientSekob1) && Npc_IsDead(DMT_DementorAmbientSekob2) && Npc_IsDead(DMT_DementorAmbientSekob3) && Npc_IsDead(DMT_DementorAmbientSekob4))
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMTWEG_Info()
{
	AI_Output(other,self,"DIA_Sekob_DMTWEG_15_00");	//Твой дом пуст. Людей в черных рясах больше нет.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
//		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01");	//Я знал, что на стражника можно положиться.
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01_add");	//Я знал! Огромное спасибо!
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_02");	//Ты отлично справился. Онар может гордиться, что на его стороне есть такие люди.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_03");	//Спасибо тебе, о великий маг. Что бы с нами сталось без защиты духовенства?!
	};
	TOPIC_END_SekobDMT = TRUE;
	B_GivePlayerXP(XP_SekobDMTWEG);	
	AI_StopProcessInfos(self);
	if(Kapitel < 5)
	{
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Obsessed");
	};
	if(Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine(Rosi,"Start");
		B_StartOtherRoutine(Till,"Start");
	};
	if(BalthasarMovedToBengar == FALSE)
	{
		B_StartOtherRoutine(Balthasar,"Start");
	};
	B_StartOtherRoutine(Rega,"Start");
	B_StartOtherRoutine(Babera,"Start");
	B_StartOtherRoutine(SekobsBauer1,"Start");
	B_StartOtherRoutine(SekobsBauer2,"Start");
	if(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Bronko,"Start");
	}
	else
	{
		B_StartOtherRoutine(Bronko,"PreStart");
	};
//	Info_ClearChoices(DIA_Sekob_DMTWEG);
//	Info_AddChoice(DIA_Sekob_DMTWEG,Dialog_Ende,DIA_Sekob_DMTWEG_END);
};

/*func void DIA_Sekob_DMTWEG_END()
{
	AI_StopProcessInfos(self);
	if(Kapitel < 5)
	{
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Obsessed");
	};
	if(Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine(Rosi,"Start");
		B_StartOtherRoutine(Till,"Start");
	};
	B_StartOtherRoutine(Balthasar,"Start");
	B_StartOtherRoutine(Rega,"Start");
	B_StartOtherRoutine(Babera,"Start");
	B_StartOtherRoutine(SekobsBauer1,"Start");
	B_StartOtherRoutine(SekobsBauer2,"Start");
	B_StartOtherRoutine(Bronko,"Start");
};*/


instance DIA_Sekob_BELOHNUNG(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 32;
	condition = DIA_Sekob_BELOHNUNG_Condition;
	information = DIA_Sekob_BELOHNUNG_Info;
	description = "Не так быстро, мой друг.";
};


func int DIA_Sekob_BELOHNUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_DMTWEG) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_BELOHNUNG_Info()
{
	DIA_Common_NotSoFastMyFriend();
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(RosiToldAboutSekob == TRUE)
		{
			AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_01");	//Отныне тебе придется оставить свои грязные делишки и встать на путь добра, или я вернусь...
		};
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_02");	//Я не понимаю. Что еще тебе нужно?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_03");	//Ты что-то там болтал о награде, или мне послышалось?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_04");	//Меня интересует только одно. Что эти люди в черных рясах делали в твоем доме?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_05");	//Я сам не понимаю, о, великий маг. Возможно, они...
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");	//Что?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_07");	//Прошу извинить меня. Несколько лет назад я поклялся никогда не говорить об этом и не собираюсь нарушать свою клятву.
	};
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_08");	//Все, что я могу сделать - это дать тебе немного золота и просить тебя пощадить меня.
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_09");	//Тогда давай его сюда. Я тороплюсь.
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_10");	//Вот.
	CreateInvItems(self,ItMi_Gold,250);
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_PERM(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 80;
	condition = DIA_Sekob_PERM_Condition;
	information = DIA_Sekob_PERM_Info;
	permanent = TRUE;
	description = "Что-нибудь произошло интересного?";
};


func int DIA_Sekob_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_BELOHNUNG) && (Kapitel >= 3) && (NpcObsessedByDMT_Sekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERM_Info()
{
	AI_Output(other,self,"DIA_Sekob_PERM_15_00");	//Что-нибудь произошло интересного?
	if((hero.guild == GIL_KDF) && (Kapitel >= 5))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		if(MIS_bringRosiBackToSekob == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_01");	//Проваливай.
		}
		else if(MIS_bringRosiBackToSekob == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_02");	//Нет. Ничего особенного.
		}
		else if((Rosi_FleeFromSekob_Kap5 == TRUE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_03");	//Моя жена исчезла. Сначала я не придал этому внимания, но она так и не вернулась.
			AI_Output(self,other,"DIA_Sekob_PERM_01_04");	//Я подозреваю, что она убежала в лес, спасаясь от полевых хищников.
			if(MIS_bringRosiBackToSekob != LOG_Running)
			{
				AI_Output(self,other,"DIA_Sekob_PERM_01_05");	//Окажи мне услугу: если ты найдешь ее, приведи ее назад домой.
				MIS_bringRosiBackToSekob = LOG_Running;
				Log_CreateTopic(TOPIC_bringRosiBackToSekob,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_bringRosiBackToSekob,LOG_Running);
				B_LogEntry(TOPIC_bringRosiBackToSekob,"Жена Секоба Рози пропала. Секоб хочет, чтобы она вернулась.");
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_06");	//Ничего с тех пор, как эти негодяи в черном захватили мой дом.
		};
	};
};


instance DIA_Sekob_Heilung(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 55;
	condition = DIA_Sekob_Heilung_Condition;
	information = DIA_Sekob_Heilung_Info;
	permanent = TRUE;
	description = "У тебя проблема.";
};


func int DIA_Sekob_Heilung_Condition()
{
	if((NpcObsessedByDMT_Sekob == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && (Kapitel >= 5))
	{
		return TRUE;
	};
};


var int DIA_Sekob_Heilung_oneTime;

func void DIA_Sekob_Heilung_Info()
{
	AI_Output(other,self,"DIA_Sekob_Heilung_15_00");	//У тебя проблема.
	if(DIA_Sekob_Heilung_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_01");	//Да, это точно. ТЫ моя проблема, грязный маг. Убирайся прочь, пока я не содрал с тебя шкуру живьем.
		AI_Output(other,self,"DIA_Sekob_Heilung_15_02");	//(себе под нос) Тяжелый случай.
		B_NpcClearObsessionByDMT(self);
		DIA_Sekob_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_03");	//Ты что, меня не слышишь?!
		AI_Output(other,self,"DIA_Sekob_Heilung_15_04");	//(себе под нос) Безнадежный случай.
		B_NpcClearObsessionByDMT(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Sekob_ROSIBACKATSEKOB(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 53;
	condition = DIA_Sekob_ROSIBACKATSEKOB_Condition;
	information = DIA_Sekob_ROSIBACKATSEKOB_Info;
	description = "Я привел твою жену назад.";
};


func int DIA_Sekob_ROSIBACKATSEKOB_Condition()
{
	if(!Npc_IsDead(Rosi) && (MIS_bringRosiBackToSekob == LOG_Running))
	{
		if((Npc_GetDistToWP(Rosi,"NW_FARM4_IN_04") < 3000) || (Npc_GetDistToWP(Rosi,"NW_BIGFARM_FARM4_PATH_01") < 3000))
		{
			return TRUE;
		};
	};
};

func void DIA_Sekob_ROSIBACKATSEKOB_Info()
{
	AI_Output(other,self,"DIA_Sekob_ROSIBACKATSEKOB_15_00");	//Я привел твою жену назад.
	AI_Output(self,other,"DIA_Sekob_ROSIBACKATSEKOB_01_01");	//Превосходно. Вот, возьми это за свои труды.
	MIS_bringRosiBackToSekob = LOG_SUCCESS;
	CreateInvItems(self,ItMi_Gold,650);
	B_GiveInvItems(self,other,ItMi_Gold,650);
	B_GivePlayerXP(XP_AmbientKap5);
	B_NpcClearObsessionByDMT(self);
	Rosi.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StartOtherRoutine(Rosi,"Start");
	if(!Npc_IsDead(Till))
	{
		Till.aivar[AIV_PARTYMEMBER] = FALSE;
		B_StartOtherRoutine(Till,"Start");
	};
};


instance DIA_Sekob_ROSINEVERBACK(C_Info)
{
	npc = BAU_930_Sekob;
	nr = 56;
	condition = DIA_Sekob_ROSINEVERBACK_Condition;
	information = DIA_Sekob_ROSINEVERBACK_Info;
	description = "Рози никогда не вернется к тебе.";
};


func int DIA_Sekob_ROSINEVERBACK_Condition()
{
//	if((MIS_bringRosiBackToSekob == LOG_OBSOLETE) && (hero.guild != GIL_KDF))
	if((MIS_RosisFlucht == LOG_SUCCESS) && (MIS_bringRosiBackToSekob == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Sekob_ROSINEVERBACK_Info()
{
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_00");	//Рози никогда не вернется к тебе. Я отвел ее в безопасное место.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_01");	//Безопасное?.. От кого?
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");	//От тебя.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_03");	//Ты пожалеешь об этом, грязная свинья.
	self.flags = 0;
	B_NpcClearObsessionByDMT(self);
	B_Attack(self,other,AR_NONE,1);
	MIS_bringRosiBackToSekob = LOG_FAILED;
	B_GivePlayerXP(XP_AmbientKap5);
};

