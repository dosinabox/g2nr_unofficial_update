
instance DIA_Marcos_EXIT(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 999;
	condition = DIA_Marcos_EXIT_Condition;
	information = DIA_Marcos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Marcos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marcos_Hallo(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Hallo_Condition;
	information = DIA_Marcos_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Marcos_Hallo_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Marcos_Hallo_Info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//СТОЙ - во имя Инноса! Я Маркос, паладин короля. Говори, что тебе нужно, и говори правду!
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//Избранный Инноса всегда говорит правду.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//Прошу простить меня, о, преподобный маг. Я не понял сразу, с кем я говорю.
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//Да, ничего, все нормально.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//Если мне будет позволено спросить - что привело тебя сюда?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//Расслабься, я состою на службе у лорда Хагена.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//Ты один из его людей. Какие задачи привели тебя сюда?
	}
	else
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//Расслабься, мы работаем на одного хозяина - лорда Хагена.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//С каких это пор лорд Хаген стал нанимать наемников? Говори, что тебе нужно здесь?
	};
};


instance DIA_Marcos_Hagen(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Hagen_Condition;
	information = DIA_Marcos_Hagen_Info;
	permanent = FALSE;
	description = "Я должен доставить лорду Хагену доказательства существования драконов.";
};


func int DIA_Marcos_Hagen_Condition()
{
	if((Kapitel == 2) && (Garond.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Hagen_Info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//Я должен доставить лорду Хагену доказательства существования драконов.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//Тогда ты не должен терять времени и рисковать своей жизнью понапрасну.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//Ты думаешь, ты сможешь найти здесь драконью чешуйку и отнести ему?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//Попробуй добраться до замка и поговорить с командующим Гарондом.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//Он должен узнать, что ты выполняешь задание лорда Хагена! Он найдет способ помочь тебе.
};


instance DIA_Marcos_Garond(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Garond_Condition;
	information = DIA_Marcos_Garond_Info;
	permanent = FALSE;
	description = "Я пришел от Гаронда ...";
};


func int DIA_Marcos_Garond_Condition()
{
	if((Kapitel == 2) && (MIS_OLDWORLD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Garond_Info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//Я пришел от Гаронда - он хочет знать, какое количество руды готово к транспортировке.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//Скажи Гаронду, что мне пришлось оставить шахту, так как нападения орков стали слишком частыми.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//Я попытался добраться до замка с оставшимися людьми, но в конце концов я единственный остался в живых.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//Я спрятал руду в безопасном месте. Там ЧЕТЫРЕ ящика. Иди к Гаронду и доложи ему об этом.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//Скажи ему, что я буду охранять руду, пока жив. Но я не знаю, сколько времени пройдет, прежде чем орки найдут меня здесь.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//Скажи ему, чтобы прислал подкрепление.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//Я дам ему знать.
	B_LogEntry(TOPIC_ScoutMine,"Паладин Маркос охраняет ЧЕТЫРЕ ящика в небольшой долине.");
	Log_CreateTopic(Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus(Topic_MarcosJungs,LOG_Running);
	B_LogEntry(Topic_MarcosJungs,"Маркос хочет, чтобы Гаронд послал ему подмогу.");
	MIS_Marcos_Jungs = LOG_Running;
	Marcos_Ore = TRUE;
	self.flags = 0;
};


instance DIA_Marcos_Perm(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 9;
	condition = DIA_Marcos_Perm_Condition;
	information = DIA_Marcos_Perm_Info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int DIA_Marcos_Perm_Condition()
{
	if((Kapitel >= 2) && (Npc_KnowsInfo(other,DIA_Marcos_Hagen) || Npc_KnowsInfo(other,DIA_Marcos_Garond)))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Perm_Info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//Как обстановка?
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//Мне очень нужны лечебные зелья!
		B_UseItem(self,ItPo_Health_03);
	}
	else if(MIS_Marcos_Jungs == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//Я выдержу, и я надеюсь, что Гаронд скоро пришлет подкрепление.
	}
	else if(MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//Спасибо тебе за помощь. Иннос даст нам силы и поможет нам продержаться.
		if(Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//Я держусь, потому что со мной Иннос!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Marcos_PICKPOCKET(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 900;
	condition = DIA_Marcos_PICKPOCKET_Condition;
	information = DIA_Marcos_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Marcos_PICKPOCKET_Condition()
{
	return C_Beklauen(65,380);
};

func void DIA_Marcos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
	Info_AddChoice(DIA_Marcos_PICKPOCKET,Dialog_Back,DIA_Marcos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marcos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Marcos_PICKPOCKET_DoIt);
};

func void DIA_Marcos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
};

func void DIA_Marcos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marcos_PICKPOCKET);
};

