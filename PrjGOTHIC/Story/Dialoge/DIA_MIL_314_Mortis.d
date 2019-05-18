
instance DIA_Mortis_EXIT(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 999;
	condition = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mortis_Hallo(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Hallo_Condition;
	information = DIA_Mortis_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Mortis_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Hallo_Info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//Что тебе нужно? Пека здесь нет. А без него ты ничего не получишь. Заходи позже.
};


instance DIA_Mortis_Waffe(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 3;
	condition = DIA_Mortis_Waffe_Condition;
	information = DIA_Mortis_Waffe_Info;
	permanent = FALSE;
	description = "А где Пек?";
};


func int DIA_Mortis_Waffe_Condition()
{
	if((MIS_Andre_Peck == LOG_Running) && !Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Waffe_Info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//А где Пек?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//Ты только что вступил в наши ряды? Ну, тогда добро пожаловать.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//Пек ушел в город уже давно. Готов поспорить, что он обхаживает Ваню в Красном Фонаре.
};


instance DIA_Mortis_Paket(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 4;
	condition = DIA_Mortis_Paket_Condition;
	information = DIA_Mortis_Paket_Info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь о тюке травки?";
};


func int DIA_Mortis_Paket_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Paket_Info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//Ты что-нибудь знаешь о тюке травки?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//Хм... последний раз, когда я был в портовом кабаке, я слышал, как Кардиф говорил об этом с каким-то парнем.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//Что это за парень?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//Понятия не имею. Но он сказал, что нашел отличное место для хранения травы - а затем они долго ржали как пьяные орки.
	B_LogEntry(TOPIC_Warehouse,"Мортис слышал, как трактирщик Кардиф и кто-то еще разговаривали о тюке в портовой таверне. Они обсуждали, где лучше хранить его.");
};


instance DIA_Mortis_Redlight(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 5;
	condition = DIA_Mortis_Redlight_Condition;
	information = DIA_Mortis_Redlight_Info;
	permanent = FALSE;
	description = "Я хочу найти того, кто продает болотную траву.";
};


func int DIA_Mortis_Redlight_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Redlight_Info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//Ты хорошо знаешь портовый квартал? Я хочу найти того, кто продает болотную траву.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//Ну-у... Народ там не особенно разговорчивый, и они уж точно ничего не скажут городскому стражнику.
	};
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//Если ты хочешь разузнать что-либо там, тебе лучше... нет, ты ДОЛЖЕН снять свои доспехи.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//Хорошо, а что дальше?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//Кабак и бордель - вероятно, самые лучшие места для поисков. Если тебе вообще удастся что-либо узнать, то ты узнаешь это там.
	B_LogEntry(TOPIC_Redlight,"Мортис полагает, что если я хочу купить болотную траву в портовом квартале, мне лучше снять свои доспехи. Лучше всего попытать счастья в таверне или борделе.");
};


instance DIA_Mortis_CanTeach(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 6;
	condition = DIA_Mortis_CanTeach_Condition;
	information = DIA_Mortis_CanTeach_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int DIA_Mortis_CanTeach_Condition()
{
	if(Mortis_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//Я хочу стать сильнее.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//Понятно. Если у тебя достаточно опыта, я могу потренировать тебя.
		if(!Npc_KnowsInfo(other,DIA_Wulfgar_AlsMil))
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			B_LogEntry(TOPIC_CityTeacher,"Ополченец Мортис может помочь мне повысить мою силу.");
		};
		Mortis_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//Конечно, хочешь. Но пока ты не станешь одним из нас или паладином, я не буду помогать тебе.
	};
};


instance DIA_Mortis_Teach(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 100;
	condition = DIA_Mortis_Teach_Condition;
	information = DIA_Mortis_Teach_Info;
	permanent = TRUE;
//	description = "Я хочу стать сильнее.";
	description = "Начнем обучение.";
};


func int DIA_Mortis_Teach_Condition()
{
	if(Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Teach_Info()
{
//	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//Я хочу стать сильнее.
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Начнем обучение.
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_BACK()
{
//	if(other.attribute[ATR_STRENGTH] >= T_LOW)
	if(other.aivar[REAL_STRENGTH] >= 150)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//Ты и так достаточно силен. Если же ты стремишься к большему, найди себе другого учителя.
	};
	Info_ClearChoices(DIA_Mortis_Teach);
};

func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,150);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,150);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};


instance DIA_Mortis_PICKPOCKET(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 900;
	condition = DIA_Mortis_PICKPOCKET_Condition;
	information = DIA_Mortis_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Mortis_PICKPOCKET_Condition()
{
	return C_Beklauen(38,60);
};

func void DIA_Mortis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,Dialog_Back,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

instance DIA_Mortis_RepairNecklace(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 8;
	condition = DIA_Mortis_RepairNecklace_Condition;
	information = DIA_Mortis_RepairNecklace_Info;
	permanent = FALSE;
	description = "Ты можешь чинить драгоценности?";
};


func int DIA_Mortis_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		if(!Npc_KnowsInfo(other,DIA_Bennet_ShowInnosEye))
		{
			return TRUE;
		};
	};
};

func void DIA_Mortis_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Ты можешь чинить драгоценности?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Ах, оставь меня в покое!
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	AI_StopProcessInfos(self);
};

