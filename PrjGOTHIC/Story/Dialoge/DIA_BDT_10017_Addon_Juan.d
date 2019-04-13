
instance DIA_Addon_Juan_EXIT(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 999;
	condition = DIA_Addon_Juan_EXIT_Condition;
	information = DIA_Addon_Juan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Juan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Juan_PICKPOCKET(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 900;
	condition = DIA_Addon_Juan_PICKPOCKET_Condition;
	information = DIA_Addon_Juan_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Addon_Juan_PICKPOCKET_Condition()
{
	return C_Beklauen(65,73);
};

func void DIA_Addon_Juan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,Dialog_Back,DIA_Addon_Juan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Juan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Juan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};

func void DIA_Addon_Juan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};


instance DIA_Addon_Juan_HI(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_HI_Condition;
	information = DIA_Addon_Juan_HI_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Addon_Juan_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//Что тебе нужно? Если тебе нечего мне сказать, проходи мимо.
	if(!Npc_IsDead(Freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//Иначе мой приятель сделает из тебя фарш. Так что тебе нужно?
		B_StartOtherRoutine(Freund,"STAND");
	};
};


instance DIA_Addon_Juan_Losung(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_Losung_Condition;
	information = DIA_Addon_Juan_Losung_Info;
	permanent = FALSE;
	description = "Говорят, у тебя есть интересные вещи...";
};


func int DIA_Addon_Juan_Losung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_HI) && ((Tom_Tells == TRUE) || (MIS_Huno_Stahl == LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Losung_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//Говорят, у тебя есть интересные вещи...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//И что? Эстебан хочет меня обуть? Я все время работаю, целыми днями не выхожу из этой жалкой дыры...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//...а он просто посылает кого-то, чтобы забрать мои вещи? Я же не склад!
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//Ну и что? Это не мои проблемы.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//Это Я создаю тебе проблемы. Ты хочешь доставить товары - отлично, заплати за них!
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//Возьми золото у Эстебана или у Ворона, или я не знаю где еще. Мне без разницы. Если кому-то нужны эти товары, за них придется заплатить!
};


instance DIA_Addon_Juan_AufsMaul(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_AufsMaul_Condition;
	information = DIA_Addon_Juan_AufsMaul_Info;
	permanent = FALSE;
	description = "Я пришел не от Эстебана!";
};


func int DIA_Addon_Juan_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//Я пришел не от Эстебана!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//Да? Ну тогда... э-э... Секундочку! Замри! У тебя на плече какая-то мошка.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Juan_Trade(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 99;
	condition = DIA_Addon_Juan_Trade_Condition;
	information = DIA_Addon_Juan_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Juan_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Trade_Info()
{
	B_Say(other,self,"$TRADE_3");
};

