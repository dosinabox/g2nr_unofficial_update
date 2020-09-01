
instance DIA_Gorax_Kap1_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap1_EXIT_Condition;
	information = DIA_Gorax_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gorax_Kap1_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_PICKPOCKET(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 888;
	condition = DIA_Gorax_PICKPOCKET_Condition;
	information = DIA_Gorax_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80_Key;
};


func int DIA_Gorax_PICKPOCKET_Condition()
{
//	return C_StealItems(80,Hlp_GetInstanceID(ItKe_KlosterSchatz),0);
	return C_StealItem(80);
};

func void DIA_Gorax_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,Dialog_Back,DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
{
	if(!Npc_HasItems(self,ItKe_KlosterSchatz))
	{
		CreateInvItem(self,ItKe_KlosterSchatz);
	};
//	B_StealItems(80,Hlp_GetInstanceID(ItKe_KlosterSchatz),1);
	B_StealItem(80,Hlp_GetInstanceID(ItKe_KlosterSchatz));
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
};

func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
};


instance DIA_Gorax_HELP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_HELP_Condition;
	information = DIA_Gorax_HELP_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gorax_HELP_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Pedro_Traitor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_HELP_Info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Могу я чем-нибудь помочь тебе?
};


instance DIA_Gorax_GOLD(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_GOLD_Condition;
	information = DIA_Gorax_GOLD_Info;
	permanent = TRUE;
	description = "Я принес целую кучу золота.";
};


var int DIA_Gorax_GOLD_perm;

func int DIA_Gorax_GOLD_Condition()
{
	if((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE) && (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_GOLD_Info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//Я принес целую кучу золота.
	if(Npc_HasItems(other,ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(в предвкушении) Ах! Приношение Инносу. Это очень хорошо, сын мой.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//Я использую твое пожертвование на благо монастыря, как того желает Иннос.
		DIA_Gorax_GOLD_perm = TRUE;
		B_GiveInvItems(other,self,ItMi_Gold,Summe_Kloster);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Что ты сделал с этим золотом? Ты потратил его? Уходи и не возвращайся сюда без золота!
	};
};


instance DIA_Addon_Gorax_DaronsStatue(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Addon_Gorax_DaronsStatue_Condition;
	information = DIA_Addon_Gorax_DaronsStatue_Info;
	permanent = TRUE;
	description = "Вот статуэтка, которую должен был принести в монастырь Дарон.";
};


func int DIA_Addon_Gorax_DaronsStatue_Condition()
{
	if((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE) && (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE))
	{
		return TRUE;
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (MIS_Addon_Daron_GetStatue == LOG_Running) && (LostInnosStatueInMonastery == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//Вот статуэтка, которую должен был принести в монастырь Дарон.
	if(B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1))
	{
		if(other.guild == GIL_NOV)
		{
			AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//(вздыхает) Поистине удивительно то, что такую драгоценность принес в монастырь неопытный послушник.
			AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//Это еще раз доказывает твою устремленность в служении Инносу.
			AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//Я перед тобой в долгу, юный послушник.
			DIA_Gorax_GOLD_perm = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//Это еще раз доказывает твою устремленность в служении Инносу.
		};
		Npc_RemoveInvItem(self,ItMi_LostInnosStatue_Daron);
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron);
		LostInnosStatueInMonastery = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//Статуэтку? Я не вижу никакой статуэтки. Принеси ее мне, и тогда я поверю твоему рассказу.
	};
};


instance DIA_Gorax_SLEEP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 4;
	condition = DIA_Gorax_SLEEP_Condition;
	information = DIA_Gorax_SLEEP_Info;
	description = "Я ищу место, где можно было бы поспать.";
};


func int DIA_Gorax_SLEEP_Condition()
{
	if((DIA_Gorax_GOLD_perm == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Gorax_JOB))
	{
		return TRUE;
	};
};

func void DIA_Gorax_SLEEP_Info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//Я ищу место, где можно было бы поспать.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//Есть одна свободная кровать в следующей комнате. Первая дверь направо, рядом с входом. Ты можешь поспать там.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//Ты можешь сложить свои вещи в один из пустых сундуков.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//И помни - тебе нельзя входить в опочивальни магов. Также без соответствующего разрешения тебе нельзя входить в библиотеку.
};


instance DIA_Gorax_Aufgabe(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe_Condition;
	information = DIA_Gorax_Aufgabe_Info;
	permanent = FALSE;
	description = "У тебя есть какое-нибудь задание для меня?";
};


func int DIA_Gorax_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//У тебя есть какое-нибудь задание для меня?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//Да, послушники хорошо поработали. А тот, кто хорошо работает, должен хорошо питаться.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//Я дам тебе ключ от кладовой. Ты найдешь там баранью колбасу. Раздай ее послушникам - но раздели ее по справедливости!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//А когда закончишь с этим, можешь опять обратиться ко мне.
	CreateInvItems(self,ItKe_KlosterStore,1);
	B_GiveInvItems(self,other,ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_Running;
	Log_CreateTopic(Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxEssen,LOG_Running);
	B_LogEntry(Topic_GoraxEssen,"Мастер Горакс хочет, чтобы я разделил баранью колбасу из кладовой поровну среди послушников. Кроме меня, в монастыре есть еще тринадцать послушников.");
};


instance DIA_Gorax_Wurst(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_Wurst_Condition;
	information = DIA_Gorax_Wurst_Info;
	permanent = TRUE;
	description = "Я раздал колбасу.";
};


func int DIA_Gorax_Wurst_Condition()
{
	if((MIS_GoraxEssen == LOG_Running) && !Mob_HasItems("WURSTTRUHE",ItFo_Schafswurst))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wurst_Info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//Я раздал колбасу.
	if(Wurst_Gegeben >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//И разделил ее по справедливости. Вот, возьми эти свитки исцеления - и возвращайся к своей работе.
		MIS_GoraxEssen = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxEssen);
		B_GiveInvItems(self,other,ItSc_LightHeal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//Да? Я думаю, ты недостаточно ответственно относишься к своей работе.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//Ты либо съел колбасу сам, либо дал кому-нибудь больше, чем ему причитается.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Послушай, так как ты новичок - и только по этой причине - я на первый раз прощаю тебя. Но чтобы больше такого не повторялось, послушник!
		MIS_GoraxEssen = LOG_FAILED;
		B_CheckLog();
	};
};


instance DIA_Gorax_Aufgabe2(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe2_Condition;
	information = DIA_Gorax_Aufgabe2_Info;
	permanent = FALSE;
	description = "У тебя есть еще какое-нибудь поручение для меня?";
};


func int DIA_Gorax_Aufgabe2_Condition()
{
	if(((MIS_GoraxEssen == LOG_SUCCESS) || (MIS_GoraxEssen == LOG_FAILED)) && !Npc_IsDead(Orlan))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe2_Info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//У тебя есть еще какое-нибудь поручение для меня?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Да. Как ты знаешь, мы делаем здесь превосходное вино, и часть его продаем.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Орлан, хозяин трактира 'Мертвая гарпия' заказал солидную партию. Мы договорились на сумму в 240 золотых монет.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Отнеси ему эти бутылки - но смотри, чтобы он не обсчитал тебя.
	CreateInvItems(self,ItFo_Wine,12);
	B_GiveInvItems(self,other,ItFo_Wine,12);
	MIS_GoraxWein = LOG_Running;
	Log_CreateTopic(Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWein,LOG_Running);
	B_LogEntry(Topic_GoraxWein,"Мастер Горакс хочет, чтобы я доставил Орлану, хозяину трактира, двенадцать бутылок вина. Они стоят 240 золотых монет.");
};


instance DIA_Gorax_Orlan(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Orlan_Condition;
	information = DIA_Gorax_Orlan_Info;
	permanent = TRUE;
	description = "Я отнес вино Орлану.";
};


var int DIA_Gorax_Orlan_permanent;

func int DIA_Gorax_Orlan_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_Wein) && (DIA_Gorax_Orlan_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Orlan_Info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//Я отнес вино Орлану.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//И? Ты получил 240 золотых монет?
		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices(DIA_Gorax_Orlan);
		Info_AddChoice(DIA_Gorax_Orlan,"Он надул меня! (отдать 100 монет)",DIA_Gorax_Orlan_100);
		Info_AddChoice(DIA_Gorax_Orlan,"Я принес золото. (отдать 240 монет)",DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//И что ты сделал с этим золотом? Ты потратил его? Уходи и не возвращайся сюда без золота!
	};
};

func void B_Gorax_YouAreUseless()
{
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//Ты совершенно ни на что не способен! Убирайся с глаз моих!
};

func void DIA_Gorax_Orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//Он надул меня!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//Ты продал ему вино дешевле? Ох, нет! И почему я послал ТЕБЯ?!
	B_Gorax_YouAreUseless();
	MIS_GoraxWein = LOG_FAILED;
	Goraxday = Wld_GetDay() + 1;
	Info_ClearChoices(DIA_Gorax_Orlan);
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_Orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//Я принес золото.
	if(B_GiveInvItems(other,self,ItMi_Gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//Превосходно. Ты проявляешь некоторые способности. Вот, возьми в качестве вознаграждения свиток исцеления. А теперь иди и займись каким-нибудь делом.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxWein);
		B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//Но ты уже потратил часть этих денег, да? Ты ничтожество - пшел прочь!
		MIS_GoraxWein = LOG_FAILED;
		Goraxday = Wld_GetDay() + 1;
	};
	Info_ClearChoices(DIA_Gorax_Orlan);
};


/*instance DIA_Gorax_Orlan_TooLate(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Orlan_TooLate_Condition;
	information = DIA_Gorax_Orlan_TooLate_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gorax_Orlan_TooLate_Condition()
{
	if((other.guild == GIL_NOV) && (MIS_GoraxWein == LOG_OBSOLETE))
	{
		return TRUE;
	};

};

func void DIA_Gorax_Orlan_TooLate_Info()
{
	B_Gorax_YouAreUseless();
	Goraxday = Wld_GetDay() + 1;
	AI_StopProcessInfos(self);
};*/


instance DIA_Gorax_JOB(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 35;
	condition = DIA_Gorax_JOB_Condition;
	information = DIA_Gorax_JOB_Info;
	permanent = FALSE;
	description = "А что входит в твои обязанности здесь?";
};


func int DIA_Gorax_JOB_Condition()
{
	return TRUE;
};

func void DIA_Gorax_JOB_Info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//А что входит в твои обязанности здесь?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//Мои обязанности многочисленны и разнообразны. Я не только управляющий, но также и казначей.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//Кроме того, я заведую винным погребом, а также на моих плечах лежит обеспечение монастыря съестными припасами.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//Поэтому, если тебе что-нибудь нужно, ты всегда можешь обратиться ко мне и получить все необходимое - за скромное пожертвование, конечно.
	if(Gorax_Trade == FALSE)
	{
		Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
		B_LogEntry(Topic_KlosterTrader,"Мастер Горакс в монастыре может предоставить мне все, что мне нужно.");
		Gorax_Trade = TRUE;
	};
};


func void B_Gorax_INeedSomething()
{
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//Мне нужно кое-что...
};

instance DIA_Gorax_TRADE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 99;
	condition = DIA_Gorax_TRADE_Condition;
	information = DIA_Gorax_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Мне нужно кое-что...";
};


func int DIA_Gorax_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gorax_JOB) && (Goraxday <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void DIA_Gorax_TRADE_Info()
{
	B_Gorax_INeedSomething();
	B_GiveTradeInv(self);
	if(!Npc_HasItems(self,ItMi_Pliers) && !Npc_HasItems(other,ItMi_Pliers))
	{
		CreateInvItems(self,ItMi_Pliers,1);
	};
	if(Npc_HasItems(self,ItKe_KlosterSchatz))
	{
		Npc_RemoveInvItem(self,ItKe_KlosterSchatz);
	};
	Trade_IsActive = TRUE;
};

/////////////////////////////////////////////////////
instance DIA_Gorax_NOTRADE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 99;
	condition = DIA_Gorax_NOTRADE_Condition;
	information = DIA_Gorax_NOTRADE_Info;
	permanent = TRUE;
	description = "Мне нужно кое-что...";
};


func int DIA_Gorax_NOTRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gorax_JOB) && (Goraxday > Wld_GetDay()) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_NOTRADE_Info()
{
	B_Gorax_INeedSomething();
	B_Gorax_YouAreUseless();
	AI_StopProcessInfos(self);
};

/////////////////////////////////////////////////////
instance DIA_Gorax_KDF(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 5;
	condition = DIA_Gorax_KDF_Condition;
	information = DIA_Gorax_KDF_Info;
	permanent = FALSE;
	description = "Мне нужно место для сна.";
};


func int DIA_Gorax_KDF_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Gorax_JOB))
	{
		return TRUE;
	};
};

func void DIA_Gorax_KDF_Info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//Мне нужно место для сна.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//У нас есть свободная комната справа отсюда. Вот, возьми ключ. Там ты найдешь все, что тебе может понадобиться.
	B_GiveInvItems(self,other,ItKe_KDFPlayer,1);
	Wld_InsertItem(ItPo_Perm_Mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_Gorax_KILLPEDRO(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_KILLPEDRO_Condition;
	information = DIA_Gorax_KILLPEDRO_Info;
	important = TRUE;
};


func int DIA_Gorax_KILLPEDRO_Condition()
{
	if((Pedro_Traitor == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Gorax_KILLPEDRO_Info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Подожди, наемник. Мне нужно поговорить с тобой.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//Чего ты хочешь?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//Монастырю необходимо решить очень деликатную проблему.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//В настоящий момент, похоже, все не доверяют друг другу. И к тому же, этот случай с Педро, это очень... (сглатывает)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//У меня есть поручение для тебя от первосвященников. Ты не являешься членом Братства Огня, и, следовательно, ты единственный, кто может помочь нам в решении этой проблемы.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//Но я должен предупредить тебя. Если я дам тебе это поручение, ты будешь обязан выполнить его. Когда ты узнаешь, в чем оно заключается, у тебя уже не будет выбора. Ты понимаешь это?
	Npc_ExchangeRoutine(self,"Start");
	Info_ClearChoices(DIA_Gorax_KILLPEDRO);
	Info_AddChoice(DIA_Gorax_KILLPEDRO,"Забудь об этом. Это слишком рискованное предприятие для меня.",DIA_Gorax_KILLPEDRO_nein);
	Info_AddChoice(DIA_Gorax_KILLPEDRO,"Скажи мне, чего ты хочешь.",DIA_Gorax_KILLPEDRO_ja);
};

func void DIA_Gorax_KILLPEDRO_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Забудь об этом. Это слишком рискованное предприятие для меня.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//Хорошо, в таком случае, забудь о том, что я говорил.
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_KILLPEDRO_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//Скажи мне, чего ты хочешь.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//Хорошо. Тогда слушай внимательно, дважды повторять я не буду.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Серпентес хочет, чтобы ты убил Педро за его предательство.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//Когда ты выполнишь эту задачу, тебе немедленно будет выдано вознаграждение.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//Я ничего тебе не говорил. И ты ничего не слышал. Понятно?
	B_LogEntry(TOPIC_TraitorPedro,"Горакс сказал мне, что Серпентес хочет, чтобы я убил предателя Педро, если я повстречаюсь с ним.");
	B_GivePlayerXP(XP_Gorax_KILLPEDRO_GotMission);
	MIS_Gorax_KillPedro = LOG_Running;
	AI_StopProcessInfos(self);
};


