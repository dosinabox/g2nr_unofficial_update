
func void B_DIA_BDT_10XX_Fluechtling_Stimme7()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_07_00");	//Забудь об этом, я не вернусь назад в тюрьму.
};

func void B_DIA_BDT_10XX_Fluechtling_Stimme6()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_06_00");	//Ты же пришел не затем, чтобы вернуть нас назад в тюрьму, правда?
};


instance DIA_BDT_1031_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1031_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1031_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1031_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1031_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1031_Fluechtling_Tip1(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1031_Fluechtling_Tip1_Condition;
	information = DIA_BDT_1031_Fluechtling_Tip1_Info;
	important = TRUE;
};


func int DIA_BDT_1031_Fluechtling_Tip1_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1031_Fluechtling_Tip1_Info()
{
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_07_00");	//Тебе лучше держаться от меня подальше, если не хочешь попасть в тюрьму.
	B_GivePlayerXP(XP_AmbientKap3);
	if(SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices(DIA_BDT_1031_Fluechtling_Tip1);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Я не собираюсь убивать тебя.",DIA_BDT_1031_Fluechtling_Tip1_frei);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Я пришел арестовать тебя.",DIA_BDT_1031_Fluechtling_Tip1_Knast);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Где Моргахард, ваш главарь?",DIA_BDT_1031_Fluechtling_Tip1_Morgahard);
	};
};

func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00");	//Где Моргахард, ваш главарь?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01");	//Мы разделились, чтобы нас не поймали слишком быстро. Понятия не имею, где сейчас остальные.
	Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Жаль. Тогда, пожалуй, мне придется доставить тебя к судье.",DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00");	//Жаль. Тогда, пожалуй, мне придется доставить тебя к судье.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01");	//Хорошо, хорошо. Я думаю, некоторые из нас направились в таверну. Но ты не слышал этого от меня, хорошо?
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Knast()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00");	//Я пришел арестовать тебя.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01");	//Только через мой труп.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_15_00");	//Я не собираюсь убивать тебя.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_07_01");	//Если тебя послал судья, скажи ему, чтобы он отстал от нас.
	Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1,"Так в каком преступлении ты обвиняешься?",DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00");	//Так в каком преступлении ты обвиняешься?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01");	//Это не твое дело.
};


instance DIA_BDT_1031_Fluechtling_PERM(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 3;
	condition = DIA_BDT_1031_Fluechtling_PERM_Condition;
	information = DIA_BDT_1031_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1031_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1031_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1032_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1032_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1032_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1032_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1032_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_Fluechtling_PERM(C_Info)
{
	npc = BDT_1032_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1032_Fluechtling_PERM_Condition;
	information = DIA_BDT_1032_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1032_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1032_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1033_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1033_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1033_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1033_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1033_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_Fluechtling_Tip2(C_Info)
{
	npc = BDT_1033_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1033_Fluechtling_Tip2_Condition;
	information = DIA_BDT_1033_Fluechtling_Tip2_Info;
	important = TRUE;
};


func int DIA_BDT_1033_Fluechtling_Tip2_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1033_Fluechtling_Tip2_Info()
{
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_07_00");	//(испуганно) Что тебе нужно от меня?
	B_GivePlayerXP(XP_AmbientKap3);
	if(SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices(DIA_BDT_1033_Fluechtling_Tip2);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2,"Расслабься. Я просто хочу поговорить.",DIA_BDT_1033_Fluechtling_Tip2_frei);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2,"Меня послал судья, чтобы я вернул тебя назад.",DIA_BDT_1033_Fluechtling_Tip2_Knast);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2,"Где Моргахард, ваш главарь?",DIA_BDT_1033_Fluechtling_Tip2_Morgahard);
	};
};

func void DIA_BDT_1033_Fluechtling_Tip2_Morgahard()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00");	//Где Моргахард, ваш главарь?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01");	//(испуганно) Мне не нужны проблемы. Иди к лендлорду. Он хотел спрятаться среди наемников. А меня оставь в покое.
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1033_Fluechtling_Tip2_Knast()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00");	//Меня послал судья, чтобы я вернул тебя назад.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01");	//(вопит) НЕЕТ!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_15_00");	//Расслабься. Я просто хочу поговорить.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_07_01");	//Но я не хочу говорить с тобой. Проваливай!
	Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2,"Ты ведь до смерти испуган, разве нет?",DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00");	//Ты ведь напуган до смерти, нет?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01");	//Тебе легко говорить. Тебя не ждет виселица, если тебя поймают.
};


instance DIA_BDT_1033_Fluechtling_PERM(C_Info)
{
	npc = BDT_1033_Fluechtling;
	nr = 3;
	condition = DIA_BDT_1033_Fluechtling_PERM_Condition;
	information = DIA_BDT_1033_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1033_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1033_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1034_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1034_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1034_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1034_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1034_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_Fluechtling_PERM(C_Info)
{
	npc = BDT_1034_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1034_Fluechtling_PERM_Condition;
	information = DIA_BDT_1034_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1034_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1034_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1035_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1035_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1035_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1035_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1035_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_Fluechtling_PERM(C_Info)
{
	npc = BDT_1035_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1035_Fluechtling_PERM_Condition;
	information = DIA_BDT_1035_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1035_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1035_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};

