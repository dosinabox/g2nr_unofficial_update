
instance DIA_Malak_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_EXIT_Condition;
	information = DIA_Malak_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Malak_HALLO(C_Info)
{
	npc = BAU_963_Malak;
	nr = 3;
	condition = DIA_Malak_HALLO_Condition;
	information = DIA_Malak_HALLO_Info;
	description = "Все в порядке?";
};


func int DIA_Malak_HALLO_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_HALLO_Info()
{
	AI_Output(other,self,"DIA_Malak_HALLO_15_00");	//Все в порядке?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_01");	//Еще один поденный рабочий, который не знает, чем заняться? Нет проблем. Поговори с нашим фермером Бенгаром.
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_HALLO_08_02");	//Конечно.
	};
};


instance DIA_Malak_WASMACHSTDU(C_Info)
{
	npc = BAU_963_Malak;
	nr = 4;
	condition = DIA_Malak_WASMACHSTDU_Condition;
	information = DIA_Malak_WASMACHSTDU_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Malak_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Malak_WASMACHSTDU_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_01");	//Я пасу овец. Это не такая уж тяжелая работа.
	AI_Output(self,other,"DIA_Malak_WASMACHSTDU_08_02");	//Но иногда нужно быть очень внимательным. Особенно, если приближаешься к Проходу.
};


instance DIA_Malak_PASS(C_Info)
{
	npc = BAU_963_Malak;
	nr = 5;
	condition = DIA_Malak_PASS_Condition;
	information = DIA_Malak_PASS_Info;
	description = "Что ты знаешь о Проходе?";
};


func int DIA_Malak_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_WASMACHSTDU) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PASS_Info()
{
	AI_Output(other,self,"DIA_Malak_PASS_15_00");	//Что ты знаешь о Проходе?
	AI_Output(self,other,"DIA_Malak_PASS_08_01");	//Не много. Только то, что он ведет в старую Долину Рудников, которая была окружена Барьером еще несколько недель назад.
	AI_Output(self,other,"DIA_Malak_PASS_08_02");	//Тогда единственное, чего нужно было опасаться нам, фермерам, это ежемесячного каравана, доставлявшего различные грузы в Долину Рудников.
	AI_Output(self,other,"DIA_Malak_PASS_08_03");	//Эти головорезы сильно усложняли нам жизнь.
};


instance DIA_Malak_WOPASS(C_Info)
{
	npc = BAU_963_Malak;
	nr = 6;
	condition = DIA_Malak_WOPASS_Condition;
	information = DIA_Malak_WOPASS_Info;
	description = "Где мне найти проход в старую Долину Рудников?";
};


func int DIA_Malak_WOPASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WOPASS_Info()
{
	AI_Output(other,self,"DIA_Malak_WOPASS_15_00");	//Где мне найти проход в старую Долину Рудников?
	AI_Output(self,other,"DIA_Malak_WOPASS_08_01");	//Около двух водопадов на другой стороне этого пастбища.
};


instance DIA_Malak_MINENTAL(C_Info)
{
	npc = BAU_963_Malak;
	nr = 7;
	condition = DIA_Malak_MINENTAL_Condition;
	information = DIA_Malak_MINENTAL_Info;
	description = "Что говорят о Долине Рудников?";
};


func int DIA_Malak_MINENTAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_PASS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_MINENTAL_Info()
{
	AI_Output(other,self,"DIA_Malak_MINENTAL_15_00");	//Что говорят о Долине Рудников?
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_01");	//Разное. Некоторые говорят, что слышали крики по ночам, другие видели странный свет над горами.
	AI_Output(self,other,"DIA_Malak_MINENTAL_08_02");	//Но я думаю, что это все пустые сплетни.
};


instance DIA_Malak_WARSTDUSCHONDA(C_Info)
{
	npc = BAU_963_Malak;
	nr = 8;
	condition = DIA_Malak_WARSTDUSCHONDA_Condition;
	information = DIA_Malak_WARSTDUSCHONDA_Info;
	description = "А ты был в Долине Рудников?";
};


func int DIA_Malak_WARSTDUSCHONDA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_PASS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WARSTDUSCHONDA_Info()
{
	AI_Output(other,self,"DIA_Malak_WARSTDUSCHONDA_15_00");	//А ты был в Долине Рудников?
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_01");	//Нет. Но иногда я пасу овец рядом с Проходом. И я всегда вижу там двух паладинов, стоящих на страже.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_02");	//Похоже, они там, чтобы никого не выпускать из долины.
	AI_Output(self,other,"DIA_Malak_WARSTDUSCHONDA_08_03");	//Раньше Долина Рудников была естественной тюрьмой. Если ты попадал туда, ты уже никогда не мог выбраться назад.
};


instance DIA_Malak_PALADINE(C_Info)
{
	npc = BAU_963_Malak;
	nr = 9;
	condition = DIA_Malak_PALADINE_Condition;
	information = DIA_Malak_PALADINE_Info;
	description = "Расскажи мне о паладинах.";
};


func int DIA_Malak_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_WARSTDUSCHONDA) && Npc_KnowsInfo(other,DIA_Malak_MINENTAL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PALADINE_Info()
{
	AI_Output(other,self,"DIA_Malak_PALADINE_15_00");	//Расскажи мне об этих паладинах. Как давно они стоят здесь?
	AI_Output(self,other,"DIA_Malak_PALADINE_08_01");	//Неделю или две, по-моему. Я точно не помню.
	AI_Output(self,other,"DIA_Malak_PALADINE_08_02");	//Не так давно тут был даже целый отряд паладинов. Они пошли через Проход. И с тех пор я их больше не видел.
};


instance DIA_Malak_KEINEFRAUEN(C_Info)
{
	npc = BAU_963_Malak;
	nr = 10;
	condition = DIA_Malak_KEINEFRAUEN_Condition;
	information = DIA_Malak_KEINEFRAUEN_Info;
	description = "Я не вижу здесь женщин.";
};


func int DIA_Malak_KEINEFRAUEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_WASMACHSTDU) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_KEINEFRAUEN_Info()
{
	AI_Output(other,self,"DIA_Malak_KEINEFRAUEN_15_00");	//Я не вижу здесь женщин.
	AI_Output(self,other,"DIA_Malak_KEINEFRAUEN_08_01");	//Ты прав. Это мужская ферма, так сказать. И это даже к лучшему, мне кажется.
};


instance DIA_Malak_PERMKAP1(C_Info)
{
	npc = BAU_963_Malak;
	nr = 11;
	condition = DIA_Malak_PERMKAP1_Condition;
	information = DIA_Malak_PERMKAP1_Info;
	permanent = TRUE;
	description = "Смотри, не перетрудись.";
};


func int DIA_Malak_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Malak_HALLO) && Npc_KnowsInfo(other,DIA_Malak_WASMACHSTDU) && Npc_KnowsInfo(other,DIA_Malak_PASS) && Npc_KnowsInfo(other,DIA_Malak_MINENTAL) && Npc_KnowsInfo(other,DIA_Malak_WARSTDUSCHONDA) && Npc_KnowsInfo(other,DIA_Malak_PALADINE) && Npc_KnowsInfo(other,DIA_Malak_KEINEFRAUEN) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Malak_PERMKAP1_15_00");	//Смотри, не перетрудись.
	AI_Output(self,other,"DIA_Malak_PERMKAP1_08_01");	//Я попробую.
	AI_StopProcessInfos(self);
};


instance DIA_Malak_KAP3_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP3_EXIT_Condition;
	information = DIA_Malak_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_FLEEFROMPASS(C_Info)
{
	npc = BAU_963_Malak;
	nr = 30;
	condition = DIA_Malak_FLEEFROMPASS_Condition;
	information = DIA_Malak_FLEEFROMPASS_Info;
	description = "Что ты делаешь здесь?";
};


func int DIA_Malak_FLEEFROMPASS_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_FLEEFROMPASS_Info()
{
	if((NpcObsessedByDMT_Malak == FALSE) && (hero.guild == GIL_KDF))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_00");	//Что ты делаешь здесь?
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_01");	//Я сбежал с фермы Бенгара. Я не хочу, чтобы меня сожрали все эти твари, что толпами валят из Прохода.
		AI_Output(self,other,"DIA_Malak_FLEEFROMPASS_08_02");	//Ты представить себе не можешь, какие ужасы повылазили оттуда за последние несколько дней.
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_03");	//Могу.
		B_LogEntry(TOPIC_BengarALLEIN,"Малак спрятался в укрепленном месте на юге, потому что боится тварей, приходящих на его пастбища из Прохода.");
		B_GivePlayerXP(XP_FoundMalakFLEEFROMPASS);
	};
};


instance DIA_Malak_Heilung(C_Info)
{
	npc = BAU_963_Malak;
	nr = 55;
	condition = DIA_Malak_Heilung_Condition;
	information = DIA_Malak_Heilung_Info;
	permanent = TRUE;
	description = "Тебе нужна помощь.";
};


func int DIA_Malak_Heilung_Condition()
{
	if((NpcObsessedByDMT_Malak == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};


var int DIA_Malak_Heilung_oneTime;

func void DIA_Malak_Heilung_Info()
{
	AI_Output(other,self,"DIA_Malak_Heilung_15_00");	//Тебе нужна помощь.
	if(DIA_Malak_Heilung_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_01");	//(плаксиво) Я просто хочу вернуться домой. Я вернусь к Бенгару. Надеюсь, он еще жив.
		B_NpcClearObsessionByDMT(self);
		Npc_ExchangeRoutine(self,"Start");
		B_StartOtherRoutine(BAU_962_Bauer,"Start");
		B_StartOtherRoutine(BAU_964_Bauer,"Start");
		B_StartOtherRoutine(BAU_965_Bauer,"Start");
		B_StartOtherRoutine(BAU_966_Bauer,"Start");
		B_StartOtherRoutine(BAU_967_Bauer,"Start");
		B_StartOtherRoutine(BAU_968_Bauer,"Start");
		B_StartOtherRoutine(BAU_969_Bauer,"Start");
		DIA_Malak_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Malak_Heilung_08_02");	//Оставь меня в покое, маг. Я справлюсь.
		B_NpcClearObsessionByDMT(self);
	};
};


instance DIA_Malak_PERMCASTLE(C_Info)
{
	npc = BAU_963_Malak;
	nr = 31;
	condition = DIA_Malak_PERMCASTLE_Condition;
	information = DIA_Malak_PERMCASTLE_Info;
	permanent = TRUE;
	description = "А как тебе здесь?";
};


func int DIA_Malak_PERMCASTLE_Condition()
{
	if((Npc_GetDistToWP(self,"CASTLEMINE") < 4000) && (MIS_GetMalakBack != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Malak_FLEEFROMPASS) && (NpcObsessedByDMT_Malak == FALSE) && (hero.guild != GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PERMCASTLE_Info()
{
	AI_Output(other,self,"DIA_Malak_PERMCASTLE_15_00");	//А как тебе здесь?
	AI_Output(self,other,"DIA_Malak_PERMCASTLE_08_01");	//Здесь мне приходится иметь дело только с бандитами. Это все же меньшее зло.
};


instance DIA_Malak_BACKTOBENGAR(C_Info)
{
	npc = BAU_963_Malak;
	nr = 31;
	condition = DIA_Malak_BACKTOBENGAR_Condition;
	information = DIA_Malak_BACKTOBENGAR_Info;
	permanent = TRUE;
	description = "Ты нужен Бенгару.";
};


func int DIA_Malak_BACKTOBENGAR_Condition()
{
	if((MIS_GetMalakBack == LOG_Running) && Npc_KnowsInfo(other,DIA_Malak_FLEEFROMPASS) && (Npc_IsDead(Bengar) == FALSE) && (NpcObsessedByDMT_Malak == FALSE) && (hero.guild != GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_BACKTOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_00");	//Ты нужен Бенгару. Он хочет, чтобы ты вернулся на его ферму.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_01");	//Я не сумасшедший. Пока ферма беззащитна, я ни на шаг отсюда не сойду!
	B_LogEntry(TOPIC_BengarALLEIN,"Малак не вернется на ферму Бенгара, пока она не будет хорошо защищена.");
	if(MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_02");	//Я нанял наемника. Он присмотрит за вашей фермой.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_03");	//Ну, это другое дело, конечно же. Но подожди минутку. А кто будет платить этому парню?
		AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_15_04");	//Это моя проблема.
		AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_08_05");	//(с любопытством) М-м-м. А может, скажешь, а?
		Info_AddChoice(DIA_Malak_BACKTOBENGAR,"Нет.",DIA_Malak_BACKTOBENGAR_los);
	};
};

func void DIA_Malak_BACKTOBENGAR_los()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_los_15_00");	//Нет.
	AI_Output(self,other,"DIA_Malak_BACKTOBENGAR_los_08_01");	//Хорошо. Тогда я возвращаюсь. Надеюсь, этот парень знает свое дело.
	MIS_GetMalakBack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Malak_BACKTOBENGAR);
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(BAU_962_Bauer,"Start");
	B_StartOtherRoutine(BAU_964_Bauer,"Start");
	B_StartOtherRoutine(BAU_965_Bauer,"Start");
	B_StartOtherRoutine(BAU_966_Bauer,"Start");
	B_StartOtherRoutine(BAU_967_Bauer,"Start");
	B_StartOtherRoutine(BAU_968_Bauer,"Start");
	B_StartOtherRoutine(BAU_969_Bauer,"Start");
};


instance DIA_Malak_BACK(C_Info)
{
	npc = BAU_963_Malak;
	nr = 32;
	condition = DIA_Malak_BACK_Condition;
	information = DIA_Malak_BACK_Info;
	permanent = TRUE;
	description = "Ты теперь останешься на ферме Бенгара?";
};


func int DIA_Malak_BACK_Condition()
{
	if((MIS_GetMalakBack == LOG_SUCCESS) && (NpcObsessedByDMT_Malak == FALSE) && (hero.guild != GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_BACK_Info()
{
	AI_Output(other,self,"DIA_Malak_BACK_15_00");	//Ты теперь останешься на ферме Бенгара?
	AI_Output(self,other,"DIA_Malak_BACK_08_01");	//Конечно. У меня появилась надежда. Мы как-нибудь справимся.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP4_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP4_EXIT_Condition;
	information = DIA_Malak_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP5_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP5_EXIT_Condition;
	information = DIA_Malak_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP6_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP6_EXIT_Condition;
	information = DIA_Malak_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_PICKPOCKET(C_Info)
{
	npc = BAU_963_Malak;
	nr = 900;
	condition = DIA_Malak_PICKPOCKET_Condition;
	information = DIA_Malak_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Malak_PICKPOCKET_Condition()
{
	return C_Beklauen(43,40);
};

func void DIA_Malak_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
	Info_AddChoice(DIA_Malak_PICKPOCKET,Dialog_Back,DIA_Malak_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Malak_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Malak_PICKPOCKET_DoIt);
};

func void DIA_Malak_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
};

func void DIA_Malak_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
};

