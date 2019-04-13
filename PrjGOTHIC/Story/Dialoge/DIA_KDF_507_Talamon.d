
instance DIA_Talamon_KAP1_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP1_EXIT_Condition;
	information = DIA_Talamon_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string KDF_507_Checkpoint = "NW_MONASTERY_SEALROOM_01";

instance DIA_KDF_507_Talamon_FirstWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 1;
	condition = DIA_KDF_507_Talamon_FirstWarn_Condition;
	information = DIA_KDF_507_Talamon_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_FirstWarn_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_KDF_507_Talamon_FirstWarn_04_00");	//Тебе нельзя идти дальше. Поворачивай назад!
	AI_StopProcessInfos(self);
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_KDF_507_Talamon_SecondWarn(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 2;
	condition = DIA_KDF_507_Talamon_SecondWarn_Condition;
	information = DIA_KDF_507_Talamon_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_SecondWarn_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,KDF_507_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_KDF_507_Talamon_SecondWarn_04_00");	//Иннос обратит свой гнев против тебя, если ты не повернешь назад!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_KDF_507_Talamon_Attack(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 3;
	condition = DIA_KDF_507_Talamon_Attack_Condition;
	information = DIA_KDF_507_Talamon_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_KDF_507_Talamon_Attack_Condition()
{
	if((Pyrokar_LetYouPassTalamon == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,KDF_507_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Talamon_KAP2_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP2_EXIT_Condition;
	information = DIA_Talamon_KAP2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talamon_KAP3_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP3_EXIT_Condition;
	information = DIA_Talamon_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talamon_KAP4_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP4_EXIT_Condition;
	information = DIA_Talamon_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talamon_KAP5_Stop(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 50;
	condition = DIA_Talamon_KAP5_Stop_Condition;
	information = DIA_Talamon_KAP5_Stop_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Talamon_KAP5_Stop_Condition()
{
	if(Pyrokar_LetYouPassTalamon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_Stop_Info()
{
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_00");	//Тебе нельзя идти дальше. Поворачивай назад!
	AI_Output(other,self,"DIA_Talamon_KAP5_Stop_15_01");	//Пирокар сказал, что мне можно взять книгу Ксардаса.
	AI_Output(self,other,"DIA_Talamon_KAP5_Stop_04_02");	//Ну, если он это сказал... Хорошо, ты можешь войти. Книга, которую ты ищешь, находится вон там, на алхимическом столе.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Таламон держал книгу Ксардаса на алхимическом столе в подвале.");
};


instance DIA_Talamon_FoundSecretDoor(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_FoundSecretDoor_Condition;
	information = DIA_Talamon_FoundSecretDoor_Info;
	permanent = FALSE;
	description = "Я нашел секретную дверь.";
};


func int DIA_Talamon_FoundSecretDoor_Condition()
{
	if(SecretLibraryIsOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_FoundSecretDoor_Info()
{
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_00");	//Я нашел секретную дверь.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_01");	//(удивленно) Что? Где?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_02");	//За книжной полкой.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_03");	//А что за дверью?
	AI_Output(other,self,"DIA_Talamon_FoundSecretDoor_15_04");	//Похоже, там старый подвал.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_05");	//Это важная новость, я должен немедленно сообщить об этом Пирокару.
	AI_Output(self,other,"DIA_Talamon_FoundSecretDoor_04_06");	//А пока ты должен выяснить, что там в этом подвале.
	MIS_ScoutLibrary = LOG_Running;
};


instance DIA_Talamon_ScoutSecretLibrary(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 51;
	condition = DIA_Talamon_ScoutSecretLibrary_Condition;
	information = DIA_Talamon_ScoutSecretLibrary_Info;
	permanent = TRUE;
	description = "Я был в этом подвале.";
};


func int DIA_Talamon_ScoutSecretLibrary_Condition()
{
	if((MIS_ScoutLibrary == LOG_Running) && (HeroWasInLibrary == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talamon_ScoutSecretLibrary_Info()
{
	AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_00");	//Я был в этом подвале.
	AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_01");	//И что ты там нашел?
	if(Npc_IsDead(SecretLibrarySkeleton))
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_02");	//Там был скелет воина, охраняющий дверь. Я убил его.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_03");	//Отлично.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_04");	//Мы разберемся с этим подвалом, когда победим Зло.
		MIS_ScoutLibrary = LOG_SUCCESS;
		B_GivePlayerXP(XP_ScoutSecretLibrary);
	}
	else
	{
		AI_Output(other,self,"DIA_Talamon_ScoutSecretLibrary_15_05");	//Там, внизу, толпы монстров.
		AI_Output(self,other,"DIA_Talamon_ScoutSecretLibrary_04_06");	//Там должно что-то быть, продолжай искать. И уничтожай этих монстров без всякой жалости.
	};
};


instance DIA_Talamon_KAP5_EXIT(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 999;
	condition = DIA_Talamon_KAP5_EXIT_Condition;
	information = DIA_Talamon_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talamon_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talamon_PICKPOCKET(C_Info)
{
	npc = KDF_507_Talamon;
	nr = 900;
	condition = DIA_Talamon_PICKPOCKET_Condition;
	information = DIA_Talamon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Talamon_PICKPOCKET_Condition()
{
	return C_Beklauen(87,140);
};

func void DIA_Talamon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,Dialog_Back,DIA_Talamon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talamon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talamon_PICKPOCKET_DoIt);
};

func void DIA_Talamon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};

func void DIA_Talamon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};

