
instance DIA_Bodo_EXIT(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 999;
	condition = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bodo_Hallo(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 1;
	condition = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//Как дела?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//Ополчение достаточно попило нашей крови. Теперь, когда на нашей стороне наемники, они не осмелятся даже показаться здесь.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//Король, вероятно, думает, что может позволить себе все. Но мы больше не будем терпеть это!
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//Хорошо. Если увидишь ополчение, задай им хорошую трепку.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Хорошо. Да пребудет с тобой Иннос.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//Королевских солдат не любят на этой ферме.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//Многие здесь, возможно не откажутся поговорить с тобой, но популярность себе ты вряд ли завоюешь.
	};
};


instance DIA_Bodo_Bauernaufstand(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 2;
	condition = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent = FALSE;
	description = "В городе говорят о восстании фермеров!";
};


func int DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//В городе говорят о восстании фермеров!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//Чушь. Мы не делаем ничего такого. Только защищаем то, что заработали тяжелым трудом.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//Воистину правда, что войны выигрываются на спинах крестьян. Но Онар больше не собирается просто стоять и смотреть, как король пьет нашу кровь.
};


instance DIA_Bodo_Bett(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 3;
	condition = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent = FALSE;
	description = "Могу я где-нибудь здесь отдохнуть?";
};


func int DIA_Bodo_Bett_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bett_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//Могу я где-нибудь здесь отдохнуть?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//Если ты ищешь, где можно поспать, иди в сарай. Но только не приляг по ошибке на кровать наемника.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Онар следит, чтобы они не трогали нас, фермеров, но это не касается чужаков, не работающих на ферме. С ними наемники могут делать все, что пожелают.
};


instance DIA_Bodo_Cipher(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 4;
	condition = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent = FALSE;
	description = "Сифер сказал мне, что кто-то украл у него тюк болотной травы ...";
};


func int DIA_Bodo_Cipher_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) || (MIS_Cipher_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bodo_Cipher_Info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Сифер сказал мне, что кто-то украл у него тюк болотной травы ...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//И?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//Он думает, что это сделал ты.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Ох, ВОТ почему этот парень все время так пялится на меня.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//Я стараюсь быть с ним максимально дружелюбным последнее время, потому что, похоже, ему вожжа попала под хвост.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//Но я ничего не могу поделать. Я стараюсь улыбаться ему, а ан в ответ смотрит так, как будто хочет убить меня.
};


instance DIA_Bodo_WeedOrElse(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 5;
	condition = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent = FALSE;
	description = "Отдай мне эту траву или ...";
};


func int DIA_Bodo_WeedOrElse_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedOrElse_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Отдай мне эту траву или ...
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//Послушай, все, что у меня есть - это один косяк из болотной травы. Возьми его и оставь меня в покое.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//Ты знаешь, как наемники Онара защищают нас, а?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//Так что даже не пытайся сделать какую-нибудь глупость!
	};
};


instance DIA_Bodo_WeedPERM(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 6;
	condition = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent = TRUE;
	description = "Я не верб ни одному твоему слову. Отдай мне эту траву!";
};


func int DIA_Bodo_WeedPERM_Condition()
{
	if((MIS_Cipher_BringWeed == LOG_Running) && Npc_KnowsInfo(other,DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedPERM_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//Я не верб ни одному твоему слову. Отдай мне эту траву!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//У меня ее нет. Честно.
};


instance DIA_Bodo_PICKPOCKET(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 900;
	condition = DIA_Bodo_PICKPOCKET_Condition;
	information = DIA_Bodo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bodo_PICKPOCKET_Condition()
{
	return C_Beklauen(30,60);
};

func void DIA_Bodo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,Dialog_Back,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bodo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

