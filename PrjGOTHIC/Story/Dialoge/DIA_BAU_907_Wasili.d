
instance DIA_Wasili_EXIT(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 999;
	condition = DIA_Wasili_EXIT_Condition;
	information = DIA_Wasili_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wasili_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wasili_HALLO(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 1;
	condition = DIA_Wasili_HALLO_Condition;
	information = DIA_Wasili_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wasili_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wasili_HALLO_Info()
{
	AI_Output(self,other,"DIA_Wasili_HALLO_01_00");	//Даже не думай прикоснуться здесь хоть к чему-нибудь. Ты обязательно перевернешь что-нибудь вверх ногами, понятно?
};


instance DIA_Wasili_Job(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 1;
	condition = DIA_Wasili_Job_Condition;
	information = DIA_Wasili_Job_Info;
	permanent = FALSE;
	description = "Чем ты занимаешься?";
};


func int DIA_Wasili_Job_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info()
{
	AI_Output(other,self,"DIA_Wasili_Job_15_00");	//Чем ты занимаешься?
	AI_Output(self,other,"DIA_Wasili_Job_01_01");	//Онар хочет, чтобы я проводил дни напролет, присматривая за его добром.
	AI_Output(self,other,"DIA_Wasili_Job_01_02");	//Он боится, что что-нибудь пропадет. На его месте я бы тоже боялся.
	AI_Output(self,other,"DIA_Wasili_Job_01_03");	//Большинство из нанятых им наемников - бывшие заключенные из колонии.
	AI_Output(self,other,"DIA_Wasili_Job_01_04");	//Они готовы стащить все, что не прибито гвоздями. Глазом не успеешь моргнуть.
};


instance DIA_Wasili_Sammler(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 4;
	condition = DIA_Wasili_Sammler_Condition;
	information = DIA_Wasili_Sammler_Info;
	permanent = FALSE;
	description = "Как я погляжу, здесь целая груда мусора.";
};


func int DIA_Wasili_Sammler_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info()
{
	AI_Output(other,self,"DIA_Wasili_Sammler_15_00");	//Как я погляжу, здесь целая груда мусора.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_01");	//Это точно, и большая его часть очень ценная. Онар коллекционирует ценные предметы.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_02");	//Простой человек, вроде меня, едва ли может позволить себе такое богатство. Мне больше нравятся другие вещи.
	AI_Output(other,self,"DIA_Wasili_Sammler_15_03");	//И что, например?
	AI_Output(self,other,"DIA_Wasili_Sammler_01_04");	//Я собираю старые монеты.
	MIS_Wasili_BringOldCoin = LOG_Running;
};


instance DIA_Wasili_FirstOldCoin(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 5;
	condition = DIA_Wasili_FirstOldCoin_Condition;
	information = DIA_Wasili_FirstOldCoin_Info;
	permanent = TRUE;
	description = "У меня есть старинная монетка.";
};


var int Wasili_BringOldCoin_NoMore;

func int DIA_Wasili_FirstOldCoin_Condition()
{
	if((MIS_Wasili_BringOldCoin == LOG_Running) && (WasilisOldCoinOffer == 0) && (Npc_HasItems(other,ItMi_OldCoin) >= 1) && (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};


var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;

func void DIA_Wasili_FirstOldCoin_Info()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_15_00");	//У меня есть старинная монетка.
	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");	//Ммм. Покажи мне.
	};
	B_GiveInvItems(other,self,ItMi_OldCoin,1);
	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_02");	//Ох, да. На рынке такую не продашь за приличную цену.
	};
	if(DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_03");	//Я заплачу тебе за нее одну золотую монету. Больше она не стоит.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_04");	//Ты знаешь, что я готов заплатить за нее, пес. Одну золотую монету. И ни центом больше.
	};
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"Нет, я лучше оставлю ее себе.",DIA_Wasili_FirstOldCoin_nein);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"Этого недостаточно. Как насчет двух?",DIA_Wasili_FirstOldCoin_mehr);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"Договорились.",DIA_Wasili_FirstOldCoin_ok);
	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		B_GivePlayerXP(XP_BringOldCoin);
		FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Wasili_FirstOldCoin_ok()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ok_15_00");	//Договорились.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");	//Хорошо.
	if(WasilisOldCoinOffer == 2)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_02");	//Вот 2 золотые монеты.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_03");	//Если найдешь еще монетки, ты знаешь, где меня найти.
		WasilisOldCoinOffer = 1;
	};
	CreateInvItems(self,ItMi_Gold,WasilisOldCoinOffer);
	B_GiveInvItems(self,other,ItMi_Gold,WasilisOldCoinOffer);
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_mehr_15_00");	//Этого недостаточно. Как насчет двух?
	if(DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_01");	//Не пойдет! Я не еще не выжил из ума! Проваливай.
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems(self,other,ItMi_OldCoin,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_02");	//Аххх. Черт. Хорошо. 2 золотые монеты за каждую старинную монетку, что ты принесешь мне, - это мое последнее предложение.
		WasilisOldCoinOffer = 2;
		Info_AddChoice(DIA_Wasili_FirstOldCoin,"В таком случае, 3 было бы неплохо.",DIA_Wasili_FirstOldCoin_ZumTeufel);
	};
};

func void DIA_Wasili_FirstOldCoin_nein()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_nein_15_00");	//Нет, я лучше оставлю ее себе.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_nein_01_01");	//Она для тебя бесполезна. Ты еще вернешься.
	B_GiveInvItems(self,other,ItMi_OldCoin,1);
	WasilisOldCoinOffer = 0;
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ZumTeufel_15_00");	//В таком случае, 3 было бы неплохо.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ZumTeufel_01_01");	//Катись к черту, ублюдок.
	AI_StopProcessInfos(self);
	Wasili_BringOldCoin_NoMore = TRUE;
	WasilisOldCoinOffer = 0;
};


instance DIA_Wasili_BringOldCoin(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 5;
	condition = DIA_Wasili_BringOldCoin_Condition;
	information = DIA_Wasili_BringOldCoin_Info;
	permanent = TRUE;
	description = "Нужны еще старинные монетки?";
};


func int DIA_Wasili_BringOldCoin_Condition()
{
	if((WasilisOldCoinOffer > 0) && (Npc_HasItems(other,ItMi_OldCoin) >= 1) && (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};


var int OldCoinCounter;

func void DIA_Wasili_BringOldCoin_Info()
{
	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;
	AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_00");	//Нужны еще старинные монетки?
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_01");	//Конечно. У тебя есть еще?
	OldCoinCount = Npc_HasItems(other,ItMi_OldCoin);
	if(OldCoinCount == 1)
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_02");	//Одна.
		B_GivePlayerXP(XP_BringOldCoin);
		B_GiveInvItems(other,self,ItMi_OldCoin,1);
		OldCoinCounter = OldCoinCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");	//Несколько.
		B_GiveInvItems(other,self,ItMi_OldCoin,OldCoinCount);
		XP_BringOldCoins = OldCoinCount * XP_BringOldCoin;
		OldCoinCounter = OldCoinCounter + OldCoinCount;
		B_GivePlayerXP(XP_BringOldCoins);
	};
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_04");	//Спасибо. Вот твои деньги. Приноси мне все, что найдешь.
	OldCoinGeld = OldCoinCount * WasilisOldCoinOffer;
	CreateInvItems(self,ItMi_Gold,OldCoinGeld);
	B_GiveInvItems(self,other,ItMi_Gold,OldCoinGeld);
};


instance DIA_Wasili_PERM(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 900;
	condition = DIA_Wasili_PERM_Condition;
	information = DIA_Wasili_PERM_Info;
	permanent = TRUE;
	description = "Никто не пытался ничего украсть?";
};


func int DIA_Wasili_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wasili_Job))
	{
		return TRUE;
	};
};

func void DIA_Wasili_PERM_Info()
{
	AI_Output(other,self,"DIA_Wasili_PERM_15_00");	//Никто не пытался ничего украсть?
	if(Kapitel <= 2)
	{
		if(PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output(self,other,"DIA_Wasili_PERM_01_01");	//Ты имеешь в виду: кроме тебя?
		};
		AI_Output(self,other,"DIA_Wasili_PERM_01_02");	//Были такие! Но я их всех поймал!
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Wasili_PERM_01_03");	//Несколько дней назад, один из наемников пробрался в дом.
		AI_Output(self,other,"DIA_Wasili_PERM_01_04");	//Он был одет в черную рясу с капюшоном, так что я не разглядел его.
		AI_Output(self,other,"DIA_Wasili_PERM_01_05");	//Но я видел, как он удирал.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_06");	//Нет. Последнее время нет.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_07");	//Наемники, похоже, готовятся покинуть лагерь.
		AI_Output(self,other,"DIA_Wasili_perm_01_08");	//Я не удивлюсь, если Ли и его парни покинут остров уже сегодня ночью.
	};
};


instance DIA_Wasili_PICKPOCKET(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 900;
	condition = DIA_Wasili_PICKPOCKET_Condition;
	information = DIA_Wasili_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Wasili_PICKPOCKET_Condition()
{
	return C_Beklauen(55,90);
};

func void DIA_Wasili_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
	Info_AddChoice(DIA_Wasili_PICKPOCKET,Dialog_Back,DIA_Wasili_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wasili_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wasili_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
};

func void DIA_Wasili_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
};

