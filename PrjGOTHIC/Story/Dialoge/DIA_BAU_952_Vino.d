
instance DIA_Vino_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_EXIT_Condition;
	information = DIA_Vino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vino_EXIT_Info()
{
	if((Kapitel < 3) && !Npc_HasEquippedArmor(other))
	{
		PlayerVisitedLobartFarmArmorless = TRUE;
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_HALLO(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_HALLO_Condition;
	information = DIA_Vino_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Vino_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_HALLO_Info()
{
	AI_Output(other,self,"DIA_Vino_HALLO_15_00");	//Как идет работа?
	AI_Output(self,other,"DIA_Vino_HALLO_05_01");	//Так же, как и всегда. Работы много, денег мало, а если нам совсем не повезет, то завтра придут орки и сожгут нашу ферму дотла.
	if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Vino_HALLO_05_02");	//Королевские паладины заняли весь город. Но я очень сомневаюсь в том, что они поднимут свои задницы и придут сюда, если орки нападут на нас.
	};
};


instance DIA_Vino_SeekWork(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_SeekWork_Condition;
	information = DIA_Vino_SeekWork_Info;
	permanent = FALSE;
	description = "Могу я чем-нибудь помочь? Я ищу работу.";
};


func int DIA_Vino_SeekWork_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lobart_WorkNOW) || Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG)) && !Npc_IsDead(Lobart) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_SeekWork_Info()
{
	AI_Output(other,self,"DIA_Vino_SeekWork_15_00");	//Могу я чем-нибудь помочь? Я ищу работу.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_01");	//А ты вообще что-нибудь знаешь о полевых работах?
		AI_Output(other,self,"DIA_Vino_SeekWork_15_02");	//А что там такого знать-то?
		AI_Output(self,other,"DIA_Vino_SeekWork_05_03");	//Ах! В таком случае... я думаю, мы и сами справимся, спасибо.
		AI_Output(self,other,"DIA_Vino_SeekWork_05_04");	//Но если ты хочешь работать на Лобарта в качестве поденного рабочего, я могу только предупредить тебя. Он платит людям вроде тебя сущие гроши!
		AI_Output(self,other,"DIA_Vino_SeekWork_05_08");	//Но ты не слышал этого от меня, понятно?
		if((Lobart_Kleidung_Verkauft == FALSE) && (Lobart_Kleidung_gestohlen == FALSE))
		{
			AI_Output(other,self,"DIA_Vino_SeekWork_15_05");	//Он предложил купить у него чистую одежду дешевле, если я буду помогать на ферме.
			AI_Output(self,other,"DIA_Vino_SeekWork_05_06");	//Хмм. У меня нет для тебя никакой работы, но ты можешь принести мне и парням что-нибудь выпить.
			AI_Output(self,other,"DIA_Vino_SeekWork_05_07");	//Принеси мне бутылку вина, и я скажу Лобарту, что ты очень помог нам. (смеется издевательски)
			MIS_Vino_Wein = LOG_Running;
			Log_CreateTopic(TOPIC_Vino,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Vino,LOG_Running);
			B_LogEntry(TOPIC_Vino,"Если я принесу Вино бутылку вина, он скажет Лобарту, что я помог ему.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_09");	//Я не думаю, что тебе это понравится. Человек твоего положения вряд ли захочет делать такую грязную работу, что я могу предложить.
	};
};


instance DIA_Vino_BringWine(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_BringWine_Condition;
	information = DIA_Vino_BringWine_Info;
	permanent = FALSE;
	description = "Вот твое вино.";
};


func int DIA_Vino_BringWine_Condition()
{
	if((MIS_Vino_Wein == LOG_Running) && (Kapitel < 3))
	{
		if(Npc_HasItems(other,ItFo_Wine) || Npc_HasItems(other,ItFo_DarkWine))
		{
			return TRUE;
		};
	};
};

func void DIA_Vino_BringWine_Info()
{
	AI_Output(other,self,"DIA_Vino_BringWine_15_00");	//Вот твое вино.
	MIS_Vino_Wein = LOG_SUCCESS;
	if(B_GiveInvItems(other,self,ItFo_Wine,1))
	{
		B_GivePlayerXP(XP_VinoWein);
	}
	else if(B_GiveInvItems(other,self,ItFo_DarkWine,1))
	{
		B_GivePlayerXP(XP_VinoWein * 2);
	};
	AI_Output(self,other,"DIA_Vino_BringWine_05_01");	//Я, пожалуй, не буду спрашивать, где ты взял его, хорошо? (смеется) Кого это волнует?
	if(!Npc_IsDead(Lobart))
	{
		AI_Output(self,other,"DIA_Vino_BringWine_05_02");	//Но все равно, спасибо.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Vino_BringWine_05_03");	//Лобарт услышит только хорошее о тебе.
		};
	};
};


instance DIA_Vino_ToTheCity(C_Info)
{
	npc = BAU_952_Vino;
	nr = 3;
	condition = DIA_Vino_ToTheCity_Condition;
	information = DIA_Vino_ToTheCity_Info;
	permanent = FALSE;
	description = "Я направляюсь в город.";
};


func int DIA_Vino_ToTheCity_Condition()
{
	if(PlayerEnteredCity == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vino_ToTheCity_Info()
{
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_00");	//Я направляюсь в город.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//И?
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_02");	//Ты можешь рассказать о городе что-нибудь интересное?
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_03");	//Нет. Но Малет частенько ходит в город. Возможно, он что-нибудь знает... ну, что-нибудь, что может заинтересовать тебя.
};


var int Vino_Gossip_Orks;
var int Vino_Gossip_Bugs;

instance DIA_Vino_PERM(C_Info)
{
	npc = BAU_952_Vino;
	nr = 10;
	condition = DIA_Vino_PERM_Condition;
	information = DIA_Vino_PERM_Info;
	permanent = TRUE;
	description = "Есть какие-нибудь интересные новости?";
};


func int DIA_Vino_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Vino_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM_15_00");	//Есть какие-нибудь интересные новости?
	if((Vino_Gossip_Orks == FALSE) && (CityOrc_Killed_Day >= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_01");	//Я могу поклясться, что видел орка вон там, на краю леса, два дня назад.
		AI_Output(self,other,"DIA_Vino_PERM_05_02");	//С тех пор я сплю хотя бы с одним открытым глазом.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
	}
	else if((Vino_Gossip_Bugs == FALSE) && (MIS_AndreHelpLobart == LOG_Running))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_03");	//Эти огромные отвратительные насекомые уже всех достали. Они повсюду. Они сожрут все, что мы вырастили, если мы не сделаем что-нибудь.
		AI_Output(self,other,"DIA_Vino_PERM_05_04");	//Несколько дней назад я лежал в траве, размышляя о своем, и собирался вздремнуть, когда одна из этих тварей сожрала мой ботинок!
		AI_Output(self,other,"DIA_Vino_PERM_05_05");	//Ты бы видел, как я улепетывал. С тех пор я не могу спать спокойно.
		Vino_Gossip_Bugs = TRUE;
	}
	else if((FoundVinosKellerei == TRUE) && (Vino_Complain == FALSE) && (hero.guild != GIL_MIL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//К сожалению, ополчение нашло мой винокуренный заводик. Надеюсь, что они хотя бы меня не поймают.
		B_GivePlayerXP(150);
		Vino_Complain = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_06");	//Кроме того, что я уже сказал тебе? Нет.
	};
};


instance DIA_Vino_DMTAMSTART(C_Info)
{
	npc = BAU_952_Vino;
	nr = 31;
	condition = DIA_Vino_DMTAMSTART_Condition;
	information = DIA_Vino_DMTAMSTART_Info;
	permanent = TRUE;
	description = "А как у тебя дела?";
};


func int DIA_Vino_DMTAMSTART_Condition()
{
	if((Kapitel == 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};


func void DIA_Vino_DMTAMSTART_Info()
{
	AI_Output(other,self,"DIA_Vino_DMTAMSTART_15_00");	//А как у тебя дела?
	if((FoundVinosKellerei == TRUE) && (Vino_Complain == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_01");	//Дерьмово. Ополчение нашло мой тайный винокуренный заводик.
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_02");	//Остается надеяться, что они никогда не узнают, что он принадлежал мне.
		B_GivePlayerXP(150);
		Vino_Complain = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_03");	//Эти ублюдки в черных рясах повсюду. Кто-нибудь должен засунуть их капюшоны им в глотку.
	};
};


instance DIA_Vino_Obesessed(C_Info)
{
	npc = BAU_952_Vino;
	nr = 32;
	condition = DIA_Vino_Obesessed_Condition;
	information = DIA_Vino_Obesessed_Info;
	permanent = TRUE;
	description = "Что с тобой?";
};


func int DIA_Vino_Obesessed_Condition()
{
	if((NpcObsessedByDMT_Vino == FALSE) && (Kapitel >= 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Vino_Obesessed_Info()
{
	AI_Output(other,self,"DIA_Vino_Obesessed_15_00");	//Что с тобой?
	if(C_VinoDementorsDead())
	{
		self.aivar[AIV_NoFightParker] = FALSE;
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_Obesessed_05_01");	//(рычит) Черт, убей их. Иначе они убьют меня.
		AI_EquipBestMeleeWeapon(self);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RunFromRitual");
		if(!Npc_IsDead(DMT_Vino1))
		{
			DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino2))
		{
			DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino3))
		{
			DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino4))
		{
			DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
			DMT_Vino4.start_aistate = ZS_Stand_Dementor;
		};
	};
};


instance DIA_Vino_Heilung(C_Info)
{
	npc = BAU_952_Vino;
	nr = 55;
	condition = DIA_Vino_Heilung_Condition;
	information = DIA_Vino_Heilung_Info;
	permanent = TRUE;
	description = "Ты сам не свой.";
};


func int DIA_Vino_Heilung_Condition()
{
	if((NpcObsessedByDMT_Vino == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") >= 4000))
	{
		return TRUE;
	};
};


var int DIA_Vino_Heilung_oneTime;

func void DIA_Vino_Heilung_Info()
{
	AI_Output(other,self,"DIA_Vino_Heilung_15_00");	//Ты сам не свой.
	AI_Output(self,other,"DIA_Vino_Heilung_05_01");	//Моя голова... я не могу больше выносить это.
	if(DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Vino_Heilung_15_02");	//Ты должен сходить в монастырь. Пирокар, высший маг Огня, сможет помочь тебе.
		AI_Output(self,other,"DIA_Vino_Heilung_05_03");	//Ты думаешь? Хорошо. Я попытаюсь.
		if(MIS_DementorsOrigins == FALSE)
		{
			Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
			MIS_DementorsOrigins = LOG_Running;
		};
		B_LogEntry(TOPIC_DEMENTOREN,"Вино одержим. Я отправил его в монастырь на лечение. Надеюсь, он сможет добраться туда живым.");
		B_NpcClearObsessionByDMT(self);
		B_StartOtherRoutine(Vino,"Kloster");
		B_GivePlayerXP(XP_VinoFreeFromDMT);
		DIA_Vino_Heilung_oneTime = TRUE;
	};
};


instance DIA_Vino_PERM4OBSESSED(C_Info)
{
	npc = BAU_952_Vino;
	nr = 41;
	condition = DIA_Vino_PERM4OBSESSED_Condition;
	information = DIA_Vino_PERM4OBSESSED_Info;
	permanent = TRUE;
	description = "Как ты?";
};


func int DIA_Vino_PERM4OBSESSED_Condition()
{
	if((hero.guild == GIL_KDF) && (NpcObsessedByDMT_Vino == TRUE) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};


var int DIA_Vino_PERM4OBSESSED_XP_oneTime;

func void DIA_Vino_PERM4OBSESSED_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//Как ты?
	AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_01");	//Да, да, все уже хорошо. Я думаю, парни смогут помочь мне. Но я все еще чувствую себя довольно паршиво.
	if(DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_02");	//Но должен признать, их вино - лучшее из того, что я пробовал.
		B_GivePlayerXP(XP_Ambient);
		DIA_Vino_PERM4OBSESSED_XP_oneTime = TRUE;
	};
};


instance DIA_Vino_PERM45UND6(C_Info)
{
	npc = BAU_952_Vino;
	nr = 42;
	condition = DIA_Vino_PERM45UND6_Condition;
	information = DIA_Vino_PERM45UND6_Info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int DIA_Vino_PERM45UND6_Condition()
{
	if((Kapitel >= 4) && (hero.guild != GIL_KDF) && (NpcObsessedByDMT_Vino == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM45UND6_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM45UND6_15_00");	//Есть новости?
	if((FoundVinosKellerei == TRUE) && (Vino_Complain == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//К сожалению, ополчение нашло мой винокуренный заводик. Надеюсь, что они хотя бы меня не поймают.
		B_GivePlayerXP(150);
		Vino_Complain = TRUE;
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_01");	//Здесь все просто кишит орками.
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_02");	//Вы, паладины, ведь прикончите их, да?
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_03");	//Боюсь, что скоро нам придется покинуть нашу ферму и присоединиться к наемникам на ферме Онара.
	};
};

