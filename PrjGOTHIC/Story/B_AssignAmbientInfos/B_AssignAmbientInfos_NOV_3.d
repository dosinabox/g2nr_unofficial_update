
instance DIA_NOV_3_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_NOV_3_EXIT_Condition;
	information = DIA_NOV_3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_3_Fegen(C_Info)
{
	nr = 2;
	condition = DIA_NOV_3_Fegen_Condition;
	information = DIA_NOV_3_Fegen_Info;
	permanent = TRUE;
	description = "Мне нужна помощь, чтобы подмести кельи послушников.";
};


var int Feger1_Permanent;
var int Feger2_Permanent;

func int DIA_NOV_3_Fegen_Condition()
{
	if((Kapitel == 1) && (MIS_KlosterArbeit == LOG_Running) && (NOV_Helfer < 4))
	{
		return TRUE;
	};
};

func void DIA_NOV_3_Fegen_Info()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_15_00");	//Мне нужна помощь, чтобы подмести кельи послушников.
	if(Hlp_GetInstanceID(Feger1) == Hlp_GetInstanceID(self))
	{
		if((NOV_Helfer < 1) && (Feger1_Permanent == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_01");	//Никто не хочет помогать тебе, да? Хорошо, я помогу тебе, но только ты должен найти еще кого-нибудь мне в пару.
			B_LogEntry(Topic_ParlanFegen,"Послушник, подметающий погреб, поможет мне, если я смогу найти еще одного послушника, готового помочь подмести комнаты.");
		}
		else if((NOV_Helfer >= 1) && (Feger1_Permanent == FALSE))
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_02");	//Я единственный, кто готов помочь тебе?
			AI_Output(other,self,"DIA_NOV_3_Fegen_15_03");	//Нет, я уже нашел помощника.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_04");	//Тогда, за дело!
			NOV_Helfer = NOV_Helfer + 1;
			Feger1_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			B_LogEntry(Topic_ParlanFegen,"Послушник из погреба поможет мне подметать комнаты.");
		}
		else if(Feger1_Permanent == TRUE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_05");	//Послушай, брат, я уже помогаю тебе. Хватит болтать попусту.
		};
	};
	if(Hlp_GetInstanceID(Feger2) == Hlp_GetInstanceID(self))
	{
		if(Feger2_Permanent == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_08");	//Конечно, я помогу. Мы, послушники, должны поддерживать друг друга. Сегодня ты - мне, завтра я - тебе.
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_09");	//Я прошу всего 50 золотых монет, мне нужно заплатить их Парлану.
			B_LogEntry(Topic_ParlanFegen,"Послушник у церкви поможет мне, если я дам ему 50 золотых монет.");
			Info_ClearChoices(DIA_NOV_3_Fegen);
			Info_AddChoice(DIA_NOV_3_Fegen,"Может быть, позже...",DIA_NOV_3_Fegen_Nein);
			if(Npc_HasItems(other,ItMi_Gold) >= 50)
			{
				Info_AddChoice(DIA_NOV_3_Fegen,"Хорошо, я заплачу.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_Fegen_03_06");	//Я же уже согласился. Ты помог мне, я помогу тебе.
		};
	};
	if((Hlp_GetInstanceID(Feger1) != Hlp_GetInstanceID(self)) && (Hlp_GetInstanceID(Feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self,other,"DIA_NOV_3_Fegen_03_07");	//Забудь об этом - у меня нет свободного времени. Поищи кого-нибудь еще.
	};
};

func void DIA_NOV_3_Fegen_Nein()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Nein_15_00");	//Возможно позже, сейчас я не могу позволить себе такие расходы.
	Info_ClearChoices(DIA_NOV_3_Fegen);
};

func void DIA_NOV_3_Fegen_Ja()
{
	AI_Output(other,self,"DIA_NOV_3_Fegen_Ja_15_00");	//Хорошо, я заплачу.
	AI_Output(self,other,"DIA_NOV_3_Fegen_Ja_03_01");	//Хорошо, тогда я готов приступать.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	NOV_Helfer = NOV_Helfer + 1;
	B_GivePlayerXP(XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices(DIA_NOV_3_Fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FEGEN");
	B_LogEntry(Topic_ParlanFegen,"Послушник у церкви поможет мне подметать комнаты.");
};


instance DIA_NOV_3_Wurst(C_Info)
{
	nr = 3;
	condition = DIA_NOV_3_Wurst_Condition;
	information = DIA_NOV_3_Wurst_Info;
	permanent = TRUE;
	description = "Хочешь колбасы?";
};


func int DIA_NOV_3_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NOV_3_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_NOV_3_Wurst_15_00");	//Ты не хочешь колбасы?
	AI_Output(self,other,"DIA_NOV_3_Wurst_03_01");	//Конечно, давай ее сюда. Кто же откажется от такой колбасы.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft,PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
};


instance DIA_NOV_3_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_NOV_3_JOIN_Condition;
	information = DIA_NOV_3_JOIN_Info;
	permanent = TRUE;
	description = "Я хочу стать магом!";
};


func int DIA_NOV_3_JOIN_Condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_NOV_3_JOIN_Info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Я хочу стать магом!
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_01");	//Этого хотят все послушники. Но только немногие из них становятся Избранными и получают шанс быть принятыми в Круг Огня.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_02");	//Стать магом Круга Огня - это высочайшая честь, и ее нужно заслужить.
	AI_Output(self,other,"DIA_NOV_3_JOIN_03_03");	//Ты должен прилежно трудиться, и тогда, возможно, у тебя появится шанс.
};


instance DIA_NOV_3_PEOPLE(C_Info)
{
	nr = 5;
	condition = DIA_NOV_3_PEOPLE_Condition;
	information = DIA_NOV_3_PEOPLE_Info;
	permanent = TRUE;
	description = "Кто возглавляет этот монастырь?";
};


func int DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Кто возглавляет этот монастырь?
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_01");	//Мы, послушники, служим магам Круга Огня. Их, в свою очередь, возглавляет Высший Совет, состоящий из трех самых влиятельных магов.
	AI_Output(self,other,"DIA_NOV_3_PEOPLE_03_02");	//Но за все дела послушников отвечает Парлан. Его всегда можно найти во дворе, он наблюдает за работой послушников.
};


instance DIA_NOV_3_LOCATION(C_Info)
{
	nr = 6;
	condition = DIA_NOV_3_LOCATION_Condition;
	information = DIA_NOV_3_LOCATION_Info;
	permanent = TRUE;
	description = "Что ты можешь сказать мне об этом монастыре?";
};


func int DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_LOCATION_Info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Что ты можешь сказать мне об этом монастыре?
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_01");	//Мы свои трудом добываем хлеб насущный. Мы выращиваем овец и делаем вино.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_02");	//Здесь есть библиотека, но вход в нее разрешен только магам и избранным послушникам.
	AI_Output(self,other,"DIA_NOV_3_LOCATION_03_03");	//Мы же, остальные послушники, следим за тем, чтобы маги Круга Огня ни в чем не нуждались.
};


instance DIA_NOV_3_STANDARD(C_Info)
{
	nr = 10;
	condition = DIA_NOV_3_STANDARD_Condition;
	information = DIA_NOV_3_STANDARD_Info;
	permanent = TRUE;
	description = "Что нового?";
};


func int DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_STANDARD_Info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_01");	//И ты еще спрашиваешь! Да все послушники только о тебе и говорят.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_02");	//Очень редко бывает так, чтобы зеленый новичок вроде тебя был избран в Круг Огня.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_03");	//Скоро опять состоятся выборы. Один из послушников скоро будет принят в Круг Огня.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_04");	//Скоро он приступит к выполнению испытаний.
		};
	};
	if((Kapitel == 2) || (Kapitel == 3))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_05");	//Нашего ордена коснулась грязная лапа Белиара! Зло, должно быть, очень сильно, если оно смогло найти союзников здесь.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_06");	//Педро жил в этом монастыре многие годы. Я думаю, что он слишком много времени проводил за стенами монастыря. Это ослабило его веру и сделало уязвимым для искушений Белиара.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_07");	//Ты пришел как раз вовремя. Сам Иннос не мог бы выбрать лучший момент для твоего появления.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_08");	//Ты войдешь в анналы нашего монастыря как спаситель Глаза.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_09");	//Новости из Долины Рудников очень тревожные. Я думаю, что Иннос специально подвергает нас суровым испытаниям.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_03_10");	//Говорят, что от паладинов, отправившихся в Долину Рудников, нет никаких вестей. Высший Совет лучше знает, что нужно делать.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_11");	//Говорят, что мы должны уничтожить драконов с помощью нашего Владыки. Гнев Инноса испепелит созданий Белиар.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_NOV_3_STANDARD_03_12");	//Слава Инносу, сейчас вроде все успокоилось. Мы должны вернуться на путь нашего Бога - только с его помощью мы можем противостоять злу.
	};
};

func void B_AssignAmbientInfos_NOV_3(var C_Npc slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc = Hlp_GetInstanceID(slf);
};

