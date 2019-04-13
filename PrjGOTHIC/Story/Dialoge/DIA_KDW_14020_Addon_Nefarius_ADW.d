
instance DIA_Addon_Nefarius_ADW_EXIT(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 999;
	condition = DIA_Addon_Nefarius_ADW_EXIT_Condition;
	information = DIA_Addon_Nefarius_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_ADWHello(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_ADWHello_Condition;
	information = DIA_Addon_Nefarius_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_00");	//Я очень рад, что ты появился здесь целым и невредимым.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_01");	//Как получилось, что вы появились здесь раньше меня?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_02");	//Мы путешествовали через загадочные измерения. Кто знает, какой путь достался тебе...
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_03");	//Использовать портал безопасно?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_04");	//Мы сразу же попали сюда. Очевидно, портал работает исправно.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_05");	//Конечно! Если что-нибудь пойдет не так, я обязательно тебе сообщу.
};


instance DIA_Addon_Nefarius_Neues(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Neues_Condition;
	information = DIA_Addon_Nefarius_Neues_Info;
	description = "Чем вы здесь занимаетесь?";
};


func int DIA_Addon_Nefarius_Neues_Condition()
{
	if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Neues_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_15_00");	//Чем вы здесь занимаетесь?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_01");	//Я изучаю историю зодчих и пытаюсь выяснить, почему они закрыли портал.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_02");	//Похоже, что они хотели скрыть затонувший город от всего остального мира.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_03");	//В прошлом здесь случилось что-то ужасное. Ими овладела какая-то злая сила.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_04");	//Если верить записям, разразилась яростная гражданская война, вскоре за которой последовало разрушение города.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_05");	//На объятые пламенем улицы обрушилась вода потопа, принесшего гибель зодчим.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_06");	//Те немногие, кто пережил этот ад, решили скрыть эту часть острова, чтобы воспрепятствовать распространению хаоса.
	Info_ClearChoices(DIA_Addon_Nefarius_Neues);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Как ты думаешь, что мы найдем здесь?",DIA_Addon_Nefarius_Neues_find);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"А мы, глупцы, вновь открыли портал...",DIA_Addon_Nefarius_Neues_auf);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Но в чем провинились зодчие?",DIA_Addon_Nefarius_Neues_was);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Ты сказал, что здесь был потоп?",DIA_Addon_Nefarius_Neues_flut);
};

func void DIA_Addon_Nefarius_Neues_find()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_find_15_00");	//Как ты думаешь, что мы найдем здесь?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_01");	//Пока у меня есть только смутные догадки. Ты должен поговорить с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_02");	//У него есть какие-то определенные мысли на этот счет.
	Log_CreateTopic(TOPIC_Addon_Flut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut,LOG_Running);
	B_LogEntry(TOPIC_Addon_Flut,"Нефариус сказал, что я должен поговорить с Сатурасом о затонувшем городе.");
	NefariusADW_Talk2Saturas = TRUE;
};

func void DIA_Addon_Nefarius_Neues_flut()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_flut_15_00");	//Ты сказал, что здесь был потоп?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_01");	//Сам Аданос явился зодчим, чтобы остановить безумие.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_02");	//Он сравнял город с землей.
};

func void DIA_Addon_Nefarius_Neues_was()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_was_15_00");	//Но в чем провинились зодчие?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_01");	//Один из них посвятил себя злу. Это был великий полководец по имени Куарходрон.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_02");	//Именно он открыл злу путь в город.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_03");	//Его последователи сходили с ума и начинали сражаться с обычными людьми.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_04");	//Последовавшие бедствия стали причиной гибели цивилизации.
};

func void DIA_Addon_Nefarius_Neues_auf()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_auf_15_00");	//А мы, глупцы, вновь открыли портал...
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_01");	//Поверь, я этому тоже совсем не рад.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_02");	//Но был ли у нас выбор?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_03");	//Если мы не остановим то, что сейчас здесь происходит, весь Хоринис постигнет судьба этого древнего города.
};


instance DIA_Addon_Nefarius_PermADW(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 10;
	condition = DIA_Addon_Nefarius_PermADW_Condition;
	information = DIA_Addon_Nefarius_PermADW_Info;
	permanent = TRUE;
	description = "Путешествовать через портал безопасно?";
};


func int DIA_Addon_Nefarius_PermADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_PermADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PermADW_15_00");	//Путешествовать через портал безопасно?
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_01");	//Пока все указывает на это.
};


instance DIA_Addon_Nefarius_PreTeach(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarius_PreTeach_Condition;
	information = DIA_Addon_Nefarius_PreTeach_Info;
	description = "Ты можешь поделиться со мной своим знанием магии?";
};


func int DIA_Addon_Nefarius_PreTeach_Condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PreTeach_15_00");	//Ты можешь поделиться со мной своим знанием магии?
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_01");	//Я могу научить тебя делать магические руны, а Кронос продаст тебе их формулы.
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_02");	//У него всегда с собой его книги рун.
	Nefarius_Addon_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_NefariusTeach);
};


instance DIA_Addon_Nefarius_ADW_Runen(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarius_ADW_Runen_Condition;
	information = DIA_Addon_Nefarius_ADW_Runen_Info;
	permanent = TRUE;
	description = "Обучи меня (созданию рун)";
};


func int DIA_Addon_Nefarius_ADW_Runen_Condition()
{
	if(Nefarius_Addon_TeachRunes == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Info()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"6-й круг магии",DIA_Addon_Nefarius_ADW_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"5-й круг магии",DIA_Addon_Nefarius_ADW_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"4-й круг магии",DIA_Addon_Nefarius_ADW_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"3-й круг магии",DIA_Addon_Nefarius_ADW_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"2-й круг магии",DIA_Addon_Nefarius_ADW_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"1-й круг магии",DIA_Addon_Nefarius_ADW_Runen_1);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
};

func void DIA_Addon_Nefarius_ADW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Zap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Zap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Zap)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Firebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firebolt)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_LIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonWolf,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonWolf)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST);
	};
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_MediumHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MediumHeal)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall);
	};
	if(PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonGolem,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGolem)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_DestroyUndead,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_DestroyUndead)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_FullHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FullHeal)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal);
	};
	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BreathOfDeath)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Whirlwind);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonWolf);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Sleep);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MediumHeal);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Fear);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGolem);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self,other,SPL_DestroyUndead);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FullHeal);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BreathOfDeath);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};

