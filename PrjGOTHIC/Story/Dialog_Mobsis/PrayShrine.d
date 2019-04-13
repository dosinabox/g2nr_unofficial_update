
var int PrayDay;

var string concatDonation;

var int Shrine_STR_Bonus;
var int Shrine_DEX_Bonus;
var int Shrine_MANA_Bonus;
var int SpecialBless;
var int ShrineIsObsessed;
var int shrinehealing;
var int ShrinesHealed;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_37;
var int ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_66;
var int ShrineIsObsessed_NW_TROLLAREA_PATH_04;
var int ShrineIsObsessed_SAGITTA;
var int ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02;
var int ShrineIsObsessed_NW_FARM3_BIGWOOD_02;

func void C_IsShrineObsessed(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(hero))
	{
		ShrineIsObsessed = TRUE;
		if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_37") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_37 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_37 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM1_CONNECT_XARDAS") < 2000) && (ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_66") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_66 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_66 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_TROLLAREA_PATH_04") < 2000) && (ShrineIsObsessed_NW_TROLLAREA_PATH_04 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_TROLLAREA_PATH_04 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"SAGITTA") < 2000) && (ShrineIsObsessed_SAGITTA == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_SAGITTA = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_BIGMILL_MALAKSVERSTECK_02") < 2000) && (ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
			{
				ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = FALSE;
				ShrineIsObsessed = FALSE;
			};
		}
		else if((Npc_GetDistToWP(hero,"NW_FARM3_BIGWOOD_02") < 2000) && (ShrineIsObsessed_NW_FARM3_BIGWOOD_02 == TRUE))
		{
			if(SHRINEHEALING == TRUE)
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
	SHRINEHEALING = TRUE;
	C_IsShrineObsessed(self);
	SHRINEHEALING = FALSE;
	ShrinesHealed = ShrinesHealed + 1;
	if(ShrinesHealed < 7)
	{
		B_Say(self,self,"$HEALSHRINE");
		ShrinesLeft = IntToString(7 - ShrinesHealed);
		ShrinesText = ConcatStrings(ShrinesLeft,PRINT_NumberLeft);
		AI_PrintScreen(ShrinesText,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	}
	else
	{
		B_Say(self,self,"$HEALLASTSHRINE");
		MIS_Ulthar_HeileSchreine_PAL = LOG_SUCCESS;
	};
	B_GivePlayerXP(XP_Ambient);
	b_endproductiondialog();
};

func void PrayShrine_S1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		C_IsShrineObsessed(self);
		if(ShrineIsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
		};
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PrayShrine;
		AI_ProcessInfos(her);
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
	description = "Помолиться за паладинов.";
};


func int PC_PrayShrine_Paladine_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (MIS_MardukBeten == LOG_Running) && (Kapitel == 1))
	{
		return TRUE;
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
	description = "Помолиться";
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
		Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 0 золотых монет.",PC_PrayShrine_Pray_NoPay);
		if(Npc_HasItems(hero,ItMi_Gold) >= 10)
		{
			Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 10 золотых монет.",PC_PrayShrine_Pray_SmallPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 50)
		{
			Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 50 золотых монет.",PC_PrayShrine_Pray_MediumPay);
		};
		if(Npc_HasItems(hero,ItMi_Gold) >= 100)
		{
			Info_AddChoice(PC_PrayShrine_Pray,"Я хочу помолиться и пожертвовать 100 золотых монет.",PC_PrayShrine_Pray_BigPay);
		};
	};
};

func void PC_PrayShrine_Pray_Back()
{
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_NoPay()
{
	var int zufall;
	zufall = Hlp_Random(100);
	if(PrayDay == Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else if(zufall < 5)
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,1);
	}
	else
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	};
	PrayDay = Wld_GetDay();
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_SmallPay()
{
	Npc_RemoveInvItems(hero,ItMi_Gold,10);
	if(PrayDay == Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,1);
	};
	PrayDay = Wld_GetDay();
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_MediumPay()
{
	Npc_RemoveInvItems(hero,ItMi_Gold,50);
	if(PrayDay == Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,2);
	};
	PrayDay = Wld_GetDay();
	Info_ClearChoices(PC_PrayShrine_Pray);
};

func void PC_PrayShrine_Pray_BigPay()
{
	var int zufall;
	zufall = Hlp_Random(100);
	Npc_RemoveInvItems(hero,ItMi_Gold,100);
	if(PrayDay == Wld_GetDay())
	{
		PrintScreen(Print_BlessNone,-1,-1,FONT_Screen,2);
	}
	else if((Shrine_STR_Bonus < 10) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (zufall < 50))
	{
		B_BlessAttribute(hero,ATR_STRENGTH,1);
		Shrine_STR_Bonus += 1;
	}
	else if((Shrine_DEX_Bonus < 10) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (zufall >= 50))
	{
		B_BlessAttribute(hero,ATR_DEXTERITY,1);
		Shrine_DEX_Bonus += 1;
	}
	else if((Shrine_MANA_Bonus < 20) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		B_BlessAttribute(hero,ATR_MANA_MAX,1);
		Shrine_MANA_Bonus += 1;
	}
	else
	{
		B_BlessAttribute(hero,ATR_HITPOINTS_MAX,3);
	};
	PrayDay = Wld_GetDay();
	Info_ClearChoices(PC_PrayShrine_Pray);
};


instance PC_PrayShrine_BlessSword(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PrayShrine_BlessSword_Condition;
	information = PC_PrayShrine_BlessSword_Info;
	permanent = TRUE;
	description = Bless_Sword;
};


func int PC_PrayShrine_BlessSword_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (hero.guild == GIL_PAL) && (Npc_GetDistToWP(hero,"NW_MONASTERY_CHAPELL_02") <= 500) && ((Npc_HasItems(hero,ItMw_1H_Blessed_01) >= 1) || (Npc_HasItems(hero,ItMw_2H_Blessed_01) >= 1)))
	{
		return TRUE;
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
		concatDonation = ConcatStrings(IntToString(Gold_BlessSword),PRINT_GoldGegeben);
		AI_PrintScreen(concatDonation,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
		if(Npc_HasItems(hero,ItMw_2H_Blessed_01) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_2H_Blessed_01,1);
			CreateInvItems(hero,ItMw_2H_Blessed_02,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_Heal_Cast");
			B_GivePlayerXP(XP_SwordBlessed);
		}
		else
		{
			Npc_RemoveInvItems(hero,ItMw_1H_Blessed_01,1);
			CreateInvItems(hero,ItMw_1H_Blessed_02,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_Heal_Cast");
			B_GivePlayerXP(XP_SwordBlessed);
		};
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
	description = Bless_Sword2;
};


func int PC_PrayShrine_BlessSword_Final_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PrayShrine) && (hero.guild == GIL_PAL) && (Npc_GetDistToWP(hero,"NW_MONASTERY_CHAPELL_02") <= 500) && (PAL_KnowsAbout_FINAL_BLESSING == TRUE) && ((Npc_HasItems(hero,ItMw_1H_Blessed_02) >= 1) || (Npc_HasItems(hero,ItMw_2H_Blessed_02) >= 1)))
	{
		return TRUE;
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
	else if((Npc_HasItems(hero,ItPo_PotionOfDeath_01_Mis) >= 1) || (Npc_HasItems(hero,ItPo_PotionOfDeath_02_Mis) >= 1))
	{
		Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_01_Mis,1);
		Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_02_Mis,1);
		if(Npc_HasItems(hero,ItMw_2H_Blessed_02) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMw_2H_Blessed_02,1);
			CreateInvItems(hero,ItMw_2H_Blessed_03,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_Heal_Cast");
			B_GivePlayerXP(XP_SwordBlessed2);
		}
		else
		{
			Npc_RemoveInvItems(hero,ItMw_1H_Blessed_02,1);
			CreateInvItems(hero,ItMw_1H_Blessed_03,1);
			Wld_PlayEffect("spellFX_PalHeal_ORIGIN",hero,hero,0,0,0,FALSE);
			Snd_Play("MFX_Heal_Cast");
			B_GivePlayerXP(XP_SwordBlessed2);
		};
	}
	else
	{
		AI_PrintScreen(PRINT_NoInnosTears,-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	};
};

