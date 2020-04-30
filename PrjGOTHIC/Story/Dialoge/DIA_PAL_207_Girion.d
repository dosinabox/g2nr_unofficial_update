
instance DIA_Girion_EXIT(C_Info)
{
	npc = PAL_207_Girion;
	nr = 999;
	condition = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Girion_Hallo(C_Info)
{
	npc = PAL_207_Girion;
	nr = 2;
	condition = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Girion_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Hallo_Info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//Я Гирион, мастер боя двуручным оружием и паладин короля. По какому поводу ты беспокоишь меня?
};


instance DIA_Girion_CanTeach(C_Info)
{
	npc = PAL_207_Girion;
	nr = 5;
	condition = DIA_Girion_CanTeach_Condition;
	information = DIA_Girion_CanTeach_Info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};


func int DIA_Girion_CanTeach_Condition()
{
	if(Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//Ты можешь обучить меня?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//Это хорошо, что ты хочешь обучиться самому благородному из всех боевых стилей. Как и подобает настоящему воину Инноса.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//Я обучу тебя. Обратись ко мне, когда будешь готов.
		Girion_Teach2H = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Паладин Гирион может обучить меня искусству сражения двуручным оружием.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//Если ты хочешь обучиться чему-нибудь, тебе лучше поискать учителя не из нашего ордена.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//Я воин, а не учитель.
	};
};


var int DIA_Girion_Teach_permanent;

func void B_BuildLearnDialog_Girion()
{
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_Girion_2H)
	{
		Info_ClearChoices(DIA_Girion_Teach);
		Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
		Info_AddChoice(DIA_Girion_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
		Info_AddChoice(DIA_Girion_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_Girion_2H)
		{
			DIA_Morgan_Teacher_permanent = TRUE;
		};
		if(VisibleTalentValue(NPC_TALENT_2H) < 100)
		{
			PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_Girion_2H)),-1,53,FONT_Screen,2);
			AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//Вообще-то говоря, твое обучение еще не завершено, но я больше ничему не могу научить тебя.
			AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//Если ты хочешь отточить свое мастерство еще больше, тебе лучше поискать настоящего мастера меча.
			AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//И где мне найти такого человека?
			AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//Лорд Хаген - мастер-мечник. Он наверняка сможет обучить тебя.
		}
		else
		{
			PrintScreen(PRINT_NoLearnOverMAX,-1,53,FONT_Screen,2);
			B_Say(self,other,"$NOLEARNYOUREBETTER");
		};
		AI_StopProcessInfos(self);
	};
};

func void B_GirionTeachComment()
{
	if(Girion_Labercount == 0)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//Сражайся с честью. Бой - наша жизнь, а что за жизнь без чести?
	}
	else if(Girion_Labercount == 1)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//Будь осторожен и быстр в бою. Удивляй своего противника.
	}
	else if(Girion_Labercount == 2)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//Никогда не вступай в бой неподготовленным. Неизвестно, сколько он будет длиться.
	}
	else if(Girion_Labercount == 3)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//Паладин всегда готов к бою. Но никогда не начинает бой, в котором не может победить.
	}
	else if(Girion_Labercount == 4)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//Паладин сражается не только мечом, но и головой.
	}
	else if(Girion_Labercount == 5)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//Ты должен понимать, когда лучше отступить.
	}
	else if(Girion_Labercount == 6)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//Помни, если ты сражаешься хорошо, ты контролируешь своего противника и не даешь ему шанса контролировать себя.
	}
	else if(Girion_Labercount == 7)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//Отступление - это всегда потеря.
	};
	Girion_Labercount += 1;
	if(Girion_Labercount >= 7)
	{
		Girion_Labercount = 0;
	};
};

instance DIA_Girion_Teach(C_Info)
{
	npc = PAL_207_Girion;
	nr = 100;
	condition = DIA_Girion_Teach_Condition;
	information = DIA_Girion_Teach_Info;
	permanent = TRUE;
	description = "Я готов к обучению.";
};


func int DIA_Girion_Teach_Condition()
{
	if((Girion_Teach2H == TRUE) && (DIA_Girion_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Teach_Info()
{
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//Я готов к обучению.
	B_BuildLearnDialog_Girion();
};

func void DIA_Girion_Teach_Back()
{
	Info_ClearChoices(DIA_Girion_Teach);
};

func void DIA_Girion_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_Girion_2H))
	{
		B_GirionTeachComment();
		B_BuildLearnDialog_Girion();
	};
};

func void DIA_Girion_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_Girion_2H))
	{
		B_GirionTeachComment();
		B_BuildLearnDialog_Girion();
	};
};

instance DIA_Girion_CATCHPLAYERSTOLENSHIP(C_Info)
{
	npc = PAL_207_Girion;
	nr = 5;
	condition = DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information = DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important = TRUE;
};


func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition()
{
	if((Kapitel >= 5) && (MIS_ShipIsFree == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//Эй! Ты можешь сказать мне, что ты делаешь здесь?
	Info_ClearChoices(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Я не знаю, о чем ты говоришь.",DIA_Girion_CATCHPLAYERSTOLENSHIP_no);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Прочь с моей дороги, или мне придется убить тебя.",DIA_Girion_CATCHPLAYERSTOLENSHIP_weg);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Мне нужен этот корабль. Поэтому я забираю его.",DIA_Girion_CATCHPLAYERSTOLENSHIP_ship);
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//Я не знаю, о чем ты говоришь.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//Я говорю о том, что ты сделал с корабельной стражей. Это дело плохо пахнет.
	if((hero.guild == GIL_KDF) && !Npc_IsDead(Schiffswache_212) && !Npc_IsDead(Schiffswache_213))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//Даже несмотря на то, что ты маг, я не доверяю тебе.
	};
};


var int Girion_WantstoKillSC;

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//Прочь с моей дороги, или мне придется убить тебя.
	if(!Npc_IsDead(Schiffswache_212) && !Npc_IsDead(Schiffswache_213))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//Возможно, тебе удалось обмануть охрану корабля, но со мной тебе так просто не справиться, мой маленький друг.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//Даже хотя ты один из нас, это не дает тебе права воровать собственность короля. Умри, проклятый предатель.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Предатель!
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//Когда мы покончим с этим делом, ты вернешь этот корабль обратно мне, понятно?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//Мне нужен этот корабль. Поэтому я забираю его.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//Ты не можешь сделать это. Это транспорт для руды...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//Как ты смеешь?! Ты, вонючее отродье...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//Руды в Долине Рудников недостаточно, чтобы удовлетворить потребности короля. Я был там. Там нечего делать. Миссия Хагена - фарс чистой воды.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//Настоящий враг пустил свои корни на острове неподалеку отсюда. Я поплыву туда и положу конец этому всему.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//Либо присоединяйся ко мне, либо мне придется разделаться с тобой. Выбирай.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//М-м-м. Похоже, у меня нет выбора.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Правильно.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//Ладно, хорошо. Я присоединюсь к тебе, но при одном условии.
	B_GirionStayOnShip();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//Я переживу это.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//Тогда делай то, что должен. А я подожду тебя здесь.
	B_JoinShip(self);
};


instance DIA_Girion_Verrat(C_Info)
{
	npc = PAL_207_Girion;
	nr = 2;
	condition = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_Verrat_Condition()
{
	if(Girion_WantstoKillSC == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Girion_Verrat_Info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Предатель!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Girion_OnShip(C_Info)
{
	npc = PAL_207_Girion;
	nr = 2;
	condition = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_OnShip_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Girion_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos(self);
};


instance DIA_Girion_PICKPOCKET(C_Info)
{
	npc = PAL_207_Girion;
	nr = 900;
	condition = DIA_Girion_PICKPOCKET_Condition;
	information = DIA_Girion_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Girion_PICKPOCKET_Condition()
{
	return C_Beklauen(73,280);
};

func void DIA_Girion_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
	Info_AddChoice(DIA_Girion_PICKPOCKET,Dialog_Back,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};

func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};

