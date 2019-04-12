
instance DIA_Thekla_EXIT(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 999;
	condition = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Thekla_HALLO(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 1;
	condition = DIA_Thekla_HALLO_Condition;
	information = DIA_Thekla_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thekla_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//Что ты здесь делаешь, на моей кухне?
};


instance DIA_Thekla_Lecker(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 2;
	condition = DIA_Thekla_Lecker_Condition;
	information = DIA_Thekla_Lecker_Info;
	permanent = FALSE;
	description = "Как у тебя здесь вкусно пахнет!";
};


func int DIA_Thekla_Lecker_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//Как у тебя здесь вкусно пахнет!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//Не подлизывайся! Знаю я таких, как ты, как облупленных! Вон их сколько вокруг бродит!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//Сначала вы пытаетесь подхалимничать, а затем, когда от вас что-то нужно, то никого не найдешь!
};


var int Thekla_GaveStew;

instance DIA_Thekla_Hunger(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 3;
	condition = DIA_Thekla_Hunger_Condition;
	information = DIA_Thekla_Hunger_Info;
	permanent = FALSE;
	description = "Я голоден!";
};


func int DIA_Thekla_Hunger_Condition()
{
	if(Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//Я голоден!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//Я не кормлю бродяг. Я кормлю только тех, кто работает.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//(презрительно) И этот сброд, наемников, конечно.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Вот твоя еда.
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//Мы не обслуживаем здесь ополчение.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//Как я могу отказать служителю Инноса?
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew = TRUE;
	};
};


instance DIA_Thekla_Arbeit(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 4;
	condition = DIA_Thekla_Arbeit_Condition;
	information = DIA_Thekla_Arbeit_Info;
	permanent = FALSE;
	description = "Я ищу работу.";
};


func int DIA_Thekla_Arbeit_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//Я ищу работу...
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//Ты хочешь работать здесь, на ферме?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//Этот вопрос может решить только Онар. Эта ферма его, как и вся долина.
};


instance DIA_Thekla_WannaJoin(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 5;
	condition = DIA_Thekla_WannaJoin_Condition;
	information = DIA_Thekla_WannaJoin_Info;
	permanent = FALSE;
	description = "Вообще-то я планировал присоединиться к наемникам...";
};


func int DIA_Thekla_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//Вообще-то я планировал присоединиться к наемникам...
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//Так ты еще и преступник из колонии?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//Могла бы догадаться! Оставь меня в покое! Здесь вашего брата уже и так хватает!
};


instance DIA_Thekla_Schlafen(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 6;
	condition = DIA_Thekla_Schlafen_Condition;
	information = DIA_Thekla_Schlafen_Info;
	permanent = FALSE;
	description = "Где тут можно поспать?";
};


func int DIA_Thekla_Schlafen_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//Где тут можно поспать?
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//Даже не думай спать в моей кухне. Найди себе место в сарае.
};


instance DIA_Thekla_Problem(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_Problem_Condition;
	information = DIA_Thekla_Problem_Info;
	permanent = FALSE;
	description = "Почему ты не любишь наемников?";
};


func int DIA_Thekla_Problem_Condition()
{
	if((Kapitel <= 3) && Npc_KnowsInfo(other,DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//Почему ты не любишь наемников?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//Эти кретины действуют мне на нервы! Особенно Сильвио и его жирный приятель Буллко.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//Эти двое сидят вон там, в углу, целыми днями напролет и отравляют мне жизнь.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//То суп им слишком горячий, то мясо слишком жесткое, ну и все тому подобное...
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//А почему ты ничего не делаешь с этим?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//А что я могу сделать, мистер Остряк-Самоучка? Врезать им своей скалкой? Да, с фермерами это проходит, но ведь эти ублюдки, недолго думая, ответят мечом!
	};
};


instance DIA_Thekla_Manieren(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_Manieren_Condition;
	information = DIA_Thekla_Manieren_Info;
	permanent = FALSE;
	description = "Хочешь, я научу этих двоих хорошим манерам?";
};


func int DIA_Thekla_Manieren_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Problem) && (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//Хочешь, я научу этих двоих хорошим манерам?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//Тебе лучше не связываться с ними. Как я знаю, у Сильвио магические доспехи. Его нельзя победить.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//А что насчет Буллко?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//Этот парень силен как бык. Пока он легко справлялся со всеми, кто пытался выступить против него или Сильвио.
};


instance DIA_Thekla_AfterFight(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_AfterFight_Condition;
	information = DIA_Thekla_AfterFight_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thekla_AfterFight_Condition()
{
	if((Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) || ((Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (Kapitel <= 3)))
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info()
{
	if(Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//Ты действительно смог выбить дурь из этого Буллко.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//Должно быть, ты очень устал, пока молотил эту жирную свинью.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//Ну что, получил по полной программе?
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//Я же тебя предупреждала! Теперь ты понимаешь, что я имела в виду?
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//Я рад, что доставил этим тебе удовольствие.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//Не расстраивайся так. Ты далеко не первый, кто пострадал от этой сволочи.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//Вот, поешь немного. Это восстановит твои силы.
	B_GiveInvItems(self,other,ItFo_XPStew,1);
	Thekla_GaveStew = TRUE;
};


instance DIA_Thekla_SagittaPaket(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 4;
	condition = DIA_Thekla_SagittaPaket_Condition;
	information = DIA_Thekla_SagittaPaket_Info;
	permanent = TRUE;
	description = "Вот пакет от Сагитты.";
};


func int DIA_Thekla_SagittaPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_TheklasPaket) && (MIS_Thekla_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info()
{
	B_GiveInvItems(other,self,ItMi_TheklasPaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//Вот пакет от Сагитты.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//Огромное спасибо. От тебя есть хоть какая-то польза в отличие от других.
	MIS_Thekla_Paket = LOG_Success;
	B_GivePlayerXP(XP_TheklasPaket);
};


var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;

instance DIA_Thekla_PERM(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 900;
	condition = DIA_Thekla_PERM_Condition;
	information = DIA_Thekla_PERM_Info;
	permanent = TRUE;
	description = "Ты мне не дашь еще своей похлебки?";
};


func int DIA_Thekla_PERM_Condition()
{
	if(Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//Ты мне не дашь еще своей похлебки?
	if(MIS_Thekla_Paket == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//Она закончилась.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//Не осталось даже маленькой миски?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//Нет.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//А могу я облизать горшок, а?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Прекрати!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//Если тебе так понравилась моя похлебка, тебе придется сделать кое-что, чтобы получить ее.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//Что?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//Сходи к Сагитте, знахарке, что живет за фермой Секоба, и принеси мне от нее пакет с травой.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//Если ты принесешь мне эти травы, я сварю похлебку для тебя.
		MIS_Thekla_Paket = LOG_Running;
		CreateInvItems(Sagitta,ItMi_TheklasPaket,1);
		Log_CreateTopic(TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_TheklaEintopf,LOG_Running);
		B_LogEntry(TOPIC_TheklaEintopf,"Если я принесу Текле травы от знахарки Саггиты, она сварит еще одну похлебку для меня. Саггита живет за фермой Секоба.");
	}
	else if(MIS_Thekla_Paket == LOG_Success)
	{
		if(Kapitel <= 2)
		{
			if(Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//Хорошо. Я сжалюсь над тобой. Вот, держи. Не могу смотреть, как ты умираешь от голода у меня на глазах.
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//Эй, эй, эй! Не будь таким жадным! Я дам тебе знать, если у меня найдется еще работа для тебя.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//И ТОГДА ты получишь еще этой похлебки, понятно?
			};
		};
		if((Kapitel == 3) || (Kapitel == 4))
		{
			if((Thekla_MehrEintopfKap3 == FALSE) && (MIS_RescueBennet == LOG_Success))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//Я слышала, ты помог Беннету выбраться из тюрьмы. Отличная работа, парень.
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else if(MIS_RescueBennet != LOG_Success)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//Эти ублюдки из ополчения бросили Беннета за решетку.
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//Окажи мне услугу, вызволи его оттуда, хорошо? А тем временем я сварю для тебя очень вкусную похлебку.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//У меня ничего не осталось. Заходи позже.
			};
		};
		if(Kapitel >= 5)
		{
			if(Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//Ты что, всегда такой голодный? А что ты делал все это время?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//Я прикончил нескольких драконов.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//Ох! Тогда тебе действительно не повредит миска хорошей похлебки.
				B_GiveInvItems(self,other,ItFo_XPStew,1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//Все! Похлебка закончилась.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//Нет трав, нет похлебки - понятно?
	};
};


instance DIA_Thekla_PICKPOCKET(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 900;
	condition = DIA_Thekla_PICKPOCKET_Condition;
	information = DIA_Thekla_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Thekla_PICKPOCKET_Condition()
{
	return C_Beklauen(53,60);
};

func void DIA_Thekla_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
	Info_AddChoice(DIA_Thekla_PICKPOCKET,Dialog_Back,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thekla_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
};

func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
};

