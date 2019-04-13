
instance DIA_Addon_Riordian_EXIT(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 999;
	condition = DIA_Addon_Riordian_EXIT_Condition;
	information = DIA_Addon_Riordian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_Hallo(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_Hallo_Condition;
	information = DIA_Addon_Riordian_Hallo_Info;
	description = "Чем ты занимаешься?";
};


func int DIA_Addon_Riordian_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Hallo_15_00");	//Чем ты занимаешься?
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_01");	//Я изучаю культуру древнего народа.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_02");	//Судя по их записям, они жили здесь в далеком прошлом.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_03");	//Я точно не знаю, когда именно они возвели эти залы, но уже в то время их цивилизация была достаточно высокоразвитой.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_04");	//На другой стороне гор они построили свой город и, по-видимому, воздвигли храм Аданоса.
};


instance DIA_Addon_Riordian_Alter(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 6;
	condition = DIA_Addon_Riordian_Alter_Condition;
	information = DIA_Addon_Riordian_Alter_Info;
	description = "Как ты думаешь, сколько лет этому зданию?";
};


func int DIA_Addon_Riordian_Alter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Alter_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Alter_15_00");	//Как ты думаешь, сколько лет этому зданию?
	AI_Output(self,other,"DIA_Addon_Riordian_Alter_10_01");	//Не могу сказать точно. Несколько сотен.
};


instance DIA_Addon_Riordian_Atlantis(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 4;
	condition = DIA_Addon_Riordian_Atlantis_Condition;
	information = DIA_Addon_Riordian_Atlantis_Info;
	description = "Затерянный город на Хоринисе?";
};


func int DIA_Addon_Riordian_Atlantis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Atlantis_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Atlantis_15_00");	//Затерянный город на Хоринисе?
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_01");	//Да. До последнего времени мы были уверены, что знаем об острове все.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_02");	//Мы считали, что весь северо-восток острова - один большой горный массив.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_03");	//Но мы ошибались.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_04");	//За этими горами лежит долина. Там и располагается этот древний город.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_05");	//(вздыхает) Я бы очень хотел взглянуть на его старинные здания, но они наверняка давно рассыпались в прах...
	B_LogEntry(TOPIC_Addon_KDW,"Маги Воды считают, что за порталом находится древний затерянный город.");
};


instance DIA_Addon_Riordian_SaturasWantYou(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_SaturasWantYou_Condition;
	information = DIA_Addon_Riordian_SaturasWantYou_Info;
	description = "Сатурас хочет тебя видеть.";
};


func int DIA_Addon_Riordian_SaturasWantYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo) && (MIS_Addon_Saturas_BringRiordian2Me == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SaturasWantYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SaturasWantYou_15_00");	//Сатурас хочет тебя видеть.
	AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_01");	//Ему удалось добиться прогресса в исследованиях? В таком случае я отправляюсь к нему немедленно.
	if(Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_02");	//Если ты хочешь узнать об этих строениях больше, поговори с Нефариусом.
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_03");	//Ты найдешь его в дальней части залов.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Saturas");
	MIS_Addon_Saturas_BringRiordian2Me = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


var int Riordian_PermNews;

instance DIA_Addon_Riordian_Perm(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 99;
	condition = DIA_Addon_Riordian_Perm_Condition;
	information = DIA_Addon_Riordian_Perm_Info;
	permanent = TRUE;
	description = "Есть что-нибудь новое?";
};


func int DIA_Addon_Riordian_Perm_Condition()
{
	if(MIS_Addon_Saturas_BringRiordian2Me == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Perm_15_00");	//Есть что-нибудь новое?
	if(Riordian_PermNews == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_01");	//Да! Я нашел подтверждение, что эта древняя цивилизация действительно поклонялась Аданосу!
		Riordian_PermNews = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_02");	//Нет, пока нет. Приходи позже.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_TeachPre(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 5;
	condition = DIA_Addon_Riordian_TeachPre_Condition;
	information = DIA_Addon_Riordian_TeachPre_Info;
	description = "Ватрас дал мне этот амулет ищущего огонька...";
};


func int DIA_Addon_Riordian_TeachPre_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Hallo) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_TeachPre_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Ватрас дал мне этот амулет ищущего огонька...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ага! (заинтересованно) Это редкий артефакт... Ты знаешь, что ты можешь обучать своего огонька?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//Ты можешь научить меня этому?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Да, конечно. Я долгое время занимался этой областью магии.
	Riordian_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
};


instance DIA_Addon_Riordian_Teach(C_Info)
{
	npc = KDW_1404_Addon_Riordian_NW;
	nr = 90;
	condition = DIA_Addon_Riordian_Teach_Condition;
	information = DIA_Addon_Riordian_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как тренировать моего блуждающего огонька.";
};


var int DIA_Addon_Riordian_Teach_NoPerm;

func int DIA_Addon_Riordian_Teach_Condition()
{
	if((Riordian_Addon_TeachPlayer == TRUE) && (DIA_Addon_Riordian_Teach_NoPerm == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Teach_Info()
{
	/*B_DIA_Addon_Riordian_Teach_15_00();
	if(WISPSKILL_LEVEL < 3)
	{
		Info_ClearChoices(DIA_Addon_Riordian_Teach);
		Info_AddChoice(DIA_Addon_Riordian_Teach,Dialog_Back,DIA_Addon_Riordian_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();
		if(WISPSKILL_LEVEL == 1)
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,"",DIA_Addon_Riordian_Teach_WISPSKILL_FF);
		}
		else if(WISPSKILL_LEVEL == 2)
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,"",DIA_Addon_Riordian_Teach_WISPSKILL_FF);
		}
		else
		{
			
		
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_Addon_Riordian_Teach_NoPerm = TRUE;
	};*/
	B_DIA_Addon_Riordian_Teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Riordian_Teach);
		Info_AddChoice(DIA_Addon_Riordian_Teach,Dialog_Back,DIA_Addon_Riordian_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FF,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),DIA_Addon_Riordian_Teach_WISPSKILL_FF);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),DIA_Addon_Riordian_Teach_WISPSKILL_NONE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),DIA_Addon_Riordian_Teach_WISPSKILL_RUNE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),DIA_Addon_Riordian_Teach_WISPSKILL_MAGIC);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),DIA_Addon_Riordian_Teach_WISPSKILL_FOOD);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),DIA_Addon_Riordian_Teach_WISPSKILL_POTIONS);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_Addon_Riordian_Teach_NoPerm = TRUE;
	};
	
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_X()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void DIA_Addon_Riordian_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_FF()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_NONE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_RUNE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_MAGIC()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_FOOD()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FOOD))
	{
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_POTIONS()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_POTIONS))
	{
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

