
instance DIA_Ingmar_EXIT(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_Hallo(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 2;
	condition = DIA_Ingmar_Hallo_Condition;
	information = DIA_Ingmar_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ingmar_Hallo_permanent;

func int DIA_Ingmar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ingmar_Hallo_permanent == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Hallo_Info()
{
	if(MIS_OLDWORLD == FALSE)
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//Я думал, ты пришел поговорить с лордом Хагеном. Так иди же к нему.
	}
	else if(MIS_OLDWORLD == LOG_Running)
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//Согласно полученным мной сообщениям, Долина Рудников - опасное место.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Позаботься о своем снаряжении, прежде чем отправляться туда.
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//Обстановка в Долине Рудников очень тревожит меня. Но мы разработаем план, чтобы преодолеть все опасности и вытащить наших парней оттуда вместе с рудой.
		DIA_Ingmar_Hallo_permanent = TRUE;
	};
};


instance DIA_Ingmar_Krieg(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 99;
	condition = DIA_Ingmar_Krieg_Condition;
	information = DIA_Ingmar_Krieg_Info;
	permanent = FALSE;
	description = "Как дела на материке?";
};


func int DIA_Ingmar_Krieg_Condition()
{
	return TRUE;
};

func void DIA_Ingmar_Krieg_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//Как дела на материке?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//Война еще не выиграна, хотя королевские войска уже теснят орков.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//Но мелкие отряды орков появляются то здесь, то там, пытаясь рассредоточить нашу армию.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//Они сражаются без мужества и без веры, и поэтому в конце концов мы обязательно победим.
};


instance DIA_Ingmar_CanTeach(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 100;
	condition = DIA_Ingmar_CanTeach_Condition;
	information = DIA_Ingmar_CanTeach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Ingmar_CanTeach_Condition()
{
	if(Ingmar_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//Ты можешь научить меня чему-нибудь?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//Я могу научить тебя как стать сильнее, чтобы ты мог эффективнее действовать своим оружием.
		Ingmar_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Паладин Ингмар может помочь мне стать сильнее.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//Я обучаю только последователей нашего ордена.
	};
};


func void B_BuildLearnDialog_Ingmar()
{
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	if(RealAttributeValue(ATR_STRENGTH) >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//Ты и так силен как тролль. Мне нечему учить тебя.
	}
	else
	{
		Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(ATR_STRENGTH,1)),DIA_Ingmar_Teach_1);
		Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(ATR_STRENGTH,5)),DIA_Ingmar_Teach_5);
	};
};

instance DIA_Ingmar_Teach(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 6;
	condition = DIA_Ingmar_Teach_Condition;
	information = DIA_Ingmar_Teach_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int DIA_Ingmar_Teach_Condition()
{
	if(Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Teach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//Я хочу стать сильнее.
	B_BuildLearnDialog_Ingmar();
};

func void DIA_Ingmar_Teach_BACK()
{
	Info_ClearChoices(DIA_Ingmar_Teach);
};

func void DIA_Ingmar_Teach_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX))
	{
		B_BuildLearnDialog_Ingmar();
	};
};

func void DIA_Ingmar_Teach_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX))
	{
		B_BuildLearnDialog_Ingmar();
	};
};

instance DIA_Ingmar_ORKELITE(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 40;
	condition = DIA_Ingmar_ORKELITE_Condition;
	information = DIA_Ingmar_ORKELITE_Info;
	description = "Орки готовят массированное наступление.";
};


func int DIA_Ingmar_ORKELITE_Condition()
{
	if(((TalkedTo_AntiPaladin == TRUE) || Npc_HasItems(other,ItRi_OrcEliteRing) || (Hagen_SawOrcRing == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_ORKELITE_Info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//Орки готовят массированное наступление.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Да ну? Ну что ж, это очень интересно. А откуда тебе это известно?
	if(TalkedTo_AntiPaladin == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//Я говорил с ними.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Их лидеры появились в этой местности.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Ммм. Это не похоже на типичную стратегию орков.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Тебе нужно найти способ избавить нас от них.",DIA_Ingmar_ORKELITE_loswerden);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Что нам делать теперь?",DIA_Ingmar_ORKELITE_wasTun);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"Что это значит?",DIA_Ingmar_ORKELITE_wieso);
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite,"Ингмар был очень заинтересован историей о вторжении орков.");
	MIS_KillOrkOberst = LOG_Running;
};

func void DIA_Ingmar_ORKELITE_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//Тебе нужно найти способ избавить нас от них.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//Было бы неплохо, если бы у нас была более подробная информация. Я пошлю кого-нибудь разведать окрестности.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//Что это значит?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//Если то, что ты говоришь, правда, это означает, что они надеются ослабить нас изнутри, нанеся удар своими лучшими воинами.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Обычно каждую орду орков возглавляет один предводитель. Крайне редко можно встретить двоих или больше вместе.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//На это есть причина. Их лидеры - ядро их атакующей стратегии, и обычно окружены простыми воинами-орками.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Поэтому очень трудно подобраться к кому-нибудь из них, не пробившись через орду не менее чем из 30 воинов.
	B_LogEntry(TOPIC_OrcElite,"Ингмар сказал, что к предводителям орков очень тяжело подобраться. Мне следует быть предельно осторожным.");
};

func void DIA_Ingmar_ORKELITE_wasTun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//Что нам делать теперь?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//Когда они встречаются в таком количестве, это обычно диверсионная группа, возглавляемая старшим по званию.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//Этот высокопоставленный предводитель устраивает себе штаб-квартиру в одной из пещер, откуда направляет свои войска в бой.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//Если бы мы смогли добраться до этого военачальника орков, мы получили бы решающее преимущество.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//Думаю, я могу помочь тебе его найти.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//Военачальник орков обычно предпочитает находиться в непосредственной близости от своих врагов. Я бы посоветовал поискать его пещеру где-нибудь неподалеку от города.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//Несколько орков было замечено у фермы Лобарта. Может быть, тебе попробовать начать поиски именно оттуда?
	B_LogEntry(TOPIC_OrcElite,"Согласно Ингмару, я должен найти полковника орков в пещере где-то неподалеку от фермы Лобарта. Ингмар хочет, чтобы я убил его.");
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};


instance DIA_Ingmar_HAUPTQUARTIER(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 41;
	condition = DIA_Ingmar_HAUPTQUARTIER_Condition;
	information = DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent = FALSE;
	description = "Я смог найти штаб-квартиру орков. Их военачальник пал.";
};


func int DIA_Ingmar_HAUPTQUARTIER_Condition()
{
	if(Npc_IsDead(AntiPaladin_NW) && Npc_KnowsInfo(other,DIA_Ingmar_ORKELITE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//Я смог найти штаб-квартиру орков. Их военачальник пал.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//Это отличные новости. Теперь орки некоторое время будут пребывать в растерянности.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//Это неплохо. Если бы у нас было побольше рыцарей вроде тебя, за исход грядущей битвы можно было бы не волноваться.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Вот. Возьми это золото. Надеюсь, оно поможет тебе купить хорошее снаряжение.
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_KillOrkOberst = LOG_SUCCESS;
	B_GivePlayerXP(XP_KilledOrkOberst);
};

