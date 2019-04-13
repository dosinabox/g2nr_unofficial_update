
instance DIA_Isgaroth_EXIT(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 999;
	condition = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_EXIT_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_EXIT_01_00");	//Пусть Иннос всегда освещает твой путь.
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Hello(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Isgaroth_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Hello_Info()
{
	AI_Output(self,other,"DIA_Isgaroth_Hello_01_00");	//Да пребудет с тобой Иннос. Что я могу сделать для тебя, странник?
};


instance DIA_Isgaroth_Segen(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 10;
	condition = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent = TRUE;
	description = "Благослови меня!";
};


func int DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_Segen_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Segen_15_00");	//Благослови меня!
	AI_Output(self,other,"DIA_Isgaroth_Segen_01_01");	//Благословляю тебя во имя Инноса. Пусть огонь Всевышнего горит в твоем сердце и дает тебе силы жить согласно его заветам.
	Isgaroth_Segen = TRUE;
};


instance DIA_Isgaroth_Wolf(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent = FALSE;
	description = "Меня послал Сержио ...";
};


func int DIA_Isgaroth_Wolf_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (Sergio_Sends == TRUE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Wolf_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Wolf_15_00");	//Меня послал Сержио. Он поручил мне свои обязанности. Что нужно сделать?
	AI_Output(self,other,"DIA_Isgaroth_Wolf_01_01");	//Здесь недавно появился черный волк. Найди его и убей.
	MIS_IsgarothWolf = LOG_Running;
	B_LogEntry(Topic_IsgarothWolf,"Около алтаря бродит черный волк. Я должен найти его и убить.");
};


instance DIA_Isgaroth_tot(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 2;
	condition = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent = TRUE;
	description = "Я убил волка.";
};


func int DIA_Isgaroth_tot_Condition()
{
	Wolfi = Hlp_GetNpc(BlackWolf);
	if((MIS_IsgarothWolf == LOG_Running) && Npc_IsDead(Wolfi))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_tot_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_tot_15_00");	//Я убил волка.
	AI_Output(self,other,"DIA_Isgaroth_tot_01_01");	//Хорошая работа, послушник. Ты мужественный человек. А теперь возвращайся в монастырь и принимайся за свои обязанности.
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP(XP_IsgarothWolf);
	AI_StopProcessInfos(self);
};


instance DIA_Isgaroth_Job(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 4;
	condition = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Isgaroth_Job_Condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Job_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Isgaroth_Job_01_01");	//Я Маг Огня. Жрец нашего бога Инноса.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_02");	//Этот алтарь посвящен ЕМУ, высшему богу, создателю огня и верховному судье.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_03");	//Ко мне приходят люди, чтобы помолиться Инносу и получить благословение.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_04");	//А за небольшое пожертвование ты можешь получить от меня много полезного.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader,"Мастер Исгарот продает полезные магические предметы в часовне неподалеку от монастыря.");
};


instance DIA_Isgaroth_Trade(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 99;
	condition = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Isgaroth_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Isgaroth_Job))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other,self,"DIA_Isgaroth_Trade_15_00");	//Покажи мне свои товары.
};


instance DIA_Isgaroth_Kloster(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent = FALSE;
	description = "Куда ведет эта дорога?";
};


func int DIA_Isgaroth_Kloster_Condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Kloster_Info()
{
	AI_Output(other,self,"DIA_Isgaroth_Kloster_15_00");	//Куда ведет эта дорога?
	AI_Output(self,other,"DIA_Isgaroth_Kloster_01_01");	//Эта дорога ведет в монастырь Магов Огня. Однако вход в него разрешен только слугам Инноса.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_02");	//Если ты хочешь стать послушником монастыря, ты должен принести овцу и...
		B_Say_Gold(self,other,Summe_Kloster);
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster,"Чтобы стать послушником монастыря Инноса, мне нужна овца и 1000 золотых монет.");
	}
	else
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_03");	//Так как ты уже решил присоединиться к другой группе, вход для тебя закрыт.
	};
};


instance DIA_Isgaroth_Vatras(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 3;
	condition = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent = TRUE;
	description = "Я несу сообщение от Ватраса.";
};


func int DIA_Isgaroth_Vatras_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && ((Npc_HasItems(other,ItWr_VatrasMessage) == 1) || (Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Vatras_Info()
{
	AI_Output(other,self,"DIA_ISgaroth_Vatras_15_00");	//Я несу сообщение от Ватраса.
	AI_Output(self,other,"DIA_Isgaroth_Vatras_01_01");	//Что это за сообщение?
	AI_Output(other,self,"DIA_Isgaroth_Vatras_15_02");	//Это письмо, вот.
	if(Npc_HasItems(other,ItWr_VatrasMessage) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage,1);
		};
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_03");	//Хорошо, ты можешь сказать Ватрасу, что я получил его сообщение.
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_04");	//Возьми эти зелья в качестве награды за свое служение, они наверняка пригодятся тебе.
		CreateInvItems(self,ItPo_Health_02,2);
		B_GiveInvItems(self,other,ItPo_Health_02,2);
		B_GivePlayerXP(XP_Ambient * 2);
	}
	else if(Npc_HasItems(other,ItWr_VatrasMessage_Open) == 1)
	{
		if(B_GiveInvItems(other,self,ItWr_VatrasMessage_Open,1))
		{
			Npc_RemoveInvItems(self,ItWr_VatrasMessage_Open,1);
		};
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_05");	//Печать сломана. О чем ты думал, идиот!
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_06");	//Иди и скажи Ватрасу, что я получил его сообщение.
		AI_StopProcessInfos(self);
	};
	Vatras_Return = TRUE;
};


instance DIA_Isgaroth_PICKPOCKET(C_Info)
{
	npc = KDF_509_Isgaroth;
	nr = 900;
	condition = DIA_Isgaroth_PICKPOCKET_Condition;
	information = DIA_Isgaroth_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Isgaroth_PICKPOCKET_Condition()
{
	return C_Beklauen(48,50);
};

func void DIA_Isgaroth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,Dialog_Back,DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

