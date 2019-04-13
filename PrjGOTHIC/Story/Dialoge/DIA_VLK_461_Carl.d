
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
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//ѕохоже, в городе есть несколько воров, которые крадут у зажиточных горожан.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//√ородска€ стража недавно перевернула портовый квартал вверх дном, но они ничего не нашли.
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
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//„то привело теб€ в этот бедный район? „то ты ищешь здесь?
	Info_ClearChoices(DIA_Carl_Hallo);
	Info_AddChoice(DIA_Carl_Hallo,"я заблудилс€.",DIA_Carl_Hallo_verlaufen);
	Info_AddChoice(DIA_Carl_Hallo,"я просто брожу, осматриваю окрестности.",DIA_Carl_Hallo_umsehen);
};

func void DIA_Carl_Hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//я заблудилс€.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//“огда смотри, чтобы теб€ не ограбили.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

func void DIA_Carl_Hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//я просто брожу, осматриваю окрестности.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//јга. —мотри, зазеваешьс€ и лишишьс€ кошелька.
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
	description = "„то ты знаешь о ворах?";
};


func int DIA_Carl_Diebe_Condition()
{
	return TRUE;
};

func void DIA_Carl_Diebe_Info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//„то ты знаешь о ворах?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//Ќичего. Ќо все горожане напуганы и станов€тс€ недоверчивыми - особенно к чужакам.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//—мотри, чтобы теб€ не застали в чужом доме. ” нас этого не люб€т.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//ƒа, ты должен сам защищатьс€ от воров. ’ороша€ дубинка - лучше всего.
};


instance DIA_Carl_Lernen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Lernen_Condition;
	information = DIA_Carl_Lernen_Info;
	permanent = FALSE;
	description = "“ы можешь научить мен€ чему-нибудь?";
};


func int DIA_Carl_Lernen_Condition()
{
	return TRUE;
};

func void DIA_Carl_Lernen_Info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//“ы можешь научить мен€ чему-нибудь?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//ќх, € всего лишь кую скоб€ные издели€ и гвозди и чиню различные желез€ки.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//Ќо € мало что знаю об изготовлении оружи€, чтобы учить теб€ этому.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//≈сли ты хочешь обучитьс€ этому ремеслу, поговори с √арадом. ќн-то уж точно знает, как ковать оружие!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//Ќо если ты хочешь немного потренировать свои мускулы, тут € могу помочь.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher," арл, кузнец в портовом квартале, может сделать мен€ сильнее.");
};


instance DIA_Carl_Wieviel(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Wieviel_Condition;
	information = DIA_Carl_Wieviel_Info;
	permanent = FALSE;
	description = "—колько ты берешь за обучение?";
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
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//—колько ты берешь за обучение?
	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//я слышал, что ты сделал дл€ Ёдды. я буду тренировать теб€ бесплатно.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//50 золотых монет - и € помогу тебе стать сильнее.
	};
};


instance DIA_Carl_bezahlen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_bezahlen_Condition;
	information = DIA_Carl_bezahlen_Info;
	permanent = TRUE;
	description = "я хочу потренироватьс€ с тобой. (заплатить 50 золотых).";
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
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//я хочу потренироватьс€ с тобой.
	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//я слышал, что ты сделал дл€ Ёдды. я буду тренировать теб€ бесплатно.
		Carl_TeachSTR = TRUE;
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//’орошо, мы можем начать, как только ты будешь готов.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//ѕринеси золото, и € потренирую теб€.
	};
};


instance DIA_Carl_Teach(C_Info)
{
	npc = VLK_461_Carl;
	nr = 7;
	condition = DIA_Carl_Teach_Condition;
	information = DIA_Carl_Teach_Info;
	permanent = TRUE;
	description = "я хочу стать сильнее.";
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
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//я хочу стать сильнее.
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

