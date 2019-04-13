
instance DIA_Opolos_Kap1_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap1_EXIT_Condition;
	information = DIA_Opolos_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Hello(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_Hello_Condition;
	information = DIA_Opolos_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Opolos_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Hello_Info()
{
	AI_Output(self,other,"DIA_Opolos_Hello_12_00");	//Привет, ты, должно быть, тот самый новичок.
	AI_Output(self,other,"DIA_Opolos_Hello_12_01");	//Я Ополос. Я присматриваю за овцами.
};


instance DIA_Opolos_Wurst(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_Wurst_Condition;
	information = DIA_Opolos_Wurst_Info;
	permanent = FALSE;
	description = "Я принес баранью колбасу ...";
};


func int DIA_Opolos_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Opolos_Wurst_15_00");	//Я принес баранью колбасу ...
	AI_Output(self,other,"DIA_Opolos_Wurst_12_01");	//Ох, фантастика! Наконец-то! Вкуснейшая баранья колбаса!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_Opolos_HowLong(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 1;
	condition = DIA_Opolos_HowLong_Condition;
	information = DIA_Opolos_HowLong_Info;
	permanent = FALSE;
	description = "Ты давно в монастыре?";
};


func int DIA_Opolos_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowLong_Info()
{
	AI_Output(other,self,"DIA_Opolos_HowLong_15_00");	//Ты давно в монастыре?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_01");	//Уже три года. Но до сих пор меня не пускают в библиотеку. А мне так хочется...
	AI_Output(other,self,"DIA_Opolos_HowLong_15_02");	//А почему?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_03");	//Моя работа здесь - пасти овец - а не изучать писания.
	AI_Output(self,other,"DIA_Opolos_HowLong_12_04");	//И пока мастер Парлан не освободит меня от этой обязанности, мне не позволят начать обучение в библиотеке.
	MIS_HelpOpolos = LOG_Running;
	Log_CreateTopic(Topic_OpolosStudy,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosStudy,LOG_Running);
	B_LogEntry(Topic_OpolosStudy,"Ополос сторожит овец. А он хотел бы изучать свитки в библиотеке.");
};


instance DIA_Opolos_Monastery(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_Monastery_Condition;
	information = DIA_Opolos_Monastery_Info;
	permanent = FALSE;
	description = "Как я должен вести себя в монастыре?";
};


func int DIA_Opolos_Monastery_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Monastery_Info()
{
	AI_Output(other,self,"DIA_Opolos_Monastery_15_00");	//Как я должен вести себя в монастыре?
	AI_Output(self,other,"DIA_Opolos_Monastery_12_01");	//Никогда не лги магам. Уважай своих братьев по общине.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_02");	//Уважай собственность монастыря. Если ты нарушишь эти правила, тебе придется отвечать перед мастером Парланом.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_03");	//Помимо этого, я могу посоветовать тебе быть осторожнее с Агоном. Если ты не будешь бдительным, ты можешь кончить как Бабо.
};


instance DIA_Opolos_beibringen(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_beibringen_Condition;
	information = DIA_Opolos_beibringen_Info;
	permanent = FALSE;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int DIA_Opolos_beibringen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_Hello) && ((other.guild == GIL_NOV) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Opolos_beibringen_Info()
{
	AI_Output(other,self,"DIA_Opolos_beibringen_15_00");	//Ты можешь чему-нибудь научить меня?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_01");	//Конечно, мне часто приходилось драться. Я могу научить тебя, как стать сильнее.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_02");	//Но я бы хотел узнать что-нибудь о зельях, особенно о магических.
	AI_Output(other,self,"DIA_Opolos_beibringen_15_03");	//Чем я могу помочь тебе в этом?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_04");	//Ну, если ты работаешь на Неораса, то у тебя наверняка будет возможность 'позаимствовать' ненадолго один из его рецептов.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_05");	//Если ты принесешь его мне, чтобы я мог изучить его, то я потренирую тебя.
	Log_CreateTopic(Topic_OpolosRezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosRezept,LOG_Running);
	B_LogEntry(Topic_OpolosRezept,"Ополос хочет взглянуть на рецепт приготовления зелий маны. Возможно мне удастся позаимствовать его, работая на Неораса.");
};


instance DIA_Opolos_rezept(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_rezept_Condition;
	information = DIA_Opolos_rezept_Info;
	permanent = TRUE;
	description = "Насчет рецепта ...";
};


var int DIA_Opolos_rezept_permanent;

func int DIA_Opolos_rezept_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Opolos_beibringen) && (other.guild == GIL_NOV) && (DIA_Opolos_rezept_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_rezept_Info()
{
	if(Npc_HasItems(other,ItWr_ManaRezept) >= 1)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_00");	//Я принес рецепт, как ты и хотел.
		AI_Output(self,other,"DIA_Opolos_rezept_12_01");	//Хорошо, дай я прочту его.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_02");	//Ага... хм ... да ... понятно ... так, так ...
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_03");	//Хорошо. Огромное спасибо. Если хочешь, ты можешь потренироваться со мной.
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		Opolos_Rezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Ополос может помочь мне стать сильнее.");
	}
	else if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_04");	//Я уже вернул этот рецепт Неорасу.
		AI_Output(self,other,"DIA_Opolos_rezept_12_05");	//Ох, черт - мне, наверное, никогда не удастся научиться чему-нибудь здесь. Ладно. Я все равно потренирую тебя.
		Opolos_Rezept = LOG_FAILED;
		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"Ополос может помочь мне стать сильнее.");
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_06");	//Вернемся к этому позже.
	};
};


instance DIA_Opolos_TEACH_STR(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 99;
	condition = DIA_Opolos_TEACH_STR_Condition;
	information = DIA_Opolos_TEACH_STR_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int DIA_Opolos_TEACH_STR_Condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (Opolos_TeachSTR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_TEACH_STR_Info()
{
	AI_Output(other,self,"DIA_Opolos_TEACH_STR_15_00");	//Я хочу стать сильнее.
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_MED)
	{
		AI_Output(self,other,"DIA_Opolos_TEACH_STR_12_00");	//Ты стал очень сильным. Мне больше нечему учить тебя.
	};
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
};

func void DIA_Opolos_TEACH_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR,Dialog_Back,DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Opolos_TEACH_STR_5);
};


instance DIA_Opolos_Agon(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 4;
	condition = DIA_Opolos_Agon_Condition;
	information = DIA_Opolos_Agon_Info;
	permanent = FALSE;
	description = "А кто такие Агон и Бабо?";
};


func int DIA_Opolos_Agon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Agon_Info()
{
	AI_Output(other,self,"DIA_Opolos_Agon_15_00");	//А кто такие Агон и Бабо?
	AI_Output(self,other,"DIA_Opolos_Agon_12_01");	//Агон заведует садом. Он тоже послушник, но ведет себя так, как будто он уже Избранный.
	AI_Output(self,other,"DIA_Opolos_Agon_12_02");	//Бабо пришел в монастырь незадолго до тебя. И сначала он помогал Агону в саду.
	AI_Output(self,other,"DIA_Opolos_Agon_12_03");	//Похоже, они что-то там не поделили, и с тех пор Бабо подметает двор.
	AI_Output(other,self,"DIA_Opolos_Agon_15_04");	//Ты знаешь, что произошло?
	AI_Output(self,other,"DIA_Opolos_Agon_12_05");	//Точно не знаю. Тебе лучше самому спросить их. Но слова Агона имеет больший вес, чем слово любого другого послушника, потому что он племянник губернатора.
};


instance DIA_Opolos_LIESEL(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_LIESEL_Condition;
	information = DIA_Opolos_LIESEL_Info;
	permanent = TRUE;
	description = "Смотри, Я привел Бетси.";
};


func int DIA_Opolos_LIESEL_Condition()
{
	if((other.guild == GIL_NOV) && (Liesel_Giveaway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_LIESEL_Info()
{
	AI_Output(other,self,"DIA_Opolos_LIESEL_15_00");	//Смотри, Я привел Бетси. Могу я оставить ее с тобой?
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 800))
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = ZS_MM_AllScheduler;
		Liesel_Giveaway = TRUE;
		AI_Output(self,hero,"DIA_Opolos_LIESEL_12_01");	//Да, конечно. Какая красивая овечка. Я позабочусь о ней.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_Add_15_00");	//Хм... куда же это я его подевал. Я приду позже.
	};
};


instance DIA_Opolos_Biblothek(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 98;
	condition = DIA_Opolos_Biblothek_Condition;
	information = DIA_Opolos_Biblothek_Info;
	permanent = TRUE;
	description = "Насчет библиотеки ...";
};


func int DIA_Opolos_Biblothek_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Opolos_HowLong))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Biblothek_Info()
{
	AI_Output(other,self,"DIA_Opolos_Biblothek_15_00");	//Насчет библиотеки ...
	if(Parlan_Erlaubnis == FALSE)
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_01");	//Это запертая комната слева, рядом с воротами.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_02");	//Ключ от нее можно получить только тогда, когда мастер Парлан решит, что ты готов изучать писания.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_03");	//Ты везунчик! Ты получил ключ от библиотеки, не пробыв тут и нескольких дней.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_04");	//Не упусти свой шанс изучить древние писания!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_HelloAgain(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 2;
	condition = DIA_Opolos_HelloAgain_Condition;
	information = DIA_Opolos_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Opolos_HelloAgain_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_HelpOpolos == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_00");	//Привет. Спасибо, что помог мне. Теперь я не упущу свой шанс.
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_01");	//Но у тебя, наверняка, теперь нет времени на разговоры с простым послушником, Мастер.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_HowIsIt(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 3;
	condition = DIA_Opolos_HowIsIt_Condition;
	information = DIA_Opolos_HowIsIt_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Opolos_HowIsIt_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowIsIt_Info()
{
	AI_Output(other,self,"DIA_Opolos_HowIsIt_15_00");	//Как дела?
	if(MIS_HelpOpolos == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_01");	//Отлично. С тех пор, как мне разрешили посещать библиотеку, все просто превосходно.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_02");	//Я смиренно выполняю все, что мне поручено, Мастер.
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_03");	//Каждый день Иннос подвергает меня новым испытаниям. Я буду продолжать работать над собой.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap2_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap2_EXIT_Condition;
	information = DIA_Opolos_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap3_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap3_EXIT_Condition;
	information = DIA_Opolos_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap3_PERM(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 39;
	condition = DIA_Opolos_Kap3_PERM_Condition;
	information = DIA_Opolos_Kap3_PERM_Info;
	permanent = TRUE;
	description = "Как твои овцы?";
};


func int DIA_Opolos_Kap3_PERM_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_PERM_Info()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_15_00");	//Как твои овцы?
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_01");	//А как ты думаешь? Они стоят вокруг и жуют траву.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_02");	//Хотел бы я знать, что происходит снаружи. Маги, похоже, очень нервничают.
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,Dialog_Back,DIA_Opolos_Kap3_PERM_BACK);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,"В Долине Рудников появились драконы.",DIA_Opolos_Kap3_PERM_DRAGONS);
	Info_AddChoice(DIA_Opolos_Kap3_PERM,"Неизвестные в черных рясах стоят на каждом перекрестке.",DIA_Opolos_Kap3_PERM_DMT);
	if(MIS_NovizenChase == LOG_Running)
	{
		Info_AddChoice(DIA_Opolos_Kap3_PERM,"Педро предал нас.",DIA_Opolos_Kap3_PERM_PEDRO);
	};
};

func void DIA_Opolos_Kap3_PERM_BACK()
{
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
};


var int Opolos_Dragons;

func void DIA_Opolos_Kap3_PERM_DRAGONS()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00");	//В Долине Рудников появились драконы. Вместе с армией орков они осаждают королевские войска.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01");	//Драконы - я всегда думал, что они существуют только в детских сказках.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02");	//Они здесь, поверь мне.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03");	//Но королевские паладины разберутся с ними, разве нет?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04");	//Посмотрим.
	if(Opolos_Dragons == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_Dragons = TRUE;
	};
};


var int Opolos_DMT;

func void DIA_Opolos_Kap3_PERM_DMT()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_00");	//Неизвестные в черных рясах стоят на каждом перекрестке.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_01");	//Что ты имеешь в виду? Какие еще неизвестные?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_02");	//Никто не знает, откуда они взялись. Они носят длинные черные рясы и скрывают свои лица.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_03");	//Похоже, это какие-то маги. По крайней мере, они владеют магией.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_04");	//Это все очень тревожно, но я уверен, что Высший Совет решит эту проблему.
	if(Opolos_DMT == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_DMT = TRUE;
	};
};


var int Opolos_Pedro;

func void DIA_Opolos_Kap3_PERM_PEDRO()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_00");	//Педро предал нас.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01");	//Я слышал об этом, но я думал, что и тебе об этом известно. Вот почему я ничего не сказал.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02");	//Неужели враг сильнее нас - ну я хочу сказать, сможем ли мы победить его?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_03");	//Мы еще не мертвы.
	if(Opolos_Pedro == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Opolos_Pedro = TRUE;
	};
};


instance DIA_Opolos_Kap4_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap4_EXIT_Condition;
	information = DIA_Opolos_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_Kap5_EXIT(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 999;
	condition = DIA_Opolos_Kap5_EXIT_Condition;
	information = DIA_Opolos_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Opolos_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Opolos_PICKPOCKET(C_Info)
{
	npc = NOV_605_Opolos;
	nr = 900;
	condition = DIA_Opolos_PICKPOCKET_Condition;
	information = DIA_Opolos_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Opolos_PICKPOCKET_Condition()
{
	return C_Beklauen(54,70);
};

func void DIA_Opolos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
	Info_AddChoice(DIA_Opolos_PICKPOCKET,Dialog_Back,DIA_Opolos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Opolos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Opolos_PICKPOCKET_DoIt);
};

func void DIA_Opolos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};

func void DIA_Opolos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};

