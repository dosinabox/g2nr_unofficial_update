
instance DIA_Wulfgar_EXIT(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 999;
	condition = DIA_Wulfgar_EXIT_Condition;
	information = DIA_Wulfgar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wulfgar_Hallo(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Hallo_Condition;
	information = DIA_Wulfgar_Hallo_Info;
	permanent = FALSE;
	description = "Каковы твои обязанности?";
};


func int DIA_Wulfgar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//Каковы твои обязанности?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//(презрительно) Эти олухи машут мечами, как крестьяне.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//(убежденно) Но когда они пройдут обучение под моим руководством, каждый из них станет серьезным воином.
};


instance DIA_Wulfgar_WannaJoin(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_WannaJoin_Condition;
	information = DIA_Wulfgar_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу вступить в ополчение!";
};


func int DIA_Wulfgar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//Я хочу вступить в ополчение!
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//Да? А ты гражданин этого города?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//Нет.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//Тогда лорд Андрэ не примет тебя.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//Конечно, ты можешь поговорить с ним, но я не думаю, что он сделает для тебя исключение.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Да.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//Тогда поговори с лордом Андрэ. Он решает, кого можно принять, а кого нет.
	};
};


instance DIA_Wulfgar_AboutMiliz(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 3;
	condition = DIA_Wulfgar_AboutMiliz_Condition;
	information = DIA_Wulfgar_AboutMiliz_Info;
	permanent = FALSE;
	description = "Каково это, служить в ополчении?";
};


func int DIA_Wulfgar_AboutMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//Каково это, служить в ополчении?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//Сейчас нами командует лорд Андрэ.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//Раньше ополчение подчинялось губернатору. (смеется) Он понятия не имел, чем мы занимались здесь.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//Но лорд Андрэ знает свое дело. Он заботится о своих людях.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//Каждый, кто вступает в ополчение, получает неплохие доспехи и хорошее оружие.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//А если ты выполняешь свою работу хорошо, то можешь рассчитывать на поощрение. Лорд Андрэ дает награду за каждого пойманного преступника.
};


instance DIA_Wulfgar_CanYouTrain(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 4;
	condition = DIA_Wulfgar_CanYouTrain_Condition;
	information = DIA_Wulfgar_CanYouTrain_Info;
	permanent = FALSE;
	description = "Ты можешь обучить меня сражению на мечах?";
};


func int DIA_Wulfgar_CanYouTrain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//Ты можешь обучить меня сражению на мечах?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//По приказу лорда Андрэ мы тренируем всех, кто в состоянии защищать город.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//Впрочем, это не касается наемников. Забудь об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//Но это касается только боевого обучения. Все остальные виды обучения предназначены только для ополчения.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//А ты меч-то можешь удержать?
		AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//Думаю, что да...
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//(вздыхает) Хорошо, ты можешь приступать, когда пожелаешь.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Вульфгар, городской гвардеец, может обучить меня искусству обращения с одноручным и двуручным оружием.");
		Wulfgar_Teach1H = TRUE;
	};
};


instance DIA_Wulfgar_Advantage(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 5;
	condition = DIA_Wulfgar_Advantage_Condition;
	information = DIA_Wulfgar_Advantage_Info;
	permanent = FALSE;
	description = "Каковы преимущества двуручного оружия?";
};


func int DIA_Wulfgar_Advantage_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//Каковы преимущества двуручного оружия?
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//Это просто. С одноручным оружием ты быстрее. Это может стать значительным преимуществом в бою.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//Двуручное оружие более тяжеловесно и замедляет тебя. При сражении им нужно просчитывать свои действия на шаг вперед, но оно наносит больший урон.
};


instance DIA_Wulfgar_HowToBegin(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 6;
	condition = DIA_Wulfgar_HowToBegin_Condition;
	information = DIA_Wulfgar_HowToBegin_Info;
	permanent = FALSE;
	description = "С чего мне лучше начать? С одноручного или двуручного оружия?";
};


func int DIA_Wulfgar_HowToBegin_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_HowToBegin_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_HowToBegin_15_00");	//С чего мне лучше начать? С одноручного или двуручного оружия?
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_01");	//Выбирай сам.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_02");	//Но даже если ты специализируешься только в одном типе оружия, со временем ты начнешь автоматически изучать и другой тип.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_03");	//Если, например, ты хорошо сражаешься одноручным оружием, но все еще новичок в использовании двуручного...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_04");	//...твой навык владения двуручным оружием повышается каждый раз, когда ты тренируешься с одноручным...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_05");	//Правда, в этом случае обучение изматывает сильнее, чем когда ты тренируешься с различным типом оружия по очереди.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_06");	//Тебе нужно просто начать - и ты сам поймешь, о чем я говорю.
};


instance DIA_Wulfgar_Teach(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 7;
	condition = DIA_Wulfgar_Teach_Condition;
	information = DIA_Wulfgar_Teach_Info;
	permanent = TRUE;
	description = "Начнем обучение.";
};


func int DIA_Wulfgar_Teach_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Teach_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Начнем обучение.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//Я не обучаю наемников!
	}
	else
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//Конечно, уважаемый.
		};
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void DIA_Wulfgar_Teach_Back()
{
	Info_ClearChoices(DIA_Wulfgar_Teach);
};

func void DIA_Wulfgar_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,75))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void DIA_Wulfgar_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,75))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void DIA_Wulfgar_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,75))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void DIA_Wulfgar_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,75))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};


instance DIA_Wulfgar_AlsMil(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_AlsMil_Condition;
	information = DIA_Wulfgar_AlsMil_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_AlsMil_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AlsMil_Info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//Значит, лорд Андрэ принял тебя!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//Я надеюсь, ты будешь регулярно тренироваться здесь.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//Руга научит тебя пользоваться арбалетом, а Мортис поможет тебе стать сильнее.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//Но самое важное - это научиться правильно держать свой меч.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//Я еще сделаю из тебя отличного воина!
};


instance DIA_Wulfgar_Bonus(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_Bonus_Condition;
	information = DIA_Wulfgar_Bonus_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_Bonus_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,2,6,54))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bonus_Info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//Ранняя пташка? Я обычно один в это время дня. Но раз уж ты здесь, то можно потренироваться.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//Будь внимательным. Ты можешь обмануть некоторых противников, если уклонишься от удара, а затем атакуешь в правильный момент.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//Помни об этом в своем следующем бою!
	B_RaiseFightTalent(other,NPC_TALENT_1H,2);
};


instance DIA_Wulfgar_PICKPOCKET(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 900;
	condition = DIA_Wulfgar_PICKPOCKET_Condition;
	information = DIA_Wulfgar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Wulfgar_PICKPOCKET_Condition()
{
	return C_Beklauen(58,80);
};

func void DIA_Wulfgar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET,Dialog_Back,DIA_Wulfgar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wulfgar_PICKPOCKET_DoIt);
};

func void DIA_Wulfgar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

func void DIA_Wulfgar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

