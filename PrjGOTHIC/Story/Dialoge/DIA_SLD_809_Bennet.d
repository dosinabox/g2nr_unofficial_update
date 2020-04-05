
func void B_UpdateBennetItemsCount()
{
	if((Bennet_ItemsGiven_Chapter_1 == TRUE) && (Kapitel == 1))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
	};
	if((Bennet_ItemsGiven_Chapter_2 == TRUE) && (Kapitel == 2))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
	};
	if((Bennet_ItemsGiven_Chapter_3 == TRUE) && (Kapitel == 3))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
		Bennet_NW_ItMi_Nugget_Count = Npc_HasItems(self,ItMi_Nugget);
	};
	if((Bennet_ItemsGiven_Chapter_4 == TRUE) && (Kapitel == 4))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
		Bennet_NW_ItMi_Nugget_Count = Npc_HasItems(self,ItMi_Nugget);
	};
	if((Bennet_ItemsGiven_Chapter_5 == TRUE) && (Kapitel == 5))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
		Bennet_NW_ItMi_Nugget_Count = Npc_HasItems(self,ItMi_Nugget);
	};
};

var int Bennet_Kap1Smith_Alt;
var int Bennet_Kap2Smith_Alt;
var int Bennet_Kap3Smith_Alt;
var int Bennet_Kap4Smith_Alt;
var int Bennet_Kap5Smith_Alt;

var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

func int C_Bennet_HaveNewWeapons()
{
	if(Bennet_TeachSmith == TRUE)
	{
		if(AlternativeSmithing == FALSE)
		{
			if((Kapitel == 2) && (Bennet_Kap2Smith == FALSE))
			{
				return TRUE;
			}
			else if((Kapitel == 3) && (MIS_ReadyforChapter4 == FALSE) && (Bennet_Kap3Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			}
			else if((Kapitel < 5) && (MIS_ReadyforChapter4 == TRUE) && (Bennet_Kap4Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			}
			else if((Kapitel >= 5) && (Bennet_Kap5Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			};
		}
		else
		{
			if((Kapitel == 1) && (Bennet_Kap1Smith_Alt == FALSE))
			{
				return TRUE;
			}
			else if((Kapitel == 2) && (Bennet_Kap2Smith_Alt == FALSE))
			{
				return TRUE;
			}
			else if((Kapitel < 5) && (Bennet_Kap3Smith_Alt == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			}
			else if((Kapitel >= 5) && (Bennet_Kap5Smith_Alt == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			};
		};
	};
	return FALSE;
};

instance DIA_Bennet_AnnounceNewWeapons(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 10;
	condition = DIA_Bennet_AnnounceNewWeapons_Condition;
	information = DIA_Bennet_AnnounceNewWeapons_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Bennet_AnnounceNewWeapons_Condition()
{
	if(C_Bennet_HaveNewWeapons())
	{
		return TRUE;
	};
};

func void DIA_Bennet_AnnounceNewWeapons_Info()
{
	if(AlternativeSmithing == FALSE)
	{
		if((Kapitel == 2) && (Bennet_Kap2Smith == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Я могу научить тебя ковать магические мечи и даже двуручные клинки.
			Bennet_Kap2Smith = TRUE;
		}
		else if((Kapitel == 3) && (MIS_ReadyforChapter4 == FALSE) && (Bennet_Kap3Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Я немного потренировался, и теперь я могу научить тебя, как ковать полуторные и тяжелые двуручные магические мечи.
			Bennet_Kap3Smith = TRUE;
		}
		else if((Kapitel < 5) && (MIS_ReadyforChapter4 == TRUE) && (Bennet_Kap4Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03_add");	//Мои новые магические клинки! Это лучшее, что я умею ковать сейчас.
			Bennet_Kap4Smith = TRUE;
		}
		else if((Kapitel >= 5) && (Bennet_Kap5Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Послушай. На меня только что снизошло вдохновение. Магическое оружие, покрытое кровью дракона. И я точно знаю, как изготовить его!
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(ухмыляется) А ты хочешь узнать?
			Bennet_Kap5Smith = TRUE;
		};
	}
	else
	{
		if((Kapitel == 1) && (Bennet_Kap1Smith_Alt == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//Я могу научить тебя ковать магические мечи и даже двуручные клинки.
			Bennet_Kap1Smith_Alt = TRUE;
		}
		else if((Kapitel == 2) && (Bennet_Kap2Smith_Alt == FALSE))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//Я немного потренировался, и теперь я могу научить тебя, как ковать полуторные и тяжелые двуручные магические мечи.
			Bennet_Kap2Smith_Alt = TRUE;
		}
		else if((Kapitel < 5) && (Bennet_Kap3Smith_Alt == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03_add");	//Мои новые магические клинки! Это лучшее, что я умею ковать сейчас.
			Bennet_Kap3Smith_Alt = TRUE;
		}
		else if((Kapitel >= 5) && (Bennet_Kap5Smith_Alt == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Послушай. На меня только что снизошло вдохновение. Магическое оружие, покрытое кровью дракона. И я точно знаю, как изготовить его!
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(ухмыляется) А ты хочешь узнать?
			Bennet_Kap5Smith_Alt = TRUE;
		};
	};
};


instance DIA_Bennet_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bennet_EXIT_Info()
{
	B_EquipTrader(self);
	B_UpdateBennetItemsCount();
	if(C_Bennet_HaveNewWeapons())
	{
		DIA_Bennet_AnnounceNewWeapons_Info();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_HALLO(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_HALLO_Condition;
	information = DIA_Bennet_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_HALLO_Condition()
{
	if((Kapitel < 3) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bennet_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//Я не продаю оружие. Халед продает. Он находится в доме Онара.
	if(Khaled_weiter == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader,"Халед - торговец оружием.");
	};
};


instance DIA_Bennet_TRADE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 700;
	condition = DIA_Bennet_TRADE_Condition;
	information = DIA_Bennet_TRADE_Info;
	permanent = TRUE;
	description = "А как насчет кузнечного инструмента?";
	trade = TRUE;
};


func int DIA_Bennet_TRADE_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info()
{
	if(Bennet_flag == TRUE)
	{
		B_ClearSmithInv(self);
		if(Bennet_swordraws > 0)
		{
			CreateInvItems(self,ItMiSwordraw,Bennet_swordraws);
		};
		Bennet_flag = FALSE;
	};
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//А как насчет кузнечного инструмента?
	B_GiveTradeInv(self);
	if(TradersHaveLimitedAmmo == TRUE)
	{
		if(Bennet_Ammo_Day <= Wld_GetDay())
		{
			B_RefreshAmmo(self,50);
	 		Bennet_Ammo_Day = Wld_GetDay() + 1;
		};
	}
	else
	{
		B_RefreshAmmo(self,50);
	};
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//Что тебе нужно?
	if(BennetLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader,"Беннет продает кузнечное снаряжение.");
		BennetLOG = TRUE;
	};
	if(!Npc_HasItems(self,ItMw_1H_Mace_L_04) && !Npc_HasItems(other,ItMw_1H_Mace_L_04) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		CreateInvItems(self,ItMw_1H_Mace_L_04,1);
	};
	Trade_IsActive = TRUE;
};


instance DIA_Bennet_WhichWeapons(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = DIA_Bennet_WhichWeapons_Condition;
	information = DIA_Bennet_WhichWeapons_Info;
	permanent = FALSE;
	description = "Какое оружие ты делаешь?";
};


func int DIA_Bennet_WhichWeapons_Condition()
{
	if(((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)) && (MIS_Bennet_BringOre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhichWeapons_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//Какое оружие ты делаешь?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//Сейчас - обычные мечи. Больше ничего.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//Но если бы у меня была магическая руда, я мог бы выковать оружие, превосходящее любой меч из обычной стали.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//Ты случайно не знаешь, где можно раздобыть руды? (смеется) Кроме как в Долине Рудников, я имею в виду.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//Нет.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Конечно же, не знаешь.
};


instance DIA_Bennet_BauOrSld(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = DIA_Bennet_BauOrSld_Condition;
	information = DIA_Bennet_BauOrSld_Info;
	permanent = FALSE;
	description = "Ты с фермерами или с наемниками?";
};


func int DIA_Bennet_BauOrSld_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BauOrSld_Info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Ты с фермерами или с наемниками?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//Ты смеешься надо мной, да?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//Мне просто интересно.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//Ты когда-нибудь видел фермера, который ковал бы оружие?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//Нет.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//Тогда зачем ты задаешь такие тупые вопросы?
};


instance DIA_Bennet_WannaJoin(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 4;
	condition = DIA_Bennet_WannaJoin_Condition;
	information = DIA_Bennet_WannaJoin_Info;
	permanent = TRUE;
	description = "Я хочу присоединиться к наемникам!";
};


func int DIA_Bennet_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_BauOrSld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//Тогда прекращай болтать и иди к Торлофу. Пусть он даст тебе испытание.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//Я прошел испытание.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Хорошо, тогда я проголосую за тебя.
		SCKnowsSLDVotes = TRUE;
	};
};


instance DIA_Bennet_WannaSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_WannaSmith_Condition;
	information = DIA_Bennet_WannaSmith_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня ковать мечи?";
};


func int DIA_Bennet_WannaSmith_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//Ты можешь научить меня ковать мечи?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Конечно.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//Впрочем, это обойдется тебе в некоторую сумму. Скажем, 30 золотых.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
	Info_AddChoice(DIA_Bennet_WannaSmith,"Ну, может быть, позже.",DIA_Bennet_WannaSmith_Later);
	Info_AddChoice(DIA_Bennet_WannaSmith,"Отлично. Вот твои 30 золотых.",DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Отлично. Вот твои 30 золотых.
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//Должен сказать, это очень хорошая цена! Я готов приступить к обучению, как только ты будешь готов.
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher,"Беннет может обучить меня кузнечному делу.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//Не надо держать меня за идиота. 30 золотых и ни одной монетой меньше.
	};
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Ну, может быть, позже.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};


instance DIA_Bennet_TeachCOMMON(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 6;
	condition = DIA_Bennet_TeachCOMMON_Condition;
	information = DIA_Bennet_TeachCOMMON_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("Научиться кузнечному делу",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common));
	description = B_BuildLearnString("Кузнечное дело",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common));
};


func int DIA_Bennet_TeachCOMMON_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Научи меня ковать мечи!
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//Это довольно просто: берешь кусок сырой стали и держишь его над огнем, пока он не раскалится.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Затем кладешь его на наковальню и придаешь мечу форму.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Самое важное - следи, чтобы сталь не стала слишком холодной. У тебя есть всего несколько минут для обработки оружия...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//А остальному ты научишься сам - это всего лишь вопрос практики.
	};
};


instance DIA_Bennet_WannaSmithORE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 7;
	condition = DIA_Bennet_WannaSmithORE_Condition;
	information = DIA_Bennet_WannaSmithORE_Info;
	permanent = TRUE;
	description = "Научи меня ковать магическое оружие!";
};


func int DIA_Bennet_WannaSmithORE_Condition()
{
	if((Bennet_TeachSmith == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Научи меня ковать магическое оружие!
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//Пока ты не один из нас, будь я проклят, если научу тебя секретам изготовления магического оружия.
		}
		else
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03_add");	//Ты не один из нас - будь я проклят, если научу тебя секретам изготовления магического оружия.
		};
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Только немногие кузнецы владеют этим искусством, и я думаю, даже кузнецы в городе ничего не знают об этом.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//И это хорошо. Иначе все эти пьяницы из городской стражи потрясали бы магическими мечами.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Ничего личного. (ухмыляется) Против тебя я ничего не имею.
		};
	}
	else if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//Но ты даже не знаешь основ кузнечного дела.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//Сначала ты должен научиться ковать обычные мечи. А там посмотрим.
	}
	else if(MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		if(MIS_Bennet_BringOre == FALSE)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//Если бы у меня была магическая руда, я бы, возможно, согласился.
			AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Ах, да ладно. Я с наемниками, и я знаю кузнечное дело. Что еще тебе нужно?
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//Скажи мне, как, интересно, я должен ковать магическое оружие, не имея магической руды?
			AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Нууу...
			MIS_Bennet_BringOre = LOG_Running;
			Log_CreateTopic(TOPIC_BennetOre,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BennetOre,LOG_Running);
			B_LogEntry(TOPIC_BennetOre,"Кузнецу наемников Беннету нужно пять кусков магической руды.");
		};
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//Вот что скажу. Мне нужно как минимум 5 кусков руды - или ты можешь забыть об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Отлично, ты принес мне руду, и ты также знаешь, как куется обычный меч.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//Так давай же, обучай меня!
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//Самое главное: не важно, целиком сделан твой меч из магической руды, или ты просто покрыл обычный меч ее тонким слоем. Поверхность - только это имеет значение.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//А так как эта чертова руда очень дорогая, просто берешь стальную заготовку и несколько кусков руды.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Естественно, нельзя просто покрыть готовый меч магической рудой. Оружие нужно создавать с нуля.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//А все остальное зависит от оружия, которое ты хочешь получить.
		Bennet_TeachSmith = TRUE;
	};
};


instance DIA_Bennet_WhereOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhereOre_Condition;
	information = DIA_Bennet_WhereOre_Info;
	permanent = FALSE;
	description = "Где мне найти магическую руду?";
};


func int DIA_Bennet_WhereOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Где мне найти магическую руду?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//Эх, если бы я только знал это. Я думаю, в горнодобывающей колонии ты наверняка найдешь что-нибудь.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//Но, может быть, тебе повезет и ты найдешь несколько мелких обломков где-нибудь здесь и сможешь слепить из них приличный кусок руды.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//Насколько я знаю, в горах к югу отсюда есть заброшенные шахты. Попробуй попытать счастья там.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//Но будь осторожен: я слышал, там устроили логово бандиты.
};


instance DIA_Bennet_BringOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_BringOre_Condition;
	information = DIA_Bennet_BringOre_Info;
	permanent = FALSE;
	description = "Вот, держи. (отдать 5 кусков руды)";
};


func int DIA_Bennet_BringOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && (Npc_HasItems(other,ItMi_Nugget) >= 5) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Вот, держи.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(смеется) Покажи!
	B_GiveInvItems(other,self,ItMi_Nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Да ты что! Я потрясен!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//Оставь себе два куска. Они тебе понадобятся, чтобы сделать твое собственное оружие.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Bennet_NW_ItMi_Nugget_Count += 3;
	B_LogEntry(TOPIC_BennetOre,"Беннет получил руду и вернул мне некоторую ее часть.");
	MIS_Bennet_BringOre = LOG_SUCCESS;
	B_GivePlayerXP(100);
};


instance DIA_Bennet_TeachSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 30;
	condition = DIA_Bennet_TeachSmith_Condition;
	information = DIA_Bennet_TeachSmith_Info;
	permanent = TRUE;
	description = "Я хочу больше узнать о магическом оружии.";
};


func int DIA_Bennet_TeachSmith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//Я хочу больше узнать о магическом оружии.
	if(AlternativeSmithing == FALSE)
	{
		if(Kapitel == 1)
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06_add");	//Пока мне нечему учить тебя.
		}
		else if(!C_Bennet_HaveNewWeapons())
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Какое оружие ты хотел бы научиться делать?
		}
		else
		{
			DIA_Bennet_AnnounceNewWeapons_Info();
		};
		if(Kapitel > 1)
		{
			Info_ClearChoices(DIA_Bennet_TeachSmith);
			Info_AddChoice(DIA_Bennet_TeachSmith,Dialog_Back,DIA_Bennet_TeachSmith_BACK);
			if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && (Kapitel >= 2))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_TeachSmith_1hSpecial1);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && (Kapitel >= 2))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_TeachSmith_2hSpecial1);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && (Kapitel >= 3))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_TeachSmith_1hSpecial2);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && (Kapitel >= 3))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_TeachSmith_2hSpecial2);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_TeachSmith_1hSpecial3);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_TeachSmith_2hSpecial3);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE) && (Kapitel >= 5))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_TeachSmith_1hSpecial4);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE) && (Kapitel >= 5))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_TeachSmith_2hSpecial4);
			};
		};
	}
	else
	{
		if(!C_Bennet_HaveNewWeapons())
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//Какое оружие ты хотел бы научиться делать?
		}
		else
		{
			DIA_Bennet_AnnounceNewWeapons_Info();
		};
		Info_ClearChoices(DIA_Bennet_TeachSmith);
		Info_AddChoice(DIA_Bennet_TeachSmith,Dialog_Back,DIA_Bennet_TeachSmith_BACK);
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_TeachSmith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_TeachSmith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_TeachSmith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_TeachSmith_2hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_TeachSmith_1hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_TeachSmith_2hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE) && (Kapitel >= 5))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_TeachSmith_1hSpecial4);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE) && (Kapitel >= 5))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_TeachSmith_2hSpecial4);
		};
	};
};

func void DIA_Bennet_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Bennet_TeachSmith);
};

func void DIA_Bennet_TeachSmith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_TeachSmith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_TeachSmith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_TeachSmith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_TeachSmith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_TeachSmith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_TeachSmith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_TeachSmith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};

instance DIA_Bennet_WhyPrison(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhyPrison_Condition;
	information = DIA_Bennet_WhyPrison_Info;
	permanent = FALSE;
	description = "Как ты попал за решетку?";
};


func int DIA_Bennet_WhyPrison_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhyPrison_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//Как ты попал за решетку?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Эти свиньи схватили меня и бросили сюда. Говорят, что я убил паладина.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//Но я не делал этого, они хотят оклеветать меня.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Зачем бы им это?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//Откуда мне знать? Ты должен вытащить меня отсюда.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Поговори с лордом Хагеном, проломи стену... ну, я не знаю... сделай же что-нибудь!
	if(MIS_RescueBennet != LOG_Running)
	{
		MIS_RescueBennet = LOG_Running;
		Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
		B_LogEntry(TOPIC_RescueBennet,"У Беннета серьезные проблемы. Он на все готов, чтобы только вырваться из тюрьмы.");
	};
};


instance DIA_Bennet_WhatHappened(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhatHappened_Condition;
	information = DIA_Bennet_WhatHappened_Info;
	permanent = FALSE;
	description = "Что произошло?";
};


func int DIA_Bennet_WhatHappened_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//Что произошло?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//Я пошел в нижнюю часть города с Ходжесом, чтобы купить кое-что для наших парней.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//Неожиданно мы услышали громкий крик и звук топота убегающих ног.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//Давай к делу.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//Мы сразу поняли - что-то случилось, и нас тут же схватят, если застанут там.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//И мы побежали. А затем, когда до городских ворот оставалось уже совсем немного, я споткнулся и повредил колено.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//А дальше все просто. Стражники тут же накинулись на меня и бросили за решетку.
};


instance DIA_Bennet_Victim(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Victim_Condition;
	information = DIA_Bennet_Victim_Info;
	permanent = FALSE;
	description = "Кто был убит?";
};


func int DIA_Bennet_Victim_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Victim_Info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Кто был убит?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//Понятия не имею - один из паладинов, я не знаю, кто.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Ты знаешь имя?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//Какой-то Лотар, по-моему. Ну, хм-м, я не знаю, я не уверен.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//Тебе лучше спросить лорда Хагена, ему известны все детали.
	B_LogEntry(TOPIC_RescueBennet,"Лотар, один из паладинов, был убит. Лорд Хаген, возможно, сможет рассказать мне подробнее об этом деле, ведь именно он ведет расследование.");
};


instance DIA_Bennet_Evidence(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Evidence_Condition;
	information = DIA_Bennet_Evidence_Info;
	permanent = FALSE;
	description = "У них есть доказательства против тебя?";
};


func int DIA_Bennet_Evidence_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Evidence_Info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//У них есть доказательства против тебя?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//Говорят, есть свидетель, который опознал меня.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Ты знаешь, кто этот свидетель?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//Нет. Я знаю только, что он лжет.
	B_LogEntry(TOPIC_RescueBennet,"Есть свидетель, утверждающий, что видел, как это сделал Беннет. Я должен найти этого свидетеля, если я хочу выяснить правду.");
//	RescueBennet_KnowsWitness = TRUE;
};


instance DIA_Bennet_Investigation(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Investigation_Condition;
	information = DIA_Bennet_Investigation_Info;
	permanent = FALSE;
	description = "Кто ведет расследование?";
};


func int DIA_Bennet_Investigation_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Investigation_Info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Кто ведет расследование?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//Сам лорд Хаген. Так как был убит один из паладинов, это дело подпадает под закон о военном положении.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//Что это означает?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//Это легко предположить. Если меня не вытащить отсюда, то я буду повешен без долгих разговоров.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//Ты должен помочь мне, или начнется война. Ли не оставит это просто так.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//Ты сам понимаешь, что это значит.
};


instance DIA_Bennet_ThankYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ThankYou_Condition;
	information = DIA_Bennet_ThankYou_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_ThankYou_Condition()
{
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Bennet_ThankYou_Info()
{
	/*if(hero.guild == GIL_SLD)
	{
		hero.guild = GIL_DJG;
		Npc_SetTrueGuild(hero,GIL_DJG);
	};*/
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Ох, я уж думал, что меня наверняка повесят!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//Что ж, в конце концов, все окончилось хорошо.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//Да уж. Ты бы видел выражение лица солдата, который выпускал меня!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(смеется) Он был так напуган, что чуть не наложил в штаны.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//Да, чуть не забыл. У меня есть кое-что для тебя.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(ухмыляется) Презент.
};


instance DIA_Bennet_Present(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Present_Condition;
	information = DIA_Bennet_Present_Info;
	permanent = FALSE;
	description = "Какой презент?";
};


func int DIA_Bennet_Present_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Present_Info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//Какой презент?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//Мы все слышали о драконах, которые вроде бы появились в Долине.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//Они действительно там!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//Хорошо, я верю тебе.
	if(hero.guild == GIL_SLD)
	{
		hero.guild = GIL_DJG;
		Npc_SetTrueGuild(hero,GIL_DJG);
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//Как бы там ни было, некоторые из парней решили отправиться в Долину.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(ухмыляется) Они собираются навести там порядок.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//А какое это имеет отношение ко мне?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(гордо) Я разработал новый тип доспехов. Доспехи охотника на драконов!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//Они прочнее и легче, чем традиционные доспехи.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//Так как ты спас меня, я хочу, чтобы ты получил первый экземпляр. Это подарок!
		CreateInvItem(hero,ITAR_DJG_L);
		AI_PrintScreen("Легкие доспехи охотника на драконов получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//Я подумал, что, возможно, тебе тоже захочется позабавиться там. Тебе понадобится хорошее снаряжение, когда ты отправишься в эту долину.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//Также мне интересны драконьи чешуйки. Настоящие драконьи чешуйки. Я хорошо заплачу тебе за них.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//Сколько я получу за чешуйку?
		B_Say_Gold(self,other,Value_DragonScale);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Ладно, я думаю, ты наверняка захочешь поучаствовать в готовящейся охоте на драконов.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//И?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//Вот, возьми этот амулет. Тебе он нужнее, чем мне.
		CreateInvItems(self,ItAm_Hp_01,1);
		B_GiveInvItems(self,other,ItAm_Hp_01,1);
	};
};


var int Bennet_DragonScale_Counter;
var int Show_DJG_Armor_M;

instance DIA_Bennet_DragonScale(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DragonScale_Condition;
	information = DIA_Bennet_DragonScale_Info;
	permanent = TRUE;
	description = "Я принес тебе несколько драконьих чешуек.";
};


func int DIA_Bennet_DragonScale_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonScale) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DragonScale_Info()
{
	var int dragonscalecount;
	var string concatText;
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//Я принес тебе несколько драконьих чешуек.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Настоящая чешуя дракона!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Вот твое золото!
	dragonscalecount = Npc_HasItems(other,ItAt_DragonScale);
	Bennet_DragonScale_Counter += dragonscalecount;
	B_GiveInvItems(self,other,ItMi_Gold,dragonscalecount * Value_DragonScale);
	Npc_RemoveInvItems(other,ItAt_DragonScale,dragonscalecount);
	concatText = ConcatStrings(IntToString(dragonscalecount),PRINT_ItemsGegeben);
	AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	if((Bennet_DragonScale_Counter >= 20) && (Show_DJG_Armor_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//Хорошо, этого должно быть достаточно. Я могу продать тебе новые, улучшенные доспехи, если, конечно, тебе это интересно.
		Show_DJG_Armor_M = TRUE;
	};
};


var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;

instance DIA_Bennet_DJG_ARMOR_M(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_M_Condition;
	information = DIA_Bennet_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "Средние доспехи охотника на драконов (120/120/75/35, 12000 золотых)";
};


func int DIA_Bennet_DJG_ARMOR_M_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (Show_DJG_Armor_M == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//Я хочу купить доспехи.
	if(Npc_HasItems(other,ItMi_Gold) >= VALUE_ITAR_DJG_M)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Очень хорошо. Уверен, они тебя не разочаруют.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//Да уж, за такую-то цену...
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//Ты поймешь, что они стоят этих денег.
		B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_DJG_M);
		if(Helmets_Enabled == TRUE)
		{
			CreateInvItem(hero,ITAR_DJGN_M);
			CreateInvItem(hero,ITHE_DJG_M);
		}
		else
		{
			CreateInvItem(hero,ITAR_DJG_M);
		};
		AI_PrintScreen("Средние доспехи охотника на драконов получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//У тебя недостаточно золота.
	};
};


instance DIA_Bennet_BetterArmor(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Condition;
	information = DIA_Bennet_BetterArmor_Info;
	permanent = FALSE;
	description = "Я знаю, как можно еще улучшить доспехи.";
};


func int DIA_Bennet_BetterArmor_Condition()
{
	if((PlayergetsFinalDJGArmor == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//Я знаю, как можно еще улучшить доспехи.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(ухмыляется про себя) Ну, расскажи мне.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//Можно покрыть драконьи чешуйки магической рудой.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(смеется) Эта мысль приходила и ко мне. Да, ты прав.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//Мои новые доспехи превосходят все, что ты когда-либо видел. Они очень легкие и очень прочные.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//Они СОВЕРШЕННЫ.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//Ты можешь купить их, если хочешь. Я не предложил бы их абы кому, а цена только-только покрывает стоимость производства.
};


//var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;

instance DIA_Bennet_DJG_ARMOR_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_H_Condition;
	information = DIA_Bennet_DJG_ARMOR_H_Info;
	permanent = TRUE;
	description = "Тяжелые доспехи охотника на драконов (150/150/100/50, 20000 золотых)";
};


func int DIA_Bennet_DJG_ARMOR_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE) && (hero.guild == GIL_DJG) && (Npc_KnowsInfo(other,DIA_Bennet_BetterArmor) || Npc_KnowsInfo(other,DIA_Bennet_DI_BetterArmor)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_H_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Дай мне доспехи.
	if(Npc_HasItems(other,ItMi_Gold) >= VALUE_ITAR_DJG_H)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//Это лучшие доспехи из того, что я когда-либо делал.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//Настоящее произведение искусства.
		B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_DJG_H);
		if(Helmets_Enabled == TRUE)
		{
			CreateInvItem(hero,ITAR_DJGN_H);
			CreateInvItem(hero,ITHE_DJG_H);
		}
		else
		{
			CreateInvItem(hero,ITAR_DJG_H);
		};
		AI_PrintScreen("Тяжелые доспехи охотника на драконов получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//У тебя недостаточно золота.
	};
};


instance DIA_Bennet_RepairNecklace(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_RepairNecklace_Condition;
	information = DIA_Bennet_RepairNecklace_Info;
	permanent = FALSE;
	description = "Ты можешь ремонтировать ювелирные изделия?";
};


func int DIA_Bennet_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Ты можешь ремонтировать ювелирные изделия?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//Может быть. Ты должен сначала показать мне их.
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//Также мне сначала нужно выбраться отсюда.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//Без этого я не смогу ничего сделать, это очевидно.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_ShowInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ShowInnosEye_Condition;
	information = DIA_Bennet_ShowInnosEye_Info;
	permanent = FALSE;
	description = "Ты можешь взглянуть на этот амулет?";
};


func int DIA_Bennet_ShowInnosEye_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Bennet_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Bennet_ShowInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Ты можешь взглянуть на этот амулет?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Конечно, давай посмотрим.
	AI_PrintScreen(Print_InnoseyeGiven,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Хммм, превосходная работа. Оправа сломана. Но, думаю, я смогу починить ее, впрочем.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//Сколько это займет времени?
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//Ну, я застрял здесь пока. Или ты где-то здесь видишь кузницу?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//Если бы я был в своей кузнице, я мог бы сделать это за один день. Но, конечно же, сначала мне нужно выбраться отсюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//Если ты оставишь его мне, к завтрашнему утру он будет как новенький.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//И я даже не возьму с тебя денег за эту работу. Ведь это ты вытащил меня из тюрьмы.
	};
	AI_PrintScreen(Print_InnosEyeGet,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_LogEntry(TOPIC_INNOSEYE,"Беннет - кузнец, который нужен мне, чтобы починить амулет.");
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_GiveInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GiveInnosEye_Condition;
	information = DIA_Bennet_GiveInnosEye_Info;
	permanent = FALSE;
	description = "Вот амулет, пожалуйста, почини его.";
};


func int DIA_Bennet_GiveInnosEye_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_SCKnowsInnosEyeIsBroken == TRUE) && (MIS_RescueBennet == LOG_SUCCESS) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Bennet_ShowInnosEye))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GiveInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Вот амулет, пожалуйста, почини его.
	Npc_RemoveInvItems(other,ItMi_InnosEye_Broken_Mis,1);
	AI_PrintScreen(Print_InnoseyeGiven,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//Хорошо. Я закончу работу к завтрашнему утру.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//Заходи завтра, и заберешь его.
	Bennet_RepairDay = Wld_GetDay();
	B_UpdateBennetItemsCount();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WORK");
};


instance DIA_Bennet_GetInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GetInnosEye_Condition;
	information = DIA_Bennet_GetInnosEye_Info;
	permanent = TRUE;
	description = "Амулет готов?";
};


func int DIA_Bennet_GetInnosEye_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_GiveInnosEye) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GetInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Амулет готов?
	B_UpdateBennetItemsCount();
	if(((Bennet_RepairDay < Wld_GetDay()) && Wld_IsTime(5,0,23,59)) || (Bennet_RepairDay + 1 < Wld_GetDay()))
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Да, держи.
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems(other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen(Print_InnosEyeGet,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//Мне пришлось сделать новую оправу для камня.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//Я работал всю ночь, и теперь он как новенький.
		B_LogEntry(TOPIC_INNOSEYE,"Амулет опять как новенький. Беннет проделал отличную работу.");
		MIS_Bennet_InnosEyeRepairedSetting = LOG_SUCCESS;
		B_GivePlayerXP(XP_InnosEyeIsRepaired);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//Этого недостаточно. Заходи попозже.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//Если ты будешь продолжать мешать мне, это только задержит работу.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bennet_DRACHENEIER(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_DRACHENEIER_Condition;
	information = DIA_Bennet_DRACHENEIER_Info;
	permanent = TRUE;
	description = "Ты можешь что-нибудь сделать с драконьими яйцами?";
};


func int DIA_Bennet_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && (BennetsDragonEggOffer == 0) && Npc_HasItems(other,ItAt_DragonEgg_MIS) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;

func void DIA_Bennet_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Ты можешь что-нибудь сделать с драконьими яйцами?
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Драконьи яйца? Где, черт возьми, тебе удалось добыть их?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//Я забрал их у людей-ящеров.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Давай посмотрим.
	};
	Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,1);
	AI_PrintScreen("Яйцо отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Ммм. Очень твердый материал. Идеально подходит для доспехов. Если только удастся открыть их.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//Ну и как? Они нужны тебе?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Конечно! Давай сюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//Ну и сколько еще ты собираешься вертеть их у меня перед носом? Ты продашь их или нет?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//Я заплачу тебе, ммм, ну... скажем, 300 золотых за каждое яйцо, что ты принесешь мне.
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Тогда можешь оставить золото себе. Я пока попридержу эти яйца.",DIA_Bennet_DRACHENEIER_nein);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Это яйца дракона, а не какие-нибудь куриные.",DIA_Bennet_DRACHENEIER_mehr);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"Договорились.",DIA_Bennet_DRACHENEIER_ok);
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_DRACHENEIER,"Беннет готов дать хорошую цену за драконьи яйца, которые я найду.");
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Bennet_DRACHENEIER_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//Договорились.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Отлично.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//Если найдешь еще, неси их сюда.
	if(BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;
	};
	CreateInvItems(self,ItMi_Gold,BennetsDragonEggOffer);
	B_GiveInvItems(self,other,ItMi_Gold,BennetsDragonEggOffer);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Эээ. Ты сказал, что забрал их у людей-ящеров?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Точно.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Насколько я знаю, люди-ящеры обычно обитают в пещерах.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//Я не удивлюсь, если тебе удастся найти еще яйца в пещерах неподалеку.
	B_LogEntry(TOPIC_DRACHENEIER,"Беннет полагает, что мне стоит поискать яйца в пещерах Хориниса. Во многих из них, по слухам, видели человекоящеров.");
	if(!Npc_HasItems(other,ItWr_Map_Caves_MIS))
	{
		if(!Npc_IsDead(Brahim))
		{
			AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//Но сначала ты должен взять карту пещер у картографа в городе. Будет жаль, если ты найдешь не все яйца.
			Log_AddEntry(TOPIC_DRACHENEIER,"Я должен купить карту пещер у картографа в городе, чтобы быть уверенным, что я не пропущу часть яиц.");
		}
		else
		{
			AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Вот. Возьми эту карту. Она поможет тебе найти пещеры.
			CreateInvItems(self,ItWr_Map_Caves_MIS,1);
			B_GiveInvItems(self,other,ItWr_Map_Caves_MIS,1);
			Log_AddEntry(TOPIC_DRACHENEIER,"Он дал мне карту пещер, возможно, она поможет мне.");
		};
	};
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//Это яйца дракона, а не какие-нибудь куриные.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(сердито) Хорошо. 350 и точка. Я не могу дать тебе больше - иначе это дело не окупится.
	BennetsDragonEggOffer = 350;
};

func void DIA_Bennet_DRACHENEIER_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Тогда можешь оставить золото себе. Я пока попридержу эти яйца.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Дай мне знать, если передумаешь.
	CreateInvItems(other,ItAt_DragonEgg_MIS,1);
	AI_PrintScreen("Яйцо получено",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	BennetsDragonEggOffer = 0;
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};


instance DIA_Bennet_EierBringen(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_EierBringen_Condition;
	information = DIA_Bennet_EierBringen_Info;
	permanent = TRUE;
	description = "Нужны еще драконьи яйца?";
};


func int DIA_Bennet_EierBringen_Condition()
{
	if((BennetsDragonEggOffer > 0) && (Kapitel >= 4) && Npc_HasItems(other,ItAt_DragonEgg_MIS) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info()
{
	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Нужны еще драконьи яйца?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Конечно!
	DragonEggCount = Npc_HasItems(other,ItAt_DragonEgg_MIS);
	if(DragonEggCount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Вот. Я принес еще одно.
		Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,1);
		AI_PrintScreen("Яйцо отдано",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		DragonEggCounter += 1;
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//Я принес еще несколько.
		Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,DragonEggCount);
		concatText = ConcatStrings(IntToString(DragonEggCount),PRINT_ItemsGegeben);
		AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		XP_DJG_BringDragonEggs = DragonEggCount * XP_DJG_BringDragonEgg;
		DragonEggCounter += DragonEggCount;
		B_GivePlayerXP(XP_DJG_BringDragonEggs);
	};
	if(DragonEggCounter <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Отлично. Давай сюда. Ты везде посмотрел, а? Наверняка где-то должны быть еще.
	}
	else if(DragonEggCounter <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Где ты раскопал их? Вряд ли где-нибудь еще остались эти яйца.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//Я не думаю, что ты найдешь еще яйца. К тому же, мне и этих достаточно. Я даже не знаю, что я буду делать со всеми ними.
		TOPIC_END_DRACHENEIER = TRUE;
		B_CheckLog();
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Ох, хорошо. Вот твои деньги.
	DragonEggGeld = DragonEggCount * BennetsDragonEggOffer;
	CreateInvItems(self,ItMi_Gold,DragonEggGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonEggGeld);
};


func void B_Bennet_BeMySmith()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//Будь моим кузнецом. Увидимся в гавани.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//Хорошо. Увидимся позже.
};

instance DIA_Bennet_KnowWhereEnemy(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_KnowWhereEnemy_Condition;
	information = DIA_Bennet_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Мне нужно плыть на другой остров. Мне бы пригодился кузнец.";
};


func int DIA_Bennet_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Bennet_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//Мне нужно плыть на другой остров. Мне бы пригодился кузнец.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//И ты подумал обо мне?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Да. Что скажешь? По крайней мере, ты сможешь выбраться отсюда.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Это лучше, чем работать на ферме Онара. Парень, даже ад ЛУЧШЕ, чем здесь. Ты можешь рассчитывать на меня.
	if(SCToldBennetHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"Беннет готов отправляться немедленно. Кузнец он непревзойденный. Я уверен, что смогу многому научиться у него.");
		SCToldBennetHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//Моя команда сейчас полностью укомплектована.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Тогда уволь кого-нибудь из нее.
	}
	else
	{
		Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"Я дам тебе знать, когда ты мне понадобишься.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"Будь моим кузнецом. Увидимся в гавани.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

func void DIA_Bennet_KnowWhereEnemy_Yes()
{
	B_Bennet_BeMySmith();
	B_UpdateBennetItemsCount();
	B_JoinShip(self);
};

func void DIA_Bennet_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, когда ты мне понадобишься.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Отлично. Я буду здесь.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};


instance DIA_Bennet_LeaveMyShip(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_LeaveMyShip_Condition;
	information = DIA_Bennet_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Я хочу найти себе другого кузнеца.";
};


func int DIA_Bennet_LeaveMyShip_Condition()
{
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//Я хочу найти себе другого кузнеца.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//Сейчас ты думаешь одно, через минуту - другое. Ты не мог бы определиться, а? Когда будешь твердо уверен в том, чего ты хочешь, дай мне знать.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Bennet_StillNeedYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_StillNeedYou_Condition;
	information = DIA_Bennet_StillNeedYou_Info;
	permanent = TRUE;
	description = "Возвращайся, я не могу найти другого кузнеца.";
};


func int DIA_Bennet_StillNeedYou_Condition()
{
	if(((Bennet_IsOnBoard == LOG_OBSOLETE) || (Bennet_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		if(Bennet_WasOnBoard == TRUE)
		{
			DIA_Bennet_StillNeedYou.description = "Возвращайся, я не могу найти другого кузнеца.";
		}
		else
		{
			DIA_Bennet_StillNeedYou.description = "Будь моим кузнецом. Увидимся в гавани.";
		};
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info()
{
	if(Bennet_WasOnBoard == TRUE)
	{
		AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Возвращайся, я не могу найти другого кузнеца.
		AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(сердито) Хорошо! Всякий может издеваться над простым кузнецом! Увидимся в гавани.
	}
	else
	{
		B_Bennet_BeMySmith();
	};
	B_UpdateBennetItemsCount();
	B_JoinShip(self);
};


instance DIA_Bennet_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 900;
	condition = DIA_Bennet_PICKPOCKET_Condition;
	information = DIA_Bennet_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bennet_PICKPOCKET_Condition()
{
	return C_Beklauen(35,45);
};

func void DIA_Bennet_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,Dialog_Back,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

