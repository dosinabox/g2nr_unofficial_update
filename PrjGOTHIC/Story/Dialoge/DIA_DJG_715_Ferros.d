
instance DIA_DJG_715_Ferros_EXIT(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 999;
	condition = DIA_DJG_715_Ferros_EXIT_Condition;
	information = DIA_DJG_715_Ferros_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DJG_715_Ferros_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_715_Ferros_Hello(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 4;
	condition = DIA_DJG_715_Ferros_Hello_Condition;
	information = DIA_DJG_715_Ferros_Hello_Info;
	permanent = FALSE;
	description = "Откуда ты?";
};


func int DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Hello_15_00");	//Откуда ты?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_01");	//С материка. Мои люди и я бежали оттуда.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_02");	//Там становится все хуже. Орки сжигают за собой все, что горит.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_03");	//Король потерял контроль над своим королевством.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_04");	//Вы, паладины, провалили все дело, если тебе интересно мое мнение.
	};
};


instance DIA_DJG_715_Ferros_Friends(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 5;
	condition = DIA_DJG_715_Ferros_Friends_Condition;
	information = DIA_DJG_715_Ferros_Friends_Info;
	permanent = FALSE;
	description = "А где сейчас твои люди?";
};


func int DIA_DJG_715_Ferros_Friends_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_Friends_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Friends_15_00");	//А где сейчас твои люди?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_01");	//Я покинул их.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_02");	//Они думали, что им дозволено брать все, что им угодно, даже если это не принадлежит им. Я не хочу принимать в этом участия.
};


instance DIA_DJG_715_Ferros_War(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_War_Condition;
	information = DIA_DJG_715_Ferros_War_Info;
	permanent = FALSE;
	description = "Что еще ты знаешь о войне?";
};


func int DIA_DJG_715_Ferros_War_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_War_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_War_15_00");	//Что еще ты знаешь о войне?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_01");	//Ты ведь давно не видел своего короля, а?
	};
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_02");	//Орки окружили столицу. Но пала она уже или нет, я не знаю.
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_03");	//Последнее, что я слышал, - что король мертв. Но я в это не верю.
};


instance DIA_DJG_715_Ferros_OldCamp(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 7;
	condition = DIA_DJG_715_Ferros_OldCamp_Condition;
	information = DIA_DJG_715_Ferros_OldCamp_Info;
	permanent = FALSE;
	description = "А что ты делаешь здесь, в замке?";
};


func int DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_15_00");	//А что ты делаешь здесь, в замке?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_01");	//Я услышал о драконах и пришел помочь сражаться с ними.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_02");	//К несчастью, я потерял свой меч, когда пробирался мимо орков. И вот я застрял здесь.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_03");	//Без меча я не могу выйти отсюда, а те мечи, что продают здесь, - бесполезный хлам.
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,"Я желаю тебе удачи в твоих поисках.",DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,"Что ты дашь мне, если я найду твой меч?",DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,"Я найду твой меч.",DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem(ItMW_1H_FerrosSword_Mis,"FP_OW_ITEM_08");
	MIS_FErrosSword = LOG_Running;
	Log_CreateTopic(TOPIC_FerrosSword,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword,LOG_Running);
	B_LogEntry(TOPIC_FerrosSword,"Ферос потерял свой меч из-за орков. Это было глупостью.");
};

func void DIA_DJG_715_Ferros_OldCamp_No()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_No_15_00");	//Я желаю тебе удачи в твоих поисках.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01");	//Я все задаю себе вопрос - а зачем я вообще пришел сюда?
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Price()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_15_00");	//Что ты дашь мне, если я найду твой меч?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01");	//Боже, я ничего не могу дать. Я потратил все свои деньги на этот меч.
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Yes()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00");	//Я найду твой меч.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01");	//Это было бы великолепно. Тебе стоит поискать у большого утеса на юге.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02");	//Я, вероятно, потерял его там, около палаток орков.
	B_LogEntry(TOPIC_FerrosSword,"Похоже, Ферос потерял свой меч на высоком утесе на юге, там, где находятся палатки орков.");
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};


instance DIA_DJG_715_Ferros_FerrosAnySword(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_FerrosAnySword_Condition;
	information = DIA_DJG_715_Ferros_FerrosAnySword_Info;
	permanent = FALSE;
	description = "Возможно, у меня есть для тебя другой меч.";
};


func int DIA_DJG_715_Ferros_FerrosAnySword_Condition()
{
	if((MIS_FErrosSword == LOG_Running) && ((Npc_HasItems(other,ItMw_1H_Special_01) >= 1) || (Npc_HasItems(other,ItMw_1H_Special_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00");	//Возможно, у меня есть для тебя другой меч.
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,Dialog_Back,DIA_DJG_715_Ferros_FerrosAnySword_Back);
	if(Npc_HasItems(other,ItMw_1H_Special_01) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,ItMw_1H_Special_01.name,DIA_DJG_715_Ferros_FerrosAnySword_Silverblade);
	};
	if(Npc_HasItems(other,ItMw_1H_Special_02) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,ItMw_1H_Special_02.name,DIA_DJG_715_Ferros_FerrosAnySword_Oreblade);
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Back()
{
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void B_Ferros_FerrosAnySword_Give()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00");	//Это хороший клинок. Превосходной работы.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01");	//Ты уверен, что хочешь отдать его мне просто так?
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade()
{
	B_Ferros_FerrosAnySword_Give();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"Нет, он нужен мне самому.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"Да, забирай.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade()
{
	B_Ferros_FerrosAnySword_Give();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"Нет, он нужен мне самому.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"Да, забирай.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

func void B_Ferros_FerrosAnySword_Yes1()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00");	//Да, забирай.
};

func void B_Ferros_FerrosAnySword_Yes2()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00");	//Спасибо. Я твой должник.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01");	//Взамен я покажу тебе парочку трюков, которые позволят тебе лучше использовать силу и ловкость в бою.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"Ферос может повысить мои силу и ловкость.");
};

func void B_Ferros_FerrosAnySword_No()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//Нет, он нужен мне самому.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//Понимаю.
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other,self,ItMw_1H_Special_01,1);
	B_Ferros_FerrosAnySword_Yes2();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other,self,ItMw_1H_Special_02,1);
	B_Ferros_FerrosAnySword_Yes2();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};


instance DIA_DJG_715_Ferros_FerrosHisSword(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_FerrosHisSword_Condition;
	information = DIA_DJG_715_Ferros_FerrosHisSword_Info;
	permanent = FALSE;
	description = "Я нашел твой меч.";
};


func int DIA_DJG_715_Ferros_FerrosHisSword_Condition()
{
	if((MIS_FErrosSword == LOG_Running) && (Npc_HasItems(other,ItMW_1H_FerrosSword_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosHisSword_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosHisSword_15_00");	//Я нашел твой меч.
	B_GiveInvItems(other,self,ItMW_1H_FerrosSword_Mis,1);
	B_Ferros_FerrosAnySword_Yes2();
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};


instance DIA_Ferros_Teach(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 1;
	condition = DIA_Ferros_Teach_Condition;
	information = DIA_Ferros_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как можно улучшить свои способности.";
};


func int DIA_Ferros_Teach_Condition()
{
	if(MIS_FErrosSword == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ferros_Teach_Info()
{
	AI_Output(other,self,"DIA_Ferros_Teach_15_00");	//Покажи мне, как можно улучшить свои способности.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_01");	//После всех этих нападений орков я больше этим не занимаюсь. Я рад, что вообще остался жив, парень.
	}
	else
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_02");	//Хороший боец должен уметь напрямую передавать свои способности своему оружию.
		Info_ClearChoices(DIA_Ferros_Teach);
		Info_AddChoice(DIA_Ferros_Teach,Dialog_Back,DIA_Ferros_Teach_Back);
		Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ferros_Teach_STR_1);
		Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ferros_Teach_STR_5);
		Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ferros_Teach_DEX_1);
		Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ferros_Teach_DEX_5);
	};
};

func void DIA_Ferros_Teach_Back()
{
	Info_ClearChoices(DIA_Ferros_Teach);
};

func void DIA_Ferros_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ferros_Teach_STR_1);
};

func void DIA_Ferros_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ferros_Teach_STR_5);
};

func void DIA_Ferros_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ferros_Teach_DEX_1);
};

func void DIA_Ferros_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ferros_Teach_DEX_5);
};


instance DIA_Ferros_AllDragonsDead(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 5;
	condition = DIA_Ferros_AllDragonsDead_Condition;
	information = DIA_Ferros_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Все драконы мертвы.";
};


func int DIA_Ferros_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ferros_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Ferros_AllDragonsDead_15_00");	//Все драконы мертвы.
	AI_Output(self,other,"DIA_Ferros_AllDragonsDead_01_01");	//Отлично! Если бы у нас было побольше людей вроде тебя, все, возможно, не зашло бы так далеко.
};


instance DIA_Ferros_PICKPOCKET(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 900;
	condition = DIA_Ferros_PICKPOCKET_Condition;
	information = DIA_Ferros_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Ferros_PICKPOCKET_Condition()
{
	return C_Beklauen(56,75);
};

func void DIA_Ferros_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
	Info_AddChoice(DIA_Ferros_PICKPOCKET,Dialog_Back,DIA_Ferros_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ferros_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ferros_PICKPOCKET_DoIt);
};

func void DIA_Ferros_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

func void DIA_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

