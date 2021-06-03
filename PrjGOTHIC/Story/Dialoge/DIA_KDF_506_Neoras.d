
instance DIA_Neoras_Kap1_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap1_EXIT_Condition;
	information = DIA_Neoras_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_Hallo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_Neoras_Hallo_Condition;
	information = DIA_Neoras_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Neoras_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Neoras_Hallo_Info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_ALCHEMY_01") <= 500)
	{
		AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//Что... что-то случилось? Зачем ты беспокоишь меня? Разве ты не видишь - я провожу очень сложный эксперимент?
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Hallo_01_00_add");	//Что... что-то случилось? Зачем ты беспокоишь меня?
	};
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//Я не хотел побеспокоить тебя.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//Ты уже побеспокоил. (вздыхает) Ладно, говори, чего ты хочешь?
};


instance DIA_Neoras_Arbeit(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 5;
	condition = DIA_Neoras_Arbeit_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};


func int DIA_Neoras_Arbeit_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//У тебя есть работа для меня?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//Да, мне нужны травы для моих экспериментов. Мы сами выращиваем их, но у нас совсем закончилась огненная крапива.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//Семи цветков будет достаточно. Принеси мне их - ох, да - я еще потерял рецепт магических зелий.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//Если ты найдешь его, я буду очень благодарен.
	MIS_NeorasPflanzen = LOG_Running;
	MIS_NeorasRezept = LOG_Running;
	Log_CreateTopic(Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus(Topic_NeorasPflanzen,LOG_Running);
	B_LogEntries(Topic_NeorasPflanzen,"Я должен принести семь кустов огненной крапивы мастеру Неорасу, алхимику.");
	Log_CreateTopic(Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_Neorasrezept,LOG_Running);
	B_LogNextEntry(Topic_Neorasrezept,"Мастеру Неорасу не хватает рецепта для приготовления зелий маны.");
	if(Npc_KnowsInfo(other,DIA_Opolos_beibringen))
	{
		Log_AddEntry(Topic_Neorasrezept,"Это, должно быть, рецепт, на который так хочет взглянуть Ополос.");
	};
};


instance DIA_Neoras_Rezept(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 6;
	condition = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent = TRUE;
	description = "Насчет рецепта...";
};


func int DIA_Neoras_Rezept_Condition()
{
	if(MIS_NeorasRezept == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Rezept_Info()
{
	DIA_Common_AboutThatRecipe();
	if(B_GiveInvItems(other,self,ItWr_ManaRezept,1))
	{
		DIA_Common_IFoundHim();
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//Хорошо. Я боялся, что он потерян для меня навсегда.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//Вот, возьми в знак моей благодарности это магическое зелье.
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasRezept);
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//Я еще не нашел его.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//Ну, я все же надеюсь, что тебе удастся его найти.
	};
};


instance DIA_Neoras_Flieder(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 7;
	condition = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Flieder_Info;
	permanent = TRUE;
	description = "Я принес тебе огненную крапиву.";
};


func int DIA_Neoras_Flieder_Condition()
{
	if(MIS_NeorasPflanzen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Flieder_Info()
{
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//Я принес тебе огненную крапиву.
	if(B_GiveInvItems(other,self,ItPl_Mana_Herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//Превосходно, теперь я могу работать. Возьми этот свиток с заклинанием 'Кулак ветра', надеюсь, он тебе пригодится.
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasPflanzen);
		B_GiveInvItems(self,other,ItSc_Windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//Ох, действительно? Но ты принес недостаточно. Мне нужно СЕМЬ экземпляров.
	};
};


instance DIA_Neoras_TEACH(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 10;
	condition = DIA_Neoras_TEACH_Condition;
	information = DIA_Neoras_TEACH_Info;
	permanent = TRUE;
	description = "Могу я чему-нибудь научиться у тебя?";
};


func int DIA_Neoras_TEACH_Condition()
{
	return TRUE;
};

func void DIA_Neoras_TEACH_Info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//Могу я чему-нибудь научиться у тебя?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//Я могу обучить тебя секретам алхимии.
		if(Neoras_TeachAlchemy == FALSE)
		{
			Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
			B_LogEntry(Topic_KlosterTeacher,"Неорас может обучить меня варить зелья.");
			Neoras_TeachAlchemy = TRUE;
		};
		Info_ClearChoices(DIA_Neoras_TEACH);
		Info_AddChoice(DIA_Neoras_TEACH,Dialog_Back,DIA_Neoras_TEACH_BACK);
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Neoras_TEACH_HEALTH_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Neoras_TEACH_Health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_HP_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Neoras_TEACH_Health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_HPMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Neoras_TEACH_Perm_Health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Neoras_TEACH_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Neoras_TEACH_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_Mana_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Neoras_TEACH_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Neoras_TEACH_Perm_Mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//Я не обучаю новичков. Если однажды ты будешь принят в Круг Огня,
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//тогда я покажу тебе, как создавать сильные зелья.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//Я передаю свои знания только членам нашей церкви.
	};
};

func void DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Neoras_TEACH);
};

func void DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Neoras_TEACH_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void DIA_Neoras_TEACH_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Neoras_TEACH_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Neoras_TEACH_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void B_Neoras_Price()
{
	AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//За само приготовление я беру 10 золотых монет.
};

instance DIA_Neoras_BrewPotion(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewPotion_Condition;
	information = DIA_Neoras_BrewPotion_Info;
	permanent = TRUE;
	description = "Не мог бы ты сварить мне зелье?";
};


func int DIA_Neoras_BrewPotion_Condition()
{
	if(NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewPotion_Info()
{
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//Не мог бы ты сварить мне зелье?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//Для новичка ты слишком нетерпелив. Иди, занимайся своими обязанностями.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//Ты можешь купить все, что тебе нужно, у Горакса.
		if(Gorax_Trade == FALSE)
		{
			Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
			B_LogEntry(Topic_KlosterTrader,"Мастер Горакс в монастыре может предоставить мне все, что мне нужно.");
			Gorax_Trade = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//Ты сомневаешься в моих способностях? Я могу сварить любое зелье.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//Отлично.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//Не так быстро. Сначала ты должен принести мне необходимые ингредиенты и внести скромную плату за мои труды, а также за материалы.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//Сколько ты просишь?
		B_Neoras_Price();
		NeorasBrewsForYou = TRUE;
	};
};


instance DIA_Neoras_BrewForMe(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent = TRUE;
	description = "Свари мне...";
};


func int DIA_Neoras_BrewForMe_Condition()
{
	if(NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"... зелье скорости.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"... экстракт маны.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"... лечебный экстракт.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Back()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
};

var int Neoras_Ingrediences_Advice;

func void B_Neoras_BuildBrewDialog()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Свари мне зелье скорости.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Свари мне экстракт маны.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"Свари мне лечебный экстракт.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//Свари мне зелье скорости.
	if(Npc_HasItems(other,ItPl_Speed_Herb_01) && Npc_HasItems(other,ItPl_Temp_Herb) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//Хорошо, у тебя есть необходимые ингредиенты и золото?
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//Да, вот, держи.
		Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		AI_PrintScreen("Снеппер-трава отдано",-1,31,FONT_ScreenSmall,2);
		AI_PrintScreen("Луговой горец отдано",-1,28,FONT_ScreenSmall,2);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//Хорошо, спасибо. Сейчас я дам тебе зелье, тебе не придется ждать долго.
		B_GiveInvItems(self,other,ItPo_Speed,1);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		B_Neoras_Price();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//У тебя нет необходимых ингредиентов. Возвращайся, когда соберешь их.
		if(Neoras_Ingrediences_Advice == FALSE)
		{
			AI_Output(other,self,"DIA_Neoras_INGREDIENCES_Speed_15_00");	//Какие ингредиенты нужны для зелья ускорения?
			DIA_Common_14_GoReadAboutIt();
			Neoras_Ingrediences_Advice = TRUE;
		};
	};
	B_Neoras_BuildBrewDialog();
};

func void DIA_Neoras_BrewForMe_Mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//Свари мне экстракт маны.
	if((Npc_HasItems(other,ItPl_Mana_Herb_02) >= 2) && Npc_HasItems(other,ItPl_Temp_Herb) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//Хорошо, у тебя есть необходимые ингредиенты и золото?
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//Да, вот, держи.
		Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		AI_PrintScreen("2 предметов отдано (Огненная трава)",-1,31,FONT_ScreenSmall,2);
		AI_PrintScreen("Луговой горец отдано",-1,28,FONT_ScreenSmall,2);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//Хорошо. Сейчас я дам тебе зелье, тебе не придется ждать долго.
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		B_Neoras_Price();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//У тебя нет необходимых ингредиентов. Возвращайся, когда соберешь их.
		if(Neoras_Ingrediences_Advice == FALSE)
		{
			AI_Output(other,self,"DIA_Neoras_INGREDIENCES_Mana_15_00");	//Какие ингредиенты нужны для экстракта маны?
			DIA_Common_14_GoReadAboutIt();
			Neoras_Ingrediences_Advice = TRUE;
		};
	};
	B_Neoras_BuildBrewDialog();
};

func void DIA_Neoras_BrewForMe_Health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//Свари мне лечебный экстракт.
	if((Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && Npc_HasItems(other,ItPl_Temp_Herb) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//Хорошо, у тебя есть необходимые ингредиенты и золото?
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//Да, вот, держи.
		Npc_RemoveInvItems(other,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		AI_PrintScreen("2 предметов отдано (Лечебное растение)",-1,31,FONT_ScreenSmall,2);
		AI_PrintScreen("Луговой горец отдано",-1,28,FONT_ScreenSmall,2);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//Хорошо. Сейчас я дам тебе зелье, тебе не придется ждать долго.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		B_Neoras_Price();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//У тебя нет необходимых ингредиентов. Возвращайся, когда соберешь их.
		if(Neoras_Ingrediences_Advice == FALSE)
		{
			DIA_Common_SureWhatsNeeded();
			DIA_Common_14_GoReadAboutIt();
			Neoras_Ingrediences_Advice = TRUE;
		};
	};
	B_Neoras_BuildBrewDialog();
};


instance DIA_Neoras_DRACHENEIER(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 40;
	condition = DIA_Neoras_DRACHENEIER_Condition;
	information = DIA_Neoras_DRACHENEIER_Info;
	permanent = TRUE;
	description = "Ты так усердно работаешь, что даже вспотел.";
};


func int DIA_Neoras_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_Neoras_DragonEgg == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_ALCHEMY_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//Ты так усердно работаешь, что даже вспотел.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//Да, я полностью истощен. Уже несколько дней я пытаюсь приготовить это чертово зелье. И ничего не получается.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Меня эта проблема не касается.",DIA_Neoras_DRACHENEIER_no);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"А что это должно быть за зелье?",DIA_Neoras_DRACHENEIER_trank);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"А в чем проблема?",DIA_Neoras_DRACHENEIER_ei);
};

func void DIA_Neoras_DRACHENEIER_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//А в чем проблема?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//В рецепте говорится что-то о яйце дракона. Конечно же, у меня его нет.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//Поэтому я пытался заменить этот ингредиент. Однако пока все тщетно.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//Если однажды, в какой-нибудь пещере, ты наткнешься на одну из таких штук, пожалуйста, не забудь обо мне.
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"А что ты используешь вместо драконьего яйца?",DIA_Neoras_DRACHENEIER_ei_statt);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"Я попробую что-нибудь сделать.",DIA_Neoras_DRACHENEIER_ei_jep);
};

func void DIA_Neoras_DRACHENEIER_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//Я попробую что-нибудь сделать.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//Эй. Я просто пошутил. Я не верю, что тебе действительно удастся найти яйцо дракона.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//Давай лучше подождем.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Log_CreateTopic(TOPIC_DRACHENEIERNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras,LOG_Running);
	B_LogEntry(TOPIC_DRACHENEIERNeoras,"Неорасу для экспериментов нужно драконье яйцо. Он думает, что, возможно я смогу найти его в какой-нибудь пещере.");
	MIS_Neoras_DragonEgg = LOG_Running;
};

func void DIA_Neoras_DRACHENEIER_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//А что ты используешь вместо драконьего яйца?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//Поверь мне, тебе лучше не знать.
};

func void DIA_Neoras_DRACHENEIER_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//А что это должно быть за зелье?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//Я купил этот рецепт у странствующего торговца. В нем говорится о довольно странных, но очень интересных вещах.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//Я не уверен, делает ли это зелье вообще что-нибудь, но жажда знаний заставляет меня продолжать этот эксперимент.
};

func void DIA_Neoras_DRACHENEIER_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//Меня эта проблема не касается.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//Тогда, пожалуйста, не беспокой меня больше.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
};


instance DIA_Neoras_FOUNDDRAGONEGG(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information = DIA_Neoras_FOUNDDRAGONEGG_Info;
	description = "Вот, я нашел для тебя яйцо дракона.";
};


func int DIA_Neoras_FOUNDDRAGONEGG_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (MIS_Neoras_DragonEgg == LOG_Running))
	{
		return TRUE;
	};
};


var int Neoras_DragonEggDrink_Day;

func void DIA_Neoras_FOUNDDRAGONEGG_Info()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//Вот, я нашел для тебя яйцо дракона.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//Ты что, издеваешься надо мной?
//	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	AI_PrintScreen("Драконье яйцо отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItem(other,ItAt_DragonEgg_MIS);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//Оно настоящее! Я даже не думал, что это возможно. Где ты нашел его?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//Тебе этого лучше не знать.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//Превосходно. Что ты хочешь за него?
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP(XP_Neoras_DragonEgg);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Даже не знаю.",DIA_Neoras_FOUNDDRAGONEGG_irgendwas);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Как насчет нескольких лечебных зелий?",DIA_Neoras_FOUNDDRAGONEGG_heil);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"Дай мне немного этого зелья, когда оно будет готово.",DIA_Neoras_FOUNDDRAGONEGG_trank);
};


func void B_Neoras_Later()
{
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//Зайди попозже, когда я закончу его.
};

var int Neoras_SCWantsDragonEggDrink;

func void DIA_Neoras_FOUNDDRAGONEGG_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//Дай мне немного этого зелья, когда оно будет готово.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//Хорошо. Но, как я уже сказал, я понятия не имею, как оно действует.
	B_Neoras_Later();
	Neoras_DragonEggDrink_Day = Wld_GetDay();
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//Как насчет нескольких лечебных зелий?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//Хороший выбор. Вот, держи. Надеюсь, они тебе пригодятся.
	CreateInvItems(self,ItPo_Health_Addon_04,5);
	B_GiveInvItems(self,other,ItPo_Health_Addon_04,5);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//Даже не знаю.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//Ммм. Хорошо. Тогда возьми это магическое кольцо. Я уверен, оно поможет тебе в сражении с твоими врагами.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//Оно защитит тебя от атак магических созданий.
	CreateInvItems(self,ItRi_Prot_Mage_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Mage_02,1);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};


instance DIA_Neoras_DRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_DRAGONEGGDRINK_Condition;
	information = DIA_Neoras_DRAGONEGGDRINK_Info;
	description = "Я пришел получить это загадочное зелье из яйца дракона.";
	permanent = TRUE;
};


func int DIA_Neoras_DRAGONEGGDRINK_Condition()
{
	if((Neoras_SCWantsDragonEggDrink == TRUE) && (Neoras_DragonEggDrinkGiven == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info()
{
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//Я пришел получить это загадочное зелье из яйца дракона.
	if(Neoras_DragonEggDrink_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//Да. Я только что закончил его. Я еще не испытывал его и не несу никакой ответственности за его действие. Ты слышишь?
		AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//Давай его сюда.
		AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//Хорошо. Надеюсь, это пойло не заставит твою голову взорваться.
		CreateInvItems(self,ItPo_DragonEggDrinkNeoras_MIS,1);
		B_GiveInvItems(self,other,ItPo_DragonEggDrinkNeoras_MIS,1);
		Neoras_DragonEggDrinkGiven = TRUE;
	}
	else
	{
		B_Neoras_Later();
		AI_StopProcessInfos(self);
	};
};


instance DIA_Neoras_USEDDRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information = DIA_Neoras_USEDDRAGONEGGDRINK_Info;
	description = "Я попробовал твое зелье из яйца дракона. Отличная штука!";
};


func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition()
{
	if(Neoras_SCUsedDragonEggDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info()
{
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//Я попробовал твое зелье из яйца дракона. Отличная штука!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//Ммм. Очень интересно. Я должен продолжать свои исследования.
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//Ты не мог бы сделать мне еще?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//Будет лучше, если мы повторим это через несколько недель. Иначе, боюсь, у тебя могут вырасти рога.
};


instance DIA_Neoras_PICKPOCKET(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 900;
	condition = DIA_Neoras_PICKPOCKET_Condition;
	information = DIA_Neoras_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Neoras_PICKPOCKET_Condition()
{
	return C_Beklauen(72,140);
};

func void DIA_Neoras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,Dialog_Back,DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

