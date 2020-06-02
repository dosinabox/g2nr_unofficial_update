
instance DIA_Carl_EXIT(C_Info)
{
	npc = VLK_461_Carl;
	nr = 999;
	condition = DIA_Carl_EXIT_Condition;
	information = DIA_Carl_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Carl_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Carl_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_CarlSayHallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//Похоже, в городе есть несколько воров, которые крадут у зажиточных граждан.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//Городская стража недавно перевернула портовый квартал вверх дном, но они ничего не нашли.
};


instance DIA_Carl_PICKPOCKET(C_Info)
{
	npc = VLK_461_Carl;
	nr = 900;
	condition = DIA_Carl_PICKPOCKET_Condition;
	information = DIA_Carl_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Carl_PICKPOCKET_Condition()
{
	return C_Beklauen(34,40);
};

func void DIA_Carl_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
	Info_AddChoice(DIA_Carl_PICKPOCKET,Dialog_Back,DIA_Carl_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Carl_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Carl_PICKPOCKET_DoIt);
};

func void DIA_Carl_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};

func void DIA_Carl_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};


instance DIA_Carl_Hallo(C_Info)
{
	npc = VLK_461_Carl;
	nr = 2;
	condition = DIA_Carl_Hallo_Condition;
	information = DIA_Carl_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Carl_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Carl_Hallo_Info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//Что привело тебя в этот бедный район? Что ты ищешь здесь?
	Info_ClearChoices(DIA_Carl_Hallo);
	Info_AddChoice(DIA_Carl_Hallo,"Я заблудился.",DIA_Carl_Hallo_verlaufen);
	Info_AddChoice(DIA_Carl_Hallo,"Я просто брожу, осматриваю окрестности.",DIA_Carl_Hallo_umsehen);
};

func void DIA_Carl_Hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//Я заблудился.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//Тогда смотри, чтобы тебя не ограбили.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

func void DIA_Carl_Hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//Я просто брожу, осматриваю окрестности.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//Ага. Смотри, зазеваешься и лишишься кошелька.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};


instance DIA_Carl_Diebe(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Diebe_Condition;
	information = DIA_Carl_Diebe_Info;
	permanent = FALSE;
	description = "Что ты знаешь о ворах?";
};


func int DIA_Carl_Diebe_Condition()
{
	return TRUE;
};

func void DIA_Carl_Diebe_Info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//Что ты знаешь о ворах?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//Ничего. Но все горожане напуганы и становятся недоверчивыми - особенно к чужакам.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//Смотри, чтобы тебя не застали в чужом доме. У нас этого не любят.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//Да, ты должен сам защищаться от воров. Хорошая дубинка - лучше всего.
};


instance DIA_Carl_Lernen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Lernen_Condition;
	information = DIA_Carl_Lernen_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Carl_Lernen_Condition()
{
	return TRUE;
};

func void DIA_Carl_Lernen_Info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//Ох, я всего лишь кую скобяные изделия и гвозди и чиню различные железяки.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//Но я мало что знаю об изготовлении оружия, чтобы учить тебя этому.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//Если ты хочешь обучиться этому ремеслу, поговори с Гарадом. Он-то уж точно знает, как ковать оружие!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//Но если ты хочешь немного потренировать свои мускулы, тут я могу помочь.
	if(DIA_Kardif_Lernen_permanent == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Карл, кузнец в портовом квартале, может сделать меня сильнее.");
	};
};


instance DIA_Carl_Wieviel(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Wieviel_Condition;
	information = DIA_Carl_Wieviel_Info;
	permanent = FALSE;
	description = "Сколько ты берешь за обучение?";
};


func int DIA_Carl_Wieviel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Carl_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Carl_Wieviel_Info()
{
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//Сколько ты берешь за обучение?
	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//Я слышал, что ты сделал для Эдды. Я буду тренировать тебя бесплатно.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//50 золотых монет - и я помогу тебе стать сильнее.
	};
};


instance DIA_Carl_bezahlen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_bezahlen_Condition;
	information = DIA_Carl_bezahlen_Info;
	permanent = TRUE;
	description = "Я хочу потренироваться с тобой. (заплатить 50 золотых)";
};


func int DIA_Carl_bezahlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Carl_Wieviel) && (Carl_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Carl_bezahlen_Info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//Я хочу потренироваться с тобой.
	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//Я слышал, что ты сделал для Эдды. Я буду тренировать тебя бесплатно.
		Carl_TeachSTR = TRUE;
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//Хорошо, мы можем начать, как только ты будешь готов.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Принеси золото, и я потренирую тебя.
	};
};


instance DIA_Carl_Teach(C_Info)
{
	npc = VLK_461_Carl;
	nr = 7;
	condition = DIA_Carl_Teach_Condition;
	information = DIA_Carl_Teach_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int DIA_Carl_Teach_Condition()
{
	if(Carl_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Carl_Teach_Info()
{
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//Я хочу стать сильнее.
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_Back()
{
	Info_ClearChoices(DIA_Carl_Teach);
};

func void DIA_Carl_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

instance DIA_Carl_RepairNecklace(C_Info)
{
	npc = VLK_461_Carl;
	nr = 8;
	condition = DIA_Carl_RepairNecklace_Condition;
	information = DIA_Carl_RepairNecklace_Info;
	permanent = FALSE;
	description = "Ты можешь чинить драгоценности?";
};


func int DIA_Carl_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		if(!Npc_KnowsInfo(other,DIA_Bennet_ShowInnosEye))
		{
			return TRUE;
		};
	};
};

func void DIA_Carl_RepairNecklace_Info()
{
	DIA_Common_CanYouRepairJewelry();
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//Ох, я всего лишь кую скобяные изделия и гвозди и чиню различные железяки.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};

