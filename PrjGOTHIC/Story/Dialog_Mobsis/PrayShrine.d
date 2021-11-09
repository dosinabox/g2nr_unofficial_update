
var int PrayDay;
var int PrayDayOne;

var int ShrineIsObsessed;
var int ShrineHealing;
var int ShrinesHealed;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_37;
var int ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_66;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_04;
var int ShrineIsObsessed_SAGITTA;
var int ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02;
var int ShrineIsObsessed_NW_FARM3_BIGWOOD_02;

const int PrayAmountSmall = 10;
const int PrayAmountMedium = 50;
const int PrayAmountBig = 100;

func int C_PrayedToday()
{
	if(Wld_GetDay() == 0)
	{
		if(PrayDayOne == TRUE)
		{
			return TRUE;
		};
	}
	else if(PrayDay == Wld_GetDay())
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Pray(var int gold)
{
	var int zufall;
	zufall = Hlp_Random(100);
	if(C_PrayedToday())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else if(gold == 0)
	{
		if(zufall < 5)
		{
			B_BlessAttribute(hero,ATR_HITPOINTS_MAX,1);
		}
		else
		{
			PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
		};
	}
	else if(gold == PrayAmountSmall)
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,1);
	}
	else if(gold == PrayAmountMedium)
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,2);
	}
	else if(gold == PrayAmountBig)
	{
		if((Stats_Blessings_Str < 10) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (zufall < 50))
		{
			B_BlessAttribute(hero,ATR_STRENGTH,1);
		}
		else if((Stats_Blessings_Dex < 10) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (zufall >= 50))
		{
			B_BlessAttribute(hero,ATR_DEXTERITY,1);
		}
		else if((Stats_Blessings_MaxMana < 20) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
		{
			B_BlessAttribute(hero,ATR_MANA_MAX,1);
		}
		else
		{
			B_BlessAttribute(hero,ATR_HITPOINTS_MAX,3);
		};
	};
	PrayDay = Wld_GetDay();
	if(PrayDay == 0)
	{
		PrayDayOne = TRUE;
	};
	if(gold > 0)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,gold);
		Stats_Blessings_GoldGiven += gold;
		AI_PrintScreen(ConcatStrings(IntToString(gold),PRINT_GoldGiven),-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	};
};

func string B_BuildBlessString(var int gold)
{
	var string concatText;
	concatText = ConcatStrings(NAME_ADDON_PRAYIDOL_GIVE,IntToString(gold));
	concatText = ConcatStrings(concatText,PRINT_Gold);
	concatText = ConcatStrings(concatText," монет.");
	return concatText;
};

func void C_IsShrineObsessed(var C_Npc slf)
{
	if(Npc_IsPlayer(slf))
	{
		ShrineIsObsessed = TRUE;
		if((Npc_GetDistToWP(slf,"NW_TROLLAREA_PATH_37") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_37 == TRUE))
		{
			if(ShrineHealing == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_37 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(slf,"NW_FARM1_CONNECT_XARDAS") < 2000) && (ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS == TRUE))
		{
			if(ShrineHealing == TRUE)
			{
				ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(slf,"NW_TROLLAREA_PATH_66") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_66 == TRUE))
		{
			if(ShrineHealing == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_66 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(slf,"NW_TROLLAREA_PATH_04") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_04 == TRUE))
		{
			if(ShrineHealing == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_04 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(slf,"SAGITTA") < 2000) && (ShrineIsObsessed_SAGITTA == TRUE))
		{
			if(ShrineHealing == TRUE)
			{
				ShrineIsObsessed_SAGITTA = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(slf,"NW_BIGMILL_MALAKSVERSTECK_02") < 2000) && (ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 == TRUE))
		{
			if(ShrineHealing == TRUE)
			{
				ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(slf,"NW_FARM3_BIGWOOD_02") < 2000) && (ShrineIsObsessed_NW_FARM3_BIGWOOD_02 == TRUE))
		{
			if(ShrineHealing == TRUE)
			{
				ShrineIsObsessed_NW_FARM3_BIGWOOD_02 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else
		{
			ShrineIsObsessed = FALSE;
		};
	};
};


instance PC_PrayShrine_HEALSHRINE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_PrayShrine_HEALSHRINE_Condition;
	information = PC_PrayShrine_HEALSHRINE_Info;
	permanent = TRUE;
	description = "Очистить алтарь";
};


func int PC_PrayShrine_HEALSHRINE_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && Npc_HasItems(hero,ItMi_UltharsHolyWater_Mis) && (ShrineIsObsessed == TRUE))
	{
		return TRUE;
	};
};

func void PC_PrayShrine_HEALSHRINE_Info()
{
	var string ShrinesText;
	var string ShrinesLeft;
	Wld_PlayEffect("spellFX_HealShrine",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_Heal_Cast");
	ShrineHealing = TRUE;
	C_IsShrineObsessed(self);
	ShrineHealing = FALSE;
	ShrinesHealed += 1;
	if(ShrinesHealed < 7)
	{
		B_Say(self,self,"$HEALSHRINE");
		ShrinesLeft = IntToString(7 - ShrinesHealed);
		ShrinesText = ConcatStrings(PRINT_ShrinesLeft,ShrinesLeft);
		AI_PrintScreen(ShrinesText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	}
	else
	{
		B_Say(self,self,"$HEALLASTSHRINE");
		MIS_Ulthar_HeileSchreine_PAL = LOG_SUCCESS;
		AI_PrintScreen(PRINT_AllShrines,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	};
	B_GivePlayerXP(XP_Ambient);
	b_endproductiondialog();
};

func void PrayShrine_S1()
{
	if(C_NpcIsHero(self))
	{
		C_IsShrineObsessed(self);
		if(ShrineIsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PrayShrine;
		AI_ProcessInfos(self);
	};
};


instance PC_PrayShrine_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PrayShrine_End_Condition;
	information = PC_PrayShrine_End_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_PrayShrine_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};

func void PC_PrayShrine_End_Info()
{
	b_endproductiondialog();
};


instance PC_PrayShrine_Paladine(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_PrayShrine_Paladine_Condition;
	information = PC_PrayShrine_Paladine_Info;
	permanent = FALSE;
	description = "Помолиться за паладинов";
};


func int PC_PrayShrine_Paladine_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (MIS_MardukBeten == LOG_Running))
	{
		if(Kapitel == 1)
		{
			return TRUE;
		};
		if(GuildlessMode == TRUE)
		{
			return TRUE;
		};
	};
};

func void PC_PrayShrine_Paladine_Info()
{
	PrintScreen(Pray_Paladin1,-1,33,FONT_ScreenSmall,3);
	PrintScreen(Pray_Paladin2,-1,36,FONT_ScreenSmall,4);
	PrintScreen(Pray_Paladin3,-1,39,FONT_ScreenSmall,5);
	PrintScreen(Pray_Paladin4,-1,42,FONT_ScreenSmall,6);
};


instance PC_PrayShrine_Pray(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayShrine_Pray_Condition;
	information = PC_PrayShrine_Pray_Info;
	permanent = TRUE;
	description = NAME_ADDON_BETEN;
};


func int PC_PrayShrine_Pray_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine)
	{
		return TRUE;
	};
};

func void PC_PrayShrine_Pray_Info()
{
	if(ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen(PRINT_SCIsObsessed,-1,-1,FONT_Screen,2);
		Snd_Play("DEM_Die");
	}
	else
	{
		Info_ClearChoices(PC_PrayShrine_Pray);
		Info_AddChoice(PC_PrayShrine_Pray,Dialog_Back,PC_PrayShrine_Pray_Back);
		Info_AddChoice(PC_PrayShrine_Pray,NAME_ADDON_PRAYIDOL_GIVENOTHING,PC_PrayShrine_Pray_NoPay);
		if(Npc_HasItems(hero,ItMi_Gold) >= PrayAmountSmall)
		{
			Info_AddChoice(PC_PrayShrine_Pray,B_BuildBlessString(PrayAmountSmall),PC_PrayShrine_Pray_SmallPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= PrayAmountMedium)
		{
			Info_AddChoice(PC_PrayShrine_Pray,B_BuildBlessString(PrayAmountMedium),PC_PrayShrine_Pray_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= PrayAmountBig)
		{
			Info_AddChoice(PC_PrayShrine_Pray,B_BuildBlessString(PrayAmountBig),PC_PrayShrine_Pray_BigPay);
		};
	};
};

func void PC_PrayShrine_Pray_Back()
{
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_NoPay()
{
	B_Pray(0);
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_SmallPay()
{
	B_Pray(PrayAmountSmall);
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_MediumPay()
{
	B_Pray(PrayAmountMedium);
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_BigPay()
{
	B_Pray(PrayAmountBig);
	Info_ClearChoices(PC_PrayShrine_Pray);
};


instance PC_PrayShrine_BlessSword(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayShrine_BlessSword_Condition;
	information = PC_PrayShrine_BlessSword_Info;
	permanent = TRUE;
	description = B_BuildPriceString(Bless_Sword,Gold_BlessSword);
};


func int PC_PrayShrine_BlessSword_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (hero.guild == GIL_PAL) && (CurrentLevel == NEWWORLD_ZEN) && (Npc_HasItems(hero,ItMw_1H_Blessed_01) || Npc_HasItems(hero,ItMw_2H_Blessed_01)))
	{
		if(Npc_GetDistToWP(hero,"NW_MONASTERY_CHAPELL_02") <= 500)
		{
			return TRUE;
		};
	};
};

func void PC_PrayShrine_BlessSword_Info()
{
	if(ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen(PRINT_SCIsObsessed,-1,-1,FONT_Screen,2);
		Snd_Play("DEM_Die");
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= Gold_BlessSword)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,Gold_BlessSword);
		AI_PrintScreen(ConcatStrings(IntToString(Gold_BlessSword),PRINT_GoldGiven),-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
		if(Npc_HasItems(hero,ItMw_2H_Blessed_01))
		{
			Npc_RemoveInvItems(hero,ItMw_2H_Blessed_01,1);
			CreateInvItems(hero,ItMw_2H_Blessed_02,1);
		}
		else
		{
			Npc_RemoveInvItems(hero,ItMw_1H_Blessed_01,1);
			CreateInvItems(hero,ItMw_1H_Blessed_02,1);
		};
		Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_Heal_Cast");
		B_GivePlayerXP(XP_SwordBlessed);
	}
	else
	{
		AI_PrintScreen(Print_NotEnoughGold,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	};
};


instance PC_PrayShrine_BlessSword_Final(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayShrine_BlessSword_Final_Condition;
	information = PC_PrayShrine_BlessSword_Final_Info;
	permanent = TRUE;
	description = ConcatStrings(Bless_Sword," Слезами Инноса");
};


func int PC_PrayShrine_BlessSword_Final_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (hero.guild == GIL_PAL) && (CurrentLevel == NEWWORLD_ZEN) && (PAL_KnowsAbout_FINAL_BLESSING == TRUE) && (Npc_HasItems(hero,ItMw_1H_Blessed_02) || Npc_HasItems(hero,ItMw_2H_Blessed_02)))
	{
		if(Npc_GetDistToWP(hero,"NW_MONASTERY_CHAPELL_02") <= 500)
		{
			return TRUE;
		};
	};
};

func void PC_PrayShrine_BlessSword_Final_Info()
{
	if(ShrineIsObsessed == TRUE)
	{
		SC_IsObsessed = TRUE;
		PrintScreen(PRINT_SCIsObsessed,-1,-1,FONT_Screen,2);
		Snd_Play("DEM_Die");
	}
	else if(Npc_HasItems(hero,ItPo_PotionOfDeath_01_Mis) || Npc_HasItems(hero,ItPo_PotionOfDeath_02_Mis))
	{
		Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_01_Mis,1);
		Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_02_Mis,1);
		if(Npc_HasItems(hero,ItMw_2H_Blessed_02))
		{
			Npc_RemoveInvItems(hero,ItMw_2H_Blessed_02,1);
			CreateInvItems(hero,ItMw_2H_Blessed_03,1);
		}
		else
		{
			Npc_RemoveInvItems(hero,ItMw_1H_Blessed_02,1);
			CreateInvItems(hero,ItMw_1H_Blessed_03,1);
		};
		Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_Heal_Cast");
		B_GivePlayerXP(XP_SwordBlessed2);
	}
	else
	{
		AI_PrintScreen(PRINT_NoInnosTears,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	};
};

