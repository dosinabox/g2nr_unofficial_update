
instance DIA_Angar_DI_EXIT(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 999;
	condition = DIA_Angar_DI_EXIT_Condition;
	information = DIA_Angar_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_DI_HALLO(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 10;
	condition = DIA_Angar_DI_HALLO_Condition;
	information = DIA_Angar_DI_HALLO_Info;
	permanent = TRUE;
	description = "Как ты?";
};


func int DIA_Angar_DI_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Angar_DI_HALLO_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_HALLO_15_00");	//Как ты?
	if(!Npc_IsDead(UndeadDragon))
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_01");	//Головные боли стали совсем невыносимыми.
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_02");	//Черт. Это когда-нибудь должно кончиться.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_03");	//Не волнуйся обо мне. Нужно выбираться отсюда.
	};
};


instance DIA_Angar_DI_ORKS(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_ORKS_Condition;
	information = DIA_Angar_DI_ORKS_Info;
	important = TRUE;
};


func int DIA_Angar_DI_ORKS_Condition()
{
	if((OrkSturmDI == TRUE) && !Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_ORKS_Info()
{
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_00");	//Тебе, черт возьми, лучше поторопиться. Следующая атака орков может стоить нам жизней.
	AI_Output(other,self,"DIA_Angar_DI_ORKS_15_01");	//Я делаю, что могу.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_02");	//Этого недостаточно.
	Info_ClearChoices(DIA_Angar_DI_ORKS);
	Info_AddChoice(DIA_Angar_DI_ORKS,"Расслабься.",DIA_Angar_DI_ORKS_no);
	Info_AddChoice(DIA_Angar_DI_ORKS,"Так помоги мне и прекрати скулить.",DIA_Angar_DI_ORKS_follow);
};

func void DIA_Angar_DI_ORKS_follow()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_follow_15_00");	//Так помоги мне и прекрати скулить.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_follow_04_01");	//Хорошо. Но ты пойдешь первым. Вперед!
	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_AmbientKap6);
	Npc_ExchangeRoutine(self,"FollowDI");
	Angar_DI_Party = LOG_Running;
};

func void DIA_Angar_DI_ORKS_no()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_no_15_00");	//Расслабься.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_no_04_01");	//Тебе легко говорить. А я здесь вот-вот сойду с ума.
	AI_StopProcessInfos(self);
};


func void B_AngarStays()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_00");	//Оставайся на месте.
	if(Npc_GetDistToWP(self,"SKELETTE") < 4000)
	{
		AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_01");	//Об остальном я сам позабочусь.
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_02");	//Удачи.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FireDragonIsland");
		if(Angar_DI_Party != LOG_SUCCESS)
		{
			B_GivePlayerXP(XP_AmbientKap6);
			Angar_DI_Party = LOG_SUCCESS;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_03");	//Конечно.
		AI_StopProcessInfos(self);
		if(Npc_GetDistToWP(self,"SHIP") < 10000)
		{
			Npc_ExchangeRoutine(self,"Start");
		}
		else if(Npc_IsDead(FireDragonIsland))
		{
			Npc_ExchangeRoutine(self,"FireDragonIsland");
		}
		else if(Npc_IsDead(AntiPaladin_DI))
		{
			Npc_ExchangeRoutine(self,"ORKOBERST_DI");
		}
		else if(Npc_IsDead(Troll_DI))
		{
			Npc_ExchangeRoutine(self,"Troll_DI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
		Angar_DI_Party = LOG_OBSOLETE;
	};
};


instance DIA_Angar_DI_FOLLOW(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOW_Condition;
	information = DIA_Angar_DI_FOLLOW_Info;
	permanent = TRUE;
	description = "Оставайся на месте.";
};


func int DIA_Angar_DI_FOLLOW_Condition()
{
	if(Angar_DI_Party == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOW_Info()
{
	B_AngarStays();
};


instance DIA_Angar_DI_FOLLOWAGAIN(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOWAGAIN_Condition;
	information = DIA_Angar_DI_FOLLOWAGAIN_Info;
	permanent = TRUE;
	description = "Иди за мной.";
};


func int DIA_Angar_DI_FOLLOWAGAIN_Condition()
{
	if(Angar_DI_Party == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWAGAIN_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOWAGAIN_15_00");	//Иди за мной.
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWAGAIN_04_01");	//Ты идешь первым.
	Angar_DI_Party = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowDI");
};


instance DIA_Angar_DI_FOLLOWSTOP(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 5;
	condition = DIA_Angar_DI_FOLLOWSTOP_Condition;
	information = DIA_Angar_DI_FOLLOWSTOP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Angar_DI_FOLLOWSTOP_Condition()
{
	if((Angar_DI_Party == LOG_Running) && (((Npc_GetDistToWP(self,"DI_DRACONIANAREA_FIREDRAGON") < 3000) && !Npc_IsDead(FireDragonIsland)) || (Npc_GetDistToWP(self,"SKELETTE") < 3000)))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOLLOWSTOP_Info()
{
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWSTOP_04_00");	//Аааа! Эта головная боль сведет меня с ума!
	B_AngarStays();
};


instance DIA_Angar_DI_UNDEADDRGDEAD(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 2;
	condition = DIA_Angar_DI_UNDEADDRGDEAD_Condition;
	information = DIA_Angar_DI_UNDEADDRGDEAD_Info;
	description = "Все кончено.";
};


func int DIA_Angar_DI_UNDEADDRGDEAD_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_00");	//Все кончено.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_01");	//Можем мы, наконец, выбираться отсюда?
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_02");	//Да. Враг повержен.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_03");	//Тогда не будем терять времени. Иди к капитану и скажи ему, чтобы он поднимал якорь.
//	if(SC_KnowsMadPsi == TRUE)
	if(Angar_KnowsMadPsi == TRUE)
	{
		AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_04");	//Надеюсь, больше никого из членов твоей секты не осталось в живых.
		AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_05");	//Все может быть. Ищущие были очень сильны. Они даже меня чуть не поработили. Кто знает?
	};
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_06");	//Что ты будешь делать дальше?
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_07");	//Может быть, я осяду где-нибудь и стану фермером. Я устал от сражений.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Angar_DI_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 900;
	condition = DIA_Angar_DI_PICKPOCKET_Condition;
	information = DIA_Angar_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Angar_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(47,45);
};

func void DIA_Angar_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
	Info_AddChoice(DIA_Angar_DI_PICKPOCKET,Dialog_Back,DIA_Angar_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_DI_PICKPOCKET_DoIt);
};

func void DIA_Angar_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
};

func void DIA_Angar_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_DI_PICKPOCKET);
};


instance DIA_Angar_DI_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 7;
	condition = DIA_Angar_DI_FOUNDAMULETT_Condition;
	information = DIA_Angar_DI_FOUNDAMULETT_Info;
	description = "Я нашел твой амулет.";
};


func int DIA_Angar_DI_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && (SC_KnowsAngarsAmulett == TRUE) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DI_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
	DIA_Angar_FOUNDAMULETT_besonders();
};


instance DIA_Angar_SCTellsAngarAboutMadPsi2_DI(C_Info)
{
	npc = DJG_705_Angar_DI;
	nr = 8;
	condition = DIA_Angar_SCTellsAngarAboutMadPsi2_DI_Condition;
	information = DIA_Angar_SCTellsAngarAboutMadPsi2_DI_Info;
	description = "Братство Спящего было порабощено Злом.";
};


func int DIA_Angar_SCTellsAngarAboutMadPsi2_DI_Condition()
{
	if((SC_KnowsMadPsi == TRUE) && (Angar_KnowsMadPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_DI_Info()
{
	B_SCTellsAngarAboutMadPsi();
	B_SCTellsAngarAboutMadPsi2();
};

